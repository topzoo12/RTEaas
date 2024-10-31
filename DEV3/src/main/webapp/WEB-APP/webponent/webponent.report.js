/**
 * webponent.export package driver
 *
 * @author  오상원, 정태승
 */


/** option
 *    - url          이 옵션을 입력할 경우 입력한 url 페이지를 rendering 해 출력
 *    - param        {Object} GET 방식으로 보내지 않을 경우 이 attribute를 통해 parameter 전달
 *    - drawArea     PDF rendering 할 영역에 대한 DOM Object | Markup String | GRID 객체
 *    - fileName     다운받을 파일 이름
 *    - action       파일 생성 후 처리에 관한 정보 ex) download, etc..
 *    - ajax         ajax 로 처리할 지 여부
 *    - callback     ajax 처리 시 콜백함수 등록 가능
 *    - mode         "debug"모드 선택 여부
 *    - sheetName    Excel 출력에 사용되는 sheetName.
 *                   sheetNames 쉬트이름 단일쉬트일경우 문자열로
 *                   다중 쉬트일경우 문자열을 담은 배열을 받는다
 *    - pdfHeader
 *    - pdfFooter    PDF 헤더, 푸터 [{
 *                      type : "text" || "image" (default : text)
 *                      content : 텍스트 || 이미지 경로(HTTP URL 혹은 서버 내의 절대경로)
 *                      color : color code (default : #000000)
 *                      align : "left" || "right" || "center" (default : left)
 *                      page : 적용될 페이지 번호 (1부터 시작, default : 전체 페이지)
 *                             형태 : 1 || 1, 2, 3 || 1 - 2
 *                   }]
 *    - exportHost   export module이 설치된 서버의 hostname 혹은 ip주소. 없을 시 local에 설치된 걸로 간주함.
 *    - stylesheet   PDF출력시 추가할 css파일 경로. 배열 형태로 입력.
 *
 *
 *
 *    - use(Deprecated) PDF출력에 시 java 클래스 분기에 사용되는 파라미터 (default : html)
 *    - template(Deprecated) PDF 생성에 사용될 template XML attribute name
 **/


(function () {
    if (window.webponent === undefined) {
        window.webponent = {};
    }

    webponent.report = {};
    var self = webponent.report;

    window.webponent.report.event = $({});
    var event = window.webponent.report.event;
    /**
     * 각 export별 호출 URL
     * @type {Object}
     */
    var exportUrls = {
        'excel' : '/WEB-APP/export/excel',
        'csv' : '/WEB-APP/export/csv',
        'pdf' : '/WEB-APP/export/pdf',
        'image' : '/WEB-APP/export/image'
    };

    function getCookie(name) {
        var nameOfCookie = name + "=";
        var x = 0, endOfCookie;
        while (x <= document.cookie.length) {
            var y = (x + nameOfCookie.length);
            if (document.cookie.substring(x, y) === nameOfCookie) {
                if ((endOfCookie = document.cookie.indexOf(";", y)) === -1) {
                    endOfCookie = document.cookie.length;
                }

                return encodeURI(document.cookie.substring(y, endOfCookie));
            }
            x = document.cookie.indexOf(" ", x) + 1;
            if (x === 0) {
                break;
            }
        }
        return "";
    }

    function expireCookie(cookieName) {
        var cookieDate = new Date();
        cookieDate.setTime(cookieDate.getTime() - 1);
        document.cookie = cookieName + "=; expires=" + cookieDate.toGMTString();
    }


    /**
     * Form Markup 에 input data attribute 설정
     *
     * @param  {Object}  data    attribute 요소들을 가지고 있는 object
     * @return {Element} form    Form jQuery Element
     */
    function getForm (data, form) {
        form = $(form);
        form.attr("method", "post");

        for (var key in data) {
            var value = data[key];

            if (value) {
                var input = $('<input type="hidden"/>');
                input.attr('name', key);
                input.val(value);

                form.append(input);
            }
        }

        return form;
    }


    /**
     * form make & submit
     * @param  {Element}         form            Markup 상의 hidden form element object
     * @param  {Object}          inputObject     form생성 시 input 요소들을 담고 있는 object
     * @param  {String}          exportType      export하는 파일 종류
     * @param  {String | Object} option
     */
    function makeFormAndSubmit (form, inputObject, exportType, option) {
        var action = option.action ? option.action : "download";


        if (action === undefined || action === "download") {
            // download logic (default)
            action = 'download';

        } else {
            // send to repository or etc logic
            if (typeof action === "object") {
                for (var key in action) {
                    inputObject[key] = action[key];
                }
            } else if (typeof action === "string") {
                inputObject.action = action;
            }
        }

        var mode = option.mode ? option.mode : "normal";
        inputObject.mode = mode;

        form = getForm(inputObject, form);

        var exportHost = option.exportHost ? option.exportHost : '';
        var exportUrl = exportHost + exportUrls[exportType];

        var ajax = option.ajax ? true : false;

        if (!ajax) {
            if (action === 'download') {
                var cookieName = 'webponent-report-downloader';
                expireCookie(cookieName);

                var interval = setInterval(function() {
                    var cookie = getCookie(cookieName);
                    if (cookie !== '') {
                        expireCookie(cookieName);
                        clearInterval(interval);

                        if (option.callback) {
                            option.callback();
                        }
                    }
                }, 50);
            }

            form.attr('action', exportUrl);
            form.trigger('submit');
            form.empty();

        } else {
            $.ajax({
                type : 'POST',
                url : exportUrl,
                data : form.serialize(),
                beforeSend : function () {
                    event.trigger('ajaxBegin');

                },
                success : function (resp) {
                    if (option.ajax.success) {
                        option.ajax.success(resp);
                    }

                },
                complete : function () {
                    event.trigger('ajaxComplete');
                    form.empty();
                }
            });
        }
    }


    /**
     * Parameter를 압축하여 return
     * @param {String} param    압축할 parameter
     * @return {String}         압축된 parameter
     */
    function getCompressedParam (param) {
        var compressedPrefix = "$LZString_ ";
        if (window.LZString) {
            return compressedPrefix + window.LZString.compressToEncodedURIComponent(param);

        } else {
            return param;
        }
    }


    /**
     * 엑셀 내보내기
     * @param  {Grid | Array<Grid> | Object | Array<Object>} dataObjs
     *                                       객체또는 객체를 담은 배열
     *                                       (그리드 객체를 바로 넘겨도 동작)
     *
     *                                       형태 :
     *                                       {
     *                                          header: [{
     *                                              bind:  BLD OUTPUT FIELD'S NAME,
     *                                              label: BLD OUTPUT FIELD'S_LABEL,
     *                                              visibility: 추후 구현예정
     *                                          }],
     *                                          body: OUTPUT DATA ARRAY
     *                                       }
     *
     * @param  {Element} form               Markup 상의 hidden form element object
     * @param  {Object}  option
     */
    self.excel = function (dataObjs, form, options) {

        var objArray = [];

        if (dataObjs instanceof Object && dataObjs instanceof Array) {

            objArray = dataObjs;

        } else if (dataObjs instanceof Object) {

            objArray.push(dataObjs);
        }

        var inputObject = {};

        //_.each(objArray, function (data, index) {
        for (var index in objArray) {
            var header, body;
            var data = objArray[index];

            if (objArray[0].header) {
                header = JSON.stringify(data.header);
                body = JSON.stringify(data.body);

            } else {    // 그리드 객체가 바로 Parameter로 넘어온 경우
                var makeBodyMergeInfoObject = function () {
                    var mergingObj = {};
                    var rows = $(data.rows);
                    var firstRow = $(rows[0]);

                    // level 정보
                    firstRow.each(function (i) {
                        $(firstRow[i]).find('td').each(function (j) {
                            var name = this.dataset.name;
                            if (!mergingObj[name]) {
                                mergingObj[name] = {};
                            }

                            mergingObj[name].level = Number(i);
                        });
                    });

                    // colspan, rowspan정보
                    rows.each(function (i) {
                        $(this).find('td').each(function () {
                            var name = this.dataset.name;

                            if (this.hasAttribute('rowspan')) {
                                if (!mergingObj[name][i]) {
                                    mergingObj[name][i] = {};
                                }

                                mergingObj[name][i].rowspan = Number(this.getAttribute('rowspan'));
                            }

                            if (this.hasAttribute('colspan')) {
                                if (!mergingObj[name][i]) {
                                    mergingObj[name][i] = {};
                                }

                                mergingObj[name][i].colspan = Number(this.getAttribute('colspan'));
                            }
                        });
                    });

                    return mergingObj;
                };


                var columnInfoFilter = ["bind", "visibility", "label", "colspan", "rowspan", "level"];

                header = JSON.stringify(data.settings.columns, columnInfoFilter);
                body = JSON.stringify(data.data);

                var mergingObj = makeBodyMergeInfoObject();

                if (typeof mergingObj === 'object') {
                    var bodyMergeInfo = JSON.stringify(mergingObj);
                    inputObject['bodyMergeInfo' + index] = getCompressedParam(bodyMergeInfo);
                }
            }

            inputObject['header' + index] = getCompressedParam(header);
            inputObject['body' + index] = getCompressedParam(body);

            var sheetNames = options.sheetName;
            if (sheetNames instanceof Array) {
                inputObject['sheetName' + index] = sheetNames[index];

            } else {
                inputObject.sheetName0 = sheetNames;
            }
        }

        inputObject.count = objArray.length;
        inputObject.fileName = options.fileName;

        makeFormAndSubmit(form, inputObject, "excel", options);
    };


    /**
     * PDF 내보내기
     * @param  {Element}         form            Markup 상의 hidden form element object
     * @param  {Object}          option
     */
    self.pdf = function (form, option) {
        if (!option) {
            console.log("option object 요소 입력 필");
            return;
        }

        var inputObject = {};

        var template = option.template;
        if (!template) {
            template = "default";
        }
        inputObject.template = template;

        if (option.url) {
            inputObject.url = option.url;
            inputObject.use = "url";

        } else if (option.drawArea) {
            var drawArea = option.drawArea;

            if (typeof drawArea === "object") {
                // 그리드 객체가 넘어오면 releaseScroll 후 rendering
                if (drawArea.appendRow !== undefined) {
                    drawArea.releaseScroll();

                    var gridMarkup = drawArea.markup.area.outerHTML;
                    var data = drawArea.data;
                    var gridTemplate = drawArea.settings.template.original.clone();
                    var div = $('<div>');

                    $(drawArea.markup.area).after(div);

                    drawArea.destroy();

                    drawArea = webponent.grid.init(div, gridTemplate);
                    drawArea.appendRow(data);

                    $.extend(true, option.drawArea, drawArea);

                    var markup = $('<html></html>');
                    var head = $('<head></head>');
                    head.append('<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">');

                    var stylesheets = option.stylesheet;
                    if (stylesheets) {
                        for (var i = 0, icnt = stylesheets.length; i < icnt; i++) {
                            var link = $('<link rel="stylesheet">');
                            link.attr('href', stylesheets[i]);
                            head.append(link);
                        }
                    }

                    markup.append(head);


                    var body = $('<body></body>');
                    body.append(gridMarkup);
                    markup.append(body);

                    markup = markup[0].outerHTML;
                    inputObject.HTML = getCompressedParam(markup);

                } else {
                    inputObject.HTML = getCompressedParam(drawArea.outerHTML);
                }

            } else if (typeof drawArea === "string") {
                inputObject.HTML = getCompressedParam(drawArea);
            }
        }

        if (option.param) {
            inputObject.param = getCompressedParam(JSON.stringify(option.param));
        }

        if (option.pdfHeader) {
            inputObject.pdfHeader = getCompressedParam(JSON.stringify(option.pdfHeader));
        }

        if (option.pdfFooter) {
            inputObject.pdfFooter = getCompressedParam(JSON.stringify(option.pdfFooter));
        }

        inputObject.fileName = option.fileName;

        makeFormAndSubmit(form, inputObject, "pdf", option);
    };


    /**
     * Image 내보내기
     * @param {Element}         form        Markup 상의 hidden form element object
     * @param {Object}          option      이미지 추출 옵션값이 지정된 Object
     */
    /*self.image = function (drawArea, form, fileName, type, template, action) {*/
    self.image = function (form, option) {
        if (!option) {
            return;

        } else {
            var template = option.template;
            if (!template) {
                template = "default";
            }

            var inputObject = {};
            var drawArea = option.drawArea;
            if (drawArea) {
                // use phantom
                if (typeof drawArea === "object") {
                    inputObject.HTML = getCompressedParam(drawArea.outerHTML);

                } else if (typeof drawArea === "string") {
                    inputObject.HTML = getCompressedParam(drawArea);
                }

            } else {
                // use batik
                inputObject.SVGSTRING = option.SVGSTRING;
            }

            inputObject.fileName = option.fileName;
            inputObject.template = template;
            inputObject.type = option.type;

            makeFormAndSubmit(form, inputObject, "image", option);
        }
    };


    /**
     * CSV 내보내기
     * @param  {Object | Grid} obj          객체 or 그리드 객체
     *
     *                                       형태 :
     *                                       {
     *                                          header: [{
     *                                              bind:  BLD OUTPUT FIELD'S NAME,
     *                                              label: BLD OUTPUT FIELD'S_LABEL,
     *                                              visibility: 추후 구현예정
     *                                          }],
     *                                          body: OUTPUT DATA
     *                                       }
     * @param  {Element} form               Markup 상의 hidden form element object
     * @param  {String}  options
     */

    self.csv = function (obj, form, options) {

        var columnInfoFilter = ["bind", "visibility", "label", "bindColumn"];
        var inputObject = {};
        var header = '', body = '';
        var theadTrCount = obj.header ?
            _.max(obj.header, function(a){return a.level;}).level :
            _.max(obj.settings.columns, function(a){return a.level;}).level;

        //일반적인 경우만 고려함 언더스코어 잘쓰면 소스가 많이 줄어들것같음
        function adjustTheadTr (headers) {

            var newHeaderArray = [];
            var rowSpan2More = [];
            var artificial = {label: ''};

            function isRowMultiType() {

                var isColspan = false;
                var isRowspan = false;

                $.each(headers, function(a, b) {
                    if(b.colspan > 1) {
                        isColspan = true;
                    }
                });
                $.each(headers, function(a, b) {
                    if(b.rowspan > 1) {
                        isRowspan = true;
                    }
                });

                if(isRowspan && !isColspan) {
                    $.each(headers, function(a, b) {
                        b.level = 0;
                    });
                }
            };

            isRowMultiType();

            //테이블 헤더 전체
            for (var i = 0; i < theadTrCount + 1; i ++) {

                newHeaderArray.push(_.select(headers, function(header) {return header.level === i}));

                //직접적으로 바디의 칼럼들과 연결될 헤더의 컬럼들
                for(var r = 0; r < newHeaderArray[i].length; r++){

                    if(i === 0 && newHeaderArray[i][r].colspan < 2) {
                        newHeaderArray[i][r].bindColumn = true;
                    }

                    if(i === theadTrCount) {
                        newHeaderArray[i][r].bindColumn = true;
                    }
                }

                //테이블헤더 i번째 줄, 인공객체 가로로 추가
                for(var j = 0; j < newHeaderArray[i].length; j++){

                    if(newHeaderArray[i][j].colspan > 1) {

                        for(var k = 0; k < newHeaderArray[i][j].colspan -1; k++) {
                            newHeaderArray[i].splice(j+1, 0, artificial);
                        }
                    }
                }

                //세로로 추가해야할 지점을 배열에 저장
                if(i === 0) {

                    for(var k = 0; k < newHeaderArray[i].length; k++) {

                        if(newHeaderArray[i][k].rowspan > 1){
                            rowSpan2More.push(k);
                        }
                    }
                } else {
                    //저장한 배열정보로 세로에 빈객체 추가
                    for (var q = 0; q < rowSpan2More.length; q++) {
                        newHeaderArray[i].splice(rowSpan2More[q], 0, artificial);
                    }
                }
            }
            return  newHeaderArray;
        }

        if (obj.header) {

            header = JSON.stringify(adjustTheadTr(obj.header));
            body = JSON.stringify(obj.body);

        } else {

            var rtHeader = adjustTheadTr(obj.settings.columns);
            for(var i = 0; i < rtHeader.length; i++) {

                //키값 붙여주는거 언더스코어로 바꿀것
                if(i === rtHeader.length -1){
                    header += '"' + i + '":' + JSON.stringify(rtHeader[i], columnInfoFilter);
                } else {
                    header += '"' + i + '":' + JSON.stringify(rtHeader[i], columnInfoFilter) + ',';
                }
            }
            body = JSON.stringify(obj.data);
        }

        header = '{' + header + '}';
        inputObject.header = getCompressedParam(header);
        inputObject.body = getCompressedParam(body);
        inputObject.fileName = options.fileName;

        makeFormAndSubmit(form, inputObject, "csv", options);
    };
})();
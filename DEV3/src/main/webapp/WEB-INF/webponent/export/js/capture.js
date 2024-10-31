/**
 * PDF 추출용 phantomJS 파일
 */

var page = require('webpage').create();
var system = require('system');

var URL = decodeDestAddress(system.args[1]),
    fileName = system.args[2],
    zoomFactor = system.args[3],
    method = system.args[4],
    parameter = parseParameters(system.args[5]),
    hdrString = decodeHeaderFooter(system.args[6]),
    ftrString = decodeHeaderFooter(system.args[7]);
var //pageSize = "A3",    // For Linux
    //pageSize = "A4",    // For Windows
    pageSize = system.args[8],
    pageOrientation = "portrait",
//dpi = 120,    // For PhantomJS 1.9.x
    dpi = 96,     // For PhantomJS 2.x
    pdfViewportWidth = 1024,
    pdfViewportHeight = 768,
    cmToInchFactor = 0.393700787,
    sideMargin = 0,
    widthInInches,
    heightInInches,
    IMG_LOADED_FLAG = "cache_image_load_done";

//page.settings.dpi

function renderPage() {
    page.render(fileName);
    console.log('Captured!! -----> ', fileName);
    phantom.exit();
}


function ImageCacheAndCapturePage() {
    page.evaluate(function (hdrStr, ftrStr, imgFlag, waitFor) {
        var hdrObj = JSON.parse(hdrStr);
        var ftrObj = JSON.parse(ftrStr);
        var objArr = [hdrObj, ftrObj];
        var cachedLen = 0;

        var cachedImg = {};
        for (var i = 0, iCnt = objArr.length; i < iCnt; i++) {
            var obj = objArr[i];

            for (var key in obj) {
                if (key === "NO")   break;

                (function () {
                    var v = obj[key];
                    if (v['type'] == "image") {
                        var imgSrc = v['content'];

                        if (!cachedImg[imgSrc]) {

                            var img = new Image();
                            img.src = imgSrc;
                            img.onload = function () {
                                cachedImg[imgSrc] = "cached";

                                console.log(imgSrc, " ", cachedImg[imgSrc]);
                                cachedLen--;
                            };

                            img.style.display = 'none';

                            document.body.appendChild(img);

                            cachedImg[imgSrc] = "caching...";
                            cachedLen++;
                        }
                    }
                })();
            }
        }

        waitFor(
            function () {
                if (cachedLen === 0 && window.svgSuccess === true) {
                    return true;

                } else {
                    return false;
                }

            },
            function () {
                makePhantomCall(imgFlag);

            },
            function () {
                for (var key in cachedImg) {
                    if (cachedImg[key] == "caching...") {
                        console.log("WARNNING : Cannot cached -", key);
                    }
                }
                makePhantomCall("timeout");

            },
            6000, "WAITFOR() 타임아웃");

        function makePhantomCall (status) {
            var callbackParam = {
                status : status
            };
            window.callPhantom(callbackParam);
        }
    }, hdrString, ftrString, IMG_LOADED_FLAG, waitFor);
}


function decodeDestAddress (url) {
    url = decodeURIComponent(url);
    url = encodeURI(url);       //한글때문에 다시 인코딩

    return url;
}


function decodeHeaderFooter (hdr) {
    if (hdr !== undefined) {
        return decodeURIComponent(hdr);

    } else {
        return hdr;
    }
}


function parseParameters (param) {
    var jsonParam = JSON.parse(decodeURIComponent(param));
    var parameter = "";

    for (key in jsonParam) {
        var temp = key + "=" + jsonParam[key] + "&";
        parameter += temp;
    }

    return parameter;
}


function setPageConfiguration () {
    switch(pageSize){
        case 'Letter':
        default:
            widthInInches = 8.5;
            heightInInches = 11;
            break;
        case 'Legal':
            widthInInches = 8.5;
            heightInInches = 14;
            break;
        case 'A3':
            widthInInches = 11.69;
            heightInInches = 16.54;
            break;
        case 'A4':
            widthInInches = 8.27;
            heightInInches = 11.69;
            break;
        case 'A5':
            widthInInches = 5.83;
            heightInInches = 8.27;
            break;
        case 'Tabloid':
            widthInInches = 11;
            heightInInches = 17;
            break;
    }

    //reduce by the margin (assuming 1cm margin on each side)
    widthInInches-= sideMargin * 2 * cmToInchFactor;
    heightInInches-= sideMargin * 2 * cmToInchFactor;

    sideMargin = sideMargin + "cm";

    //interchange if width is equal to height
    if(pageOrientation === 'Landscape'){
        var temp;
        temp = widthInInches;
        widthInInches = heightInInches;
        heightInInches = temp;
    }

    //calculate corresponding viewport dimension in pixels
    pdfViewportWidth = dpi * widthInInches;
    pdfViewportHeight = dpi * heightInInches;

    page.viewportSize = { width: pdfViewportWidth, height: pdfViewportHeight };

    page.paperSize = {
        format: pageSize,
        orientation: pageOrientation,
        margin: {
            left: sideMargin,
            right: sideMargin
        },
        header: {
            height: "1cm",
            contents: phantom.callback(function(pageNum, numPages) {
                return makeHeaderFooter(hdrString, pageNum, numPages, function () {
                    return '';
                });
            })
        },
        footer: {
            height: "1cm",
            contents: phantom.callback(function(pageNum, numPages) {
                return makeHeaderFooter(ftrString, pageNum, numPages, function (page, numOfPages, align, color) {
                    if (!align) {
                        align = "right";
                    }

                    if (!color) {
                        color = "#000000";
                    }

                    return '<div style="text-align: ' + align + '; height: 1cm; color: ' + color + '">'
                        + page + '/' + numOfPages + '</div>';
                });
            })
        }
    };
}


function printInfomationLogs () {
    console.log("URL : " + URL);
    console.log("DESTINATION FILE : " + fileName);
    console.log("ZOOM FACTOR : " + zoomFactor);
    console.log("METHOD : " + method);
    console.log("PARAMETER : " + parameter);
    console.log("HEADER : " + hdrString);
    console.log("FOOTER : " + ftrString);
    console.log("PAGE SIZE : " + pageSize);
    console.log("DPI : " + dpi);
    console.log("SIDE MARGIN : " + sideMargin);
    console.log("VIEWPORT WIDTH : " + pdfViewportWidth);
    console.log("VIEWPORT HEIGHT : " + pdfViewportHeight);
}


function makeHeaderFooter (jsonString, pageNum, numPages, defaultReturnCall) {
    var jsonObj = JSON.parse(jsonString);

    if (!jsonObj['NO']) {
        var pageObj = jsonObj[pageNum.toString()];
        if (!pageObj) {
            pageObj = jsonObj['default'];
            if (!pageObj) {
                return defaultReturnCall(pageNum, numPages);
            }
        }

        var type = pageObj["type"];
        var align = pageObj["align"];
        var content = pageObj["content"];
        var color = pageObj["color"];

        if (align != 'center' && align != 'left' && align != 'right') {
            align = "left";
            console.log('HEADER, FOOTER ALIGN INPUT UNCORRECT, CHANGED TO "LEFT"');
        }

        if (!content) {
            return defaultReturnCall(pageNum, numPages, align, color);
        }

        var returnValue;
        if (type === "image") {
            returnValue = '<div style="text-align: ' + align + ';">'
                + '<img src="' + content + '" style="height:0.5cm;"/>'
                + '</div>';

        } else {
            returnValue = '<div style="text-align: ' + align + ';'
                + 'height: 0.95cm; '
                + 'color: ' + color + ';">'
                + content
                + '</div>';
        }

        return returnValue;

    } else {
        return defaultReturnCall(pageNum, numPages);
    }
}


function waitFor(testFx, onReady, onTimeout, timeOutMillis, timeoutMessage) {
    var maxtimeOutMillis = timeOutMillis ? timeOutMillis : 3000;
    var start = new Date().getTime();
    var condition = false;
    var result;

    var interval = setInterval(function() {
        if ((new Date().getTime() - start < maxtimeOutMillis) && !condition ) {
            condition = (typeof(testFx) === "string" ? eval(testFx) : testFx());

        } else {
            if(!condition) {
                console.log("'waitFor()' timeout");

                if (timeoutMessage) {
                    console.log(timeoutMessage);
                }
                if (onTimeout) {
                    result = (typeof(onTimeout) === "string" ? eval(onTimeout) : onTimeout());
                    clearInterval(interval);

                } else {
                    phantom.exit(1);
                }

            } else {
                console.log("'waitFor()' finished in " + (new Date().getTime() - start) + "ms.");

                result = (typeof(onReady) === "string" ? eval(onReady) : onReady());
                clearInterval(interval);
            }
        }
    }, 50);
}


function init () {
    page.onError = function (msg, trace) {
        var msgStack = ['ERROR: ' + msg];

        if (trace && trace.length) {
            msgStack.push('TRACE:');
            trace.forEach(function(t) {
                msgStack.push(' -> ' + t.file + ': ' + t.line + (t.function ? ' (in function "' + t.function +'")' : ''));
            });
        }

        console.log(msgStack.join('\n'));
    };

    page.onConsoleMessage = function(msg) {
        console.log(/*'CONSOLE: ' + */msg);
    };

    page.onInitialized = function () {
        // 차트 요소들 렌더링 완료됐을 시 이벤트 발생
        page.evaluate(function () {
            window.svgSuccess = false;

            document.addEventListener('svg.success', function () {
                //console.log("완료!!");
                window.svgSuccess = true;
            });
            console.log('차트 리스너 등록완료');
        });
    };

    page.onLoadFinished = function () {
        ImageCacheAndCapturePage();
    };

    page.onCallback = function (data) {
        setTimeout(function () {
            if (data['status']) {
                if (data['status'] === IMG_LOADED_FLAG) {
                    console.log("모든 헤더 푸터 이미지 캐싱")

                } else if (data['status'] === "timeout") {
                    console.log("캐시할 이미지가 없거나, 캐시 실패.")
                }

                renderPage();

            } else {
                console.log("Undefined callPhantom trigger");
                console.log("close phantom");
                phantom.exit();
            }
        }, 100);
    };

    setPageConfiguration();
    printInfomationLogs();

    page.open(URL, method, parameter, function (status) {
        console.log ("PAGE STATUS : " + status);

        if (status !== 'success') {
            console.log('Unable to load the address!');
            phantom.exit();

        } else {
            console.log('Opened URL : ' + URL);
        }
    });
}


init();
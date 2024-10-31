<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=j5co10chpb&submodules=geocoder"></script>

<div class="contentsWrap">
    <div class="contents_bg"></div>
    <p class="title ${fav}">${pageName.srnNm}</p>

    <ul class="search_box">
        <li>
            <span class="stl">구역(동)</span>
            <span class="selectBox bottom" id="areaDiv_span">
            <button class="label" id="areaDiv" data-code="">전체</button>
            <ul class="optionList">
                <li class="optionItem" data-code="">전체</li>
            <c:forEach var="select1" items="${selectList1}" varStatus="status">
                <li class="optionItem" data-code="${select1.comCd}">${select1.cdNm}</li>
            </c:forEach>
            </ul>
            </span>

            <span class="stl">측정소 종류</span>
            <span class="selectBox bottom" id="locDiv_span">
            <button class="label" id="locDiv" data-code="">전체</button>
            <ul class="optionList">
                <li class="optionItem" data-code="">전체</li>
            <c:forEach var="select2" items="${selectList2}" varStatus="status">
                <li class="optionItem" data-code="${select2.etc2}">${select2.cdNm}</li>
            </c:forEach>
            </ul>
            </span>

            <span class="stl">측정소 ID</span>
            <span class="wd200">
                <input type="text" value="" name="deviceId" id="deviceId" class="input1 wd200" placeholder="">
            <span>
        </li>
        <li>
            <button class="btn_search">검색</button>
        </li>
    </ul>

    <ul class="contents">
        <li class="code5">
            <div class="stitle">
                <p class="tl">측정소 <span class="cnt">총 <strong id="totCnt1">${totCnt1}</strong> 건</span></p>
                <p class="bbs_btn">
                    <a href="#" class="btn_bbs btn_write pop_reg" data-pop="info">신규</a>
                    <a href="#" class="btn_bbs btn_edit pop_mod" data-pop="info">수정</a>
                    <!-- <a href="#" class="btn_bbs btn_delete pop_del" id="pop_del-1" data-pop="info">삭제</a> -->
                </p>
            </div>
            <table class="table">
                <colgroup>
                    <col style="width: 48px">
                    <col style="width: 96px">
                    <col style="width: 120px">
                    <col style="width: 96px">
                    <col style="width: 120px">
                    <col style="width: ">
                    <col style="width: 150px">
                </colgroup>
                <thead>
                    <tr>
                    <th>No.</th>
                    <th>측정소ID</th>
                    <th>측정소명</th>
                    <th>구역(동)</th>
                    <th>측정소종류</th>
                    <th>위치정보</th>
                    <th>SMS</th>
                    </tr>
                </thead>
            </table>

            <div class="tbody" style="overflow-y:scroll">
                <table class="table" id="table-1">
                    <colgroup>
                        <col style="width: 48px">
                        <col style="width: 96px">
                        <col style="width: 120px">
                        <col style="width: 96px">
                        <col style="width: 120px">
                        <col style="width: ">
                        <col style="width: calc(150px - 17px)">
                    </colgroup>
                    <tbody>
                    <c:forEach var="result1" items="${resultList1}" varStatus="status">
                        <tr class="<c:if test="${result1.rowno eq '1'}">on</c:if>">
                        <td><c:out value="${result1.rowno}"/></td>
                        <td><c:out value="${result1.fcltsUuid}"/></td>
                        <td><c:out value="${result1.fcltsNm}"/></td>
                        <td><c:out value="${result1.fcltsItlpcNmDs}"/></td>
                        <td><c:out value="${result1.fcltsClUuidNm}"/></td>
                        <td align="left"><c:out value="${result1.fcltsItlpcAddr}"/></td>
                        <td><c:out value="${result1.tlphonNo}"/></td>
                        <td style="display:none;"><c:out value="${result1.fcltsItlpcNm}"/></td>
                        <td style="display:none;"><c:out value="${result1.fcltsClUuid}"/></td>
                        <td style="display:none;"><c:out value="${result1.fcltsClUuidNm}"/></td>
                        <td style="display:none;"><c:out value="${result1.fcltsItlpcLa}"/></td>
                        <td style="display:none;"><c:out value="${result1.fcltsItlpcLo}"/></td>
                        <td style="display:none;"><c:out value="${result1.fwNo}"/></td>
                        <td style="display:none;"><c:out value="${result1.reason}"/></td>
                        <td style="display:none;"><c:out value="${result1.useSttus}"/></td>
                        <td style="display:none;"><c:out value="${result1.sendDt}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </li>
        <li class="view">
            <div class="stitle">
                <p class="tl">I/O 상세 <span class="cnt">총 <strong id="totCnt2">${totCnt2}</strong> 건</span></p>
                <p class="bbs_btn">
                    <!-- <a href="#" class="btn_bbs btn_init pop_open" data-pop="init"></a> -->
                    <!-- <a href="#" class="btn_bbs btn_cali pop_open" data-pop="cali"></a> -->
                </p>
            </div>

            <table class="table">
                <colgroup>
                    <col style="width: 48px">
                    <col style="width: 170px">
                    <col style="width: calc(100% - 388px)">
                </colgroup>
                <thead>
                    <tr>
                    <th>No.</th>
                    <th>I/O ID</th>
                    <th>I/O 명</th>
                    </tr>
                </thead>
            </table>
            <div class="tbody">
            <table class="table" id="table-2">
                <colgroup>
                    <col style="width: 48px">
                    <col style="width: 170px">
                    <col style="width: calc(100% - 405px)">
                </colgroup>
                <tbody>
                    <c:forEach var="result2" items="${resultList2}" varStatus="status">
                    <tr>
                    <td><c:out value="${result2.rowno}"/></td>
                    <td><c:out value="${result2.ioIdDs}"/></td>
                    <td><c:out value="${result2.ioNm}"/></td>
                    <td style="display:none;"><label class="checkbox"><input type="checkbox" value="1"><span class="icon"></span></label></td>
                    <td style="display:none;"><input type="text" name="cali" id="cali_${result2.ioId}" class="input3 wdp90" placeholder=""></td>
                    <td style="display:none;"><c:out value="${result2.fcltsUuid}"/></td>
                    <td style="display:none;"><c:out value="${result2.ioId}"/></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            </div>
        </li>
    </ul>

    <div class="pop_wrap" id="pop_info">
        <div class="pop_box">
            <div class="pop_content">
                <h3 class="pop_tit">
                측정소 정보
                </h3>

                <ul class="user_write">
                    <li>
                        <table class="table_write">
                            <tbody>
                                <tr>
                                <th>측정소 ID<span class="remark"></span></th>
                                <td><input type="text" name="deviceId" id="p1_deviceId" class="input3" placeholder=""></td>
                                <th>측정소명<span class="remark"></span></th>
                                <td><input type="text" value="" name="deviceNm" id="p1_deviceNm" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                <th>구역(동)<span class="remark"></span></th>
                                <td>
                                <span class="selectBox border bottom" id="p1_areaDiv_span">
                                <button class="label" id="p1_areaDiv" data-code="">선택</button>
                                <ul class="optionList">
                                    <c:forEach var="select1" items="${selectList1}" varStatus="status">
                                        <li class="optionItem" data-code="${select1.comCd}">${select1.cdNm}</li>
                                    </c:forEach>
                                </ul>
                                </span>
                                </td>
                                <th>측정소 종류<span class="remark"></span></th>
                                <td>
                                <span class="selectBox border bottom" id="p1_locDiv_span">
                                <button class="label" id="p1_locDiv" data-code="">선택</button>
                                <ul class="optionList">
                                <c:forEach var="select2" items="${selectList2}" varStatus="status">
                                    <li class="optionItem" data-code="${select2.etc2}">${select2.cdNm}</li>
                                </c:forEach>
                                </ul>
                                </span>
                                </td>
                                </tr>
                                <tr>
                                <th>위치<span class="remark"></span></th>
                                <td colspan="3">
                                    <span class="addr_box">
                                        <input type="hidden" id="p1_roadzpNo" placeholder="우편번호">
                                        <input type="text" id="p1_roadnmAddr" class="input9" placeholder="주소">
                                        <button class="search_btn" onclick="execDaumPostcode()"></button>
                                    </span>
                                </tr>
                                <tr>
                                <th>좌표</th>
                                <td colspan="3">
                                    <input type="text" value="X : 37.5452244" name="check_x" id="p1_la" class="input3" placeholder="" readonly disabled="disabled"> <input type="text" value="Y : 37.5452244" name="check_y" id="p1_lo" class="input3" placeholder="" readonly disabled="disabled"></td>
                                </tr>
                                <tr>
                                <th>전화번호</th>
                                <td colspan="3">
                                    <input type="text" value="" name="tel" id="p1_tel" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                <th>펌웨어 정보</th>
                                <td colspan="3">
                                    <input type="text" value="" name="fwNo" id="p1_fwNo" class="input3" placeholder="">
                                    <button class="btn_s btn_gray btn_r btn_check update">업데이트</button>
                                </td>

                                </tr>
                                <tr>
                                <th>기타 정보</th>
                                <td colspan="3">
                                    <textarea class="noresize" name="rmksCts" id="p1_reason" style="height: 60px"></textarea></td>
                                </tr>
                                <tr>
                                <th>사용여부</span></th>
                                <td colspan="3"><label class="checkbox"><input type="checkbox" id="p1_useYn" value="1" checked><span class="icon"></span></label></td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="pop_btn">
                            <span class="btn_m btn_darkline btn_r pop_close" id="pop_close-1">취소</span>
                            <button class="btn_m btn_primary btn_r" id="pop_save-1">저장</button>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div id="layer" class="pop_wrap" style="display:none;position:fixed;overflow:hidden;z-index:2001;-webkit-overflow-scrolling:touch;">
<div class="pop_box" style="width:360px;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:0px;top:0px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	<div class="pop_content" id="pop_zip">
	</div>

</div>

</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('pop_zip');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        $('#layer').stop().fadeOut(300);
        //element_layer.style.display = 'none';
    }

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample2_extraAddress").value = extraAddr;

                } else {
                    //document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('p1_roadzpNo').value = data.zonecode;
                document.getElementById("p1_roadnmAddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                //document.getElementById("p1_roadnmdtlAddr").focus();
				naver.maps.Service.geocode({
			        query: addr
			    }, function(status, response) {
					//console.log(status);
					//console.log(response);
			        if (status !== naver.maps.Service.Status.OK) {
			            return alert('Something wrong!');
			        }

			        var result = response.v2,
			        items = result.addresses;// 검색 결과의 컨테이너
			        document.getElementById('p1_la').value = items[0].y; // 검색 결과의 배열
			        document.getElementById('p1_lo').value = items[0].x; // 검색 결과의 배열

			        // do Something
			    });
                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                //element_layer.style.display = 'none';
                $('#layer').stop().fadeOut(300);
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);
        $('#layer').stop().fadeIn(300);


        // iframe을 넣은 element를 보이게 한다.
        //element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 360; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께
        var element_layer_pop = document.getElementById('pop_zip');
        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer_pop.style.width = width + 'px';
        element_layer_pop.style.height = height + 'px';
        //element_layer_pop.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer_pop.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer_pop.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
<script language="javascript">

//
var g_isInsert = true;
$('.btn_check.update').on('click', function () {
	console.log($('#p1_fwNo').val().replace('wiot_esp_','').replace('.bin',''));

	if(validFw()){
	//if(false){
		var params = {
			'title':'fwupdate'
			,'msg':'$'+$('#p1_deviceId').val()+'|U|'+$('#p1_fwNo').val().replace('wiot_esp','').replace('.bin','').replace('_','')+'|http://'+window.location.host+'/firmware/wiot_esp_'+$('#p1_fwNo').val()+'.bin'
			,'reciever':$('#p1_tel').val()
		};
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : 'http://121.190.22.245:8888/nflux/api/brief/sendSms.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;

				console.log(result);
			},
			error : function(err) {
				console.log(err);
			}
		});
	}


});

	$('.btn_search').on('click', function () {
		getMaster();
	});

	$("#deviceId").keydown(function(keyNum){
		if(keyNum.keyCode == 13){
			$(".btn_search").click();
		}
	});

	$('#table-1 > tbody > tr').on('click', function(){
		$(this).parent().children().removeClass('on');
		$(this).addClass('on');
		getDetail(this);
	});

	$('.pop_reg').on('click', function(){
		let target_pop = $(this).data('pop');
        $('#pop_'+target_pop).stop().fadeIn(300);
        if($('.pop_wrap').length){
            $('#pop_'+target_pop).stop().fadeIn(300);
        }
        popupData(target_pop,'');
	});

	$('.pop_mod').on('click', function(){
        let target_pop = $(this).data('pop');

        var row = $('#table-1 > tbody > .on');
        if(!row.length){
        	return
        }

        $('#pop_'+target_pop).stop().fadeIn(300);
        if($('.pop_wrap').length){
            $('#pop_'+target_pop).stop().fadeIn(300);
        }
        popupData(target_pop,row);
    });

	$('#pop_del-1').on('click', function(){
		let target_pop = $(this).data('pop');

        var row = $('#table-1 > tbody > .on');

        if(!row.length){
        	return
        };

		$("#confirm_msg").html("삭제하시겠습니까?");
		$('#pop_confirm').stop().fadeIn(300);
        $('#pop_confirm').stop().fadeIn(300);

        $('.btn_select.pop_confirm_select').off('click');
        $('.btn_select.pop_confirm_select').on('click', function(){

           	var params = {
          			'fcltsUuid' : $('#table-1 > tbody > .on').find('td:eq(1)').text()
           		};

           	$.ajax({
    			type : 'POST',
    			data : params,
    			dataType : 'text',
    			url : '/deleteDevice.do',
    			success : function (resp) {
    				//console.log(resp);
    				var json = JSON.parse(resp);
    				var result = json.result;
					$('#pop_confirm').hide();
    				$('.btn_search').click();
    			},
    			error : function(err){
    				console.log(err);
    			}
    		});
    	});
	});

	$('#pop_save-1').on('click', function(){
		var params = {
			'fcltsUuid':$('#p1_deviceId').val()
			,'fcltsNm':$('#p1_deviceNm').val()
			,'fcltsItlpcNm':$('#p1_areaDiv').data('code')
			,'fcltsClUuid':$('#p1_locDiv').data('code')
			,'fcltsItlpcAddr':$('#p1_roadnmAddr').val()
			,'fcltsItlpcLa':$('#p1_la').val()
			,'fcltsItlpcLo':$('#p1_lo').val()
			,'tlphonNo':$('#p1_tel').val()
			,'useSttus':$('#p1_useYn').is(':checked')?$('#p1_useYn').val():'2'
			,'fwNo':$('#p1_fwNo').val()
			,'reason':$('#p1_reason').val()
		};
		//console.log(params);
		if(valid(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : (g_isInsert?'/insertDevice.do':'/updateDevice.do'),
				success : function (resp) {
					var json = JSON.parse(resp);
					var result = json.result;

					if(result == -1000){
						$("#alert_msg").html("중복 ID입니다.");
						$('#pop_alert').stop().fadeIn(300);
				        $('#pop_alert').stop().fadeIn(300);
					} else {
						$('#pop_info').hide();
						$('.btn_search').click();

					}


				},
				error : function(err){
					console.log(err);
				}
			});
		} else {
			return false;
		}

	});

	function validFw(){
		var cnt = 0;
		var msg = "";
		var bool = true;

		if(!$('#p1_fwNo').val()){
			cnt += 1;
			msg += "버전은 필수입력 입니다.<br>";
		}

		if(cnt>0){
			$("#alert_msg").html(msg);
			$('#pop_alert').stop().fadeIn(300);
	        $('#pop_alert').stop().fadeIn(300);
	        bool = false;
		}

		return bool;

	}
	function valid(params){
		var cnt = 0;
		var msg = "";
		var bool = true;

		if(!params.fcltsUuid){
			cnt += 1;
			msg += "측정소ID는 필수입력 입니다.<br>";
		}

		if(!params.fcltsNm){
			cnt += 1;
			msg += "측정소명은 필수입력 입니다.<br>";
		}

		if(!params.fcltsItlpcNm){
			cnt += 1;
			msg += "구역(동)은 필수입력 입니다.<br>";
		}

		if(!params.fcltsClUuid){
			cnt += 1;
			msg += "측정소 종류는 필수입력 입니다.<br>";
		}

		if(!params.fcltsItlpcAddr){
			cnt += 1;
			msg += "위치는 필수입력 입니다.<br>";
		}

		if(cnt>0){
			$("#alert_msg").html(msg);
			$('#pop_alert').stop().fadeIn(300);
	        $('#pop_alert').stop().fadeIn(300);
	        bool = false;
		}

		return bool;

	}
	function validIo(params){
		var cnt = 0;
		var msg = "";
		var bool = true;

		if(!params.ioNm){
			cnt += 1;
			msg += "I/O 명은 필수입력 입니다.<br>";
		}

		if(cnt>0){
			$("#alert_msg").html(msg);
			$('#pop_alert').stop().fadeIn(300);
	        $('#pop_alert').stop().fadeIn(300);
	        bool = false;
		}

		return bool;

	}
	function getMaster(){
		$('#table-1 tbody tr').remove();
		var params = {
			'fcltsItlpcNm':$('#areaDiv').data('code')
			,'fcltsClUuid':$('#locDiv').data('code')
			,'fcltsUuid':$('#deviceId').val()
		};
		console.log(params);
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getDeviceList.do',
			//url : '/getAdtDeviceList.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;

				var appendRow = "";

				result.forEach (function (el, index) {
					appendRow += '<tr class="'+(el.rowno==1?'on':'')+'">'
						+'<td>'+el.rowno+'</td>'
						+'<td>'+el.fcltsUuid+'</td>'
						+'<td>'+el.fcltsNm+'</td>'
						+'<td>'+el.fcltsItlpcNmDs+'</td>'
						+'<td>'+el.fcltsClUuidNm+'</td>'
						+'<td align="left">'+el.fcltsItlpcAddr+'</td>'
						+'<td>'+el.tlphonNo+'</td>'
						+'<td style="display:none;">'+el.fcltsItlpcNm+'</td>'
						+'<td style="display:none;">'+el.fcltsClUuid+'</td>'
						+'<td style="display:none;">'+el.fcltsClUuidNm+'</td>'
						+'<td style="display:none;">'+el.fcltsItlpcLa+'</td>'
						+'<td style="display:none;">'+el.fcltsItlpcLo+'</td>'
						+'<td style="display:none;">'+el.fwNo+'</td>'
						+'<td style="display:none;">'+el.reason+'</td>'
						+'<td style="display:none;">'+el.useSttus+'</td>'
						+'<td style="display:none;">'+el.sendDt+'</td>'
						+'</tr>';
				});

				$('#table-1 > tbody').append(appendRow);
				$('#totCnt1').text(result.length);

				$('#table-1 > tbody > tr').on('click', function(){
					$(this).parent().children().removeClass('on');
					$(this).addClass('on');
					getDetail(this);
				});
				getDetail($('#table-1 > tbody .on'));
			},
			error : function(err){
				console.log(err);
			}
		});
	};

	function getDetail(obj){
		$('#table-2 tbody tr').remove();
		var params = {
			'fcltsUuid':$(obj).find('td:eq(1)').text()
		};

		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getIoList.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";

				result.forEach (function (el, index) {
					appendRow += '<tr>'
						+'<td>'+el.rowno+'</td>'
						+'<td>'+el.ioIdDs+'</td>'
						+'<td>'+el.ioNm+'</td>'
						+'<td style="display:none;"><label class="checkbox"><input type="checkbox" value="1"><span class="icon"></span></label></td>'
						+'<td style="display:none;"><input type="text" name="cali" id="cali_'+el.ioId+'" class="input3 wdp90" placeholder=""></td>'
						+'<td style="display:none;">'+el.fcltsUuid+'</td>'
						+'</tr>';
				});

				$('#table-2 > tbody').append(appendRow);
				$('#totCnt2').text(result.length);

				$('#table-2 > tbody > tr').on('click', function(){
					$(this).parent().children().removeClass('on');
					$(this).addClass('on');
				});
			},
			error : function(err){
				console.log(err);
			}
		});
	};
	function popupData(target_pop,row){
		if(target_pop=='info'){
			if(row.length) {
				$('#p1_deviceId').val(row.find('td:eq(1)').text());
				$('#p1_deviceId').prop('disabled',true);

				$('#p1_deviceNm').val(row.find('td:eq(2)').text());

				$('#p1_areaDiv').text(row.find('td:eq(3)').text());
				$('#p1_areaDiv').data('code',row.find('td:eq(7)').text());
				$('#p1_areaDiv').addClass('on');

				$('#p1_locDiv').text(row.find('td:eq(9)').text());
				$('#p1_locDiv').data('code',row.find('td:eq(8)').text());
				$('#p1_locDiv').addClass('on');


				$('#p1_roadnmAddr').val(row.find('td:eq(5)').text());
				$('#p1_la').val(row.find('td:eq(10)').text());
				$('#p1_lo').val(row.find('td:eq(11)').text());

				$('#p1_tel').val(row.find('td:eq(6)').text());


				//$('#p1_roadnmdtlAddr').val(row.find('td:eq(14)').text());

				//$('#p1_ioInfo').val(row.find('td:eq(7)').text());
				//$('#p1_fwInfo').val(row.find('td:eq(8)').text());
				//$('#p1_deviceSpec').val(row.find('td:eq(15)').text());
				$('#p1_useYn').prop('checked',row.find('td:eq(14)').text()=='1'?true:false);

				$('#p1_reason').val(row.find('td:eq(13)').text());
				$('#p1_fwNo').val(row.find('td:eq(12)').text());
				$('.btn_check.update').css('display','');
				$('#p1_sendDt').val(row.find('td:eq(15)').text());

				g_isInsert = false;
			} else {
				$('#p1_deviceId').val('');
				$('#p1_deviceId').prop('disabled',false);

				$('#p1_deviceNm').val('');

				$('#p1_areaDiv').text('');
				$('#p1_areaDiv').data('code','');
				$('#p1_areaDiv').removeClass('on');

				$('#p1_locDiv').text('');
				$('#p1_locDiv').data('code','');
				$('#p1_locDiv').removeClass('on');

				$('#p1_roadnmAddr').val('');
				$('#p1_la').val('');
				$('#p1_lo').val('');

				$('#p1_tel').val('');

				$('#p1_useYn').prop('checked',false);

				$('#p1_reason').val('');
				$('#p1_fwNo').val('');
				$('.btn_check.update').css('display','none');

				$('#p1_sendDt').val('');
				g_isInsert = true;
			}
		}
	};

</script>
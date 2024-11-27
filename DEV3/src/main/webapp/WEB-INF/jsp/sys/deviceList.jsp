<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=j5co10chpb"></script>

<div class="contentsWrap">
	<div class="contents_bg"></div>
	<p class="title ${fav}">${pageName.srnNm}</p>

	<ul class="search_box">
		<li>
			<input type="text" value="" name="deviceNm" id="deviceNm" class="input1" placeholder=<fmt:message key="DEVICE_NAME" bundle="${bundle}"/>>
		</li>
		<li>
			<button class="btn_search" id="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>
		</li>
	</ul>

	<ul class="contents">
		<li class="view">
			<div class="stitle">
				<div class="">
						<p class="tl"><span class="cnt"><fmt:message key="TOTAL" bundle="${bundle}"/> <strong id="totCnt">${totCnt}</strong> <fmt:message key="COUNT2" bundle="${bundle}"/></span></p>
						<ul class="optList">
							<li><a href="#" onclick="filterUseYn('ALL')" id="selectAll" class="active" id="selectAll"><fmt:message key="ALL" bundle="${bundle}"/></a></li>
							<li><a href="#" onclick="filterUseYn('Y')" id="selectUse"><fmt:message key="USE" bundle="${bundle}"/></a></li>
							<li><a href="#" onclick="filterUseYn('N')" id="selectUnUse"><fmt:message key="UNUSE" bundle="${bundle}"/></a></li>
						</ul>

					</div>
				<p class="bbs_btn">
				<!-- 	<a href="#" class="btn_bbs btn_approve confirm"></a> -->
					<a href="#" class="btn_bbs btn_write pop_reg" data-pop="write-1"><fmt:message key="NEW" bundle="${bundle}"/></a>
					<a href="#" class="btn_bbs btn_edit pop_mod" data-pop="write-1"><fmt:message key="MOD" bundle="${bundle}"/></a>
					<!-- <a href="#" class="btn_bbs btn_delete pop_del" id="pop_del-1" data-pop="write-1"></a> -->
				</p>
			</div>

			<table class="table">
				<colgroup>
					<col style="width: 48px">
					<col style="width: 15%">
					<col style="width: 15%">
					<col style="width: 10%">
					<col style="width: 15%">
					<col style="width: 15%">
					<col style="width: 10%">
					<col style="width: 100px">
				</colgroup>
				<thead>
					<tr>
                        <th>No.</th>
                        <th><fmt:message key="DEVICE_ID" bundle="${bundle}"/></th>
                        <th><fmt:message key="DEVICE_NAME" bundle="${bundle}"/></th>
                        <th><fmt:message key="FIRM_VER" bundle="${bundle}"/></th>
                        <th><fmt:message key="MAC_ADDR" bundle="${bundle}"/></th>
                        <th><fmt:message key="BIGO" bundle="${bundle}"/></th>
                        <th><fmt:message key="REG_DTTM" bundle="${bundle}"/></th>
                        <th><fmt:message key="USE_YN" bundle="${bundle}"/></th>
					</tr>
				</thead>
			</table>

			<div class="tbody" style="overflow-y:scroll">
				<table class="table" id="table-1">
					<colgroup>
                        <col style="width: 48px">
                        <col style="width: 15%">
                        <col style="width: 15%">
                        <col style="width: 10%">
                        <col style="width: 15%">
                        <col style="width: 15%">
                        <col style="width: 10%">
                        <col style="width: calc(100px - 16px)">
					</colgroup>
		        	<tbody>
		 		<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
							<td align="center" class="listtd"><c:out value="${result.rowno}"/></td>
							<td align="center" class="listtd"><c:out value="${result.deviceId}"/></td>
							<td align="center" class="listtd"><c:out value="${result.deviceNm}"/></td>
							<td align="center" class="listtd"><c:out value="${result.fwInfo}"/></td>
							<td align="center" class="listtd"><c:out value="${result.macAddr}"/></td>
							<td align="center" class="listtd"><c:out value="${result.deviceRmks}"/></td>
							<td align="center" class="listtd"><c:out value="${result.regDtm}"/></td>
							<td align="center" class="listtd"><c:out value="${result.useYn}"/></td>
							<td align="center" class="listtd" style="display:none;"><c:out value="${result.coId}"/></td>
						</tr>
					</c:forEach>
		        	</tbody>
				</table>
			</div>

		</li>
	</ul>

	<!-- 신규 등록화면 -->

	<div class="pop_wrap" id="pop_write-1">
	    <div class="pop_box">
			<div class="pop_content">
				<h3 class="pop_tit">
				  디바이스 등록
				</h3>

				<ul class="user_write">
					<li>
						<table class="table_write">
							<tbody>
								<tr>
									<!-- <th>서비스 ID</th>
									<td><input type="text" value="" name="coId" id="p1_coId" class="input3" placeholder="" disabled="true"></td> -->

									<th><fmt:message key="DEVICE_ID" bundle="${bundle}"/><span class="remark"></span></th>
									<td><input type="text" value="" name="deviceId" id="p1_deviceId" class="input3" placeholder=""></td>
									<th><fmt:message key="DEVICE_NAME" bundle="${bundle}"/><span class="remark"></th>
                                    <td><input type="text" value="" name="deviceNm" id="p1_deviceNm" class="input3" placeholder=""></td>
								</tr>
								<tr>
									<th><fmt:message key="MAC_ADDR" bundle="${bundle}"/><span class="remark"></span></th>
									<td><input type="text" value="" name="mac_addr" id="p1_macAddr" class="input3" placeholder=""></td>
									<th><fmt:message key="FIRM_VER" bundle="${bundle}"/></span></th>
									<td><input type="text" value="" name="fwInfo" id="p1_fwInfo" class="input3" placeholder=""></td>
								</tr>
                                <tr>
									<th><fmt:message key="BIGO" bundle="${bundle}"/></th>
									<td colspan="3">
                                        <!-- <input type="text" value="" name="deviceRmks" id="p1_deviceRmks" class="input3" placeholder=""> -->
                                        <textarea value="" name="deviceRmks" id="p1_deviceRmks" class="input3"></textarea>
                                    </td>
								</tr>
								<tr>
									<th><fmt:message key="USE_YN" bundle="${bundle}"/></th>
									<td><label class="checkbox"><input type="checkbox" name="useYn" id="p1_useYn" value="Y"><span class="icon"></span></label></td>
								</tr>

							</tbody>
						</table>

						<div class="pop_btn">
							<span class="btn_m btn_darkline btn_r pop_close" id="pop_close-1"><fmt:message key="CANCEL" bundle="${bundle}"/></span>
							<button class="btn_m btn_primary btn_r" id="pop_save-1"><fmt:message key="SAVE" bundle="${bundle}"/></button>
						</div>
					</li>
				</ul>
			</div>
	    </div>
	</div>

</div>

<script language="javascript">

// getMasterPopSearch();
// getMasterPopSearch2();

var g_isInsert = true;

	function getMaster(){
		$('#table-1 tbody tr').remove();
		var useYn = '';

		 if( $("#selectUse").hasClass("active")) {
			 useYn= 'Y';

		} else if($("#selectUnUse").hasClass("active")) {
			useYn= 'N';
		}

		var params = {
			'deviceNm':$('#deviceNm').val(),
			'useYn' : useYn
		};

		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getSysDeviceList.do',
			success : function (resp) {

				var json = JSON.parse(resp);
				var result = json.result;
 				var resultCode = json.resultCode;
				var appendRow = "";
				result.forEach (function (el, index) {
					appendRow += '<tr>'
						+'<td align="center" class="listtd">'+el.rowno+'</td>'
						+'<td align="center" class="listtd">'+el.deviceId+'</td>'
						+'<td align="center" class="listtd">'+el.deviceNm+'</td>'
						+'<td align="center" class="listtd">'+el.fwInfo+'</td>'
						+'<td align="center" class="listtd">'+el.macAddr+'</td>'
						+'<td align="center" class="listtd">'+el.deviceRmks+'</td>'
						+'<td align="center" class="listtd">'+el.regDtm+'</td>'
						+'<td align="center" class="listtd">'+el.useYn+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.coId+'</td>'
						+'</tr>';
				});
				$('#table-1 > tbody').append(appendRow);
				$('#totCnt').text(result.length);


				$('#table-1 > tbody > tr').on('click', function(){   // 클릭하면 선택 row 색 변화
					$(this).parent().children().removeClass('on');
					$(this).addClass('on');
				});


			},
			error : function(err){
				console.log(err);
			}
		});
	};


	//	ROW 선택 처리
	$('#table-1 > tbody > tr').on('click', function(){
		$(this).parent().children().removeClass('on');
		$(this).addClass('on');

	});

	// 검색
	$('#btn_search').on('click', function () {
		getMaster();
	});

	// 신규 등록 화면 팝업
	$('.pop_reg').on('click', function(){

		g_isInsert = true;
		let target_pop = $(this).data('pop');
        $('#pop_'+target_pop).stop().fadeIn(300);
        if($('.pop_wrap').length){
            $('#pop_'+target_pop).stop().fadeIn(300);
        }
        popupData(target_pop, '')
	});


	// 신규 등록 화면 팝업 - 닫기
	$('.pop_close1').on('click', function () {
		$('#pop_search1').stop().fadeOut(300);
	});


	// 수정 화면 팝업
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

	//  화면 팝업 - 저장/수정
	$('#pop_save-1').on('click', function(){

		var params = {
			 /* 'coId':$('#p1_coId').val()  */
			 'deviceId':$('#p1_deviceId').val()
			,'deviceNm':$('#p1_deviceNm').val()
			,'fwInfo':$('#p1_fwInfo').val()
			,'deviceRmks':$('#p1_deviceRmks').val()
			,'macAddr':$('#p1_macAddr').val()
			,'useYn':$('#p1_useYn').is(':checked')?$('#p1_useYn').val():'N'
		};

		var apiParams = {
				region: '${authInfo.cdNa}'
				,deviceId: $('#p1_macAddr').val()
				,coId: '${authInfo.coId}'
				,coDeviceId: $('#p1_deviceId').val()
				,useYn: $('#p1_useYn').is(':checked')?$('#p1_useYn').val():'N'
		};

	 	if (valid(params)) {

	 		var mac = $('#p1_macAddr').val();
	 		var deviceId = $('#p1_deviceId').val();

	 	// 신규 등록인 경우
	 		if (g_isInsert) {
	 			checkDevicePK(deviceId, function(devicePKValid) {  // 첫 번째 콜백 함수
	 		        if (devicePKValid) {
	 		            checkMacAddr(mac, function(macValid) {  // 두 번째 콜백 함수
	 		                if (macValid) {

	 		                    $.ajax({
	 		                        type: 'POST',
	 		                        data: params,
	 		                        dataType: 'text',
	 		                        url: '/insertSysDevice.do',
	 		                        success: function (resp) {
	 		                            var json = JSON.parse(resp);
	 		                            var result = json.result;

	 		                            if (result.code == 0) {
	 		                                $.ajax({
	 		                                    type: 'POST',
	 		                                    url: '${authInfo.restApiUrl}/device',
	 		                                    data: JSON.stringify(apiParams),
	 		                                    contentType: 'application/json',
	 		                                    dataType: 'json',
	 		                                    headers: {
	 		                                        'Accept': 'application/json'
	 		                                    },
	 		                                    success: function (resp) { },
	 		                                    error: function (xhr, status, error) {
	 		                                        console.error('Error in register device request:', error);
	 		                                    }
	 		                                });
	 		                            }

	 		                            $("#alert_msg").html(result.msg);
	 		                            $('#pop_alert').stop().fadeIn(300);
	 		                            $('#pop_alert').stop().fadeIn(300);

	 		                            if (result.code == 0000) {
	 		                                // 성공시 창 닫기
	 		                                $('#pop_write-1').hide();
	 		                                $('.btn_search').click();
	 		                            }
	 		                        },
	 		                        error: function (err) {
	 		                            console.log(err);
	 		                        }
	 		                    });
	 		                } else {
	 		                    return false;  // 중복된 MAC 주소가 있는 경우
	 		                }
	 		            });  // 두 번째 checkMacAddr 콜백 종료
	 		        } else {
	 		            return false;  // devicePKValid가 false인 경우
	 		        }
	 		    });  // 첫 번째 checkDevicePK 콜백 종료
	 		}

	 		// 디바이스 정보 수정인 경우
			 else {
	 			checkMacAddrForUpdate(mac, deviceId, function(macValid) {
	 	 	        if (macValid) {

	 	 	            $.ajax({
	 	 	                type: 'POST',
	 	 	                data: params,
	 	 	                dataType: 'text',
	 	 	                url: '/updateSysDevice.do',
	 	 	                success: function (resp) {
	 	 	                    var json = JSON.parse(resp);
	 	 	                    var result = json.result;

	 	 	                   if(result.code == 0){

	 		 	                        $.ajax({
	 		 	                            type: 'POST',
	 		 	                            url: '${authInfo.restApiUrl}/modify/device',
	 		 	                            data: JSON.stringify(apiParams),
	 		 	                            contentType: 'application/json',
	 		 	                            dataType: 'json',
	 		 	                            headers: {
	 		 	                                'Accept': 'application/json'
	 		 	                            },
	 		 	                            success: function (resp) { },
	 		 	                            error: function (xhr, status, error) {
	 		 	                                console.error('Error in update device request:', error);
	 		 	                            }
	 		 	                        });

	 	 	                   }

	 	 	                    $("#alert_msg").html(result.msg);
	 	 	                    $('#pop_alert').stop().fadeIn(300);
	 	 	                    $('#pop_alert').stop().fadeIn(300);

	 	 	                    if (result.code == 0000) {
	 	 	                        // 성공시 창닫기
	 	 	                        $('#pop_write-1').hide();
	 	 	                        $('.btn_search').click();
	 	 	                    }
	 	 	                },
	 	 	                error: function (err) {
	 	 	                    console.log(err);
	 	 	                }
	 	 	            });

	 	 	        } else {
	 	 	            return false;  // 중복된 MAC 주소가 있는 경우
	 	 	        }
	 	 	    });
	 		}

	 	}

	});

	function valid(params){
		var cnt = 0;
		var msg = "";
		var bool = true;

		if(!params.deviceId){
			cnt += 1;
			msg += "<fmt:message key="REQ_DEVICE_ID" bundle="${bundle}"/><br>";
		}

		if(!params.deviceNm){
			cnt += 1;
			msg += "<fmt:message key="REQ_DEVICE_NM" bundle="${bundle}"/><br>";
		}

		if(!params.macAddr){
			cnt += 1;
			msg += "<fmt:message key="MAC_REQUIRED" bundle="${bundle}"/><br>";
		}

		if(cnt > 0){
			$("#alert_msg").html(msg);
			$('#pop_alert').stop().fadeIn(300);
	        $('#pop_alert').stop().fadeIn(300);
	        bool = false;
		}

		return bool;
	}

	function checkMacAddr(mac, callback) {

	    var macParam = {
	        'macAddr': mac
	    };

	    $.ajax({
	        type: 'POST',
	        data: macParam,
	        dataType: 'text',
	        url: '/getMacAddrList.do',
	        success: function (resp) {
	            var json = JSON.parse(resp);
	            var result = json.result;

	            if (result.length > 0) {
	                $("#alert_msg").html("<fmt:message key="DUPLICATE_MAC" bundle="${bundle}"/>");
	                $('#pop_alert').stop().fadeIn(300);
	                $('#pop_alert').stop().fadeIn(300);
	                callback(false);  // 콜백에 false를 넘겨줌
	            } else {
	                callback(true);  // 콜백에 true를 넘겨줌
	            }
	        },
	        error: function (err) {
	            console.log(err);
	            callback(false);  // 에러 발생 시 false 반환
	        }
	    });
	}

	function checkMacAddrForUpdate(mac, deviceId , callback) {

	    var macParam = {
	    	'coId': '${authInfo.coId}',
	    	'deviceId': deviceId,
	        'macAddr': mac
	    };

	    $.ajax({
	        type: 'POST',
	        data: macParam,
	        dataType: 'text',
	        url: '/checkMacAddrList.do',
	        success: function (resp) {
	            var json = JSON.parse(resp);
	            var result = json.result;

	            if (result.length > 0) {
	                $("#alert_msg").html("<fmt:message key="DUPLICATE_MAC" bundle="${bundle}"/>");
	                $('#pop_alert').stop().fadeIn(300);
	                $('#pop_alert').stop().fadeIn(300);
	                callback(false);
	            } else {
	                callback(true);
	            }
	        },
	        error: function (err) {
	            console.log(err);
	            callback(false);
	        }
	    });
	}

	function checkDevicePK(deviceId , callback) {

	    var deviceParam = {
	    	'coId': '${authInfo.coId}',
	    	'deviceId': deviceId
	    };

	    $.ajax({
	        type: 'POST',
	        data: deviceParam,
	        dataType: 'text',
	        url: '/checkDuplicateDevicePK.do',
	        success: function (resp) {
	            var json = JSON.parse(resp);
	            var result = json.result;

	            if (result.length > 0) {
	                $("#alert_msg").html("<fmt:message key="DUPLICATE_DEVICE_ID" bundle="${bundle}"/>");
	                $('#pop_alert').stop().fadeIn(300);
	                $('#pop_alert').stop().fadeIn(300);
	                callback(false);
	            } else {
	                callback(true);
	            }
	        },
	        error: function (err) {
	            console.log(err);
	            callback(false);
	        }
	    });
	}

	// 팝업시 데이터 바인딩 처리
	function popupData(target_pop,row){
		if(target_pop=='write-1'){
			if(row.length) {

				//$('#p1_coId').val(row.find('td:eq(7)').text());
				$('#p1_deviceId').val(row.find('td:eq(1)').text());
				$('#p1_deviceId').attr("disabled",true);
				$('#p1_deviceNm').val(row.find('td:eq(2)').text());
				$('#p1_fwInfo').val(row.find('td:eq(3)').text());
				$('#p1_deviceRmks').val(row.find('td:eq(5)').text());
				$('#p1_macAddr').val(row.find('td:eq(4)').text());

				$('#p1_useYn').prop('checked',row.find('td:eq(7)').text()=='사용'?true:false);
				// $('#p1_useYn').val('checked',row.find('td:eq(7)').text()=='사용'?'Y':'N');
				g_isInsert = false;
			} else {
				// $('#p1_coId').val('');
				$('#p1_deviceId').val('');
				$('#p1_deviceId').attr("disabled",false);
				$('#p1_deviceNm').val('');
				$('#p1_fwInfo').val('');
				$('#p1_deviceRmks').val('');

				$('#p1_useYn').prop('checked', true);
				$('#p1_macAddr').val('');

				g_isInsert = true;
			}
		}
	};

	function Validataion(params){

		if( params.deviceId =='' ||params.deviceNm == '' ){

			return false;
		}

		return true;
	}

	function filterUseYn(useYn){
		$("#selectAll").removeAttr('class');
		$("#selectUse").removeAttr('class');
		$("#selectUnUse").removeAttr('class');

		if (useYn == "Y") {
			$('#selectUse').addClass('active')
		} else if(useYn == "N") {
			$('#selectUnUse').addClass('active')
		} else {
			$('#selectAll').addClass('active')
		}
		getMaster();

	}

	</script>
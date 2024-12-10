<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<div class="contentsWrap">
    <div class="contents_bg"></div>
    <p class="title ${fav}">${pageName.srnNm}</p>

    <ul class="search_box">
        <li style="display:none;" >
            <span class="selectBox bottom" id="authgrpId_span">
                <button class="label" id="authgrpId" data-code="">권한그룹</button>
                <ul class="optionList">
                    <li class="optionItem" data-code="">전체</li>
                    <c:forEach var="select1" items="${selectList1}" varStatus="status">
                        <li class="optionItem" data-code="${select1.authgrpId}">${select1.authgrpNm}</li>
                    </c:forEach>
                </ul>
            </span>

        </li>
        <li>
            <input type="text" name="usrId" id="usrId" class="input1" placeholder="<fmt:message key="USER_ID_NM" bundle="${bundle}"/>">
            <button class="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>
        </li>
    </ul>

    <ul class="contents">
        <li class="view">
            <div class="stitle">
                <p class="tl"><span class="cnt"><fmt:message key="TOTAL" bundle="${bundle}"/> <strong id="totCnt">${totCnt}</strong> <fmt:message key="COUNT2" bundle="${bundle}"/></span></p>
                <p class="bbs_btn">
                    <a href="#" class="btn_bbs btn_write pop_reg" data-pop="write-1"><fmt:message key="NEW" bundle="${bundle}"/></a>
                    <a href="#" class="btn_bbs btn_edit pop_mod" data-pop="write-1"><fmt:message key="MOD" bundle="${bundle}"/></a>
                    <a href="#" class="btn_bbs btn_delete pop_del" id="pop_del-1" data-pop="write-1"><fmt:message key="DELETE" bundle="${bundle}"/></a>
                </p>
            </div>

            <table class="table">
                <colgroup>
                    <col style="width: 48px">
                    <col style="width: 25%">
                    <col style="width: 10%">
                    <col style="width: 15%">
                    <col style="width: 12%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 128px">
                </colgroup>
                <thead>
                    <tr>
                        <th>No.</th>
                        <th><fmt:message key="USER_ID" bundle="${bundle}"/></th>
                        <th><fmt:message key="USER_NM" bundle="${bundle}"/></th>
                        <th><fmt:message key="AUTH_GRP" bundle="${bundle}"/></th>
                        <th><fmt:message key="TEL" bundle="${bundle}"/></th>
                        <th><fmt:message key="APPLY_DATE" bundle="${bundle}"/></th>
                        <th><fmt:message key="AUTH_START_DATE" bundle="${bundle}"/></th>
                        <th><fmt:message key="AUTH_END_DATE" bundle="${bundle}"/></th>
                        <th><fmt:message key="USE_YN" bundle="${bundle}"/></th>
                    </tr>
                </thead>
            </table>

            <div class="tbody" style="overflow-y:scroll">
                <table class="table" id="table-1">
                    <colgroup>
                        <col style="width: 48px">
                        <col style="width: 25%">
                        <col style="width: 10%">
                        <col style="width: 15%">
                        <col style="width: 12%">
                        <col style="width: 10%">
                        <col style="width: 10%">
                        <col style="width: 10%">
                        <col style="width: calc(120px - 16px)">
                    </colgroup>
                    <tbody>
                    <c:forEach var="result" items="${resultList}" varStatus="status">
                        <tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
	                        <td align="center" class="listtd"><c:out value="${result.rowno}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result.usrId}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result.usrNm}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result.authgrpNm}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result.cotelNo}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result.regDt}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result.useDt}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result.endDt}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result.useYn}"/></td>
	                        <td align="center" class="listtd" style="display:none;"><c:out value="${result.authgrpId}"/></td>
	                        <td align="center" class="listtd" style="display:none;"><c:out value="${result.adminYn}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </li>
    </ul>

    <div class="pop_wrap" id="pop_write-1">
        <div class="pop_box">
            <div class="pop_content">
                <h3 class="pop_tit">
                <fmt:message key="USER_INFO" bundle="${bundle}"/>
                </h3>

                <ul class="user_write">
                    <li>
                        <table class="table_write">
                            <tbody>
                                <tr>
                                    <th><fmt:message key="USER_ID" bundle="${bundle}"/><span class="remark" id="userIdSpan"></span></th>
                                    <td colspan="3">
                                    <input type="text" name="usrId" id="p1_usrId" class="input3 p1_usrId" >
                                    <button id="chkBtn" class="btn_s btn_gray btn_r btn_check check"><fmt:message key="DUPLICATION_CHECK" bundle="${bundle}"/></button>
                                    <span id="checkMsg"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="PWD" bundle="${bundle}"/><span class="remark" id="userPwdSpan"></span></th>
                                    <td colspan="3">
                                    <input type="password" type="text" name="pwd" id="p1_pwd" class="input3 p1_pwd" >
                                    <button class="btn_s btn_gray btn_r btn_check reset"><fmt:message key="RESET_PWD" bundle="${bundle}"/></button>
                                    </td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="USER_NM" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td><input type="text" name="usrNm" id="p1_usrNm" class="input3 p1_usrNm" ></td>
                                    <!-- <th>부서명</th>
                                    <td><input type="text" name="deptNm" id="p1_deptNm" class="input3 p1_deptNm" ></td> -->
                                </tr>
                                <tr>
                                    <th><fmt:message key="TEL" bundle="${bundle}"/></th>
                                    <td><input type="text" name="cotelNo" id="p1_cotelNo" class="input3 p1_cotelNo" ></td>
                                    <!-- <th>신청일</th>
                                    <td><input type="text" name="regDt" id="p1_regDt" class="input3 p1_regDt"  disabled="disabled"></td> -->
                                </tr>
                                <tr>
                                    <th><fmt:message key="AUTH_GRP" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td>
                                        <span class="selectBox bottom border" id="p1_authgrpId_span">
                                            <button class="label p1_authgrpId" id="p1_authgrpId" data-code=""><fmt:message key="AUTH_GRP" bundle="${bundle}"/></button>
                                            <ul class="optionList">
                                                <li class="optionItem" data-code=""><fmt:message key="SELECTION" bundle="${bundle}"/></li>
                                                <c:forEach var="select1" items="${selectList1}" varStatus="status">
                                                    <li class="optionItem" data-code="${select1.authgrpId}">${select1.authgrpNm}</li>
                                                </c:forEach>
                                            </ul>
                                        </span>
                                    </td>
                                    <!-- <th>관리자여부<span class="remark"></span></th>
                                    <td><label class="checkbox"><input type="checkbox" name="adminYn" id="p1_adminYn" value="1"><span class="icon"></span></label></td> -->
                                </tr>
                                <tr>
                                    <th><fmt:message key="AUTH_START_DATE" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td>
                                        <span class="date" style="position: relative">
                                        <input type="text" name="useDt" id="p1_useDt" class="input3 p1_useDt" readonly>
                                        <button class="search_calender" id="search_calender1"></button>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="AUTH_END_DATE" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td>
                                        <span class="date" style="position: relative">
                                        <input type="text" name="endDt" id="p1_endDt" class="input3 p1_endDt" readonly>
                                        <button class="search_calender" id="search_calender2"></button>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4"><span class="txt">※ <fmt:message key="USER_ID_RULE" bundle="${bundle}"/><br>
                                    								※ <fmt:message key="USER_PWD_RULE" bundle="${bundle}"/>
                                   </span></td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="pop_btn">
                            <span class="btn_m btn_darkline btn_r pop_close" id="pop_close-1"><fmt:message key="CANCEL" bundle="${bundle}"/></span>
                            <button class="btn_m btn_primary btn_r" id="pop_save-1"><fmt:message key="SAVE" bundle="${bundle}"/></button>
                            <!-- <button class="btn_m btn_primary btn_r" id="pop_approve">승인</button> -->
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>


<script language="javascript">

var g_isInsert = true;
var g_idCheck = false;
	//alert("${authInfo}")
	//console.log("${authInfo.coId}")
	//날짜선택
	$('#search_calender1').daterangepicker({
	   singleDatePicker: true,
		autoApply: true,
		autoUpdateInput: false,
		singleClasses: "date",
		locale: {
			"format": "YYYY-MM-DD",
			"separator": " - ",
			"applyLabel": "<fmt:message key="CONFIRM" bundle="${bundle}"/>",
			"cancelLabel": "<fmt:message key="CANCEL" bundle="${bundle}"/>",
			"fromLabel": "From",
			"toLabel": "~",
			"customRangeLabel": "Custom",
			"weekLabel": "W",
			"daysOfWeek": [
				"<fmt:message key="SUNDAY" bundle="${bundle}"/>",
	        	"<fmt:message key="MONDAY" bundle="${bundle}"/>",
	        	"<fmt:message key="TUESDAY" bundle="${bundle}"/>",
	        	"<fmt:message key="WEDNESDAY" bundle="${bundle}"/>",
	        	"<fmt:message key="THURSDAY" bundle="${bundle}"/>",
	        	"<fmt:message key="FRIDAY" bundle="${bundle}"/>",
	        	"<fmt:message key="SATURDAY" bundle="${bundle}"/>"
			],
			"monthNames": [
				"<fmt:message key="JANUARY" bundle="${bundle}"/>",
	        	"<fmt:message key="FEBRUARY" bundle="${bundle}"/>",
	        	"<fmt:message key="MARCH" bundle="${bundle}"/>",
	        	"<fmt:message key="APRIL" bundle="${bundle}"/>",
	        	"<fmt:message key="MAY" bundle="${bundle}"/>",
	        	"<fmt:message key="JUNE" bundle="${bundle}"/>",
	        	"<fmt:message key="JULY" bundle="${bundle}"/>",
	        	"<fmt:message key="AUGUST" bundle="${bundle}"/>",
	        	"<fmt:message key="SEPTEMBER" bundle="${bundle}"/>",
	        	"<fmt:message key="OCTOBER" bundle="${bundle}"/>",
	        	"<fmt:message key="NOVEMBER" bundle="${bundle}"/>",
	        	"<fmt:message key="DECEMBER" bundle="${bundle}"/>"
			],
			"firstDay": 0
		}
	},function(start, end, label) {
			$("#p1_useDt").val(start.format('YYYY-MM-DD'));
	});

	$('#search_calender2').daterangepicker({
	   singleDatePicker: true,
		autoApply: true,
		autoUpdateInput: false,
		singleClasses: "date",
		locale: {
			"format": "YYYY-MM-DD",
			"separator": " - ",
			"applyLabel": "<fmt:message key="CONFIRM" bundle="${bundle}"/>",
			"cancelLabel": "<fmt:message key="CANCEL" bundle="${bundle}"/>",
			"fromLabel": "From",
			"toLabel": "~",
			"customRangeLabel": "Custom",
			"weekLabel": "W",
			"daysOfWeek": [
				"<fmt:message key="SUNDAY" bundle="${bundle}"/>",
	        	"<fmt:message key="MONDAY" bundle="${bundle}"/>",
	        	"<fmt:message key="TUESDAY" bundle="${bundle}"/>",
	        	"<fmt:message key="WEDNESDAY" bundle="${bundle}"/>",
	        	"<fmt:message key="THURSDAY" bundle="${bundle}"/>",
	        	"<fmt:message key="FRIDAY" bundle="${bundle}"/>",
	        	"<fmt:message key="SATURDAY" bundle="${bundle}"/>"
			],
			"monthNames": [
				"<fmt:message key="JANUARY" bundle="${bundle}"/>",
	        	"<fmt:message key="FEBRUARY" bundle="${bundle}"/>",
	        	"<fmt:message key="MARCH" bundle="${bundle}"/>",
	        	"<fmt:message key="APRIL" bundle="${bundle}"/>",
	        	"<fmt:message key="MAY" bundle="${bundle}"/>",
	        	"<fmt:message key="JUNE" bundle="${bundle}"/>",
	        	"<fmt:message key="JULY" bundle="${bundle}"/>",
	        	"<fmt:message key="AUGUST" bundle="${bundle}"/>",
	        	"<fmt:message key="SEPTEMBER" bundle="${bundle}"/>",
	        	"<fmt:message key="OCTOBER" bundle="${bundle}"/>",
	        	"<fmt:message key="NOVEMBER" bundle="${bundle}"/>",
	        	"<fmt:message key="DECEMBER" bundle="${bundle}"/>"
			],
			"firstDay": 0
		}
	},function(start, end, label) {
			$("#p1_endDt").val(start.format('YYYY-MM-DD'));
	});

	$('.btn_search').on('click', function () {
		getMaster();
	});

	$('.btn_check.check').on('click', function () {

		var params = {
			//'coId':'A0001',
			'coId':'${authInfo.coId}',
			'usrId':$('.p1_usrId').val()
		};

		console.log(params)
		if(validIdCheck(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/getUserIdCheck.do',
				success : function (resp) {
					var json = JSON.parse(resp);
					var result = json.result;
					if(result==0){
						$('#checkMsg').text('<fmt:message key="POSSIBLE" bundle="${bundle}"/>');
						$('#checkMsg').css('color','green');
						g_idCheck = true;
						$('#p1_usrId').prop('disabled',true);
					} else if(result==1){
						$('#checkMsg').text('<fmt:message key="DUP_IMPOSSIBLE" bundle="${bundle}"/>');
						$('#checkMsg').css('color','red');
						g_idCheck = false;
						$('#p1_usrId').prop('disabled',false);
					} else if(result==-1){
						$('#checkMsg').text('<fmt:message key="DOMAIN_IMPOSSIBLE" bundle="${bundle}"/>');
						$('#checkMsg').css('color','red');
						g_idCheck = false;
						$('#p1_usrId').prop('disabled',false);
					}
				},
				error : function(err) {
					console.log(err);
				}
			});
		}

	});

	$('.btn_check.reset').on('click', function () {

		var params = {
			'coId':'${authInfo.coId}',
			'usrId':$('.p1_usrId').val()
		};

		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/updateUserPwdReset.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;

			},
			error : function(err) {
				console.log(err);
			}
		});
	});

	$("#usrId").keydown(function(keyNum){
		if(keyNum.keyCode == 13){
			$(".btn_search").click();
		}
	});

	$('#table-1 > tbody > tr').on('click', function(){
		$(this).parent().children().removeClass('on');
		$(this).addClass('on');
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

		$("#confirm_msg").html("<fmt:message key="Q_DELETE" bundle="${bundle}"/>");
		$('#pop_confirm').stop().fadeIn(300);
        $('#pop_confirm').stop().fadeIn(300);


        $('.pop_confirm_select').off('click');
        $('.pop_confirm_select').on('click', function(){

           	var params = {
          			'usrId' : $('#table-1 > tbody > .on').find('td:eq(1)').text()
           		};

        	$('#confirm_msg').hide();

           	$.ajax({
    			type : 'POST',
    			data : params,
    			dataType : 'text',
    			url : '/deleteUser.do',
    			success : function (resp) {

    				var json = JSON.parse(resp);
    				var result = json.result;

    				$("#alert_msg").html(result.msg);
					$('#pop_alert').stop().fadeIn(300);
		        	$('#pop_alert').stop().fadeIn(300);

					if(result.code == 0000){
						// 성공시 창닫기
						$('#pop_write-1').hide();
	    				$('.btn_search').click();

					}



    			},
    			error : function(err){
    				console.log(err);
    			}
    		});
    	});
	});

	$('#pop_save-1').on('click', function(){
		var params = {
			'usrId':$('.p1_usrId').val()
			,'sectNo':$('.p1_pwd').val()
			,'usrNm':$('.p1_usrNm').val()
			,'deptNm':$('.p1_deptNm').val()
			,'cotelNo':$('.p1_cotelNo').val()
			,'regDt':$('.p1_regDt').val()
			,'authgrpId':$('.p1_authgrpId').data('code')
			,'useDt':$('.p1_useDt').val()
			,'endDt':$('.p1_endDt').val()
			,'adminYn':$('#p1_adminYn').is(':checked')?$('#p1_adminYn').val():''
			//,'coId':'A0001'
			,'coId':'${authInfo.coId}'
			,'statConfirm':'1'
		};


		if(valid(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : (g_isInsert?'/insertUser.do':'/updateUser.do'),
				success : function (resp) {
					var json = JSON.parse(resp);
					var result = json.result;

    				$("#alert_msg").html(result.msg);
					$('#pop_alert').stop().fadeIn(300);
		        	$('#pop_alert').stop().fadeIn(300);

					if(result.code == 0000){
						// 성공시 창닫기
						$('#pop_write-1').hide();
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

	$('#pop_approve').on('click', function(){
		var params = {
			'usrId':$('.p1_usrId').val()
		};

		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/approveUser.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;
		        var row = $('#table-1 > tbody > .on');
		        row.find('td:eq(1)').text('승인');
			},
			error : function(err){
				console.log(err);
			}
		});

	});
	function valid(params){
		var cnt = 0;
		var msg = "";
		var bool = true;

		//var reg = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,16}$/;
		var reg = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-z]{2,50}).{8,}$/;

		var pwdChk = params.sectNo;


		// 신규인 경우에만 비밀번호 형식 체크
		if(g_isInsert){
			if( !reg.test(pwdChk) ) {
			    msg += "<fmt:message key="REQ_PW_RULE" bundle="${bundle}"/><br>";

			    $("#alert_msg").html(msg);
				$('#pop_alert').stop().fadeIn(300);
		        $('#pop_alert').stop().fadeIn(300);
		        bool = false;
		        return false;
			}
		}

		if(!params.usrId){
			cnt += 1;
			msg += "<fmt:message key="USER_ID_REQUIRED" bundle="${bundle}"/><br>";
		}

		if(!g_idCheck){
			cnt += 1;
			msg += "<fmt:message key="DUP_CHECK_REQUIRED" bundle="${bundle}"/><br>";
		}

		/* if(params.sectNo){
			cnt += 1;
			msg += "비밀번호는 필수입력 입니다.<br>";
		} */

		if(!params.sectNo&&g_isInsert){
			cnt += 1;
			msg += "<fmt:message key="PASSWORD_REQUIRED" bundle="${bundle}"/><br>";
		}

		if(!params.usrNm){
			cnt += 1;
			msg += "<fmt:message key="USER_NM_REQUIRED" bundle="${bundle}"/><br>";
		}

		if(!params.authgrpId){
			cnt += 1;
			msg += "<fmt:message key="AUTH_GRP_REQURIED" bundle="${bundle}"/><br>";
		}

		if(!params.useDt){
			cnt += 1;
			msg += "<fmt:message key="AUTH_START_REQUIRED" bundle="${bundle}"/><br>";
		}

		if(!params.endDt){
			cnt += 1;
			msg += "<fmt:message key="AUTH_END_REQUIRED" bundle="${bundle}"/>";
		}

		if(cnt>0){
			$("#alert_msg").html(msg);
			$('#pop_alert').stop().fadeIn(300);
	        $('#pop_alert').stop().fadeIn(300);
	        bool = false;
		}

		return bool;

	}

	function validIdCheck(params){
		var cnt = 0;
		var msg = "";
		var bool = true;

		if(!params.usrId){
			cnt += 1;
			msg += "<fmt:message key="USER_ID_REQUIRED" bundle="${bundle}"/><br>";
		}

		if(!CheckEmail(params.usrId)){
			cnt += 1;
			msg += "<fmt:message key="USER_ID_TYPE_NOT_MATCH" bundle="${bundle}"/><br>";
		}

		if(cnt>0){
			$("#alert_msg").html(msg);
			$('#pop_alert').stop().fadeIn(300);
	        $('#pop_alert').stop().fadeIn(300);
	        bool = false;
		}

		return bool;

	}
	function CheckEmail(str){
	    var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	    if(!reg_email.test(str)) {
	         return false;
	    }
	    else {
	         return true;
	    }
	}
	function getMaster(){
		$('#table-1 tbody tr').remove();
		var params = {
			'authgrpId':$('#authgrpId').data('code')
			,'statConfirm': ''
			,'usrId':$('#usrId').val()
		};

		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getUserList.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";




				result.forEach (function (el, index) {
					appendRow += '<tr>'
						+'<td align="center" class="listtd">'+el.rowno+'</td>'
						+'<td align="center" class="listtd">'+el.usrId+'</td>'
						+'<td align="center" class="listtd">'+el.usrNm+'</td>'
						+'<td align="center" class="listtd">'+el.authgrpNm+'</td>'
						+'<td align="center" class="listtd">'+el.cotelNo+'</td>'
						+'<td align="center" class="listtd">'+el.regDt+'</td>'
						+'<td align="center" class="listtd">'+el.useDt+'</td>'
						+'<td align="center" class="listtd">'+el.endDt+'</td>'
						+'<td align="center" class="listtd">'+el.useYn+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.authgrpId+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.adminYn+'</td>'
						+'</tr>';
				});

				$('#table-1 > tbody').append(appendRow);
				$('#totCnt').text(result.length);

				$('#table-1 > tbody > tr').on('click', function(){
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
		if(target_pop=='write-1'){

			if(row.length) {
				$('.p1_usrId').val(row.find('td:eq(1)').text());
				$('.p1_usrId').prop('disabled',true);
				$('.btn_check.check').prop('disabled',true);
				$('#checkMsg').text('');

				$('.btn_check.reset').css('display','');

				$('.p1_pwd').val('');
				$('.p1_pwd').prop('disabled',true);

				$('.p1_usrNm').val(row.find('td:eq(2)').text());

				$('.p1_deptNm').val(row.find('').text());
				$('.p1_cotelNo').val(row.find('td:eq(4)').text());
				$('.p1_regDt').val(row.find('td:eq(5)').text());
				$('.p1_authgrpId').text(row.find('td:eq(3)').text());
				$('.p1_authgrpId').data('code',row.find('td:eq(9)').text());
				$('.p1_authgrpId').addClass('on');

				$('.p1_useDt').val(row.find('td:eq(6)').text());
				if($('.p1_useDt').val()){
					$('#search_calender1').data('daterangepicker').setStartDate($('.p1_useDt').val());
					$('#search_calender1').data('daterangepicker').setEndDate($('.p1_useDt').val());
				}

				$('.p1_endDt').val(row.find('td:eq(7)').text());
				if($('.p1_endDt').val()){
					$('#search_calender2').data('daterangepicker').setStartDate($('.p1_endDt').val());
					$('#search_calender2').data('daterangepicker').setEndDate($('.p1_endDt').val());
				}

				$('#p1_adminYn').prop('checked',row.find('td:eq(8)').text()=='사용'?true:false);

				if(row.find('td:eq(1)').text()=='승인'){
					$('#pop_approve').css('display','none');//prop('disabled',false);
				} else {
					$('#pop_approve').css('display','block');//prop('disabled',false);
				}


				// remark 제거
				$('#userIdSpan').removeAttr('class');
				$('#userPwdSpan').removeAttr('class');
				$('#p1_pwd').css('display','none');
				$('.btn_check.check').css('display','none');


				g_isInsert = false;
				g_idCheck = true;
			} else {

				$('.btn_check.check').css('display', '')

				$('.p1_usrId').val('');
				$('.p1_usrId').prop('disabled',false);
				$('.btn_check.check').prop('disabled',false);
				$('#checkMsg').text('');

				$('.btn_check.reset').css('display','none');

				$('.p1_pwd').val('');
				$('.p1_pwd').prop('disabled',false);

				$('.p1_usrNm').val('');
				$('.p1_deptNm').val('');
				$('.p1_cotelNo').val('');
				$('.p1_regDt').val('');
				$('.p1_authgrpId').text('<fmt:message key="AUTH_GRP" bundle="${bundle}"/>');

				$('.p1_authgrpId').data('code','');
				$('.p1_authgrpId').removeClass('on');

				$('.p1_useDt').val('${todayDt}');
				$('.p1_endDt').val('');

				$('#p1_adminYn').prop('checked',false);

				//$('#pop_approve').prop('disabled',true);
				$('#pop_approve').css('display','none');//prop('disabled',false);

				//
				$('#userIdSpan').attr('class', 'remark');
				$('#userPwdSpan').attr('class', 'remark');
				$('#p1_pwd').css('display','block');


				g_isInsert = true;
				g_idCheck = false;
			}

		}

	};

</script>
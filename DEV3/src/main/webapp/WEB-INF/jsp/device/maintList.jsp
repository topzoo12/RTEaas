<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script>
console.log("${authInfo.cdNa}");
</script>
<div class="contentsWrap">
    <div class="contents_bg"></div>
    <p class="title ${fav}">${pageName.srnNm}</p>

    <ul class="search_box">
		<li>
			<input type="text" value="" name="deviceNm" id="deviceNm" class="input1" placeholder=<fmt:message key="DEVICE_NAME" bundle="${bundle}"/>>
		</li>
        <li>
            <button class="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>  <!--검색 -->
        </li>
    </ul>

    <ul class="contents">
        <li class="code">
            <div class="stitle">
                <p class="tl"><fmt:message key="DEVICE_STATUS" bundle="${bundle}"/> <span class="cnt"><fmt:message key="TOTAL" bundle="${bundle}"/> <strong id="totCnt1">${totCnt1}</strong> <fmt:message key="COUNT2" bundle="${bundle}"/></span></p>
            </div>
            <table class="table">
                <colgroup>
                    <col style="width: 48px">
                    <col style="width: 160px">
                    <col style="width: 160px">
                    <col style="width: 110px">
                </colgroup>
                <thead>
                    <tr>
                    <th>No.</th>
                    <th><fmt:message key="DEVICE_ID" bundle="${bundle}"/></th>
                    <th><fmt:message key="DEVICE_NAME" bundle="${bundle}"/> </th>
                    <th><fmt:message key="USE_YN" bundle="${bundle}"/> </th>
                    </tr>
                </thead>
            </table>

            <div class="tbody" style="overflow-y:scroll">
                <table class="table" id="table-1">
                    <colgroup>
                        <col style="width: 48px">
                        <col style="width: 160px">
                        <col style="width: 160px">
                        <col style="width: calc(100px - 14px)">
                    </colgroup>
                    <tbody>
                    <c:forEach var="result1" items="${resultList1}" varStatus="status">
                        <tr class="<c:if test="${result1.rowno eq '1'}">on</c:if>">
                        <td><c:out value="${result1.rowno}"/></td>
                        <td><c:out value="${result1.fcltsUuid}"/></td>
                        <td><c:out value="${result1.fcltsNm}"/></td>
                        <td style="display:none;"><c:out value="${result1.stat}"/></td>
                        <td><c:out value="${result1.useSttus}"/></td>
                        <td style="display:none;"><c:out value="${result1.fcltsItlpcNm}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </li>
        <li class="view">
            <div class="stitle">
                <p class="tl"><fmt:message key="MAINT_HISTORY" bundle="${bundle}"/> <span class="cnt"><fmt:message key="TOTAL" bundle="${bundle}"/> <strong id="totCnt2">${totCnt2}</strong> <fmt:message key="COUNT2" bundle="${bundle}"/></span></p>
                <p class="bbs_btn">
                    <a href="#" class="btn_bbs btn_write pop_reg" data-pop="write"><fmt:message key="NEW" bundle="${bundle}"/></a>
                    <a href="#" class="btn_bbs btn_edit pop_mod" data-pop="write"><fmt:message key="MOD" bundle="${bundle}"/></a>
                    <a href="#" class="btn_bbs btn_delete pop_del" id="pop_del-2" data-pop="write"><fmt:message key="DELETE" bundle="${bundle}"/></a>
                </p>
            </div>

            <table class="table">
                <colgroup>
                    <col style="width: 48px">
                    <col style="width: 150px">
                    <col style="width: 150px">
                    <col style="width: calc(100% - 498px)">
                </colgroup>
                <thead>
                    <tr>
                    <th>No.</th>
                    <th><fmt:message key="DEVICE_ID" bundle="${bundle}"/></th>
                    <th><fmt:message key="INS_DATE" bundle="${bundle}"/></th>
                    <th><fmt:message key="INS_DETAIL" bundle="${bundle}"/></th>
                    </tr>
                </thead>
            </table>
            <div class="tbody">
            <table class="table" style="table-layout: fixed;" id="table-2">
                <colgroup>
                    <col style="width: 48px">
                    <col style="width: 150px">
                    <col style="width: 150px">
                    <col style="width: calc(100% - 515px)">
                </colgroup>
                <tbody>
                    <c:forEach var="result2" items="${resultList2}" varStatus="status">
                    <tr class="<c:if test="${result2.rowno eq '1'}">on</c:if>">
	                    <td><c:out value="${result2.rowno}"/></td>
	                    <td><c:out value="${result2.fcltsUuid}"/></td>
	                    <td><c:out value="${result2.checkDt}"/></td>
	                    <td style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;"><c:out value="${result2.checkCts}"/></td>
	                    <td style="display:none;"><c:out value="${result2.checkNo}"/></td>
	                    <td style="display:none;"><c:out value="${result2.checkDiv}"/></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            </div>
        </li>
    </ul>

    <div class="pop_wrap" id="pop_write">
        <div class="pop_box">
            <div class="pop_content">
                <h3 class="pop_tit">
                <fmt:message key="MAINT_DETAIL" bundle="${bundle}"/>
                </h3>

                <ul class="user_write">
                    <li>
                        <table class="table_write">
                            <tbody>
                                <tr>
                                    <th><fmt:message key="DEVICE_ID" bundle="${bundle}"/></th>
                                    <td>
                                        <input type="text" name="deviceId" id="p1_deviceId" class="input3" placeholder="" readonly disabled="disabled">
                                        <input type="hidden" name="checkNo" id="p1_checkNo" class="input3" placeholder="">
                                    </td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="DEVICE_NAME" bundle="${bundle}"/></th>
                                    <td><input type="text" name="deviceNm" id="p1_deviceNm" class="input3" placeholder="" readonly disabled="disabled"></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="INS_DATE" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td><span class="date" style="position: relative">
                                        <input type="text" value="" name="date" id="p1_checkDt" class="input3" readonly>
                                        <button class="search_calender" id="calender1"></button>
                                    </span></td>

                                    <%-- <th>AS방법<span class="remark"></span></th>
                                    <td><span class="selectBox bottom border" id="p1_check_span">
                                    <button class="label" id="p1_check" data-code="">AS방법</button>
                                    <ul class="optionList">
                                    <c:forEach var="select2" items="${selectList2}" varStatus="status">
                                        <li class="optionItem" data-code="${select2.comCd}">${select2.cdNm}</li>
                                    </c:forEach>
                                    </ul>
                                    </span></td> --%>
                                </tr>
                                <tr>
                                <th><fmt:message key="INS_DETAIL" bundle="${bundle}"/><span class="remark"></th>
                                <td>
                                    <textarea class="noresize" name="checkCts" id="p1_checkCts" style="height: 60px;width: 240px;"></textarea></td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="pop_btn">
                            <span class="btn_m btn_darkline btn_r pop_close" id="pop_close-2"><fmt:message key="CANCEL" bundle="${bundle}"/></span> <!-- 취소 -->
                            <button class="btn_m btn_primary btn_r" id="pop_save-2"><fmt:message key="SAVE" bundle="${bundle}"/></button>  <!-- 저장 -->
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<script language="javascript">
$(function() {

	   //날짜선택
	   $('#calender1').daterangepicker({
		   singleDatePicker: true,
			autoApply: true,
			autoUpdateInput: false,
			singleClasses: "date",
			locale: {
				"format": "YYYY-MM-DD",
				"separator": " - ",
				"applyLabel": "<fmt:message key="CONFIRM" bundle="${bundle}"/>",
				"cancelLabel":"<fmt:message key="CANCEL" bundle="${bundle}"/>",
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
				$("#p1_checkDt").val(start.format('YYYY-MM-DD'));
		});

	});

var g_isInsert = true;

	$('.btn_search').on('click', function () {
		getMaster();
	});

	$("#deviceNm").keydown(function(keyNum){
		if(keyNum.keyCode == 13){
			$(".btn_search").click();
		}
	});

	$('#table-1 > tbody > tr').on('click', function(){
		$(this).parent().children().removeClass('on');
		$(this).addClass('on');
		getDetail(this);
	});

	$('#table-2 > tbody > tr').on('click', function(){
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

        var row = $('#table-2 > tbody > .on');
        if(!row.length){
        	return
        }

        $('#pop_'+target_pop).stop().fadeIn(300);
        if($('.pop_wrap').length){
            $('#pop_'+target_pop).stop().fadeIn(300);
        }
        popupData(target_pop,row);
    });

	$('#pop_del-2').on('click', function(){
		let target_pop = $(this).data('pop');

        var row = $('#table-2 > tbody > .on');

        if(!row.length){
        	return
        };

		$("#confirm_msg").html("<fmt:message key="Q_DELETE" bundle="${bundle}"/>");
		$('#pop_confirm').stop().fadeIn(300);
        $('#pop_confirm').stop().fadeIn(300);

        $('.pop_confirm_select').off('click');
        $('.pop_confirm_select').on('click', function(){


        		console.log($('#table-2 > tbody > .on').find('td:eq(5)').text())
        		console.log($('#table-2 > tbody > .on').find('td:eq(4)').text())
        		console.log($('#table-2 > tbody > .on').find('td:eq(3)').text())
        		console.log($('#table-2 > tbody > .on').find('td:eq(2)').text())
        		console.log($('#table-2 > tbody > .on').find('td:eq(1)').text())
           	var params = {
          			'checkNo' : $('#table-2 > tbody > .on').find('td:eq(4)').text()
           		};

           	$.ajax({
    			type : 'POST',
    			data : params,
    			dataType : 'text',
    			url : '/deleteDeviceMng.do',
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


					$('#pop_confirm').hide();
   					getDetail($('#table-1 > tbody .on'));
    			},
    			error : function(err){
    				console.log(err);
    			}
    		});
    	});
	});

	$('#pop_save-2').on('click', function(){
		var params = {
			'checkNo':$('#p1_checkNo').val()
			,'fcltsUuid':$('#p1_deviceId').val()
			,'checkDt':$('#p1_checkDt').val()
			,'checkDiv':$('#p1_check').data('code')
			,'checkCts':$('#p1_checkCts').val()
		};
		if(valid(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : (g_isInsert?'/insertDeviceMng.do':'/updateDeviceMng.do'),
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

					$('#pop_write').hide();
   					getDetail($('#table-1 > tbody .on'));
				},
				error : function(err){
					console.log(err);
				}
			});
		} else {
			return false;
		}

	});

	function valid(params){
		var cnt = 0;
		var msg = "";
		var bool = true;

		if(!params.checkDt){
			cnt += 1;
			msg += "<fmt:message key="REQ_AS_DATE" bundle="${bundle}"/><br>";
		}


		if(!params.checkCts){
			cnt += 1;
			msg += "<fmt:message key="REQ_AS_INFO" bundle="${bundle}"/><br>";
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

			'fcltsNm':$('#deviceNm').val()
		};


		console.log($('#deviceNm').val());
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getMaintList.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";

				result.forEach (function (el, index) {
					appendRow += '<tr class="'+(el.rowno==1?'on':'')+'">'
						+'<td>'+el.rowno+'</td>'
						+'<td>'+el.fcltsUuid+'</td>'
						+'<td>'+el.fcltsNm+'</td>'
						+'<td style="display:none;">'+el.stat+'</td>'
						+'<td>'+el.useSttus+'</td>'
						+'<td style="display:none;">'+el.fcltsItlpcNm+'</td>'
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
			url : '/getDeviceMngList.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";

				result.forEach (function (el, index) {
					appendRow += '<tr class="'+(el.rowno==1?'on':'')+'">'
						+'<td>'+el.rowno+'</td>'
						+'<td>'+el.fcltsUuid+'</td>'
						+'<td>'+el.checkDt+'</td>'
						+'<td style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">'+el.checkCts+'</td>'
						+'<td style="display:none;">'+el.checkNo+'</td>'
						+'<td style="display:none;">'+el.checkDiv+'</td>'
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

		if(target_pop=='write'){
			if(row.length) {
				$('#p1_checkNo').val(row.find('td:eq(4)').text());

				$('#p1_deviceId').val($('#table-1 > tbody .on').find('td:eq(1)').text());
				$('#p1_deviceNm').val($('#table-1 > tbody .on').find('td:eq(2)').text());

				$('#p1_check').text(row.find('td:eq(3)').text());
				$('#p1_check').data('code',row.find('td:eq(6)').text());
				$('#p1_check').addClass('on');

				$('#p1_checkDt').val(row.find('td:eq(2)').text());
				if($('#p1_checkDt').val()){
					$('#calender1').data('daterangepicker').setStartDate($('#p1_checkDt').val());
					$('#calender1').data('daterangepicker').setEndDate($('#p1_checkDt').val());
				}

				$('#p1_checkCts').val(row.find('td:eq(3)').text());

				g_isInsert = false;
			} else {
				$('#p1_checkNo').val('');

				$('#p1_deviceId').val($('#table-1 > tbody .on').find('td:eq(1)').text());
				$('#p1_deviceNm').val($('#table-1 > tbody .on').find('td:eq(2)').text());

				$('#p1_check').text('');
				$('#p1_check').data('code','');
				$('#p1_check').removeClass('on');

				$('#p1_checkDt').val();
				$('#p1_checkCts').val('');

				g_isInsert = true;
			}
		}
	};

</script>
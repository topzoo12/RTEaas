<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<!--달력-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<div class="contentsWrap">
    <p class="title ${fav}">${pageName.srnNm}</p>

    <ul class="search_box">
        <li>
            <span class="stl"><fmt:message key="PERIOD" bundle="${bundle}"/><span class="remark2"></span></span>
            <span class="date">
                <input type="text" value="${fromDt}" name="start" id="fromDt" class="input2" readonly> ~ <input type="text" value="${toDt}" name="end" id="toDt" class="input2" readonly>
                <button class="search_calender" id="search_calender"></button>
            </span>

        </li>
        <li>
            <button class="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>
        </li>
    </ul>

    <ul class="contents">
        <li class="code3">
            <div class="stitle">
                <p class="tl"><fmt:message key="SCREEN_ACCESS_STATUS" bundle="${bundle}"/> <span class="cnt"><fmt:message key="TOTAL" bundle="${bundle}"/> <strong id="totCnt1">${totCnt1}</strong> <fmt:message key="COUNT2" bundle="${bundle}"/></span></p>
            </div>
            <table class="table">
                <colgroup>
                    <col style="width: 60px">
                    <col style="width: ">
                    <col style="width: 160px">
                    <col style="width: 150px">
                </colgroup>
                <thead>
                    <tr>
                    <th>No.</th>
                    <th><fmt:message key="SCREEN_ID" bundle="${bundle}"/></th>
                    <th><fmt:message key="SCREEN_NAME" bundle="${bundle}"/></th>
                    <th><fmt:message key="ACCESS_STATISTIC" bundle="${bundle}"/></th>
                    </tr>
                </thead>
            </table>
            <div class="tbody" style="overflow-y:scroll">
                <table class="table" id="table-1">
                    <colgroup>
                        <col style="width: 60px">
                        <col style="width: ">
                        <col style="width: 160px">
                        <col style="width: calc(150px - 16px)">
                    </colgroup>
                    <tbody>
                    <c:forEach var="result" items="${resultList}" varStatus="status">
                        <tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
                        <td align="center" class="listtd"><c:out value="${result.rowno}"/></td>
                        <td align="center" class="listtd"><c:out value="${result.mnuId}"/></td>
                        <td align="center" class="listtd"><c:out value="${result.mnuNm}"/></td>
                        <td align="center" class="listtd"><c:out value="${result.usageCnt}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </li>
        <li class="view">
            <div class="stitle">
                <p class="tl"><fmt:message key="DETAIL_ACCESS" bundle="${bundle}"/> <span class="cnt">총 <strong id="totCnt2">${totCnt2}</strong> 건</span></p>
            </div>

            <table class="table" >
                <colgroup>
                    <col style="width: 60px">
                    <col style="width: ">
                    <col style="width: 150px">
                    <col style="width: 200px">
                </colgroup>
                <thead>
                    <tr>
                    <th>No.</th>
                    <th><fmt:message key="USER_ID" bundle="${bundle}"/></th>
                    <th><fmt:message key="USER_NM" bundle="${bundle}"/></th>
                    <th><fmt:message key="ACCESS_DATETIME" bundle="${bundle}"/></th>
                    </tr>
                </thead>
            </table>
            <div class="tbody" style="overflow-y:scroll">
                <table class="table" id="table-2" >
                    <colgroup>
                        <col style="width: 60px">
                        <col style="width: ">
                        <col style="width: 150px">
                        <col style="width: calc(200px - 16px)">
                    </colgroup>
                    <tbody>
                    <c:forEach var="result2" items="${resultList2}" varStatus="status2">
						<tr class="<c:if test="${result2.rowno eq '1'}">on</c:if>">
	                        <td align="center" class="listtd"><c:out value="${result2.rowno}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result2.usrId}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result2.usrNm}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result2.cnctDtm}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </li>
    </ul>
</div>

<script language="javascript">
$(function() {

	   //날짜선택
	   $('#search_calender').daterangepicker({
			"locale": {
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
				$("#fromDt").val(start.format('YYYY-MM-DD'));
				$("#toDt").val(end.format('YYYY-MM-DD'));
				//console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' ~ ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
		});
	});

	$('.btn_search').on('click', function () {
		getMaster();
	});

	$('#table-1 > tbody > tr').on('click', function(){
		//console.log('click');
		$(this).parent().children().removeClass('on');
		$(this).addClass('on');
		getDetail(this);
	});

	$('#table-2 > tbody > tr').on('click', function(){
		$(this).parent().children().removeClass('on');
		$(this).addClass('on');
	});


	function validSearch(params){
		var cnt = 0;
		var msg = "";
		var bool = true;

		if(!params.fromDt || !params.toDt){
			cnt += 1;
			msg += "<fmt:message key="SEARCH_PERIOD_REQUIRED" bundle="${bundle}"/><br>";
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
			'fromDt':$('#fromDt').val()
			,'toDt':$('#toDt').val()
		};
		if(validSearch(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/getUsageMenuList.do',
				success : function (resp) {
					//console.log(resp);
					var json = JSON.parse(resp);
					var result = json.result;
					var appendRow = "";

					result.forEach (function (el, index) {
						appendRow += '<tr class="'+(el.rowno==1?'on':'')+'">'
							+'<td align="center" class="listtd">'+el.rowno+'</td>'
							+'<td align="center" class="listtd">'+el.mnuId+'</td>'
							+'<td align="center" class="listtd">'+el.mnuNm+'</td>'
							+'<td align="center" class="listtd">'+el.usageCnt+'</td>'
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
		}

	};

	function getDetail(obj){
		var params = {
			'fromDt':$('#fromDt').val()
			,'toDt':$('#toDt').val()
			,'mnuId':$(obj).find('td:eq(1)').text()
		};

		$('#table-2 tbody tr').remove();
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getUsageMenuUserList.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";

				result.forEach (function (el, index) {
					//appendRow += '<tr>'
					appendRow += '<tr class="'+(el.rowno==1?'on':'')+'">'
						+'<td align="center" class="listtd">'+el.rowno+'</td>'
						+'<td align="center" class="listtd">'+el.usrId+'</td>'
						+'<td align="center" class="listtd">'+el.usrNm+'</td>'
						+'<td align="center" class="listtd">'+el.cnctDtm+'</td>'
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
</script>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
            <button class="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>
        </li>
        <button class="btn_excel_download">excel</button>
        <!-- <a id="downloadLink" href="/excel/yearly/download.do" style="display: none;"></a> -->
		 <a id="downloadLink" href="/excel/download.do" style="display: none;"></a>
    </ul>
    <ul class="contents">
        <li class="view">
            <table class="table">
                <colgroup>
                    <col style="width: 20%">
                    <col style="width: 16%">
                    <col style="width: 16%">
                    <col style="width: 16%">
                    <col style="width: 16%">
                    <col style="width: 17%">
                </colgroup>
                <thead>
                    <tr>
                    <th><fmt:message key="BY_DATE" bundle="${bundle}"/></th>
                    <th><fmt:message key="POTHOLE" bundle="${bundle}"/></th>
                    <th><fmt:message key="VERTICAL_CRACK" bundle="${bundle}"/></th>
                    <th><fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}"/></th>
                    <th><fmt:message key="FATIGUE_CRACK" bundle="${bundle}"/></th>
                    <th><fmt:message key="RISK_AVG" bundle="${bundle}"/></th>
                    </tr>
                </thead>
            </table>
            <div class="tbody" style="overflow-y:scroll">
                <table class="table" id="table-1">
                    <colgroup>
                        <col style="width: 20%">
                        <col style="width: 16%">
                        <col style="width: 16%">
                        <col style="width: 16%">
                        <col style="width: 16%">
                        <col style="width: calc(16% - 17px)">
                    </colgroup>
                    <tbody>
                    <c:forEach var="result" items="${resultList}" varStatus="status">
                        <tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
	                        <td><c:out value="${result.rowno}"/></td>
	                        <td><c:out value="${result.coId}"/></td>
	                        <td><c:out value="${result.coNm}"/></td>
	                        <td><c:out value="${result.usrId}"/></td>
	                        <td><c:out value="${result.usrNm}"/></td>
	                        <td><c:out value="${result.loginDtm}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </li>
    </ul>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

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
		});

	});


$('.btn_search').on('click', function () {

	getList();
});

//jquery-3.3.1 부분 적용
 var newJquery = $.noConflict(true);

 newJquery('.btn_excel_download').on('click', function() {

	    let tableData = [];
	    newJquery('#table-1 tbody tr').each(function() {
	        let rowData = {};
	        newJquery(this).find('td').each(function(index) {
	            rowData['col' + index] = newJquery(this).text();
	        });
	        tableData.push(rowData);
	    });

	    let headers = [];
	    newJquery('.table thead th').each(function() {
	        headers.push($(this).text());
	    });

	    newJquery.ajax({
	        type: 'POST',
	        url: '/excel/download.do',
	        /* url: '/excel/yearly/download.do', */
	        contentType: 'application/json',
	        data: JSON.stringify({ tableData: tableData, headers: headers }),
	        xhrFields: {
	            responseType: 'blob'
	        },
	        success: function(response) {
	            // Blob으로 받은 응답을 다운로드 링크로 변환
	            let a = document.createElement('a');
	            a.href = window.URL.createObjectURL(response);
	            a.download = 'period_statistics.xlsx'; // 파일 이름 설정
	            a.click();
	            window.URL.revokeObjectURL(a.href); // 메모리 해제
	        },
	        error: function() {
	            alert('파일 다운로드에 실패했습니다.');
	        }
	    });
	});

function getList(){

	var region = "${authInfo.cdNa}"
	var fromDt = $('#fromDt').val().replaceAll('-','');
	var toDt  = $('#toDt').val().replaceAll('-','');

	$.ajax({
		type: "GET",
		//url: "${authInfo.restApiUrl}/statistics/daily",
		url: "${authInfo.restApiUrl}/statistics/daily/count",
		//url: "http://localhost:8080/statistics/daily/count",
		async: true,
		data: {
			region : region,
			from: fromDt,
			to: toDt
		},
		success: function(resp) {

			$('#table-1 tbody tr').remove();

 			var appendRow = "";
			for (var i = 0;  i < resp.data.length; i++){

				var list = resp.data[i]

				var day = list["statistics-date"].substr(0,4) + "." + list["statistics-date"].substr(4,2) + "." + list["statistics-date"].substr(6,2);

				appendRow += '<tr class="'+(i==0?'on':'')+'">'
		 				//+'<td align="center" class="listtd">'  + list["statistics-date"] +'</td>'
		 				+'<td align="center" class="listtd">'  + day +'</td>'
		 				+'<td align="center" class="listtd">'  + list["count-of-potholes"].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")  +'</td>'           //.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") 숫자 정규식(콤마)
		 				+'<td align="center" class="listtd">'  + list["count-of-vertical-cracks"].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")  +'</td>'
		 				+'<td align="center" class="listtd">'  + list["count-of-horizontal-cracks"].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")  +'</td>'
		 				+'<td align="center" class="listtd">'  + list["count-of-alligators"].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")  +'</td>'
		 				+'<td align="center" class="listtd">'  + Math.round(list["level"]) +'</td>'
		 				+ '</tr>'

				/* for( var j =0 ; j<12; j++){
					appendRow += '<td align="center" class="listtd">'  + val[j] +'</td>'
				} */
			}

			$('#table-1 > tbody').append(appendRow);

			$('#table-1 > tbody > tr').on('click', function(){
			   	$(this).parent().children().removeClass('on');
			   	$(this).addClass('on');
			   });


		}

	})
 

}

$(document).ready(function () {

	   // 날짜 설정 오늘날짜로부터 1주일 (임시10.1)
	   var date1  = new Date();

	    $('#toDt').val(dateFormat(date1, 'select'))
	   var date2 = new Date(date1.setDate(date1.getDate()-30));
	   // $('#fromDt').val(dateFormat(date2, 'select'))
	   $('#fromDt').val('2023-10-01')


 	getList();


})
///////////////////// 날짜관련
function dateFormat(date, format){


   if (format == 'list'){
      // 2023.01.01 14:03:01
      var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 )
      var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate()
      var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours()
      var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes()
      var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds()

      dateString  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec

   } else if (format == 'select'){

      // 2023-01-02
      var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 )
      var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate()

      dateString  = date.getFullYear() + '-' + month + '-' + day
   }

   return dateString;
}

</script>
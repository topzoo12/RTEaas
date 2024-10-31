<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<c:set var="nowCdNa" value="${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}"/>

<!--달력-->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="year">
	<fmt:formatDate value="${today}" pattern="yyyy" />
</c:set>

<div class="contentsWrap">
	<div class="contents_bg"></div>
	<p class="title ${fav}">${pageName.srnNm}</p>

	<ul class="search_box">
		<li><span class="stl"><fmt:message key="YEAR"
					bundle="${bundle}" /><span class="remark2"></span></span> <span
			class="selectBox bottom" id="year_span">
				<button class="label" id="year_btn"
					data-code="<c:out value="${year}"/>">
					<c:out value="${year}" />
				</button>
				<ul class="optionList" id="year_ul">
					<li class="optionItem" data-code="<c:out value="${year}"/>"><c:out
							value="${year}" /></li>
					<li class="optionItem" data-code="<c:out value="${year-1}"/>"><c:out
							value="${year-1}" /></li>
					<li class="optionItem" data-code="<c:out value="${year-2}"/>"><c:out
							value="${year-2}" /></li>
				</ul>
		</span>
			<button class="btn_search">
				<fmt:message key="SEARCH" bundle="${bundle}" />
			</button></li>
		<button class="btn_excel_download">excel</button>
		<a id="downloadLink" href="/excel/yearly/download.do" style="display: none;"></a>
	</ul>

	<ul class="contents">
		<li class="view">
			<table class="table">
				<colgroup>
					<col style="width: 12%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
					<col style="width: 7%;">
				</colgroup>
				<thead>
					<tr>
						<th><fmt:message key="CATEGORY" bundle="${bundle}" /></th>
						<th><fmt:message key="JANUARY" bundle="${bundle}" /></th>
						<th><fmt:message key="FEBRUARY" bundle="${bundle}" /></th>
						<th><fmt:message key="MARCH" bundle="${bundle}" /></th>
						<th><fmt:message key="APRIL" bundle="${bundle}" /></th>
						<th><fmt:message key="MAY" bundle="${bundle}" /></th>
						<th><fmt:message key="JUNE" bundle="${bundle}" /></th>
						<th><fmt:message key="JULY" bundle="${bundle}" /></th>
						<th><fmt:message key="AUGUST" bundle="${bundle}" /></th>
						<th><fmt:message key="SEPTEMBER" bundle="${bundle}" /></th>
						<th><fmt:message key="OCTOBER" bundle="${bundle}" /></th>
						<th><fmt:message key="NOVEMBER" bundle="${bundle}" /></th>
						<th><fmt:message key="DECEMBER" bundle="${bundle}" /></th>
					</tr>
				</thead>
			</table>
			<div class="tbody" style="height: 210px;">
				<table class="table" id="table-1">
					<colgroup>
						<col style="width: 12%;">
						<col style="width: 7%;">
						<col style="width: 7%;">
						<col style="width: 7%;">
						<col style="width: 7%;">
						<col style="width: 7%;">
						<col style="width: 7%;">
						<col style="width: 7%;">
						<col style="width: 7%;">
						<col style="width: 7%;">
						<col style="width: 7%;">
						<col style="width: 7%;">
						<col style="width: 7%;">
					</colgroup>
					<tbody>
						<tr class="on">
							<td align="center" class="listtd"><fmt:message key="POTHOLE" bundle="${bundle}" /></td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd" style="padding-left: 10px">0</td>
						</tr>
						<tr>
							<td align="center" class="listtd"><fmt:message
									key="VERTICAL_CRACK" bundle="${bundle}" /></td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd" style="padding-left: 10px">0</td>
						</tr>
						<tr>
							<td align="center" class="listtd"><fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}" /></td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd" style="padding-left: 10px">0</td>
						</tr>
						<tr>
							<td align="center" class="listtd"><fmt:message key="FATIGUE_CRACK" bundle="${bundle}" /></td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd" style="padding-left: 10px">0</td>
						</tr>
						<tr>
							<td align="center" class="listtd"><fmt:message key="RISK_AVG" bundle="${bundle}" /></td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd">0</td>
							<td align="center" class="listtd" style="padding-left: 10px">0</td>
						</tr>
					</tbody>

				</table>
			</div>

		</li>
	</ul>
	<div class="chart_area">
		<div class="chartWrap">
			<canvas id="myChart" height="120%"></canvas>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script language="javascript">

	var potholeKeyValue = [];

	<c:forEach var="potholeDvList" items="${codeListDv}" varStatus="status">
		potholeKeyValue.push({ 'codeId' : '${potholeDvList.cdId}', 'potholeNm' : '${potholeDvList.cdNm}', 'potholeNmEng' : '${potholeDvList.cdNmEng}', 'potholeNmJp' : '${potholeDvList.cdNmJp}', 'potholeEtc2' : '${potholeDvList.etc2}'});
	</c:forEach>

	var searchYear = ${year};

	$('.btn_search').on('click', function() {
		Chart.getChart('myChart').destroy();

		searchYear = $('#year_btn').text();
		$('#year_btn').attr('data-code', searchYear);
		getList();
	});

	$('.btn_excel_download').on('click', function() {

	    // 테이블 데이터를 JSON으로 변환
	    let tableData = [];
	    $('#table-1 tbody tr').each(function() {
	        let rowData = {};
	        $(this).find('td').each(function(index) {
	            rowData['col' + index] = $(this).text();
	        });
	        tableData.push(rowData);
	    });

	    // 테이블 헤더를 JSON으로 변환
	    let headers = [];
	    $('.table thead th').each(function() {
	        headers.push($(this).text());
	    });

	    // 서버로 데이터 전송
	    $.ajax({
	        type: 'POST',
	        url: '/excel/yearly/download.do',
	        contentType: 'application/json',
	        data: JSON.stringify({ tableData: tableData, headers: headers }),
	        xhrFields: {
	            responseType: 'blob'
	        },
	        success: function(response) {
	            // Blob으로 받은 응답을 다운로드 링크로 변환
	            let a = document.createElement('a');
	            a.href = window.URL.createObjectURL(response);
	            a.download = 'Annual_statistics.xlsx';
	            a.click();
	        },
	        error: function() {
	            alert('파일 다운로드에 실패했습니다.');
	        }
	    });
	});

	function getList() {

		var port =  [ '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-' ];
		var hori =  [ '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-' ];
		var verti = [ '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-' ];
		var piro =  [ '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-' ];
		var level = [ '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-' ];

		var region = "${authInfo.cdNa}";
		var year = $('#year_btn').data('code');

		$.ajax({
			type : "GET",
			url: "${authInfo.restApiUrl}/statistics/yearly/count",
			//url: " http://localhost:8080/statistics/yearly/count",
			async : true,
			data : {
				year : year,
				region : region
			},
			headers : {
				'Authorization' : 'Bearer '	+ localStorage.getItem("accessToken"),
				'Refresh-Token' : localStorage.getItem("Refresh-Token")
			},
			success : function(resp) {
				$('#table-1 tbody tr').remove();

				var datas = resp.data;

				datas.forEach(function(data) {
					var idx = data['month'] - 1;

					port[idx] = data['count-of-potholes'].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");           //.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") 숫자 정규식(콤마)
					hori[idx] = data['count-of-horizontal-cracks'].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					verti[idx] = data['count-of-vertical-cracks'].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					piro[idx] = data['count-of-alligators'].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					level[idx] = Math.round(data['level']);

				});

				var appendRow = "";
				var data = {
					port : port,
					hori : hori,
					verti : verti,
					piro : piro,
					level : level
				};

				//균열 종류 (포트홀, 수직균열, 수평균열, 피로균열)
				var gubunByCdna = [];

				switch ('${nowCdNa}') {
			        case 'KR':
			        	potholeKeyValue.forEach(item => {gubunByCdna.push(item.potholeNm);})
			        	break;
			        case 'US':
			        	potholeKeyValue.forEach(item => {gubunByCdna.push(item.potholeNmEng);})
			        	break;
			        case 'JP':
			        	potholeKeyValue.forEach(item => {gubunByCdna.push(item.potholeNmJp);})
			        	break;
				}

				var gubun = [];

				// 균열 종류  -> 심각도(평균) 추가
				gubunByCdna.forEach(item => {gubun.push(item);})
				gubun.push('<fmt:message key="RISK_AVG" bundle="${bundle}"/>');

				// data json keyname
				var gubun2 = [ 'port', 'verti', 'hori', 'piro', 'level' ];

				for (var i = 0; i < gubun2.length; i++) {

					appendRow += '<tr class="'+(i==0?'on':'')+'">'
							+ '<td align="center" class="listtd">'
							+ gubun[i] + '</td>';
					var val = data[gubun2[i]];

					for (var j = 0; j < 12; j++) {
						appendRow += '<td align="center" class="listtd">'
								+ val[j] + '</td>'
					}
				}

				$('#table-1 > tbody').append(appendRow);

				chartInfo(data, year);


				$('#table-1 > tbody > tr').on('click', function(){
				   	$(this).parent().children().removeClass('on');
				   	$(this).addClass('on');
				   });

			}

		})

	}

	function chartInfo(data, year) {

		var context = document.getElementById('myChart').getContext('2d');

		var myChart = new Chart(
				context,
				{
					type : 'bar',
					//type: 'line',
					data : {
						labels : [
							 year+' / 01',
							 year+' / 02',
							 year+' / 03',
							 year+' / 04',
							 year+' / 05',
							 year+' / 06',
							 year+' / 07',
							 year+' / 08',
							 year+' / 09',
							 year+' / 10',
							 year+' / 11',
							 year+' / 12' ],
						datasets : [
								{
									label : '<fmt:message key="POTHOLE" bundle="${bundle}"/>',
									data : [ data['port'][0], data['port'][1],
											data['port'][2], data['port'][3],
											data['port'][4], data['port'][5],
											data['port'][6], data['port'][7],
											data['port'][8], data['port'][9],
											data['port'][10], data['port'][11],
											data['port'][12] ],
									backgroundColor : [
											'rgba(255, 99, 132, 0.4)',
									],
									borderColor : [ 'rgba(255, 99, 132, 1)',
									],
									borderWidth : 1,
									borderRadius : 5,
									borderSkipped : false,
								},
								{
									label : '<fmt:message key="VERTICAL_CRACK" bundle="${bundle}"/>',
									data : [ data['verti'][0],
											data['verti'][1], data['verti'][2],
											data['verti'][3], data['verti'][4],
											data['verti'][5], data['verti'][6],
											data['verti'][7], data['verti'][8],
											data['verti'][9],
											data['verti'][10],
											data['verti'][11],
											data['verti'][12] ],
									backgroundColor : [
											'rgba(255, 206, 86, 0.4)',

									],
									borderColor : [ 'rgba(255, 206, 86, 1)',

									],
									borderWidth : 1,
									borderRadius : 5,
									borderSkipped : false,
								},
								{
									label : '<fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}"/>',
									data : [ data['hori'][0], data['hori'][1],
											data['hori'][2], data['hori'][3],
											data['hori'][4], data['hori'][5],
											data['hori'][6], data['hori'][7],
											data['hori'][8], data['hori'][9],
											data['hori'][10], data['hori'][11],
											data['hori'][12] ],
									backgroundColor : [
											'rgba(155, 106, 86, 0.4)',

									],
									borderColor : [ 'rgba(155, 106, 86, 1)',

									],
									borderWidth : 1,
									borderRadius : 5,
									borderSkipped : false,
								},
								{
									label : '<fmt:message key="FATIGUE_CRACK" bundle="${bundle}"/>',
									data : [ data['piro'][0], data['piro'][1],
											data['piro'][2], data['piro'][3],
											data['piro'][4], data['piro'][5],
											data['piro'][6], data['piro'][7],
											data['piro'][8], data['piro'][9],
											data['piro'][10], data['piro'][11],
											data['piro'][12] ],
									backgroundColor : [
											'rgba(39, 126, 255, 0.4)',

									],
									borderColor : [ 'rgba(39, 126, 255, 1)',

									],
									borderWidth : 1,
									borderRadius : 5,
									borderSkipped : false,
								} ]
					},
					options : {
						scales : {
							y : {
								beginAtZero : true
							}
						},
						legend : {
							position : 'bottom',
						},
					}
				});
	}

	$(document).ready(function() {

		$('#year_btn').addClass("on");
		getList();

	})
</script>
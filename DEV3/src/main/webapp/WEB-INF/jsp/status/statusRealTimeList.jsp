<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!--달력-->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<div class="contents_bg"></div>
<p class="title ${fav}">${pageName.srnNm}</p>

<div class="date_txt">
	<span>${year}</span>년 <span>${month}</span>월 <span>${day}</span>일 <span>${hour}:${minute}</span> 기준 <strong>실시간 대기현황</strong>
</div>
<div class="data_txt">
<div class="icon_ex">
	아래 표는 현재 시간을 기준으로 가장 최근에 수집된 데이터입니다.<!-- 측정은 1시간을 기준으로, 0~59분 사이에는 측정소에서 자료수집 중이므로 이전 시간의 자료가 조회됩니다. -->
	<div class="option">
		<span class="selectBox bottom bottom border wd200" id="deviceId_span">
		  <button class="label" id="deviceId"></button>
		  <ul class="optionList">
		  <c:forEach var="select1" items="${selectList1}" varStatus="status">
			<li class="optionItem" data-code="${select1.fcltsUuid}">${select1.fcltsNm}</li>
			<c:if test="${status.first}">
				<c:set var="select_first_id" value="${select1.fcltsUuid}" />
				<c:set var="select_first_nm" value="${select1.fcltsNm}" />
			</c:if>
		  </c:forEach>
		  </ul>
		</span>
	</div>
</div>
<table class="table" id="table-1">
	<colgroup>
		<col style="width: 150px ">

		<c:forEach var="io" items="${ioList}" varStatus="status">
			<c:choose>
				<c:when test="${status.last}">
					<col style="width: 80px">
				</c:when>
				<c:otherwise>
					<col style="width: 65px">
				</c:otherwise>
			</c:choose>
		</c:forEach>

	</colgroup>
		<thead>
			<tr>
			<th>측정소명</th>

			<c:forEach var="io" items="${ioList}" varStatus="status">
				<th><c:out value="${io.cdNm}"/></th>
			</c:forEach>

			</tr>
		</thead>
		<tbody>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</tbody>
	</table>
</div>

<ul class="contents" id="graphDiv" style="display:none;">
	<li class="graph">
		<div class="stitle">
			<div class="tl">대기현황 그래프</div>
			<div class="option">
				<span class="selectBox bottom bottom border wd200" id="ioId_span">
				  <button class="label" id="ioId">미세/초미세먼지</button>
				  <ul class="optionList">
					<li class="optionItem" data-code="">미세/초미세먼지</li>
					<!-- <li class="optionItem" data-code="BA005">미세먼지</li>
					<li class="optionItem" data-code="BA006">초미세먼지</li>
					 -->

				  <c:forEach var="select2" items="${selectList2}" varStatus="status">
					<li class="optionItem" data-code="${select2.comCd}">${select2.cdNm}</li>
				  </c:forEach>

				  </ul>
				</span>
			</div>
		</div>

		<div class="graph_content state_air">
			<div id="chartDiv" style="width:100%;height:600px">
			  <canvas id="myChart"></canvas>
			</div>
			<!-- <img src="/img/graph_state_air.png"> -->
		</div>
	</li>
</ul>

<script language="javascript">
window.onload = function(){
	//var opInfoWindow = infoWindow_${resultList[0].deviceId};
	//var opMarker = marker_${resultList[0].deviceId};
	//opInfoWindow.open(map, opMarker);
	$('#deviceId').text('${select_first_nm}');
	$('#deviceId').data('code','${select_first_id}');

	getMaster('${select_first_id}');
	getDetail('${select_first_id}',null);
}

const labels = [
    '01시',
    '02시',
    '03시',
    '04시',
    '05시',
    '06시',
    '07시',
    '08시',
    '09시',
    '10시',
    '11시',
    '12시',
    '13시',
    '14시',
    '15시',
    '16시',
    '17시',
    '18시',
    '19시',
    '20시',
    '21시',
    '22시',
    '23시',
    '24시'
];

//const data = {
//	labels: labels,
//	datasets: [
//		{
//			label: '',
//			backgroundColor: 'rgb(255, 99, 132)',
//			borderColor: 'rgb(255, 99, 132)',
//			data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
//		}
//	]
//};

//const config = {
//	type: 'line',
//	data: data,
//	options: {}
//};
//const myChart = new Chart(
//	document.getElementById('myChart'),
//	config
//);
$("#deviceId_span").find(".optionItem").on("click", function(){
	//$("#frm_areaDiv").val($(this).data('code'));

	getMaster($(this).data('code'));
	getDetail($(this).data('code'),$("#ioId").data('code'));

	//$("#frm").attr("action","/status/statusSynthList.do").submit();
});

$("#ioId_span").find(".optionItem").on("click", function(){
	getDetail(null,$(this).data('code'));
});
	//실렉트 외 클릭시 실렉트 닫기
	$(document).on("mouseup", function(e){
		if($("#deviceId_span").has(e.target).length === 0){
			$("#deviceId_span").removeClass("active");
			$("#deviceId_span").find(".optionList").css("display", "none");
		}
	});

	function getMaster(datacode){
		$("#graphDiv").attr("style","display:block;");
		//console.log('getMaster');
		$('#table-1 tbody tr').remove();
		var params = {
			'deviceId':datacode
		};
		//console.log(params);
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getStatusRealTimeList.do',
			success : function (resp) {
				//console.log(resp);
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";
				result.forEach (function (el, index) {
					appendRow += '<tr>'
						+'<td>'+el.deviceNm+'</td>'

						<c:forEach var="io" items="${ioList}" varStatus="status">
							+'<td>'+(el.deviceValue${status.count}==0?'0':el.deviceValue${status.count})+'</td>'
						</c:forEach>

						+'</tr>';
				});

				$('#table-1 > tbody').append(appendRow);

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

	function getDetail(datacode_m,datacode_d){
		//$('#table-1 tbody tr').remove();
		var params = {
			'deviceId':datacode_m==null?$('#deviceId').data('code'):datacode_m
			,'ioId':datacode_d
		};
		//console.log(params);
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getStatusRealTimeChartList.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;

				datasetChart = [];

				//var appendRow = "";
				result.forEach (function (el, index) {
					console.log(el);
					datasetItem = {
						label: el.ioNm,
						//backgroundColor: 'rgb(255, 99, 132)',
						//borderColor: 'rgb(255, 99, 132)',
						data: [el.deviceValue1?el.deviceValue1:null
							, el.deviceValue2?el.deviceValue2:null
							, el.deviceValue3?el.deviceValue3:null
							, el.deviceValue4?el.deviceValue4:null
							, el.deviceValue5?el.deviceValue5:null
							, el.deviceValue6?el.deviceValue6:null
							, el.deviceValue7?el.deviceValue7:null
							, el.deviceValue8?el.deviceValue8:null
							, el.deviceValue9?el.deviceValue9:null
							, el.deviceValue10?el.deviceValue10:null
							, el.deviceValue11?el.deviceValue11:null
							, el.deviceValue12?el.deviceValue12:null
							, el.deviceValue13?el.deviceValue13:null
							, el.deviceValue14?el.deviceValue14:null
							, el.deviceValue15?el.deviceValue15:null
							, el.deviceValue16?el.deviceValue16:null
							, el.deviceValue17?el.deviceValue17:null
							, el.deviceValue18?el.deviceValue18:null
							, el.deviceValue19?el.deviceValue19:null
							, el.deviceValue20?el.deviceValue20:null
							, el.deviceValue21?el.deviceValue21:null
							, el.deviceValue22?el.deviceValue22:null
							, el.deviceValue23?el.deviceValue23:null
							, el.deviceValue24?el.deviceValue24:null],
					}
					datasetChart.push(datasetItem);
				});

				const dataChart = {
					labels: [
					    '01시',
					    '02시',
					    '03시',
					    '04시',
					    '05시',
					    '06시',
					    '07시',
					    '08시',
					    '09시',
					    '10시',
					    '11시',
					    '12시',
					    '13시',
					    '14시',
					    '15시',
					    '16시',
					    '17시',
					    '18시',
					    '19시',
					    '20시',
					    '21시',
					    '22시',
					    '23시',
					    '24시'
					],
					datasets: datasetChart
				};

				const config = {
					type: 'line',
					data: dataChart,
					options: {}
				};

				$('#chartDiv').html();
				$('#chartDiv').html('<canvas id="myChart" style="height:30vh; width:50vw"></canvas>');

				const newChart = new Chart(
					document.getElementById('myChart'),
					config
				);

				//newChart.resize($('#myChart').parent().offsetWidth,$('#myChart').parent().offsetHeight);
				//newChart.update();
				//chart.destroy();

			},
			error : function(err){
				console.log(err);
			}
		});

	};
</script>
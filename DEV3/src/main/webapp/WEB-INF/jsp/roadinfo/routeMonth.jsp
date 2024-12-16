<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<c:set var="nowCdNa" value="${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}"/>

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin=""/>
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>

<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
<link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.css" />
<link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.Default.css" />
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
<script src="https://unpkg.com/leaflet.markercluster@1.4.1/dist/leaflet.markercluster.js"></script>

<!--달력-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js" defer></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<div class="contents_box item mainpage roadinfo">
	<!-- p class="title ${fav}" style="margin:20px 24px;">${pageName.srnNm}</p-->
	<p class="title ${fav}">${pageName.srnNm}</p>

	<div class="contents mainMap">
        <div class="riskInfopopup" >
	        <c:forEach var="monthColor" items="${codeListMc}" varStatus="status">
				<span id="riskbgcolorLv1" style="background:${monthColor.etc1}">&nbsp;</span>
				<span id="${monthColor.cdId}">
					<c:choose>
						<c:when test="${nowCdNa eq 'KR'}">${monthColor.cdNm}</c:when>
						<c:when test="${nowCdNa eq 'US'}">${monthColor.cdNmEng}</c:when>
						<c:when test="${nowCdNa eq 'JP'}">${monthColor.cdNmJp}</c:when>
					</c:choose>
				</span>
				</span>
			</c:forEach>

        </div>
        <div class="mapWrap">

		<div class="MapArea NoSearchBar">

			<div class="item map_box">
				<div class="map" id="map"></div>

				<div class="pop_wrap" id="pop_riskPopImg" style="display: none;">
					<div class="pop_riskPopImg">
						<div class="photo_area">
							<img id="pop_img" src="/img/sample_highway03.jpg" alt="도로위험목록 이미지">
						</div>
					</div>
					<button class="riskPopImg_close pop_close" id=""></button>
				</div>

			</div>
		</div>
	</div>

	<div class="infoWrap">
	</div>
</div>
<!-- 로딩중 맵용 -->
<div id="circularG">
   <div id="circularG_1" class="circularG map"></div>
   <div id="circularG_2" class="circularG map"></div>
   <div id="circularG_3" class="circularG map"></div>
   <div id="circularG_4" class="circularG map"></div>
   <div id="circularG_5" class="circularG map"></div>
   <div id="circularG_6" class="circularG map"></div>
   <div id="circularG_7" class="circularG map"></div>
   <div id="circularG_8" class="circularG map"></div>
</div>


<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDLlGOOgY5Y88zXjRQq_gIHJabQI5eXG1U&callback=initMap"></script>
<script>

	let searchLv;

	// 현재 연도와 월을 계산
	var today = new Date();
	var currentYear = today.getFullYear();
	var currentMonth = today.getMonth() + 1; // 0이 1월이므로 +1

	// 리스트를 추가할 <ul> 요소를 선택
	var yearMonthList = document.getElementById('YearMonth');

	// 첫 번째 항목: "전체" 추가 (data-code는 빈 값으로 설정)
	var allItem = document.createElement('li');
	//allItem.className = 'optionItem';
	//allItem.textContent = '전체';
	//allItem.setAttribute('data-code', ''); // 전체는 빈 값으로 설정
	//yearMonthList.appendChild(allItem);

	// 현재 월과 이전 12개월을 추가하는 함수
	function addPreviousMonths(year, month, numberOfMonths) {
	    for (var i = 0; i < numberOfMonths; i++) {
	        var listItem = document.createElement('li');
	        listItem.className = 'optionItem';

	        // 월이 0이면 작년 12월로 변경
	        if (month === 0) {
	            month = 12;
	            year -= 1;
	        }

	        // 형식화된 년도와 월을 리스트 항목으로 추가
	        listItem.textContent = year + '년 ' + (month < 10 ? '0' : '') + month + '월';

	        // data-code 속성 값을 "YYYYMM" 형식으로 설정
	        var yearMonthCode = year.toString() + (month < 10 ? '0' : '') + month.toString();
	        listItem.setAttribute('data-code', yearMonthCode); // data-code 설정

	        // 리스트에 추가
	        yearMonthList.appendChild(listItem);

	        // 월을 하나 줄임
	        month--;
	    }
	}

	var monthColorKeyValue = [];

	<c:forEach var="monthColor" items="${codeListMc}" varStatus="status">
		monthColorKeyValue.push({'code':'${monthColor.cdId}', 'codeName':'${monthColor.cdNm}', 'color':'${monthColor.etc1}', })
	</c:forEach>

	var img_id;


	markerList = [];
	markersTemp = [];

	lineList = [];

	window.initMap = function () {

	};

	var popup = L.popup();

 	/* function removeLine(e) {
 		map.removeLayer(firstpolyline)
 	} */


/*  	function onClick(e) {

		detail(e.target.options.id
			, e.target.options.deviceName
			, e.target.options.deviceId
			, e.target.options.addrName
			, e.target.options.ctime
			, e.latlng.lat
			, e.latlng.lng
			, 'N'
		)

    } */

</script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script>

$(document).ready(function() {

	let now1 = new Date('2023-03-30');
	//console.log("현재 : ", now1);

	let oneMonthAgo = new Date(now1.setMonth(now1.getMonth() - 1)); // 한달
	//console.log("한달 전 : ", oneMonthAgo);

	let now2 = new Date('2023-12-22');
	//console.log("현재 : ", now2);

	let oneMonthLater = new Date(now2.setMonth(now2.getMonth() + 1));
	//console.log("한달 후 : ", oneMonthLater)

	var fromDt = '';
	var toDt = '';

	filterYN = "N";
	markers = [];

	region = "${authInfo.cdNa}";

	deviceKeyValue = [];
	deviceIdList = "";

	<c:forEach var="deList" items="${deviceList}" varStatus="status">

		deviceKeyValue.push({'macAddr':'${deList.macAddr}', 'deviceId':'${deList.deviceId}', 'deviceNm':'${deList.deviceNm}'});

		if (deviceIdList == "" ) {
			deviceIdList += '${deList.macAddr}'
		} else {
			deviceIdList += ',${deList.macAddr}'
		}

	</c:forEach>

	old_id = "";

		//map = L.map('map').setView({lat:37.470613, lng:127.126118}, 14);
		//map = L.map('map').setView({lat:37.412079, lng:127.135001}, 18);
		map = L.map('map').setView({lat:"${authInfo.wtX}", lng:"${authInfo.wtY}"}, 13);

		L.control.scale({
			imperial: true, metric: true
		}).addTo(map);

	//L.tileLayer('https://mt0.google.com/vt/lyrs=m&h1=kr{z}&x={x}&y={y}&z={z}', {
	//L.tileLayer('https://tiles.osm.kr/hot/{z}/{x}/{y}.png', {
	L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
		//maxZoom: 20,
		//minZoom:12,
		minZoom: '${authInfo.mapMinSize}',
		maxZoom: '${authInfo.mapMaxSize}',
	    attribution: '© OpenStreetMap'
	    //stylers:[{visibility:'off'}]
	}).addTo(map);

	// swagger.js
	//mapInfo(map);
	drawline();

map.on("moveend", function(){

	drawline();

	map.closePopup();

})

/*
function removeLine() {
	map.removeLayer(firstpolyline);
	map.removeLayer(map._layers);
} */

var lines = [];


})

function drawline() {

	//console.log($("#searchYearMonth").data('code'))

	lineList.forEach(function(polyline) {
        polyline.remove();  // 각 polyline 객체를 맵에서 제거
    });

	$.ajax({
		type: "GET",
		//url: "${authInfo.restApiUrl}/detected-road-by-date",
		//url: "http://datahub-dev.zieumtn.com/gis/detected-road-by-date",
		//url: "http://localhost:8080/detected-road-by-date",
		url: "${authInfo.restApiUrl}/detected-road-by-deviceid",
		//url: "http://localhost:8081/detected-road-by-deviceid",

		data: {
			north_west:"latitude:" + (map.getBounds().getNorthWest().lat + 0.0025) + ",longitude:" + (map.getBounds().getNorthWest().lng - 0.0025),
			north_east:"latitude:" + (map.getBounds().getNorthEast().lat + 0.0025) + ",longitude:" + (map.getBounds().getNorthEast().lng + 0.0025),
			south_west:"latitude:" + (map.getBounds().getSouthWest().lat - 0.0025) + ",longitude:" + (map.getBounds().getSouthWest().lng - 0.0025),
			south_east:"latitude:" + (map.getBounds().getSouthEast().lat - 0.0025) + ",longitude:" + (map.getBounds().getSouthEast().lng + 0.0025),
			//searchMonth:$("#searchYearMonth").data('code'),
			region:"${authInfo.cdNa}",
			co_id :"${authInfo.coId}"

		},
		success: function(resp) {
			datas = resp.data
            //console.log('탐지도로 데이터 확인--->>', datas);

			/* for (var a = 0; a < datas.length; a++) {
				for (var b = 0; b < datas[a].detectedRoadInfo.length; b++) {
					if (datas[a].detectedRoadInfo[b]['device-id'] == 'MH2DY2300060') {
						console.log("MH2DY2300060");
					} else {
						console.log("MH2DY2300026");
					}
				}
			} */

			// 날짜 설정 오늘날짜로부터 1주일 (임시10.1)
			var date1 = new Date();
			//$('#toDt').val(fnDateFormat(date1, 'select'))
			var date2 = new Date(date1.setDate(date1.getDate() - 30));
			// $('#fromDt').val(dateFormat(date2, 'select'))
			//$('#fromDt').val('2023-10-01')

			var nowDate = new Date();

			var oneMonthAgo = new Date(nowDate.setMonth(nowDate.getMonth() - 1)); // 한달
			var twoMonthAgo = new Date(nowDate.setMonth(nowDate.getMonth() - 2)); // 두달
			var threeMonthAgo = new Date(nowDate.setMonth(nowDate.getMonth() - 3)); // 세달
			var fourMonthAgo = new Date(nowDate.setMonth(nowDate.getMonth() - 4)); // 네달

			color = 'gray';

			for (var i = 0; i < datas.length; i++) {

				//console.log(`${givenDate}는 현재와 ${diffInDays}일 차이입니다.`);

				/*********************************************************************************************************************/
				/* if (datas[i].detectedRoadDate == "2024-01-20") {
					//detectedRoadDate:"2024-01-20"
					color = 'green';
				} else if ( datas[i].detectedRoadDate == "2024-01-21" ) {
					color = 'blue';
				} else if ( datas[i].detectedRoadDate == "2024-01-22" ) {
					color = 'red';
				} else if ( datas[i].detectedRoadDate == "2024-01-23" ) {
					color = 'skyblue';
				} else {
					color = 'gray';
				} */

				var positionDatas = datas[i].detectedRoadInfo;

				for (var x = 1; x < positionDatas.length; x++) {

					const givenDate = new Date(positionDatas[x-1].timestamp);

					// 현재 날짜
					const now = new Date();

					// 두 날짜 간의 차이 계산 (밀리초 차이 -> 일수로 변환)
					const diffInMilliseconds = now - givenDate;
					const diffInDays = Math.floor(diffInMilliseconds / (1000 * 60 * 60 * 24)); // 밀리초를 일수로 변환

					// 30일, 30~60일, 60~90일, 그 이상으로 구분
					if (diffInDays <= 30) {
					    color = (monthColorKeyValue.find(item => item.code === 'one')).color;
					} else if (diffInDays > 30 && diffInDays <= 60) {
					    color = (monthColorKeyValue.find(item => item.code === 'two')).color;
					} else if (diffInDays > 60 && diffInDays <= 90) {
					    color = (monthColorKeyValue.find(item => item.code === 'thre')).color;
					} else {
					    color = (monthColorKeyValue.find(item => item.code === 'else')).color;
					}



					var pointA = new L.LatLng(positionDatas[x-1].latitude, positionDatas[x-1].longitude);
					var pointB = new L.LatLng(positionDatas[x].latitude, positionDatas[x].longitude);

					var pointList = [ pointA, pointB ];

					var linesize = 6;

					var firstpolyline = new L.Polyline(pointList, {
					    color: color,
					    //weight: 15,
					    weight: linesize,
					    //opacity: 0.1,
					    smoothFactor: 1

					    })

			        var pointATime = new Date( positionDatas[x-1].timestamp );
			        var pointBTime = new Date( positionDatas[x].timestamp );

			        //var date2 = new Date(date1.setDate(date1.getDate() - 30));

			        var BAsecond = (pointBTime - pointATime) / 1000;

			        	//console.log( pointATime + " / " + pointBTime )
			        	//console.log( (pointBTime - pointATime) / 1000 )

					if (BAsecond < 10) {
				        map.addLayer(firstpolyline);
					}

					lineList.push(firstpolyline);
				}
			}

		},
		error: function(request,status,error){

			//console.log("request.status = " + request.status);

		},
		beforeSend:function(){
			$('#circularG').css('display','block');
		},
		complete : function(data) {
			//  실패했어도 완료가 되었을 때 처리
			$('#circularG').css('display','none');

		}
	})
}

</script>
<script>
/* document.addEventListener('DOMContentLoaded', function() {
	var divA = document.getElementById('.infoWrap');
	var divB = document.getElementById('.riskInfopopup');

	// divA의 위치와 크기를 가져옴
	//var rect = divA.getBoundingClientRect();

	// divB의 위치를 divA의 위치를 기준으로 설정
	//divB.style.top = (rect.bottom + 20) + 'px'; // divA의 아래쪽에 20px 떨어진 위치에 divB를 배치
	//divB.style.left = rect.left + 'px'; // divA와 같은 left 위치에 divB를 배치
	divB.style.left = (divA.left + 20) + 'px'; // divA와 같은 left 위치에 divB를 배치
}); */
</script>


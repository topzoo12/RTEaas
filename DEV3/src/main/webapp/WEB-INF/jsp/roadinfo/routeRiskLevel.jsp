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

<style type="text/css">
.contents_box.roadinfo .contents.mainMap{
    height: calc(100% - 64px);
}

.map-center-btn.with-icon {
    position: absolute;
    bottom: 50px;
    left: 50%;
    transform: translateX(-50%);
    z-index: 1000;
    padding: 10px 20px 10px 40px; /* 왼쪽 여백 줘서 아이콘 공간 확보 */
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 8px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.3);
    font-size: 16px;
    cursor: pointer;
    background-image: url('../../img/icon_search2.png'); /* 상대 경로 확인 필요 */
    background-repeat: no-repeat;
    background-position: 12px center;
    background-size: 18px 18px; /* 아이콘 크기 */
}

</style>

<div class="contents_box item mainpage roadinfo">
	<!-- p class="title ${fav}" style="margin:20px 24px;">${pageName.srnNm}</p-->
	<p class="title ${fav}">${pageName.srnNm}</p>

	<!-- ******************************************************************************************************************* -->
	<!-- ******************************************************************************************************************* -->
	<div class="contents mainMap">
        <div class="riskInfopopup" >
	        <c:forEach var="lvList" items="${levelList}" varStatus="status">
				<!--
				<input type="checkbox" id="${monthColor.etc2}" class="risklist" name="risklist" value="${monthColor.etc3}" checked><label for="${monthColor.etc2}">${monthColor.cdNm}</label>
				 -->
				<span id="riskbgcolorLv1" style="background:${lvList.etc1}">&nbsp;</span>
				<span id="${lvList.cdId}" onclick="toggleLayer('${lvList.cdId}')">
				<%-- ${lvList.cdNm} --%>
					<c:choose>
						<c:when test="${nowCdNa eq 'KR'}">${lvList.cdNm}</c:when>
						<c:when test="${nowCdNa eq 'US'}">${lvList.cdNmEng}</c:when>
						<c:when test="${nowCdNa eq 'JP'}">${lvList.cdNmJp}</c:when>
					</c:choose>
				</span>
			</c:forEach>
        </div>
        <div class="markerOnOffpopup" >
        	<input type="checkbox" name="markerOnOff" id="Levelswitch" checked/><label for="Levelswitch"></label>
        	<!--
        	<input type="radio" name="markerView" id="markerOn" value="markerOn" class="custom-radio"/><label for="markerOn" onClick="showCluster()">On</label>
        	<input type="radio" name="markerView" id="markerOff" value="markerOff" class="custom-radio"/><label for="markerOff" onClick="hideCluster()">Off</label> -->
        	<!-- <div onClick="showCluster()">Marker On</div>
			<div onClick="hideCluster()">Marker Off</div> -->
        </div>
        <div class="mapWrap">
        	<%-- <ul class="search_box level_list" style="min-width: 1170px; margin-top:0px;">
				<li>
					<span class="selectBox resp bottom" id="msgdivCd_span">
						<button class="label" id="level1" data-code="" data-lat="" data-lng="">Level1</button>
						<ul class="optionList" id="level1_ul"></ul>
					</span>
					<!-- <span class="selectBox resp bottom" id="msgdivCd_span">
						<button class="label" id="level2" data-code="" data-lat="" data-lng="">디바이스 리스트</button>
						<ul class="optionList" id="level2_ul"></ul>
					</span> -->
					<button class="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>
					<button class="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>
				</li>
				<!-- <li>
					<select name="cars" id="cars" multiple>
				  		<option value="1">Audi</option>
						<option selected value="2">BMW</option>
						<option selected value="3">Mercedes</option>
						<option value="4">Volvo</option>
						<option value="5">Lexus</option>
						<option value="6">Tesla</option>
					</select>
				</li> -->
			</ul> --%>
			<!-- <div class="MapArea"> -->
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
					<!--   지도 위에 떠 있는 재검색 버튼 (icon 사용하지 않을 시 class=> with-icon 지우기) -->
	  				<button id="drawlineBtn" class="map-center-btn with-icon" style="display: none;">
					    현 지도에서 검색
					</button>
				</div>
			</div>


        </div>
		<div class="infoWrap"> <!-- class="on" -->
		<!-- <button type="button" class="btn_infoWrap off"></button> -->

            <!-- 상세설명 -->
            <div class="infoDetailWrap" style="display: none;">
                <div class="infoTitle">
                    <button type="button" class="btn_back" id="btn_Back"></button>
                    <!-- <span class="badge badge_primary">승인</span> -->
                    <h2 id="detail_title">NFG - 001</h2>
                </div>
                <div class="infoContents">
                    <p class="infoPhoto">
	                    <img id="detail_img" src="/img/sample_highway02.jpg" alt="대표이미지" onclick="originalimg()">
	                    <span class="noPhoto" style="display: none;">
		                    <span class="material-symbols-outlined">no_photography</span>
						</span>
					</p>
                    <div class="infoDetail">
                        <div class="level level4">
                            <!-- <span>LEVEL1. 양호</span>
                            <span>LEVEL2. 주의</span>
                            <span>LEVEL3. 위험</span>  -->
                            <span id="riskLv">LEVEL4. 심각</span>
                        </div>
                        <div class="itemvalue">
                            <span><em id="CntPothole">3개</em><fmt:message key="POTHOLE" bundle="${bundle}"/></span>
                            <span><em id="CntVertical">1개</em><fmt:message key="VERTICAL_CRACK" bundle="${bundle}"/></span>
                            <span><em id="CntHorizontal">0개</em><fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}"/></span>
                            <span><em id="CntAlligators">0개</em><fmt:message key="FATIGUE_CRACK" bundle="${bundle}"/></span>
                        </div>
                        <dl class="">
                            <dt><fmt:message key="DEVICE_NAME" bundle="${bundle}"/></dt>
                            <dd id="detail_device_name">디바이스A</dd>
                            <dt><fmt:message key="DEVICE_ID" bundle="${bundle}"/></dt>
                            <dd id="detail_device_id">NFG - 001</dd>
                            <dt><fmt:message key="COORDINATES" bundle="${bundle}"/></dt>
                            <dd id="detail_latlng">경도 132.1 / 위도 37.001</dd>
                            <dt><fmt:message key="RISK_LEVEL" bundle="${bundle}"/></dt>
                            <dd id="detail_risk_level">심각</dd>
                            <dt><fmt:message key="ROAD_NAME" bundle="${bundle}"/></dt>
                            <dd id="detail_route_name">서울 외곽순환도로</dd>
                            <dt><fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/></dt>
                            <dd id="detail_ctime">2023.10.25 17:42:01</dd>
                            <dt><fmt:message key="ROAD_STATUS" bundle="${bundle}"/></dt>
                            <dd id="detail_state">보수 진행중</dd>
                        </dl>
                    </div>
                </div>
            </div>
            <!-- e:상세설명 -->

            <!-- 검색목록 -->
            <div class="infoListWrap" style="overflow-y:auto;">
                <div class="infoListTop">
                </div>

                <ul class="infoList">
                </ul>
            </div>
            <!-- e:검색목록 -->


        </div>
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

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script>

var potholeCnt;
var potholeListData;
var img_id;

let activeMarker = null;
let searchLv;

var deviceIdList = "";
var markerOnOff = "";

var markers = [];

var lines = [];
var markerId = [];

var markerList = [];
var markersTemp = [];

var testlines = [];

var allData = [];

window.initMap = function () {

};

var popup = L.popup({autoPan:false});


old_id = "";

map = L.map('map').setView({lat:"${authInfo.wtX}", lng:"${authInfo.wtY}"}, 13);

L.control.scale({
	imperial: true, metric: true
}).addTo(map);

//L.tileLayer('https://mt0.google.com/vt/lyrs=m&h1=kr{z}&x={x}&y={y}&z={z}', {
//L.tileLayer('https://tiles.osm.kr/hot/{z}/{x}/{y}.png', {
L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
	minZoom: '${authInfo.mapMinSize}',
	maxZoom: '${authInfo.mapMaxSize}',
	attribution: '© OpenStreetMap',
	stylers:[{visibility:'off'}]
}).addTo(map);

var redIcon = L.icon({
	iconUrl: '/img/pin_select.png',
	iconSize:     [32, 32], 	// size of the icon
	iconAnchor:   [16, 32], 	// point of the icon which will correspond to marker's location
});

var blueIcon = L.icon({
	iconUrl: '/img/pin_default.png',
	iconSize:     [32, 32], 	// size of the icon
	iconAnchor:   [16, 32], 	// point of the icon which will correspond to marker's location
});

var markerCluster = L.markerClusterGroup({
	disableClusteringAtZoom: 19, // 줌 레벨 15 이상에서 클러스터 해제
	maxClusterRadius: 30,        // 클러스터링 반경 50px로 설정
	iconCreateFunction: function(cluster) {
		var count = cluster.getChildCount();
		return L.divIcon({
			html: '<div>' + count + '</div>',
			className: 'mycluster',
			iconSize: L.point(40, 40)
		});
	},
	spiderfyOnMaxZoom: false,
	zoomToBoundsOnClick: false,
	showCoverageOnHover: false // 마우스 오버 시 폴리곤 비활성화
});

map.on('click', onMapClick);

map.on("moveend", function(){

	/* // 접음
	$('.infoWrap').removeClass('on');
	$('.infoWrap').addClass('off');
   	$('.infoDetailWrap').css('display', 'none');
   	$('.infoListWrap').css('display', 'none');
   	//$(".infoListWrap p").text("")
   	$(".infoListWrap p").css('display', 'hidden');
   	$('.infoListWrapNoData').css('display', 'none');

	$('.btn_infoWrap').addClass("off");
	map.closePopup(); */
	map.closePopup();
	document.getElementById("drawlineBtn").style.display = "block";
/* 	mapInfo(map);
	//ttt();

	map.closePopup(); */

})
// 버튼 클릭 시 mapInfo 실행 + 버튼 다시 숨기기
document.getElementById("drawlineBtn").addEventListener("click", function () {
	// 접음
	$('.infoWrap').removeClass('on');
	$('.infoWrap').addClass('off');
   	$('.infoDetailWrap').css('display', 'none');
   	$('.infoListWrap').css('display', 'none');
   	//$(".infoListWrap p").text("")
   	$(".infoListWrap p").css('display', 'hidden');
   	$('.infoListWrapNoData').css('display', 'none');

	$('.btn_infoWrap').addClass("off");
	mapInfo(map);
	//ttt();

	map.closePopup();
    this.style.display = "none";
});

var deviceKeyValue = [];

var deviceForParam = [];

<c:forEach var="deList" items="${deviceList}" varStatus="status">
	deviceKeyValue.push({'macAddr':'${deList.macAddr}', 'deviceId':'${deList.deviceId}', 'deviceNm':'${deList.deviceNm}', 'useYn':'${deList.useYn}'})

	if (deviceIdList == "" ) {
	      	deviceIdList += '${deList.macAddr}'
	} else {
		deviceIdList += ',${deList.macAddr}'
	}

	if ('${deList.macAddr}'.length > 0 && '${deList.macAddr}' != "" && '${deList.useYn}' == '사용'){
		deviceForParam.push('${deList.macAddr}');
	}

</c:forEach>
/*
var node = document.getElementById('level1_ul');
node.innerHTML = '';

var html = '';

for(var i = 0; i < deviceForParam.length; i++){
	data = deviceForParam[i];
	//html += '<li class="optionItem" data-code="' + data.id + '">' + data.name + '</li>'
	//html += '<li class="optionItem" data-code="' + data.id + '" data-lat="' + data.center.latitude + '" data-lng="' + data.center.longitude + '">' + data.name + '</li>'
	//html += '<input type="checkbox" name="deviceList" id="Levelswitch" checked/><label for="Levelswitch"></label>'
	//html += '<input type="checkbox" id="'  + i + '" name="deviceList"/>' + i
	//html += '<li class="optionItem" data-code="' + data + '">' + data + '</li>'

	html += '<li class="optionItem" data-code="' + data + '">'
	html += '<input type="checkbox" id="'  + i + '" name="deviceList" value="' + data + '">'
	html +=  data + '</li>'


}

node.innerHTML = html;
*/
var lvColorKeyValue = [];

<c:forEach var="lvList" items="${levelList}" varStatus="status">
	lvColorKeyValue.push({'lv':'${lvList.cdId}', 'color':'${lvList.etc1}', 'riskNm':'${lvList.cdNm}', 'riskNmEng' : '${lvList.cdNmEng}', 'riskNmJp' : '${lvList.cdNmJp}', 'riskLv' : '${lvList.etc3}'})
</c:forEach>

var statusKeyValue = [];

<c:forEach var="statusList" items="${codeListSd}" varStatus="status">
	statusKeyValue.push({'code':'${statusList.cdId}', 'codeName':'${statusList.cdNm}', 'codeNameEng':'${statusList.cdNmEng}', 'codeNameJP':'${statusList.cdNmJp}', 'codeClass':'${statusList.etc1}', })
</c:forEach>

var monthColorKeyValue = [];

<c:forEach var="monthColor" items="${codeListMc}" varStatus="status">
	monthColorKeyValue.push({'code':'${monthColor.cdId}', 'codeName':'${monthColor.cdNm}', 'color':'${monthColor.etc1}', })
</c:forEach>


// ------------------------------------------------------------------------------------------------------------------------------------------------------

const lorem = document.querySelector(".infoList");

var scrollT = $(this).scrollTop(); //스크롤바의 상단위치
var scrollH = $(this).height(); //스크롤바를 갖는 div의 높이

 //console.log("scrollT = " + scrollT + "  /  scrollH = " + scrollH )
$('.infoList').on('scroll', function(){
	var scrol_position = document.querySelector('.infoList').scrollTop;
	var scrol_height = document.querySelector('.infoList').scrollHeight;
	var scrol_h = document.querySelector('.infoList').clientHeight;

	if (scrol_position + scrol_h > scrol_height - 10) {

		var startNum = $('.infoListItem').length

		for (var i=startNum;i<markerList.length;i++) {
			if (i == (startNum + 10)) {
				//console.log("멈추기")
				break;
			}else {
				//console.log("더하기")
				$(".infoList").append(markerList[i])
			}
		}
	}
});


$(".btn_iconTXT, #btn_Back").click(function(){
	map.closePopup();

	markerIconCheck();

	$('.infoDetailWrap').css('display', 'none')
	$('.infoListWrap').css('display', 'block')

	$('.infoWrap').removeClass('on');
	$('.infoWrap').addClass('off');
	$('.infoDetailWrap').css('display', 'none');
	$('.infoListWrap').css('display', 'none');
	//$(".infoListWrap p").text("")
	$(".infoListWrap p").css('display', 'hidden');
	$('.infoListWrapNoData').css('display', 'none');

	if ( $('.menu_bar_close').css('display') == 'block' ) {
		$('.level_list').css('width', 'calc(100% - 40px)');
		$('.re-search-container').css('width', 'calc(100% - 40px)');
	} else if ( $('.menu_bar_close').css('display') == 'none' ) {
		$('.level_list').css('width', 'calc(100% - 40px)');
		$('.re-search-container').css('width', 'calc(100% - 40px)');
	}

	$('.btn_infoWrap').addClass("off");
	//$(".btn_infoWrap").click();

});

//우측 패널 펼치기
$(".btn_infoWrap").click(function(){
   	//infoDetailWrap

   	if ($('.infoDetailWrap').css('display') != "none") {

        if($(".infoWrap").hasClass("on")){
        	// 접음
            $('.infoWrap').removeClass('on');
            $('.infoWrap').addClass('off');
        	$('.infoDetailWrap').css('display', 'none');
        	$('.infoListWrap').css('display', 'none');
        	//$(".infoListWrap p").text("")
        	$(".infoListWrap p").css('display', 'hidden');
        	$('.infoListWrapNoData').css('display', 'none');

            $('.btn_infoWrap').addClass("off");
        } else {

            $('.btn_infoWrap').removeClass("off");

            // 펼침
            $('.infoWrap').addClass('on');
            $('.infoListWrap').css('display', 'block');
        	//$(".infoListWrap p").text("총  건")
        	if($('.infoListItem').length < 1) {
        		$('.infoListWrapNoData').css('display', 'block')
        	}
        }
   	}

});


$("#Levelswitch").change(function(){

	/* if ($("input[name='markerOnOff']:checked")) {
		console.log("aaaaaaaaaaaaaaaaaaaaaaa")
	} else {
		console.log("bbbbbbbbbbbbbbbbbbbbbbb")
	} */

	if ($(this).is(':checked')) {
        //console.log('Marker ON');
        map.addLayer(markerCluster);
        // ON 상태일 때 동작 추가
      } else {
        //console.log('Marker OFF');
        map.removeLayer(markerCluster);
        map.closePopup();
        // OFF 상태일 때 동작 추가
        onMapClick();
      }

});


// ------------------------------------------------------------------------------------------------------------------------------------------------------

/* function removeLine() {

	map.removeLayer(firstpolyline);
	map.removeLayer(map._layers)
} */

	//var markers = []
var layerGroup = L.featureGroup();
var layerGroup0 = L.featureGroup();
var layerGroup1 = L.featureGroup();
var layerGroup2 = L.featureGroup();
var layerGroup3 = L.featureGroup();
function toggleLayer(code){
	//console.log(code);
	if(code == '00'){
		if(layerGroup0._map){
			map.removeLayer(layerGroup0)
		} else {
			layerGroup0.addTo(map)
		}
	}
	if(code == '01'){
		if(layerGroup1._map){
			map.removeLayer(layerGroup1)
		} else {
			layerGroup1.addTo(map)
		}
	}
	if(code == '02'){
		if(layerGroup2._map){
			map.removeLayer(layerGroup2)
		} else {
			layerGroup2.addTo(map)
		}
	}
	if(code == '03'){
		if(layerGroup3._map){
			map.removeLayer(layerGroup3)
		} else {
			layerGroup3.addTo(map)
		}
	}


	layerGroup0.bringToFront();
	layerGroup1.bringToFront();
	layerGroup2.bringToFront();
	layerGroup3.bringToFront();
}
function nodata(map) {

	//$("div").show(); //display :none 일떄
	$('.infoListWrapNoData').css('display', 'block')
	$('.infoListWrap').css('display', 'none')

}

//////////// Level 관련
function getLevelText(level){

	var zerolv = "0" + level;

	//console.log('lvColorKeyValue 확인', lvColorKeyValue);
	var result = lvColorKeyValue.find(item => item.lv === zerolv);

	switch ('${nowCdNa}') {
        case 'KR':
            return result.riskNm;
        case 'US':
        	return result.riskNmEng;
        case 'JP':
        	return result.riskNmJp;
	}
}

function fn_device_id (id) {

	var macAddr = id;

	var device_id = "";

	for (var i=0; i< deviceKeyValue.length;i++) {
		if (deviceKeyValue[i].macAddr == macAddr){
			device_id = deviceKeyValue[i].deviceId;
		}
	}

	return device_id;
}

function fn_device_name (id) {

	var macAddr = id;

	var device_name = "";

	for (var i=0; i< deviceKeyValue.length;i++) {
		if (deviceKeyValue[i].macAddr == macAddr){
			device_name = deviceKeyValue[i].deviceNm;
			//device_id = deviceKeyValue[i].deviceId;
		}
	}


	return device_name;
}

///////////////////// 날짜관련
function fnDateFormat(date, format) {

	if (format == 'list') {
		// 2023.01.01 14:03:01
		var month = (date.getMonth() + 1) < 10 ? "0" + ""
				+ (date.getMonth() + 1) : (date.getMonth() + 1)
		var day = date.getDate() < 10 ? "0" + "" + date.getDate()
				: date.getDate()
		var hour = date.getHours() < 10 ? "0" + "" + date.getHours()
				: date.getHours()
		var min = date.getMinutes() < 10 ? "0" + "" + date.getMinutes()
				: date.getMinutes()
		var sec = date.getSeconds() < 10 ? "0" + "" + date.getSeconds()
				: date.getSeconds()

		dateString = date.getFullYear() + '.' + month + '.' + day + " "
				+ hour + ":" + min + ":" + sec

	} else if (format == 'select') {

		// 2023-01-02
		var month = (date.getMonth() + 1) < 10 ? "0" + ""
				+ (date.getMonth() + 1) : (date.getMonth() + 1)
		var day = date.getDate() < 10 ? "0" + "" + date.getDate()
				: date.getDate()

		dateString = date.getFullYear() + '-' + month + '-' + day
	}

	return dateString;
}

function statusName(code) {
	var statusNameByCdna = getCdNa('${authInfo.changedCdNa}', '${authInfo.cdNa}');

	const result = statusKeyValue.find(item => item.code === code);

	if (result) {
	    switch (statusNameByCdna) {
        case 'KR':
            return result.codeName;
        case 'US':
            return result.codeNameEng;
        case 'JP':
        	return result.codeNameJP;
		}

	} else {
		return '<fmt:message key="UNCLASSIFIED" bundle="${bundle}"/>';
	}
}

function statusClassName(code) {
	const result = statusKeyValue.find(item => item.code === code);

	if (result) {
	    return result.codeClass;
	} else {
		return "badge_warning"
	}
}

function getCdNa(selectedCnda, authCdNa){
	var changedCdNa = selectedCnda;
	var cdNa = authCdNa;

	if(changedCdNa.length > 0) {
		return changedCdNa;
	} else {
		return cdNa;
	}
}
function originalimg(id) {

	var popupimg = document.getElementById("pop_wrap");

	var modalImg = document.getElementById("pop_img");

	$('#pop_riskPopImg').css('display', 'block')
	$("#pop_img").attr("src", "${authInfo.restApiUrl}/pothole/" + id + "/image");

}

function onMarkerClick(e) {

	// 이전에 클릭된 마커가 있으면 원래 아이콘(blueIcon)으로 변경
    if (activeMarker) {
        activeMarker.setIcon(blueIcon);
    }

	this.setIcon(redIcon);

	// 현재 클릭된 마커를 추적
    activeMarker = this;

    detail(e.target.options.id, 'N');

	/* detail(e.target.options.id
		, e.target.options.deviceName
		, e.target.options.deviceId
		, e.target.options.addrName
		, e.target.options.ctime
		, e.latlng.lat
		, e.latlng.lng
		, 'N'
	); */

}

/* function removeLine(e) {
	map.removeLayer(firstpolyline)
} */


function markerIconCheck() {
	markerCluster.eachLayer(function(layer) {
		//if (layer.options.id === id) {
		// 마커를 찾았으면 아이콘 변경
			//layer.setIcon(redIcon);
		//}
		//console.log(layer.options.iconChanged)

		if (layer.options.iconChanged) {
			layer.setIcon(blueIcon);
		}

	});
}

function onMapClick(e) {
	/* popup.setLatLng(e.latlng)
	    .setContent("이곳의 좌표는" + e.latlng.toString() + "  \\ncenter = " + map.getCenter())
	    .openOn(map); */

	markerIconCheck()
	// 접음
	$('.infoWrap').removeClass('on');
	$('.infoWrap').addClass('off');
   	$('.infoDetailWrap').css('display', 'none');
   	$('.infoListWrap').css('display', 'none');
   	//$(".infoListWrap p").text("")
   	$(".infoListWrap p").css('display', 'hidden');
   	$('.infoListWrapNoData').css('display', 'none');

	$('.btn_infoWrap').addClass("off");

	$("#info").hide();
	$('.infoListWrap').css('display', 'block')
	$('.infoDetailWrap').css('display', 'none')

}
function clearMapLayers() {
    map.eachLayer(function (layer) {
        if (!(layer instanceof L.TileLayer)) {
            map.removeLayer(layer);
        }
    });

    // 그룹이 있다면 내부도 전부 제거
    [layerGroup0, layerGroup1, layerGroup2, layerGroup3].forEach(group => {
        if (group) {
            group.clearLayers();
            if (map.hasLayer(group)) {
                map.removeLayer(group);
            }
        }
    });
}


function mapInfo(map) {

	var lat = map.getCenter().lat;
	var lng = map.getCenter().lng;

	markerList = [];

	/* map.eachLayer(function (layer) {
	    if (!(layer instanceof L.TileLayer)) {
	        map.removeLayer(layer);
	    }
	}); */
	clearMapLayers();

	$.ajax({
		type: "GET",
		//url: "http://localhost:8080/potholeInArea",
		url: "${authInfo.restApiUrl}/potholeInArea",
		data: {
			on_way:false,
			//administrative_id: areaCode,
			//administrative_id: "2409180", //성남시
			north_west:"latitude:" + map.getBounds().getNorthWest().lat + ",longitude:" + map.getBounds().getNorthWest().lng,
			north_east:"latitude:" + map.getBounds().getNorthEast().lat + ",longitude:" + map.getBounds().getNorthEast().lng,
			south_west:"latitude:" + map.getBounds().getSouthWest().lat + ",longitude:" + map.getBounds().getSouthWest().lng,
			south_east:"latitude:" + map.getBounds().getSouthEast().lat + ",longitude:" + map.getBounds().getSouthEast().lng,
			region:"${authInfo.cdNa}",
			co_id :"${authInfo.coId}"
		},
		success: drawMarker,
		error: function(request,status,error){
			//console.log("request.status = " + request.status)
		},
		beforeSend:function(){
			$('#circularG').css('display','block')
		},
		complete : function(data) {
			//  실패했어도 완료가 되었을 때 처리
			$('#circularG').css('display','none');
			getDetectedRoad();

		}
	})

}

function drawMarker(response) {

	$("#info").hide();
	//$('.infoListWrap').css('display', 'block')
	$('.infoDetailWrap').css('display', 'none')
	map.closePopup();

	//console.log("abc => ", response)
	allData = response.data;

	sumMarkerSort = [];

	for (var i = 0; i < lines.length; i++) {
		map.removeLayer(lines[i])
	}

	for (var i = 0; i < markers.length; i++) {
		map.removeLayer(markers[i])
	}

	markers = []

	point = []

	var lvColorKeyValue = [];
	var riskText = '';

	// riskLv1
	//obj.css("color","색상");
	for (var i = 1; i <= lvColorKeyValue.length; i++) {
		$('#riskbgcolorLv' + i).css("background-color", lvColorKeyValue[i-1].color)
		$('#riskLv' + i).text(lvColorKeyValue[i].lvNm);
	}

	markerCluster = L.markerClusterGroup({
		disableClusteringAtZoom: 19, // 줌 레벨 15 이상에서 클러스터 해제
		maxClusterRadius: 30,        // 클러스터링 반경 50px로 설정
		iconCreateFunction: function(cluster) {
			var count = cluster.getChildCount();
			return L.divIcon({
				html: '<div>' + count + '</div>',
				className: 'mycluster',
				iconSize: L.point(40, 40)
			});
		},
		spiderfyOnMaxZoom: false,
		zoomToBoundsOnClick: false,
		showCoverageOnHover: false // 마우스 오버 시 폴리곤 비활성화
	});

 	for (var i = 0 ; i < response.data.length ; i++) {

		var markerdate = new Date(response.data[i].timestamp);

		var item = response.data[i];

		var deviceId = fn_device_id(item['device-id'])
		var deviceNm = fn_device_name(item['device-id'])

		var lat = item.point['latitude'];
		var lng = item.point['longitude'];

		var date = new Date(item['timestamp'])

		var dateFormat = date.getFullYear() + '.' + (date.getMonth()+1) + '.'
						+ date.getDate() + ' '
						+ date.getHours() + ':' + date.getMinutes() ;

		var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 )
		var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate()
		var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours()
		var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes()
		//var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds()

		var cTime  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min;

		var addrPoLocality = (item.way == null || item.way.name == null || item.way.name == '') ? "도로정보 없음" : item.way.name;

		var t = L.marker([item.point.latitude, item.point.longitude], {
			id : item['id'],
			lat : item.point['latitude'],
			lng : item.point['longitude'],
			ctime : cTime,
			deviceId : deviceId,
			deviceName : deviceNm,
			addrName : addrPoLocality,
			level : item.risk.level,
			status : item.status,
			potholes : item.risk['count-of-potholes'],
			vertical : item.risk['count-of-vertical-cracks'],
			horizontal : item.risk['count-of-horizontal-cracks'],
			alligators : item.risk['count-of-alligators'],
			icon : blueIcon,
		}).on('click', onMarkerClick);

		//console.log("tt -- ", t);
		markerCluster.addLayer(t);
		markers.push(t);
		//markerId.push(item['id']);

		//map.removeLayer(markerCluster);


	}

 	// 마커 클러스터 그룹에 클릭 이벤트 추가
	markerCluster.on('clusterclick', function(event) {
		var cluster = event.layer;
		var childMarkers = cluster.getAllChildMarkers();

		markerIconCheck();
		onMapClick(map);

		// 팝업 내용 생성
		var popupContent = '<b>Cluster contains ' + childMarkers.length + ' markers:</b><br>';
		//console.log('childMarkers -- ', childMarkers)
		childMarkers.forEach(function(marker, index) {

			var item = marker.options;

			popupContent += "Marker " + (index + 1) + " : "
						+ "<b id='" + marker.options.id + "'" //+ mouseoverTxt + mouseoutTxt
						+ "class='txtColor' onClick=\"detail('" + item.id + "', 'Y')\">"
						+ marker.getLatLng().toString()
						+ "</b><br>";

		});

		//console.log('markerCluster >>> ', markerCluster);
		// 첫 번째 마커의 위치를 팝업 위치로 사용
		//var popupLatLng = childMarkers[0].getLatLng();
		var popupLatLng = cluster.getLatLng();

		// 팝업 생성 및 오픈
		//cluster.bindPopup(popupContent).openPopup();

		popup = L.popup({autoPan:false}).setLatLng(popupLatLng).setContent(popupContent).openOn(map);
	});

 	//map.addLayer(markerCluster);

 	$('.infoList li').remove()
	$('.infoList div').remove()

	potholeCnt = response.data.length;
	potholeListData = response.data;

	$("#Levelswitch").trigger("change");

}

/* //클러스터 숨기기
function hideCluster() {
  map.removeLayer(markerCluster);
}

// 클러스터 보이기
function showCluster() {
  map.addLayer(markerCluster);
} */

function detail(id, clusterChk){

	var deviceNm, deviceId, addrPoLocality, dateFormat, lat, lng, level, status, potholes, vertical, horizontal, alligators, riskLvNm;

	markerCluster.eachLayer(function(layer) {

		if (layer.options.id === id) {

			layer.setIcon(redIcon);
			layer.options.iconChanged = true;

			deviceNm = layer.options.deviceName;
			deviceId = layer.options.deviceId;
			addrPoLocality = layer.options.addrName;
			dateFormat = layer.options.ctime;
			lat = layer.options.lat;
			lng = layer.options.lng;
			level = layer.options.level;
			status = layer.options.status;
			potholes = layer.options.potholes;
			vertical = layer.options.vertical;
			horizontal = layer.options.horizontal;
			alligators = layer.options.alligators;
		}
	});


	$(".infoWrap").addClass("on");
 	$(".infoListWrap p").css('display', 'block');

   	markersTemp = markers;

	$(".infoWrap").addClass("on");
 	$(".infoListWrap p").css('display', 'block');

   	markersTemp = markers;

	markers = markersTemp;

 	$("#info").hide();
	//$('.infoListWrap').css('display', 'block')
	$('.infoDetailWrap').css('display', 'none');

	img_id = id;

	thisData = "";

	for (var i=0; i<allData.length; i++) {

		if (allData[i].id == id) {
			thisData = allData[i];
		}
	}

	var popuptxt = "<div><h1><fmt:message key="DEVICE_NAME" bundle="${bundle}"/> : " + deviceNm + " ( " + deviceId + " )</h1>"
					+ "<fmt:message key="ROAD_NAME" bundle="${bundle}"/> : " + addrPoLocality + " (" + lat + ", " + lng + ")<br>"
					+ "<fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/> : " + dateFormat + "</div>";

	var lat = Number(lat);
	var lng = Number(lng);

	var position = [lat, lng];

	if (clusterChk == 'N') {
		popup.setLatLng(position)
			.setContent(popuptxt)
			.openOn(map);
	}

	for (var i = 0; i < lvColorKeyValue.length; i++) {
		if (Number(lvColorKeyValue[i].lv) == Number(thisData.risk.level)){
			riskLvNm = lvColorKeyValue[i].riskNm;
			riskColor = lvColorKeyValue[i].color;
		}
	}

	$("#detail_img").attr("src", "${authInfo.restApiUrl}/pothole/"  + id + "/thumbnail");

	$("#detail_img").removeAttr("onClick");
	$("#detail_img").attr("onclick", "originalimg('" + id + "')");

	//console.log(potholeListData)

	for (var i = 0; i < potholeListData.length; i++) {
		if (potholeListData[i].id == id) {

			//var addrName = potholeListData[i].way == null ? "도로정보 없음" : potholeListData[i].way.name
			var addrName = (potholeListData[i].way == null || potholeListData[i].way.name == null || potholeListData[i].way.name == '' ) ? "도로정보 없음" : potholeListData[i].way.name;
			//var addrPoLocality = (item.way == null || item.way.name == null || item.way.name == '') ? "<fmt:message key="ROAD_INFO_NOT_EXISTS" bundle="${bundle}"/>" : item.way.name;


			//var riskLevel = "level level" + (Number(thisData.risk.level)+1);
			var riskLevel = "level level" + (Number(thisData.risk.level));

			$(".itemvalue").prev().attr("class", riskLevel)

			var riskText = getLevelText((Number(thisData.risk.level)));

			$("#riskLv").text("LEVEL" + thisData.risk.level + ". " + riskText)

			var totCnt = thisData.risk['count-of-vertical-cracks']
						+ thisData.risk['count-of-horizontal-cracks']
						+ thisData.risk['count-of-alligators'];

			var date = new Date(potholeListData[i]['created-at'])

			var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 )
			var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate()
			var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours()
			var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes()
			var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds()

			dateString  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec

			// 포트홀
			//$("#CntPothole").text(totCnt + " 개")
			$("#CntPothole").text(thisData.risk['count-of-potholes'] + " <fmt:message key="COUNT1" bundle="${bundle}"/>")
			// 수직균열
			$("#CntVertical").text(thisData.risk['count-of-vertical-cracks'] + " <fmt:message key="COUNT1" bundle="${bundle}"/>")
			// 수평균열
			$("#CntHorizontal").text(thisData.risk['count-of-horizontal-cracks'] + " <fmt:message key="COUNT1" bundle="${bundle}"/>")
			// 피로균열
			$("#CntAlligators").text(thisData.risk['count-of-alligators'] + " <fmt:message key="COUNT1" bundle="${bundle}"/>")

			// detail영역
			$("#detail_title").text(deviceNm + " ( " + deviceId + " )");
			// 디바이스 name
			$("#detail_device_name").text(deviceNm);
			// 디바이스 ID
			$("#detail_device_id").text(deviceId);
			// 좌표
			$("#detail_latlng").text("<fmt:message key="LATITUDE" bundle="${bundle}"/> " + lat + " / <fmt:message key="LONGITUDE" bundle="${bundle}"/> " + lng);
			// 위험도
			$("#detail_risk_level").text(riskText);
			// 도로명
			//$("#detail_route_name").text();
			$("#detail_route_name").text(addrPoLocality);
			// 촬영일시
			$("#detail_ctime").text(dateFormat);

			// 현재상태
			$("#detail_state").text(statusName(status));

		}

	}

	if ($(".infoDetailWrap").css("display") == "none") {
	    //$("div").show(); //display :none 일떄
	    $('.infoDetailWrap').css('display', 'block')
	    $('.infoListWrap').css('display', 'none')
	} else {
	    //$("div").hide();  //display :block 일떄
	    $('.infoDetailWrap').css('display', 'none')
		//$('.infoListWrap').css('display', 'block')
	}

		//$('.infoDetailWrap').css('display', 'block')
		//$('.infoListWrap').css('display', 'none')

}

function getDetectedRoad() {

	$.ajax({
		type: "GET",
		//url: "${authInfo.restApiUrl}/detected-road" ,
		//url: "http://localhost:8081/detected-road",
		url: "${authInfo.restApiUrl}/detected-road-by-deviceid",
		data: {
			north_west:"latitude:" + (map.getBounds().getNorthWest().lat + 0.0025) + ",longitude:" + (map.getBounds().getNorthWest().lng - 0.0025),
			north_east:"latitude:" + (map.getBounds().getNorthEast().lat + 0.0025) + ",longitude:" + (map.getBounds().getNorthEast().lng + 0.0025),
			south_west:"latitude:" + (map.getBounds().getSouthWest().lat - 0.0025) + ",longitude:" + (map.getBounds().getSouthWest().lng - 0.0025),
			south_east:"latitude:" + (map.getBounds().getSouthEast().lat + 0.0025) + ",longitude:" + (map.getBounds().getSouthEast().lng + 0.0025),
			region:"${authInfo.cdNa}",
			co_id :"${authInfo.coId}"
		},
		success: function(resp) {

			// ------- api 시작하는 부분------

			//datas = resp.data;
			//var linesize = map.getZoom()-9;
			var linesize = 6;



			var crackList = [];
			var crackListLv00 = [];
			var crackListLv11 = [];
			var crackListLv22 = [];
			var crackListLv33 = [];
			var elseddd = [];

			for (var i = 0; i < allData.length; i++) {

				if ( allData[i].risk.level == 0 ) {
					//console.log( i + " 번째  riskLv = " + allData[i].risk.level);
					crackListLv00.push(allData[i].id);

				} else if ( allData[i].risk.level == 1 ) {

					crackListLv11.push(allData[i].id);

				} else if ( allData[i].risk.level == 2 ) {

					crackListLv22.push(allData[i].id);

				} else if ( allData[i].risk.level == 3 ) {

					crackListLv33.push(allData[i].id);
				} else {
					elseddd.push(allData[i].id);
				}
			}

			for (var z = 0; z < resp.data.length; z++) {
            //console.log('탐지도로 데이터 확인--->> ', datas);
			//console.log('포트홀 데이터 확인-->> ', allData);
				datas = resp.data[z].detectedRoadInfo;

				//var crackList = [];
				var crackListLv0 = [];
				var crackListLv1 = [];
				var crackListLv2 = [];
				var crackListLv3 = [];
				//var elsedd = [];

				color = lvColorKeyValue.find(item => item.lv === '99').color;
				//lvColorKeyValue.find(item => item.lv === zerolv)

				function deg2rad(deg) {
			        return deg * (Math.PI/180)
			    }

				for (var i = 0; i < datas.length; i++) {


					for (var b = 0; b < crackListLv00.length; b++) {

						if ( datas[a].id == crackListLv00[b] ) {
							//console.log("인덱스 >> ", a , " - ", datas[a]);
							crackListLv0.push(i);
						}
					}

					for (var b = 0; b < crackListLv11.length; b++) {

						if ( datas[i].id == crackListLv11[b] ) {
							crackListLv1.push(i);
						}
					}

					for (var c = 0; c < crackListLv22.length; c++) {

						if ( datas[i].id == crackListLv22[c] ) {
							crackListLv2.push(i);
						}
					}

					for (var d = 0; d < crackListLv33.length; d++) {

						if ( datas[i].id == crackListLv33[d] ) {
							crackListLv3.push(i);
						}
					}

					//var roadInfo = datas[i].detectedRoadInfo;
					if (i < datas.length-1) {
						var pointA = new L.LatLng(datas[i].latitude, datas[i].longitude);
						var pointB = new L.LatLng(datas[i+1].latitude, datas[i+1].longitude);

						var pointList = [ pointA, pointB ];

						var firstpolyline = new L.Polyline(pointList, {
						    //color: 'red',
						    color: color,
						    //color: color,
						    //color: 'lightgray',
						    //weight: 15,
						    weight: linesize,
						    //opacity: 0.1,
						    smoothFactor: 1

						    })//.on('click', function(e) {
					            //wayMarkerList(response ,wayname)

					        //});;

				        var pointATime = new Date( datas[i].timestamp );
				        var pointBTime = new Date( datas[i+1].timestamp );

				        //console.log("빼기 ------------------------------" ,(pointBTime - pointATime));
				        var BAsecond = (pointBTime - pointATime) / 1000;

						if (BAsecond < 10) {
					        //map.addLayer(firstpolyline);
							layerGroup.addLayer(firstpolyline,true);
						}
					}

				}

				//map.addLayer(firstpolyline);
				///layerGroup1.addLayer(firstpolyline);


				layerGroup.addTo(map);
				//layerGroup2.addTo(map);

				//layerGroup1.bringToFront();

				// ------------------------------------------------------------------------------------------------------------------------
				// Lv0 리스트 처리 부분
				// ▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽
				//for (datas) {

				for (var x = 0; x < crackListLv0.length; x++) {

					var rangeSumM = 0;
					var rangeSumP = 0;

					for (var xx = crackListLv0[x]; xx > 0; xx--) {
						if (xx > 1) {

							var R = 6371; // Radius of the earth in km
						    var dLat = deg2rad( datas[xx].latitude - datas[xx-1].latitude );  // deg2rad below
						    var dLon = deg2rad( datas[xx].longitude - datas[xx-1].longitude );

						    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(datas[xx].latitude)) * Math.cos(deg2rad(datas[xx].longitude)) * Math.sin(dLon/2) * Math.sin(dLon/2);

						    //var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
						    var c = 2 * Math.atan2(Math.sqrt(Math.abs(a)), Math.sqrt(Math.abs(1-a)));

						    //var d = R * c; // Distance in km
						    var d = (R * c) * 1000; // Distance in km

						    rangeSumM = rangeSumM + d;

						    // -----------------------------------------------------------------------------------------------------

						    var pointA = new L.LatLng(datas[xx].latitude, datas[xx].longitude);
							var pointB = new L.LatLng(datas[xx-1].latitude, datas[xx-1].longitude);

							var pointList = [ pointA, pointB ];

							var firstpolyline = new L.Polyline(pointList, {
							    //color: 'green',
							    //color: lvColorKeyValue[datas[crackListLv0[x]].riskLevel-1].color,
							    //color: lvColorKeyValue[datas[crackListLv0[x]].riskLevel+1].color,
							    color: lvColorKeyValue.find(item => item.riskLv == datas[crackListLv0[x]].riskLevel).color,
							    //color: 'gray',
							    //color: color,
							    //color: 'lightgray',
							    //weight: 15,
							    weight: linesize,
							    //opacity: 0.1,
							    smoothFactor: 1

							    })

					        var pointATime = new Date( datas[xx-1].timestamp );
					        var pointBTime = new Date( datas[xx].timestamp );

					        var BAsecond = (pointBTime - pointATime) / 1000;

					        //console.log(xx + " : " + pointA + ", " + pointB + " // " + pointBTime + " - " + pointATime + " = " + BAsecond);
					        //console.log(xx + " : " + pointA + ", " + pointB + " // " + datas[xx-1].timestamp + " - " + datas[xx].timestamp + " = " + BAsecond);

							if (BAsecond < 10) {
						        //map.addLayer(firstpolyline);
								layerGroup0.addLayer(firstpolyline);
							} else {
						    	break;
							}

						    // -----------------------------------------------------------------------------------------------------

						    if (rangeSumM > 25 ) {
						    	break;
						    }
						}
					}
					//console.log("-----------------------------------------------------------------------------------------------------")
					for (var xx = crackListLv0[x]; xx < datas.length; xx++) {

						if (xx < datas.length-1) {

							var R = 6371; // Radius of the earth in km
						    var dLat = deg2rad( datas[xx].latitude - datas[xx+1].latitude );  // deg2rad below
						    var dLon = deg2rad( datas[xx].longitude - datas[xx+1].longitude );

						    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(datas[xx].latitude)) * Math.cos(deg2rad(datas[xx].longitude)) * Math.sin(dLon/2) * Math.sin(dLon/2);

						    //var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
						    var c = 2 * Math.atan2(Math.sqrt(Math.abs(a)), Math.sqrt(Math.abs(1-a)));

						    //var d = R * c; // Distance in km
						    var d = (R * c) * 1000; // Distance in km

						    rangeSumP = rangeSumP + d;

						    // -----------------------------------------------------------------------------------------------------

						    var pointA = new L.LatLng(datas[xx].latitude, datas[xx].longitude);
							var pointB = new L.LatLng(datas[xx+1].latitude, datas[xx+1].longitude);

							var pointList = [ pointA, pointB ];

							var firstpolyline = new L.Polyline(pointList, {
							    //color: 'green',
							    //color: lvColorKeyValue[datas[crackListLv0[x]].riskLevel-1].color,
							    //color: lvColorKeyValue[datas[crackListLv0[x]].riskLevel+1].color,
							    color: lvColorKeyValue.find(item => item.riskLv == datas[crackListLv0[x]].riskLevel).color,
							    //color: 'gray',
							    //color: color,
							    //color: 'lightgray',
							    //weight: 15,
							    weight: linesize,
							    //opacity: 0.1,
							    smoothFactor: 1

							    })

					        var pointATime = new Date( datas[xx].timestamp );
					        var pointBTime = new Date( datas[xx+1].timestamp );

					        var BAsecond = (pointBTime - pointATime) / 1000;

							if (BAsecond < 10) {
						        //map.addLayer(firstpolyline);
						        layerGroup0.addLayer(firstpolyline);
							}

						    // -----------------------------------------------------------------------------------------------------

						    if (rangeSumP > 25 ) {
						    	break;
						    }
						}
					}
				}

				// △△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△
				// Lv0 리스트 처리 부분
				// ------------------------------------------------------------------------------------------------------------------------

				// ------------------------------------------------------------------------------------------------------------------------
				// Lv1 리스트 처리 부분
				// ▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽

				for (var x = 0; x < crackListLv1.length; x++) {

					var rangeSumM = 0;
					var rangeSumP = 0;

					for (var xx = crackListLv1[x]; xx > 0; xx--) {

						if (xx > 1) {

							var R = 6371; // Radius of the earth in km
						    var dLat = deg2rad( datas[xx].latitude - datas[xx-1].latitude );  // deg2rad below
						    var dLon = deg2rad( datas[xx].longitude - datas[xx-1].longitude );

						    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(datas[xx].latitude)) * Math.cos(deg2rad(datas[xx].longitude)) * Math.sin(dLon/2) * Math.sin(dLon/2);

						    //var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
						    var c = 2 * Math.atan2(Math.sqrt(Math.abs(a)), Math.sqrt(Math.abs(1-a)));

						    //var d = R * c; // Distance in km
						    var d = (R * c) * 1000; // Distance in km

						    rangeSumM = rangeSumM + d;

						    // -----------------------------------------------------------------------------------------------------

						    var pointA = new L.LatLng(datas[xx].latitude, datas[xx].longitude);
							var pointB = new L.LatLng(datas[xx-1].latitude, datas[xx-1].longitude);

							var pointList = [ pointA, pointB ];

							var firstpolyline = new L.Polyline(pointList, {
							    //color: 'blue',
							    //color: lvColorKeyValue[datas[crackListLv1[x]].riskLevel-1].color,
							    //color: lvColorKeyValue[datas[crackListLv1[x]].riskLevel+1].color,
							    color: lvColorKeyValue.find(item => item.riskLv == datas[crackListLv1[x]].riskLevel).color,
							    //color: 'gray',
							    //color: color,
							    //color: 'lightgray',
							    //weight: 15,
							    weight: linesize,
							    //opacity: 0.1,
							    smoothFactor: 1

							    })

					        var pointATime = new Date( datas[xx-1].timestamp );
					        var pointBTime = new Date( datas[xx].timestamp );

					        var BAsecond = (pointBTime - pointATime) / 1000;

							if (BAsecond < 10) {
						        //map.addLayer(firstpolyline);
						        layerGroup1.addLayer(firstpolyline);
							}

						    // -----------------------------------------------------------------------------------------------------

						    if (rangeSumM > 25 ) {
						    	break;
						    }
						}
					}

					for (var xx = crackListLv1[x]; xx < datas.length; xx++) {

						if (xx < datas.length-1) {

							var R = 6371; // Radius of the earth in km
						    var dLat = deg2rad( datas[xx].latitude - datas[xx+1].latitude );  // deg2rad below
						    var dLon = deg2rad( datas[xx].longitude - datas[xx+1].longitude );

						    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(datas[xx].latitude)) * Math.cos(deg2rad(datas[xx].longitude)) * Math.sin(dLon/2) * Math.sin(dLon/2);

						    //var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
						    var c = 2 * Math.atan2(Math.sqrt(Math.abs(a)), Math.sqrt(Math.abs(1-a)));

						    //var d = R * c; // Distance in km
						    var d = (R * c) * 1000; // Distance in km

						    rangeSumP = rangeSumP + d;

						    // -----------------------------------------------------------------------------------------------------

						    var pointA = new L.LatLng(datas[xx].latitude, datas[xx].longitude);
							var pointB = new L.LatLng(datas[xx+1].latitude, datas[xx+1].longitude);

							var pointList = [ pointA, pointB ];

							var firstpolyline = new L.Polyline(pointList, {
							    //color: 'blue',
							    //color: lvColorKeyValue[datas[crackListLv1[x]].riskLevel-1].color,
							    //color: lvColorKeyValue[datas[crackListLv1[x]].riskLevel+1].color,
							    color: lvColorKeyValue.find(item => item.riskLv == datas[crackListLv1[x]].riskLevel).color,
							    //color: 'gray',
							    //color: color,
							    //color: 'lightgray',
							    //weight: 15,
							    weight: linesize,
							    //opacity: 0.1,
							    smoothFactor: 1

							    })

					        var pointATime = new Date( datas[xx].timestamp );
					        var pointBTime = new Date( datas[xx+1].timestamp );

					        var BAsecond = (pointBTime - pointATime) / 1000;

							if (BAsecond < 10) {
						        //map.addLayer(firstpolyline);
						        layerGroup1.addLayer(firstpolyline);
							}

						    // -----------------------------------------------------------------------------------------------------

						    if (rangeSumP > 25 ) {
						    	break;
						    }
						}
					}
				}

				// △△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△
				// Lv1 리스트 처리 부분
				// ------------------------------------------------------------------------------------------------------------------------

				// ------------------------------------------------------------------------------------------------------------------------
				// Lv2 리스트 처리 부분
				// ▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽

				for (var x = 0; x < crackListLv2.length; x++) {

					var rangeSumM = 0;
					var rangeSumP = 0;

					for (var xx = crackListLv2[x]; xx > 0; xx--) {

						if (xx > 1) {

							var R = 6371; // Radius of the earth in km
						    var dLat = deg2rad( datas[xx].latitude - datas[xx-1].latitude );  // deg2rad below
						    var dLon = deg2rad( datas[xx].longitude - datas[xx-1].longitude );

						    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(datas[xx].latitude)) * Math.cos(deg2rad(datas[xx].longitude)) * Math.sin(dLon/2) * Math.sin(dLon/2);

						    //var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
						    var c = 2 * Math.atan2(Math.sqrt(Math.abs(a)), Math.sqrt(Math.abs(1-a)));

						    //var d = R * c; // Distance in km
						    var d = (R * c) * 1000; // Distance in km

						    rangeSumM = rangeSumM + d;

						    // -----------------------------------------------------------------------------------------------------

						    var pointA = new L.LatLng(datas[xx].latitude, datas[xx].longitude);
							var pointB = new L.LatLng(datas[xx-1].latitude, datas[xx-1].longitude);

							var pointList = [ pointA, pointB ];

							var firstpolyline = new L.Polyline(pointList, {
							    //color: 'orange',
							    //color: lvColorKeyValue[datas[crackListLv2[x]].riskLevel-1].color,
							    //color: lvColorKeyValue[datas[crackListLv2[x]].riskLevel+1].color,
							    color: lvColorKeyValue.find(item => item.riskLv == datas[crackListLv2[x]].riskLevel).color,
							    //color: 'gray',
							    //color: color,
							    //color: 'lightgray',
							    //weight: 15,
							    weight: linesize,
							    //opacity: 0.1,
							    smoothFactor: 1

							    })

					        var pointATime = new Date( datas[xx-1].timestamp );
					        var pointBTime = new Date( datas[xx].timestamp );

					        var BAsecond = (pointBTime - pointATime) / 1000;

							if (BAsecond < 10) {
						        //map.addLayer(firstpolyline);
						        layerGroup2.addLayer(firstpolyline);
							}

						    // -----------------------------------------------------------------------------------------------------

						    if (rangeSumM > 25 ) {
						    	break;
						    }
						}
					}

					for (var xx = crackListLv2[x]; xx < datas.length; xx++) {

						if (xx < datas.length-1) {

							var R = 6371; // Radius of the earth in km
						    var dLat = deg2rad( datas[xx].latitude - datas[xx+1].latitude );  // deg2rad below
						    var dLon = deg2rad( datas[xx].longitude - datas[xx+1].longitude );

						    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(datas[xx].latitude)) * Math.cos(deg2rad(datas[xx].longitude)) * Math.sin(dLon/2) * Math.sin(dLon/2);

						    //var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
						    var c = 2 * Math.atan2(Math.sqrt(Math.abs(a)), Math.sqrt(Math.abs(1-a)));

						    //var d = R * c; // Distance in km
						    var d = (R * c) * 1000; // Distance in km

						    rangeSumP = rangeSumP + d;

						    // -----------------------------------------------------------------------------------------------------

						    var pointA = new L.LatLng(datas[xx].latitude, datas[xx].longitude);
							var pointB = new L.LatLng(datas[xx+1].latitude, datas[xx+1].longitude);

							var pointList = [ pointA, pointB ];

							var firstpolyline = new L.Polyline(pointList, {
							    //color: 'orange',
							    //color: lvColorKeyValue[datas[crackListLv2[x]].riskLevel-1].color,
							    //color: lvColorKeyValue[datas[crackListLv2[x]].riskLevel+1].color,
							    color: lvColorKeyValue.find(item => item.riskLv == datas[crackListLv2[x]].riskLevel).color,
							    //color: 'gray',
							    //color: color,
							    //color: 'lightgray',
							    //weight: 15,
							    weight: linesize,
							    //opacity: 0.1,
							    smoothFactor: 1

							    })

					        var pointATime = new Date( datas[xx].timestamp );
					        var pointBTime = new Date( datas[xx+1].timestamp );

					        var BAsecond = (pointBTime - pointATime) / 1000;

							if (BAsecond < 10) {
						        //map.addLayer(firstpolyline);
						        layerGroup2.addLayer(firstpolyline);
							}

						    // -----------------------------------------------------------------------------------------------------

						    if (rangeSumP > 25 ) {
						    	break;
						    }
						}
					}
				}

				// △△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△
				// Lv2 리스트 처리 부분
				// ------------------------------------------------------------------------------------------------------------------------


				// ------------------------------------------------------------------------------------------------------------------------
				// Lv3 리스트 처리 부분
				// ▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽

				for (var x = 0; x < crackListLv3.length; x++) {

					var rangeSumM = 0;
					var rangeSumP = 0;

					for (var xx = crackListLv3[x]; xx > 0; xx--) {

						if (xx > 1) {

							var R = 6371; // Radius of the earth in km
						    var dLat = deg2rad( datas[xx].latitude - datas[xx-1].latitude );  // deg2rad below
						    var dLon = deg2rad( datas[xx].longitude - datas[xx-1].longitude );

						    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(datas[xx].latitude)) * Math.cos(deg2rad(datas[xx].longitude)) * Math.sin(dLon/2) * Math.sin(dLon/2);

						    //var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
						    var c = 2 * Math.atan2(Math.sqrt(Math.abs(a)), Math.sqrt(Math.abs(1-a)));

						    //var d = R * c; // Distance in km
						    var d = (R * c) * 1000; // Distance in km

						    rangeSumM = rangeSumM + d;

						    // -----------------------------------------------------------------------------------------------------

						    var pointA = new L.LatLng(datas[xx].latitude, datas[xx].longitude);
							var pointB = new L.LatLng(datas[xx-1].latitude, datas[xx-1].longitude);

							var pointList = [ pointA, pointB ];

							var firstpolyline = new L.Polyline(pointList, {
							    //color: 'red',
							    //color: lvColorKeyValue[datas[crackListLv3[x]].riskLevel-1].color,
							    //color: lvColorKeyValue[datas[crackListLv3[x]].riskLevel+1].color,
							    color: lvColorKeyValue.find(item => item.riskLv == datas[crackListLv3[x]].riskLevel).color,
							    //color: 'gray',
							    //color: color,
							    //color: 'lightgray',
							    //weight: 15,
							    weight: linesize,
							    //opacity: 0.1,
							    smoothFactor: 1

							    })

					        var pointATime = new Date( datas[xx-1].timestamp );
					        var pointBTime = new Date( datas[xx].timestamp );

					        var BAsecond = (pointBTime - pointATime) / 1000;

							if (BAsecond < 10) {
						        //map.addLayer(firstpolyline);
						        layerGroup3.addLayer(firstpolyline);
							}

						    // -----------------------------------------------------------------------------------------------------

						    if (rangeSumM > 25 ) {
						    	break;
						    }
						}
					}

					for (var xx = crackListLv3[x]; xx < datas.length; xx++) {

						if (xx < datas.length-1) {

							var R = 6371; // Radius of the earth in km
						    var dLat = deg2rad( datas[xx].latitude - datas[xx+1].latitude );  // deg2rad below
						    var dLon = deg2rad( datas[xx].longitude - datas[xx+1].longitude );

						    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(datas[xx].latitude)) * Math.cos(deg2rad(datas[xx].longitude)) * Math.sin(dLon/2) * Math.sin(dLon/2);

						    //var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
						    var c = 2 * Math.atan2(Math.sqrt(Math.abs(a)), Math.sqrt(Math.abs(1-a)));

						    //var d = R * c; // Distance in km
						    var d = (R * c) * 1000; // Distance in km

						    rangeSumP = rangeSumP + d;

						    // -----------------------------------------------------------------------------------------------------

						    var pointA = new L.LatLng(datas[xx].latitude, datas[xx].longitude);
							var pointB = new L.LatLng(datas[xx+1].latitude, datas[xx+1].longitude);

							var pointList = [ pointA, pointB ];

							var firstpolyline = new L.Polyline(pointList, {
							    //color: lvColorKeyValue[datas[crackListLv3[x]].riskLevel+1].color,
							    color: lvColorKeyValue.find(item => item.riskLv == datas[crackListLv3[x]].riskLevel).color,
							    weight: linesize,
							    //opacity: 0.1,
							    smoothFactor: 1

							    })

					        var pointATime = new Date( datas[xx].timestamp );
					        var pointBTime = new Date( datas[xx+1].timestamp );

					        var BAsecond = (pointBTime - pointATime) / 1000;

							if (BAsecond < 10) {
						        //map.addLayer(firstpolyline);
						        layerGroup3.addLayer(firstpolyline);
							}

						    // -----------------------------------------------------------------------------------------------------

						    if (rangeSumP > 25 ) {
						    	break;
						    }
						}
					}
				}
				// △△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△
				// Lv3 리스트 처리 부분
				// ------------------------------------------------------------------------------------------------------------------------
			}

			layerGroup0.addTo(map);
			layerGroup1.addTo(map);
			layerGroup2.addTo(map);
			layerGroup3.addTo(map);

			layerGroup0.bringToFront();
			layerGroup1.bringToFront();
			layerGroup2.bringToFront();
			layerGroup3.bringToFront();

			// ------- api success 끝나는 부분------

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

$(document).ready(function() {

	let now1 = new Date('2023-03-30');
	//console.log("현재 : ", now1);

	let oneMonthAgo = new Date(now1.setMonth(now1.getMonth() - 1)); // 한달
	//console.log("한달 전 : ", oneMonthAgo);

	let now2 = new Date('2023-12-22');
	//console.log("현재 : ", now2);

	let oneMonthLater = new Date(now2.setMonth(now2.getMonth() + 1));
	//console.log("한달 후 : ", oneMonthLater)

	//0.0025

	//fromDt = $('#fromDt').val().replaceAll('-', '');
	//toDt = $('#toDt').val().replaceAll('-', '');

	// 날짜 설정 오늘날짜로부터 1주일 (임시10.1)
	var date1 = new Date();
	//$('#toDt').val(fnDateFormat(date1, 'select'))
	var date2 = new Date(date1.setDate(date1.getDate() - 30));
	// $('#fromDt').val(dateFormat(date2, 'select'))
	//$('#fromDt').val('2023-10-01')

//setLevelList(1, '');
region = "${authInfo.cdNa}";

mapInfo(map);



})

// ------------------------------------------------------------------------------------------------------------------------------------------------------
</script>



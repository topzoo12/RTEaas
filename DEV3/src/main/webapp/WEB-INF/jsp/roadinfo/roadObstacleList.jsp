<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="bundleName"	value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<c:set var="nowCdNa" value="${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />


<!--달력-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js" defer></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin=""/>

<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
<link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.css" />
<link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.Default.css" />
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
<script src="https://unpkg.com/leaflet.markercluster@1.4.1/dist/leaflet.markercluster.js"></script>

<div class="contentsWrap">
    <p class="title ${fav}">${pageName.srnNm}</p>
		<ul class="search_box" style="min-width: 1390px;">
			<li>
				<input type="text" value="" name="" id="inputVideoName" class="input1" placeholder="<fmt:message key="VIDEO_NAME" bundle="${bundle}"/>">
				<span class="stl"><fmt:message key="PERIOD" bundle="${bundle}"/><span class="remark2"></span></span>
				<span class="date">
                	<input type="text" value="${fromDt}" name="start" id="fromDt" class="input2" readonly> ~ <input type="text" value="${toDt}" name="end" id="toDt" class="input2" readonly>
                	<button class="search_calender" id="search_calender"></button>
            	</span>
            <button class="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>
        </li>
        <button class="btn_subPrimary btn_mapinfo" id ="btn_mapinfo" onclick='showMap()'><fmt:message key="MAP_INFO" bundle="${bundle}"/></button>

		</ul>
    <%-- <ul>
        <li>
			<input type="text" value="" name="" id="" class="input1" placeholder="영상이름">
            <span class="stl"><fmt:message key="PERIOD" bundle="${bundle}"/><span class="remark2"></span></span>
            <span class="date">
                <input type="text" value="${fromDt}" name="start" id="fromDt" class="input2" readonly> ~ <input type="text" value="${toDt}" name="end" id="toDt" class="input2" readonly>
                <button class="search_calender" id="search_calender"></button>
            </span>
            <button class="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>
        </li>
        <button class="btn_subPrimary btn_mapinfo" onclick='showMap()'>지도정보보기</button>
    </ul> --%>

    <ul class="contents">
        <li class="view">
            <table class="table">
                <colgroup>
                    <col style="width: 50px">
                    <col style="width: *">
                    <col style="width: 180px">
                    <col style="width: 100px">
                    <col style="width: 100px">
                    <col style="width: 100px">
                    <col style="width: 100px">
                    <col style="width: 100px">
                    <col style="width: 100px">
                    <col style="width: 100px">
                    <col style="width: 100px">
                    <col style="width: 100px">
                    <col style="width: 150px">
                </colgroup>
                <thead>
                    <tr>
						<!-- <th><input class="checkbox" type="checkbox" id="checked"><label for="checked"></label></th> -->
						<th></th>
						<th><fmt:message key="VIDEO_NAME" bundle="${bundle}"/></th>
						<th><fmt:message key="VIDEO_DATE" bundle="${bundle}"/></th>
						<th><fmt:message key="ANIMALS" bundle="${bundle}"/></th>
						<th><fmt:message key="PERSON" bundle="${bundle}"/></th>
						<th><fmt:message key="CONSTRUCTION_SIGNS" bundle="${bundle}"/></th>
						<th><fmt:message key="TRAFFIC_CONE" bundle="${bundle}"/></th>
						<th><fmt:message key="BOX" bundle="${bundle}"/></th>
						<th><fmt:message key="STONE" bundle="${bundle}"/></th>
						<th><fmt:message key="GARBAGE_BAG" bundle="${bundle}"/></th>
						<th><fmt:message key="MANHOLE" bundle="${bundle}"/></th>
						<th><fmt:message key="POTHOLE" bundle="${bundle}"/></th>
						<th><fmt:message key="FILLED_POTHOLE" bundle="${bundle}"/></th>
                    </tr>
                </thead>
            </table>
            <div class="tbody" style="overflow-y:scroll; height: 610px;">
                <table class="table" id="table-1">
                    <colgroup>
                        <col style="width: 50px">
						<col style="width: *">
						<col style="width: 180px">
						<col style="width: 100px">
						<col style="width: 100px">
						<col style="width: 100px">
						<col style="width: 100px">
						<col style="width: 100px">
						<col style="width: 100px">
						<col style="width: 100px">
						<col style="width: 100px">
						<col style="width: 100px">
						<col style="width: calc(150px - 14px)">
                    </colgroup>
					<tbody>
						<tr class="">
							<!-- <td><input class="checkbox" type="checkbox" id="check1"><label for="check1"></label></td> -->
							<td>
								<label class="checkbox">
									<input class="checkbox" type="checkbox" id="check1">
									<span class="icon"></span>
								</label>
							</td>
							<td>수정구로_20241113.dat</td>
							<td>2024-11-21</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
						</tr>
					</tbody>
                </table>
            </div>

        </li>
    </ul>

	<!-- 도로 장애물 탐지 상세정보 -->
	<div class="contents_box roadinfo roadDetetionInfo" id="mapDetetionInfo" style="display: none;">
		 <div class="btnAreaTop" style="display:none">
			<button class="btn_re-search" id ="btn_re-search" onclick='btnClick()'><fmt:message key="RESULT_IN_SEARCH" bundle="${bundle}"/></button>
			<button class="btn_bgPrimary btn_obstacleList" id ="btn_obstacleList" onclick='hideMap()'><fmt:message key="OBS_LIST_INFO" bundle="${bundle}"/></button>
		</div>
		<div class="contents mainMap">
			<div class="mapWrap">
				<!-- ******************************************************************************************************************* -->
				<!-- Level List 부분 start -->
				<!-- ******************************************************************************************************************* -->
				 <ul class="search_box level_list" style="min-width: 1170px; margin-top:0px; display: none;">
					<li>
						<span class="selectBox resp bottom" id="msgdivCd_span">
							<button class="label" id="level1" data-code="" data-lat="" data-lng="">Level1</button>
							<ul class="optionList" id="level1_ul"></ul>
						</span>
						<span class="selectBox resp bottom" id="msgdivCd_span">
							<button class="label" id="level2" data-code="" data-lat="" data-lng="">Level2</button>
							<ul class="optionList" id="level2_ul"></ul>
						</span>
						<span class="selectBox resp bottom" id="msgdivCd_span">
							<button class="label" id="level3" data-code="" data-lat="" data-lng="">Level3</button>
							<ul class="optionList" id="level3_ul"></ul>
						</span>
						<span class="search" style="display: none;">
							<input type="text" value="" name="deviceNm" id="deviceNm" class="input1" placeholder="디바이스명">
						</span>
						<span class="stl">
							<fmt:message key="PERIOD" bundle="${bundle}" />
								<span class="remark2"></span>
						</span>
						<span class="date">
							<input type="text" value="${fromDt}" name="start" id="fromDt2" class="input2" readonly>
							~ <input type="text" value="${toDt}" name="end" id="toDt2" class="input2"readonly>
							<button class="search_calender" id="search_calender"></button>
						</span>
						<button class="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>
					</li>
					<li>
						<button class="btn_re-search" onclick='btnClick()'><fmt:message key="RESULT_IN_SEARCH" bundle="${bundle}"/></button>
					</li>
				</ul>

				<!-- 결과내재검색패널 -->
				<div class="re-search-container" id="re-search-container" style="display: none; width: calc(100% - 400px);">
					<button type="button" id="btn_re-searchWrap" class="btn_re-searchWrap" onclick='btnClick()'></button>
					<div class="group">
						<dl class="">
							<dt><fmt:message key="DETECTED_OBJ" bundle="${bundle}"/></dt>
							<dd>
								<div class="selectOpt">
								<c:forEach var="obslist" items="${codeListOb}" varStatus="status">
									<input type="checkbox" id="${obslist.etc1}" class="obslist" name="obslist" value="${obslist.etc1}" checked><label for="${obslist.etc1}">
									<c:choose>
										<c:when test="${nowCdNa eq 'KR'}">${obslist.cdNm}</c:when>
										<c:when test="${nowCdNa eq 'US'}">${obslist.cdNmEng}</c:when>
										<c:when test="${nowCdNa eq 'JP'}">${obslist.cdNmJp}</c:when>
									</c:choose>

									</label>
								</c:forEach>
								<!--
									<input type="checkbox" id="allCheck" class="" name="" value=""><label for="allCheck">전체</label>
									<input type="checkbox" id="object1" class="" name="" value="" checked><label for="object1">동물</label>
									<input type="checkbox" id="object2" class="" name="" value=""><label for="object2">보행자</label>
									<input type="checkbox" id="object3" class="" name="" value=""><label for="object3">공사표지판</label>
									<input type="checkbox" id="object4" class="" name="" value=""><label for="object4">라바콘</label>
									<input type="checkbox" id="object5" class="" name="" value="" checked><label for="object5">상자</label>
									<input type="checkbox" id="object6" class="" name="" value="" checked><label for="object6">낙석</label>
									<input type="checkbox" id="object7" class="" name="" value=""><label for="object7">쓰레기</label>
									<input type="checkbox" id="object8" class="" name="" value=""><label for="object8">맨홀</label>
									<input type="checkbox" id="object9" class="" name="" value=""><label for="object9">포트홀</label>
									<input type="checkbox" id="object10" class="" name="" value=""><label for="object10">보수된포트홀</label> -->
							</div>
							</dd>
						</dl>
						<div class="submitarea">
							<input type="checkbox" id="renew">
							<button class="btn_iconTXT btn_r btn_m btn_resetOpt" onclick="optionReset()"><fmt:message key="RESET_SELECT" bundle="${bundle}"/></button>
						</div>
					</div>
				</div>
			<!-- ******************************************************************************************************************* -->
			<!-- Level List 부분 end -->
			<!-- ******************************************************************************************************************* -->

			<!-- <div class="MapArea" style="height: 100%;"> -->

			<div class="MapArea">
				<div class="item map_box">
					<div class="map" id="map" style="height: 100%;"></div>
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
		<div class="infoWrap on">
			<!-- <button id="btn_re-search_move" class="btn_re-search" onclick='btnClick()'><fmt:message key="RESULT_IN_SEARCH" bundle="${bundle}"/></button> -->
			<button type="button" class="btn_infoWrap"></button>
				<!-- 상세설명 -->
				<div class="infoDetailWrap" style="display:none;">
					<div class="infoTitle">
						<button type="button" class="btn_back" id="btn_Back"></button>
						<h2 id="detail_title">수정구로_20241113.dat</h2>
					</div>
					<div class="infoContents">
						<p class="infoPhoto">
							<img id="detail_img" src="/img/sample_highway02.jpg" alt="대표이미지" onclick="originalimg()">
							<span class="noPhoto" style="display: none;">
								<span class="material-symbols-outlined">no_photography</span>
							</span>
						</p>
						<div class="infoDetail">
							<div class="itemvalue roadDeteil">
								<span><fmt:message key="ANIMALS" bundle="${bundle}"/><em id="animalsCnt">0</em></span>
								<span><fmt:message key="PERSON" bundle="${bundle}"/><em id="personCnt">0</em></span>
								<span><fmt:message key="CONSTRUCTION_SIGNS" bundle="${bundle}"/><em id="constructionSignsCnt">0</em></span>
								<span><fmt:message key="TRAFFIC_CONE" bundle="${bundle}"/><em id="trafficConeCnt">0</em></span>
								<span><fmt:message key="BOX" bundle="${bundle}"/><em id="boxCnt">0</em></span>
								<span><fmt:message key="STONE" bundle="${bundle}"/><em id="stoneCnt">0</em></span>
								<span><fmt:message key="GARBAGE_BAG" bundle="${bundle}"/><em id="garbageBagCnt">0</em></span>
								<span><fmt:message key="MANHOLE" bundle="${bundle}"/><em id="manholeCnt">0</em></span>
								<span><fmt:message key="POTHOLE" bundle="${bundle}"/><em id="potholeCnt">0</em></span>
								<span><fmt:message key="FILLED_POTHOLE" bundle="${bundle}"/><em id="filledPotholeCnt">0</em></span>
							</div>
							<dl class="">
								<dt><fmt:message key="DEVICE_NAME" bundle="${bundle}"/></dt>
								<dd id="detail_device_name">SOT1000</dd>
								<dt><fmt:message key="DEVICE_ID" bundle="${bundle}"/></dt>
								<dd id="detail_device_id">KR0001</dd>
								<dt><fmt:message key="COORDINATES" bundle="${bundle}"/></dt>
								<dd id="detail_latlng">위도 37.412396 / 경도 127.133415</dd>
								<dt><fmt:message key="ROAD_NAME" bundle="${bundle}"/></dt>
								<dd id="detail_route_name">매화로47번길</dd>
								<dt><fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/></dt>
								<dd id="detail_stime">2024.11.22 11:08</dd>
							</dl>
						</div>
					</div>
					<div class="btnWrap">
						<div class="btnArea">
							<button type="button" class="btn_iconTXT" id="btn_Back"><span class="material-symbols-outlined">list</span> <fmt:message key="TO_LIST" bundle="${bundle}"/></button>
						</div>
					</div>
				</div>
				<!-- e:상세설명 -->

				<!-- 검색목록 -->
				<div class="infoListWrap" style="overflow-y:auto; display: block;">
					<div class="infoListTop">
						<h2 class="hidden">검색목록</h2>
						<span class="fileName"><fmt:message key="FILE_NAME" bundle="${bundle}"/> : <em>수정구로_20241113.dat</em></span>
						<p class="itemCount">총 <em>0건</em></p>
					</div>

					<ul class="infoList">
						<li>
							<a class="infoListItem">
								<div class="info">
									<ul class="infoContents">
										<li> 도로명 : 매화로47번길</li>
										<li> 촬영일시 : 2024.11.22 11:08</li>
										<li> 탐지객체수  : 5개</li>
									</ul>
								</div>
								<div class="infoThumnail">
									<img src="http://datahub-dev.zieumtn.com/gis/pothole/20240906024925-MH2DY2300001/thumbnail" alt="대표이미지" onclick="originalimg('20240906024925-MH2DY2300001')">
								</div>
							</a>
						</li>
						<li>
							<a class="infoListItem">
								<div class="info">
									<ul class="infoContents">
										<li> 도로명 : 매화로47번길</li>
										<li> 촬영일시 : 2024.11.22 11:08</li>
										<li> 탐지객체수  : 5개</li>
									</ul>
								</div>
								<div class="infoThumnail">
									<img src="http://datahub-dev.zieumtn.com/gis/pothole/20240906024925-MH2DY2300001/thumbnail" alt="대표이미지" onclick="originalimg('20240906024925-MH2DY2300001')">
								</div>
							</a>
						</li>
						<li>
							<a class="infoListItem">
								<div class="info">
									<ul class="infoContents">
										<li> 도로명 : 매화로47번길</li>
										<li> 촬영일시 : 2024.11.22 11:08</li>
										<li> 탐지객체수  : 5개</li>
									</ul>
								</div>
								<div class="infoThumnail">
									<img src="http://datahub-dev.zieumtn.com/gis/pothole/20240906024925-MH2DY2300001/thumbnail" alt="대표이미지" onclick="originalimg('20240906024925-MH2DY2300001')">
								</div>
							</a>
						</li>
					</ul>
				</div>
				<!-- e:검색목록 -->
				<!-- 검색목록 nodata-->
				<div class="infoListWrapNoData" style="display: none;">
					<h2 class="hidden">검색목록</h2>
					<div class="nodata">
						<span class="material-symbols-outlined">warning</span>
							<fmt:message key="NO_SEARCH_DATA" bundle="${bundle}"/>
							<!--  검색된 데이터가 없습니다. -->
					</div>
				</div>
				<!-- e:검색목록 nodata -->

			</div>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script language="javascript">

var requiredMsg = '<fmt:message key="CONTENTS_REQUIRED" bundle="${bundle}"/>';

var selectedId = '';
var selectedVideoName ='';
var allData = [];
var infoList = [];
var markers = [];
var markerList = [];

var popup = L.popup({autoPan:false});

var lorem = document.querySelector(".infoList");

var baseLat = '${authInfo.wtX}';
var baseLng = '${authInfo.wtY}';

var map = L.map('map').setView({lat:baseLat, lng:baseLng}, 12);

L.control.scale({
	imperial: true, metric: true
}).addTo(map);

L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
	minZoom: '${authInfo.mapMinSize}',
	maxZoom: '${authInfo.mapMaxSize}',
	attribution: '© OpenStreetMap',
	stylers:[{visibility:'off'}]
}).addTo(map);

map.on('click', onMapClick);

map.on('zoomend', function() {
	if ($(".infoListWrap").css("display") == "none" && $(".infoDetailWrap").css("display") == "none") {
		$(".btn_infoWrap").click();
	} else if ($(".infoListWrap").css("display") == "none" && $(".infoDetailWrap").css("display") == "block") {
		$('.infoDetailWrap').css('display', 'none');
		$('.infoListWrap').css('display', 'block');
	}

    markerIconCheck();

	map.closePopup();
});

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


var deviceKeyValue = [];

<c:forEach var="deList" items="${deviceList}" varStatus="status">
	deviceKeyValue.push({'macAddr':'${deList.macAddr}', 'deviceId':'${deList.deviceId}', 'deviceNm':'${deList.deviceNm}', 'useYn':'${deList.useYn}'})
		var mac = '${deList.macAddr}';
		/* if (mac.length > 0 && mac != "" && '${deList.useYn}' == '사용'){
			deviceIdList.push(mac);
		}
 		*/
</c:forEach>

//결과내재검색패널
function btnClick() {
  const searchOpt = document.getElementById('re-search-container');

  if (searchOpt.style.display === 'none') {
    searchOpt.style.display = 'block';
  } else {
    searchOpt.style.display = 'none';
  }

}

$("input:checkbox[name='obslist']").on('click', function() {

	var checkboxName = $(this).attr('name');
	//var checkboxLength = $('input:checkbox[name="' + checkboxName + '"]').length;
	var checkedCount = $('input[name="' + checkboxName + '"]:checked').length;

	if (checkedCount == 0) {
		$("#alert_msg").html(requiredMsg);
		$("#pop_alert").stop().fadeIn(300);
		return false;
    }
})

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

function getList(){

 var vname = $('#inputVideoName').val();
	var params = {
			'videoName': $('#inputVideoName').val()
			,'from': $('#fromDt').val().replaceAll('-','')
			,'to': $('#toDt').val().replaceAll('-','')
			,'coId': "${authInfo.coId}"
	};

	$.ajax({
		type : "GET",
		//url : "http://localhost:8080/obs/video/list",
		url : "${authInfo.restApiUrl}/obs/video/list",
		async : false,
		data : params ,
		headers : {
			'Authorization' : 'Bearer '
					+ localStorage.getItem("accessToken"),
			'Refresh-Token' : localStorage
					.getItem("Refresh-Token")
		},
		beforeSend : function() {
			$('#circularG').css('display', 'block')
		},
		complete : function() {
			$('#circularG').css('display', 'none')

		},
		error : function(err){
			$('#circularG').css('display', 'none')
			console.log(err);
		},
		success : function(resp) {
			$('#table-1 tbody tr').remove();

			var result = resp.data;

 			var appendRow = "";

 			result.forEach (function (el, index) {

 				var startDate = dateFormat(new Date(el.videoStartTime), 'select').replaceAll('-', '.');

				appendRow += '<tr>'
					+'<td><label class="checkbox"><input class="checkbox" type="checkbox" id="'+ el.id +'" name ="videolist"><span class="icon"></span></label></td>'
					+'<td align="center" class="listtd">'+el.videoName+'</td>'
					//+'<td align="center" class="listtd">'+el.videoStartTime+'</td>'
					+'<td align="center" class="listtd">'+ startDate +'</td>'
					+'<td align="center" class="listtd">'+el.obstacleVideo.videoAnimalsCnt+'</td>'
					+'<td align="center" class="listtd">'+el.obstacleVideo.videoPersonCnt+'</td>'
					+'<td align="center" class="listtd">'+el.obstacleVideo.videoConstructionSignsCnt+'</td>'
					+'<td align="center" class="listtd">'+el.obstacleVideo.videoTrafficConeCnt+'</td>'
					+'<td align="center" class="listtd">'+el.obstacleVideo.videoBoxCnt+'</td>'
					+'<td align="center" class="listtd">'+el.obstacleVideo.videoStoneCnt+'</td>'
					+'<td align="center" class="listtd">'+el.obstacleVideo.videoGarbageBagCnt+'</td>'
					+'<td align="center" class="listtd">'+el.obstacleVideo.videoManholeCnt+'</td>'
					+'<td align="center" class="listtd">'+el.obstacleVideo.videoPotholeCnt+'</td>'
					+'<td align="center" class="listtd">'+el.obstacleVideo.videoFilledPotholeCnt+'</td>'
					+'</tr>'
			});

			$('#table-1 > tbody').append(appendRow);

			// 체크박스 상태 초기화
            $("input:checkbox[name='videolist']").prop('checked', false);

            // 체크박스 클릭 이벤트 설정
            $("input:checkbox[name='videolist']").on('click', function() {
                var checkboxName = $(this).attr('name');
                var checkedCount = $('input[name="' + checkboxName + '"]:checked').length;

                selectedId = $(this).attr('id');  // 선택된 체크박스의 ID

                // 선택된 체크박스와 동일한 ID를 가진 tr 행을 찾기
                var selectedRow = $('#table-1 tbody tr').filter(function() {
                    return $(this).find('input:checkbox').attr('id') == selectedId;
                });

                // 선택된 행에서 비디오 이름을 추출
                if (selectedRow.length > 0) {
                    selectedVideoName = selectedRow.find('td').eq(1).text();
                }

                // 체크된 개수가 1보다 크면, 모든 체크박스를 해제하고 클릭된 체크박스만 체크되게 설정
                if (checkedCount > 1) {
                    $('input[name="' + checkboxName + '"]').prop('checked', false);  // 모든 체크박스 해제
                    $(this).prop('checked', true);  // 클릭된 체크박스만 선택
                }
            });


			$('#table-1 > tbody > tr').on('click', function(){
				$(this).parent().children().removeClass('on');
				$(this).addClass('on');
			});

		}
	});

}

function mapClosePopup() {
	map.closePopup();
}

function getVideoImageList(){

	infoList = [];

	if ($(".infoListWrap").css("display") == "none" && $(".infoDetailWrap").css("display") == "none") {
		$(".btn_infoWrap").click();
	}

	map.eachLayer(function (layer) {
	    if (!(layer instanceof L.TileLayer)) {
	        map.removeLayer(layer);
	    }
	});

	var videoIds = []; // 추후 다중 선택을 위해 숫자형 배열로 전달
	videoIds.push(selectedId);

    var params = {
        'videoIds': videoIds.join(',')  // 배열을 쉼표로 구분하여 문자열로 변환
    };

	$.ajax({
		type : "GET",
		//url : "http://localhost:8080/obs/image/list",
		url : "${authInfo.restApiUrl}/obs/image/list",
		async : false,
		data : params ,
		headers : {
			'Authorization' : 'Bearer '
					+ localStorage.getItem("accessToken"),
			'Refresh-Token' : localStorage
					.getItem("Refresh-Token")
		},
		beforeSend : function() {
			$('#circularG').css('display', 'block')
		},
		complete : function() {
			$('#circularG').css('display', 'none')

		},
		error : function(err){
			$('#circularG').css('display', 'none')
			console.log(err);
		},
		success : function(resp) {
			allData = resp.data;
			reSearch();

		}
	});

}

function reSearch() {

	infoList = [];
	markers = [];
	markerList = [];

	if ($(".infoListWrap").css("display") == "none" && $(".infoDetailWrap").css("display") == "none") {
		$(".btn_infoWrap").click();
	} else if ($(".infoListWrap").css("display") == "none" && $(".infoDetailWrap").css("display") == "block") {
		$('.infoDetailWrap').css('display', 'none');
		$('.infoListWrap').css('display', 'block');
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

	map.eachLayer(function(layer) {
		if ((layer instanceof L.Marker) || (layer instanceof L.MarkerCluster) || (layer instanceof L.MarkerClusterGroup)) {
			map.removeLayer(layer);
		};
	});

	mapClosePopup();

	$('.infoDetailWrap').css('display', 'none');
	$('.infoListWrap').css('display', 'block');

	$('.infoListTop .fileName em').remove();
	$('.infoList li').remove();
	$('.infoListTop .fileName').append('<em>' + selectedVideoName + '</em>');

	/* 재검색 패널 */
	var obsChk = $("input[name='obslist']:checked");

	for (var i = 0; i < allData.length; i++) {

	    for (var j = 0; j < obsChk.length; j++) {
	        var check = obsChk[j].value;

	        for (var key in allData[i].obstacleImage) {
	            if (allData[i].obstacleImage.hasOwnProperty(key)) {
	                // 속성 이름이 체크박스 값과 일치하고 값이 0 이상인 경우
	                if (key === check && allData[i].obstacleImage[key] > 0) {
	                    // markerList에 i가 이미 존재하지 않으면 추가
	                    if (!markerList.includes(i)) {
	                        markerList.push(i);
	                    }
	                    break;
	                }
	            }
	        }
	    }
	}

	for (var i = 0; i < allData.length; i++) {
		for (var x = 0 ; x < markerList.length ; x++ ) {

   			if (markerList[x] == i) {
   				var item = allData[i];
   				var id = item.id;

				//sortDataList.push(item); 정렬

				var macAddr = item['deviceId'];
				var deviceId = "";
				var deviceNm = "";

				for ( var s = 0; s < deviceKeyValue.length; s++ ) {
					if (deviceKeyValue[s].macAddr == macAddr){
						deviceId = deviceKeyValue[s].deviceId;
						deviceNm = deviceKeyValue[s].deviceNm;

					}
				}

				var addrPoLocality = ( item.wayName == null || item.wayName == '') ? "<fmt:message key="ROAD_INFO_NOT_EXISTS" bundle="${bundle}"/>" : item.wayName;

				var t1 = L.marker([item.latitude, item.longitude], {
					id : item['id'],
					lat : item['latitude'],
					lng : item['longitude'],
					stime : dateFormat(new Date(item.systemTime), 'list'),
					deviceId : deviceId,
					deviceName : deviceNm,
					addrName : addrPoLocality,
				 	animals : item.obstacleImage['imageAnimalsCnt'],
					person : item.obstacleImage['imagePersonCnt'],
					garbageBag : item.obstacleImage['imageGarbageBagCnt'],
					constructionSign : item.obstacleImage['imageConstructionSignsCnt'],
					trafficCone : item.obstacleImage['imageTrafficConeCnt'],
					box : item.obstacleImage['imageBoxCnt'],
					stone : item.obstacleImage['imageStoneCnt'],
					pothole : item.obstacleImage['imagePotholeCnt'],
					filledPothole : item.obstacleImage['imageFilledPotholeCnt'],
					manhole : item.obstacleImage['imageManholeCnt'],
					icon : blueIcon,
				}).on('click', onMarkerClick);

				markerCluster.addLayer(t1);
				markers.push(t1);

				var sum = 0;
				var totalObjects = Object.values(item.obstacleImage).reduce((sum, i) => sum + i, 0);

				infoList.push("<li><a class='infoListItem'>"
					+ "<div class='info'>"
					+ "<ul class='infoContents'>"
					+ "<li style='cursor: pointer;' onClick=\"detail('" + id + "', 'N')\"> <fmt:message key='ROAD_NAME' bundle='${bundle}'/> : " + addrPoLocality + "</li>"
					+ "<li> <fmt:message key='PHOTO_DATETIME' bundle='${bundle}'/> : " + dateFormat(new Date(item.systemTime), 'list') + "</li>"
					+ "<li> <fmt:message key='DETECTED_OBJ_CNT' bundle='${bundle}'/> : " +totalObjects +"</li>"
					+ "</ul>"
					+ "</div>"
					+ "<div class='infoThumnail'>"
					+ "<img src='${authInfo.restApiUrl}/obs/" + id + "/thumbnail' alt='대표이미지' onclick=\"originalimg('" + id + "')\">"   // 배포시 ajax
					//+ "<img src='http://localhost:8080/obs/" + id + "/thumbnail' alt='대표이미지' onclick=\"originalimg('" + id + "')\">"
					+ "</div>"
					+ "</li>"
				);

  			}
		}
	}

	// 마커 클러스터 그룹에 클릭 이벤트 추가
	markerCluster.on('clusterclick', function(event) {
		var cluster = event.layer;
		var childMarkers = cluster.getAllChildMarkers();

		markerIconCheck();
		onMapClick(map);

		// 팝업 내용 생성
		var popupContent = '<b>Cluster contains ' + childMarkers.length + ' markers:</b><br>';

		childMarkers.forEach(function(marker, index) {
			var item = marker.options;

			popupContent += "Marker " + (index + 1) + " : "
							+ "<b id='" + marker.options.id + "'" //+ mouseoverTxt + mouseoutTxt
							+ "class='txtColor' onClick=\"detail('" + item.id + "', 'Y')\">"
							+ marker.getLatLng().toString()
							+ "</b><br>";

		});

		var popupLatLng = cluster.getLatLng();

		popup = L.popup({autoPan:false}).setLatLng(popupLatLng).setContent(popupContent).openOn(map);

	});

	map.addLayer(markerCluster);

	for (var i = 0; i < infoList.length; i++) {
		if ( i < 10 ) {
			$(".infoList").append(infoList[i])
		}
	}

	$(".infoList").scrollTop = 0;

	if ($('.infoListItem').length < 1 && $(".infoWrap").hasClass("on")) {
		$('.infoListWrapNoData').css('display', 'block')
	} else {
		$('.infoListWrapNoData').css('display', 'none');
	}

	$(".infoListWrap p").text("<fmt:message key="TOTAL" bundle="${bundle}"/> "+ infoList.length + " <fmt:message key="COUNT2" bundle="${bundle}"/>");

	/* if ($('#sort').data('code') == 'asc') {
		$('#sortchk .sorting').click();
	} */

}

function markerIconCheck() {

	markerCluster.eachLayer(function(layer) {
		if (layer.options.iconChanged) {
			layer.setIcon(blueIcon);
			layer.options.iconChanged = false;
		}
	});
}

function onMapClick(e) {

	markerIconCheck();

	const searchOpt = document.getElementById('re-search-container');

	if(searchOpt.style.display === 'block') {
		searchOpt.style.display = 'none';
	};

	$("#info").hide();

	if (!$('.btn_infoWrap').hasClass('off')) {
		$(".btn_infoWrap").click();
	}

	if ( $('.infoDetailWrap').css('display') == 'block' ) {
		$('.infoDetailWrap').css('display', 'none');
		$('.infoListWrap').css('display', 'block');
	}
}

function onMarkerClick(e) {
	markerIconCheck();
	this.setIcon(redIcon);

    detail(e.target.options.id, 'N');
}

function detail(id, clusterChk){

	var deviceNm, deviceId, addrPoLocality, lat, lng, dateFormat;
	var imageAnimalsCnt, imagePersonCnt, imageGarbageBagCnt, imageConstructionSignsCnt, imageTrafficConeCnt, imageBoxCnt, imageStoneCnt, imagePotholeCnt, imageFilledPotholeCnt, imageManholeCnt;

 	markerIconCheck();

 	markerCluster.eachLayer(function(layer) {
		if (layer.options.id == id) {

			layer.setIcon(redIcon);
			layer.options.iconChanged = true;

			deviceNm = layer.options.deviceName;
			deviceId = layer.options.deviceId;
			addrPoLocality = layer.options.addrName;
			dateFormat = layer.options.stime;
			lat = layer.options.lat;
			lng = layer.options.lng;

			imageAnimalsCnt = layer.options.animals;
			imagePersonCnt = layer.options.person;
			imageGarbageBagCnt = layer.options.garbageBag;
			imageConstructionSignsCnt = layer.options.constructionSign;
			imageTrafficConeCnt = layer.options.trafficCone;
			imageBoxCnt = layer.options.box;
			imageStoneCnt = layer.options.stone;
			imagePotholeCnt = layer.options.pothole;
			imageFilledPotholeCnt = layer.options.filledPothole;
			imageManholeCnt = layer.options.manhole;
		}
	});

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


	if ( $('.menu_bar_close').css('display') == 'block' ) {
    	$('.re-search-container').css('width', 'calc(100% - 400px)');
    	$('.btn_infoWrap').removeClass("off");
    	$('.btn_infoWrap').addClass("on");

	} else if ( $('.menu_bar_close').css('display') == 'none' ) {
    	$('.re-search-container').css('width', 'calc(100% - 400px)');
	}

	$('.btn_infoWrap').removeClass("off");

	$(".infoWrap").addClass("on");
 	$(".infoListWrap p").css('display', 'block');

 	$("#info").hide();
	$('.infoListWrap').css('display', 'none');
	$('.infoDetailWrap').css('display', 'block');

	///// item contents
	//$("#detail_img").attr("src", "http://localhost:8080/obs/"  + id + "/thumbnail");
	$("#detail_img").attr("src", "${authInfo.restApiUrl}/obs/"  + id + "/thumbnail");  //개발 배포 ajax

	$("#detail_img").removeAttr("onClick");
	$("#detail_img").attr("onclick", "originalimg('" + id + "')");

	$("#animalsCnt").text(imageAnimalsCnt);
	$("#personCnt").text(imagePersonCnt);
	$("#constructionSignsCnt").text(imageConstructionSignsCnt);
	$("#trafficConeCnt").text(imageTrafficConeCnt);

	$("#boxCnt").text(imageBoxCnt);
	$("#stoneCnt").text(imageStoneCnt);
	$("#garbageBagCnt").text(imageGarbageBagCnt);
	$("#manholeCnt").text(imageManholeCnt);
	$("#potholeCnt").text(imagePotholeCnt);
	$("#filledPotholeCnt").text(imageFilledPotholeCnt);

	// detail영역
	$("#detail_title").text(selectedVideoName);
	// 디바이스 name
	$("#detail_device_name").text(deviceNm);
	// 디바이스 ID
	$("#detail_device_id").text(deviceId);
	// 좌표
	$("#detail_latlng").text("<fmt:message key="LATITUDE" bundle="${bundle}"/> " + lat + " / <fmt:message key="LONGITUDE" bundle="${bundle}"/> " + lng);

	// 도로명
	$("#detail_route_name").text(addrPoLocality);

	// 촬영일시
	$("#detail_stime").text(dateFormat);

}

$('.infoList').on('scroll', function(){

	var scrol_position = document.querySelector('.infoList').scrollTop;
	var scrol_height = document.querySelector('.infoList').scrollHeight;
	var scrol_h = document.querySelector('.infoList').clientHeight;

	if (scrol_position + scrol_h > scrol_height - 10) {

		var startNum = $('.infoListItem').length;

		for (var i = startNum; i < infoList.length; i++) {
			if (i == (startNum + 10)) {
				break;
			}else {
				$(".infoList").append(infoList[i]);
			}
		}
	}
});

//좌측 메뉴바 동작
$(".menu_bar_close").click(function(){

	setTimeout(() => map.invalidateSize(), 550);

});

function originalimg(id) {

	var popupimg = document.getElementById("pop_wrap");

	var modalImg = document.getElementById("pop_img");

	$('#pop_riskPopImg').css('display', 'block')

	$("#pop_img").attr("src", "${authInfo.restApiUrl}/obs/" + id + "/image");   // 배포시 ajax
	//$("#pop_img").attr("src", "http://localhost:8080/obs/" + id + "/image");
}


$(".btn_iconTXT, #btn_Back").click(function(){
	map.closePopup();
	markerIconCheck();

	$('.infoDetailWrap').css('display', 'none');
	$('.infoListWrap').css('display', 'block');

});

//우측 패널 펼치기
$(".btn_infoWrap").click(function(){

    if($(".infoWrap").hasClass("on")){
    	// 접음
        $('.infoWrap').removeClass('on');
        $('.infoWrap').addClass('off');
    	$('.infoDetailWrap').css('display', 'none');
    	$('.infoListWrap').css('display', 'none');
    	$(".infoListWrap p").css('display', 'hidden');
    	$('.infoListWrapNoData').css('display', 'none');

		if ( $('.menu_bar_close').css('display') == 'block' ) {
        	$('.re-search-container').css('width', 'calc(100% - 40px)');
		} else if ( $('.menu_bar_close').css('display') == 'none' ) {
        	$('.re-search-container').css('width', 'calc(100% - 40px)');
		}

        $('.btn_infoWrap').addClass("off");

        map.closePopup();
    	markerIconCheck();
    } else{

 		if ( $('.menu_bar_close').css('display') == 'block' ) {
        	$('.re-search-container').css('width', 'calc(100% - 400px)');
		} else if ( $('.menu_bar_close').css('display') == 'none' ) {
        	$('.re-search-container').css('width', 'calc(100% - 400px)');
		}

        $('.btn_infoWrap').removeClass("off");

        // 펼침
        $('.infoWrap').addClass('on');
        $('.infoListWrap').css('display', 'block');
    	if($('.infoListItem').length < 1) {
    		$('.infoListWrapNoData').css('display', 'block')
    	}

    	lorem.scrollTop = 0;
    }

});


$(document).ready(function () {

   // 날짜 설정 오늘날짜로부터 1주일 (임시10.1)
   var date1  = new Date();

    $('#toDt').val(dateFormat(date1, 'select'))
    $('#fromDt').val(getThreeMonthAgo())

 	getList();

/* 	//체크박스 컨트롤
    $("input:checkbox[name='videolist']").on('click', function() {
        var checkboxName = $(this).attr('name');
        var checkedCount = $('input[name="' + checkboxName + '"]:checked').length;

        selectedId = $(this).attr('id');  // 선택된 체크박스의 ID

		 // 선택된 체크박스와 동일한 ID를 가진 tr 행을 찾기
		 var selectedRow = $('#table-1 tbody tr').filter(function() {
		     return $(this).find('input:checkbox').attr('id') == selectedId;
		 });

		 // 선택된 행에서 비디오 이름을 추출
		 if (selectedRow.length > 0) {
		     selectedVideoName = selectedRow.find('td').eq(1).text();
		 }

		 // 체크된 개수가 1보다 크면, 모든 체크박스를 해제하고 클릭된 체크박스만 체크되게 설정
		 if (checkedCount > 1) {
		     $('input[name="' + checkboxName + '"]').prop('checked', false);
		     $(this).prop('checked', true);
		 }
    }); */

})

///////////////////// 날짜관련
function dateFormat(date, format){

   if (format == 'list'){
      // 2023.01.01 14:03:01
      var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 );
      var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate();
      var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours();
      var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes();
      //var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds();

      dateString  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min

   } else if (format == 'select'){

      // 2023-01-02
      var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 )
      var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate()

      dateString  = date.getFullYear() + '-' + month + '-' + day
   }

   return dateString;
}

function getThreeMonthAgo(){

	var today = new Date();

	today.setDate(today.getDate() + 1);
	today.setMonth(today.getMonth() - 3);

	var fromDate = dateFormat(today, 'select');
	return fromDate;

}

function showMap() {
	var checkedCount = $('input[name="videolist"]:checked').length;

	if (checkedCount == 0) {
		$("#alert_msg").html("<fmt:message key="VIDEO_SELECT_REQUIRED" bundle="${bundle}"/>");
		$("#pop_alert").stop().fadeIn(300);
		return false;
	}

    $('#mapDetetionInfo').css('display', 'block');
	$('.btnAreaTop').css('display', 'block');

	$('#btn_mapinfo').css('display', 'none');

	getVideoImageList();

	map.invalidateSize();

	//mapInfo(map);
}

function hideMap() {
	$('#mapDetetionInfo').css('display', 'none');
	$('.btnAreaTop').css('display', 'none');
	$('#btn_mapinfo').css('display', 'block');

	//결과 내 재검색 선택초기화
	$("input[name='obslist']").each(function() {
		$(this).prop('checked', true);
	});

	const searchOpt = document.getElementById('re-search-container');
	searchOpt.style.display = 'none';
}

//선택초기화 버튼 이벤트 ( 결과 내 재검색 옵션 )
function optionReset() {

	$("input[name='obslist']").each(function() {
		$(this).prop('checked', true);
	});

	reSearch();
}

$(".obslist").change(function(){
    reSearch();
});


</script>
<%@ page language="java"	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
	<fmt:setBundle basename="${bundleName}" var="bundle" />
<c:set var="nowCdNa" value="${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}"/>

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

<div class="contents_box item mainpage roadinfo">
	<p class="title ${fav}">${pageName.srnNm}</p>
    <div class="contents mainMap">
        <div class="mapWrap">
			<!-- ******************************************************************************************************************* -->
			<!-- Level List 부분 start -->
			<!-- ******************************************************************************************************************* -->
			<ul class="search_box level_list" style="min-width: 1170px; margin-top:0px;">
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
						<input type="text" value="${fromDt}" name="start" id="fromDt" class="input2" readonly>
						~ <input type="text" value="${toDt}" name="end" id="toDt" class="input2"readonly>
						<button class="search_calender" id="search_calender"></button>
					</span>
					<button class="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>
				</li>
				<%-- <li>
					<button class="btn_re-search" onclick='btnClick()'><fmt:message key="RESULT_IN_SEARCH" bundle="${bundle}"/></button>
				</li> --%>
			</ul>
			<!-- 결과내재검색패널 -->
			<div class="re-search-container" id="re-search-container" style="display: none; width: calc(100% - 400px);">
                <button type="button" id="btn_re-searchWrap" class="btn_re-searchWrap" onclick='btnClick()'></button>

				<div class="group">
					<dl class="">
						<dt><fmt:message key="RISK_LEVEL" bundle="${bundle}"/></dt>
						<dd>
							<div class="selectOpt">
								<c:forEach var="risklist" items="${codeListLv}" varStatus="status">
									<input type="checkbox" id="${risklist.etc2}" class="risklist" name="risklist" value="${risklist.etc3}" checked><label for="${risklist.etc2}">
									<c:choose>
										<c:when test="${nowCdNa eq 'KR'}">${risklist.cdNm}</c:when>
										<c:when test="${nowCdNa eq 'US'}">${risklist.cdNmEng}</c:when>
										<c:when test="${nowCdNa eq 'JP'}">${risklist.cdNmJp}</c:when>
									</c:choose>

									</label>
								</c:forEach>
						</div>
						</dd>
					</dl>
				</div>
				<div class="group">
					<dl class="">
						<dt><fmt:message key="TYPE" bundle="${bundle}"/></dt>
						<dd>
							<div class="selectOpt">
								<c:forEach var="cracklist" items="${codeListDv}" varStatus="status">
									<input type="checkbox" id="${cracklist.etc1}" class="crack" name="crack" value="${cracklist.etc2}" checked><label for="${cracklist.etc1}">
									<c:choose>
										<c:when test="${nowCdNa eq 'KR'}">${cracklist.cdNm}</c:when>
										<c:when test="${nowCdNa eq 'US'}">${cracklist.cdNmEng}</c:when>
										<c:when test="${nowCdNa eq 'JP'}">${cracklist.cdNmJp}</c:when>
									</c:choose>

									</label>
								</c:forEach>
							</div>
						</dd>
					</dl>
				</div>
				<div class="group">
					<dl class="">
						<dt><fmt:message key="STATUS" bundle="${bundle}"/></dt>
						<dd>
							<div class="selectOpt">
								<c:forEach var="statuslist" items="${codeListSd}" varStatus="status">
									<input type="checkbox" id="${statuslist.cdId}" class="statusstat" name="statusstat" value="${statuslist.comCd}" checked><label for="${statuslist.cdId}">
										<c:choose>
											<c:when test="${nowCdNa eq 'KR'}">${statuslist.cdNm}</c:when>
											<c:when test="${nowCdNa eq 'US'}">${statuslist.cdNmEng}</c:when>
											<c:when test="${nowCdNa eq 'JP'}">${statuslist.cdNmJp}</c:when>
										</c:choose>
									</label>
								</c:forEach>
								<input type="checkbox" id="ETC" class="statusstat" name="statusstat" value="ETC" checked><label for="ETC"><fmt:message key="UNCLASSIFIED" bundle="${bundle}" /></label>
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

		<div class="MapArea">
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
	<div class="infoWrap on">
		<button id="btn_re-search_move" class="btn_re-search" onclick='btnClick()'><fmt:message key="RESULT_IN_SEARCH" bundle="${bundle}"/></button>
		<button type="button" class="btn_infoWrap"></button>
            <!-- 상세설명 -->
            <div class="infoDetailWrap" style="display: none;">
                <div class="infoTitle">
                    <button type="button" class="btn_back" id="btn_Back"></button>
                    <h2 id="detail_title"></h2>
                </div>
                <div class="infoContents">
                    <p class="infoPhoto">
	                    <img id="detail_img" src="/img/sample_highway02.jpg" alt="대표이미지" onclick="originalimg()">
	                    <span class="noPhoto" style="display: none;">
		                    <span class="material-symbols-outlined">no_photography</span>
						</span>
					</p>
                    <div class="infoDetail">
                        <div class="level">
                            <span id="riskLv"></span>
                        </div>
                        <div class="itemvalue">
                            <span><em id="CntPothole"></em><fmt:message key="포트홀" bundle="${bundle}"/></span>
                            <span><em id="CntVertical"></em><fmt:message key="수직균열" bundle="${bundle}"/></span>
                            <span><em id="CntHorizontal"></em><fmt:message key="수평균열" bundle="${bundle}"/></span>
                            <span><em id="CntAlligators"></em><fmt:message key="피로균열" bundle="${bundle}"/></span>
                        </div>
                        <dl class="">
                            <dt><fmt:message key="DEVICE_NAME" bundle="${bundle}"/></dt>
                            <dd id="detail_device_name"></dd>
                            <dt><fmt:message key="DEVICE_ID" bundle="${bundle}"/></dt>
                            <dd id="detail_device_id"></dd>
                            <dt><fmt:message key="COORDINATES" bundle="${bundle}"/></dt>
                            <dd id="detail_latlng"></dd>
                            <dt><fmt:message key="RISK_LEVEL" bundle="${bundle}"/></dt>
                            <dd id="detail_risk_level"></dd>
                            <dt><fmt:message key="ROAD_NAME" bundle="${bundle}"/></dt>
                            <dd id="detail_route_name"></dd>
                            <dt><fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/></dt>
                            <dd id="detail_ctime"></dd>
                            <dt><fmt:message key="ROAD_STATUS" bundle="${bundle}"/></dt>
                            <dd id="detail_state"></dd>
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
            <div class="infoListWrap" style="overflow-y:auto;">
                <div class="infoListTop">
                    <h2 class="hidden">검색목록</h2>
                    <div class="array-container">
                        <span class="selectBox text bottom" id="select_asc_sort">
                        	<button class="label" id="sort" data-code="desc" onchange="changeSortSelect()"><fmt:message key="DATE_DESC" bundle="${bundle}"/></button>
                            <ul class="optionList" id="sortchk">
                                <li class="optionItem sorting" id="desc" data-code="desc"><fmt:message key="DATE_DESC" bundle="${bundle}"/></li>
                                <li class="optionItem sorting" id="asc" data-code="asc"><fmt:message key="DATE_ASC" bundle="${bundle}"/></li>
                            </ul>
                        </span>
                    </div>
                    <p class="itemCount">총 <em>0건</em></p>
                </div>

                <ul class="infoList"></ul>
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

<script>

var requiredMsg = '<fmt:message key="CONTENTS_REQUIRED" bundle="${bundle}"/>';
var region = "${authInfo.cdNa}";

var chkAreaCodeLv1 = '${authInfo.areaCodeLv1}';
var chkAreaCodeLv2 = '${authInfo.areaCodeLv2}';
var baseLat = '${authInfo.wtX}';
var baseLng = '${authInfo.wtY}';

console.log("chkAreaCodeLv1 : " + chkAreaCodeLv1 + " / chkAreaCodeLv2 : " + chkAreaCodeLv2 + " / baseLat : "  + baseLat + " / baseLng : "  + baseLng);

var allData = [];
var markers = [];
var markerList = [];

let searchLv;

var lorem = document.querySelector(".infoList");

var scrollT = $(this).scrollTop(); //스크롤바의 상단위치
var scrollH = $(this).height(); //스크롤바를 갖는 div의 높이

var popup = L.popup({autoPan:false});

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
/*     var zoomLevel = map.getZoom();
    console.log('Zoom level changed to:', zoomLevel);

    if (zoomLevel > 10) {
        console.log("High zoom level, change cluster behavior...");
    } else {
        console.log("Low zoom level, reset cluster behavior...");
    } */
    $('.infoDetailWrap').css('display', 'none');
	$('.infoListWrap').css('display', 'block');

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

var infoList = [];
var sortDataList= [];
var deviceIdList;

var deviceKeyValue = [];
<c:forEach var="deList" items="${deviceList}" varStatus="status">
	deviceKeyValue.push({'macAddr':'${deList.macAddr}', 'deviceId':'${deList.deviceId}', 'deviceNm':'${deList.deviceNm}'})
		if (deviceIdList == "" ) {
			deviceIdList += '${deList.macAddr}'
		} else {
			deviceIdList += ',${deList.macAddr}'
		}
</c:forEach>

var statusKeyValue = [];
<c:forEach var="statusList" items="${codeListSd}" varStatus="status">
	statusKeyValue.push({'code':'${statusList.cdId}', 'codeName':'${statusList.cdNm}', 'codeNameEng':'${statusList.cdNmEng}', 'codeNameJP':'${statusList.cdNmJp}', 'codeClass':'${statusList.etc1}', })
</c:forEach>

var riskKeyValue = [];
<c:forEach var="riskList" items="${codeListLv}" varStatus="status">
	riskKeyValue.push({'code':'${riskList.cdId}', 'codeName':'${riskList.cdNm}', 'codeNameEng':'${riskList.cdNmEng}', 'codeNameJP':'${riskList.cdNmJp}', 'codeClass':'${riskList.etc1}', })
</c:forEach>

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


//검색버튼 클릭 이벤트
$('.btn_search').on("click", function(){

	map.eachLayer(function (layer) {
	    if (!(layer instanceof L.TileLayer)) {
	        map.removeLayer(layer);
	    }
	});

	var areaCode;

	if(searchLv == 2 || searchLv == 3){

		if ($("#level3").data('code') > 0) {
			map.setView([$("#level3").data().lat, $("#level3").data().lng], map.getZoom())
			areaCode = $("#level3").data('code');
		} else if ($("#level2").data('code') > 0) {
			map.setView([$("#level2").data().lat, $("#level2").data().lng], map.getZoom())
			areaCode = $("#level2").data('code');
		}

	} else {
		$("#alert_msg").html("Level1과 Level2는 필수선택사항입니다.");
		$("#pop_alert").stop().fadeIn(300);
    	$("#pop_alert").stop().fadeIn(300);
	}

	$.ajax({
		type: "GET",
		url: "${authInfo.restApiUrl}/pothole",
		data: {
			on_way:false,
			administrative_id: areaCode,
			region: region,
			devices: deviceIdList
		},
		success: function(response) {
			allData = response.data;
			reSearch();
		},
		error: function(request,status,error){

		},
		beforeSend:function(){
			$('#circularG').css('display','block')
		},
		complete : function(data) {
			//  실패했어도 완료가 되었을 때 처리
			$('#circularG').css('display','none');
		}
	});

	$.ajax({
		type: "GET",
		url: "${authInfo.restApiUrl}/administrative/boundary" ,
		data: {
			administrative_id: areaCode, //성남시
			region: region,
		},
		success: function(resp) {

			datas = resp.data

			var boundaryLines = []

			for (var i = 0; i < datas.length-1; i++) {

				var pointA = new L.LatLng(datas[i].y, datas[i].x);
				var pointB = new L.LatLng(datas[i+1].y, datas[i+1].x);

				var pointList = [ pointA, pointB ];

				var riskLvColor = "";

				var linesize = 5;

				var firstpolyline = new L.Polyline(pointList, {
				    color: '#2f33fb',
				    weight: linesize,
				    smoothFactor: 1
				})

				map.addLayer(firstpolyline);

				boundaryLines.push(firstpolyline);
			}

		},
		error: function(request,status,error){

		},
		beforeSend:function(){
			$('#circularG').css('display','block')
		},
		complete : function(data) {
			//  실패했어도 완료가 되었을 때 처리
			$('#circularG').css('display','none')

		}
	})

});



$(".btn_iconTXT, #btn_Back").click(function(){
	map.closePopup();
	markerIconCheck();

	$('.infoDetailWrap').css('display', 'none');
	$('.infoListWrap').css('display', 'block');

});

//  우측 패널 펼치기
$(".btn_infoWrap").click(function(){

    if($(".infoWrap").hasClass("on")){
    	// 접음
        $('.infoWrap').removeClass('on');
        $('.infoWrap').addClass('off');
    	$('.infoDetailWrap').css('display', 'none');
    	$('.infoListWrap').css('display', 'none');
    	$(".infoListWrap p").css('display', 'hidden');
    	$('.infoListWrapNoData').css('display', 'none');

		/* if ( $('.menu_bar_close').css('display') == 'block' ) {
			$('.level_list').css('width', 'calc(100% - 40px)');
        	//$('.re-search-container').css('width', 'calc(100% - 40px)');
		} else if ( $('.menu_bar_close').css('display') == 'none' ) {
			$('.level_list').css('width', 'calc(100% - 40px)');
        	//$('.re-search-container').css('width', 'calc(100% - 40px)');
		} */

        $('.btn_infoWrap').addClass("off");

        map.closePopup();
    	markerIconCheck();
    } else{

 		/* if ( $('.menu_bar_close').css('display') == 'block' ) {
			$('.level_list').css('width', 'calc(100% - 400px)');
        	//$('.re-search-container').css('width', 'calc(100% - 400px)');
		} else if ( $('.menu_bar_close').css('display') == 'none' ) {
			$('.level_list').css('width', 'calc(100% - 180px)');
        	//$('.re-search-container').css('width', 'calc(100% - 180px)');
		} */

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


// 좌측 메뉴바 동작
$(".menu_bar_close").click(function(){

/* 	if ( $('.infoListWrap').css('display') == 'block' ) {
		$('.level_list').css('width', '1485px');
        $('.re-search-container').css('width', '1485px');
	} else if ( $('.infoListWrap').css('display') == 'none' ) {
		$('.level_list').css('width', '1845px');
        $('.re-search-container').css('width', '1845px');
	} */

});


// 좌측 메뉴바 동작
$(".menu_bar").click(function(){

/* 	if ( $('.infoListWrap').css('display') == 'block' ) {
		$('.level_list').css('width', '1285px');
        $('.re-search-container').css('width', '1285px');
	} else if ( $('.infoListWrap').css('display') == 'none' ) {
		$('.level_list').css('width', '1645px');
        $('.re-search-container').css('width', '1645px');
	} */
});

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


$("input:checkbox").on('click', function() {

	var checkboxName = $(this).attr('name');
	var checkboxLength = $('input:checkbox[name="' + checkboxName + '"]').length;
	var checkedCount = $('input[name="' + checkboxName + '"]:checked').length;

	//  위험도 체크 박스 동작 이벤트
	if ( checkboxName == "risklist" ) {
		if (checkboxLength == checkedCount) {
			$("#riskAll").prop("checked", true);
		} else {
			if (checkedCount > 0) {
				$("#riskAll").prop("checked", false);
			} else {
				$("#alert_msg").html(requiredMsg);
				$("#pop_alert").stop().fadeIn(300);
				return false;
			}
		}
	}

	if ( checkboxName == "riskAll" && ($('input:checkbox[name="risklist"]:checked').length == $('input:checkbox[name="risklist"]').length) ) {
		$("#alert_msg").html(requiredMsg);
		$("#pop_alert").stop().fadeIn(300);
		return false;

	} else if ( checkboxName == "riskAll" && ($('input:checkbox[name="risklist"]:checked').length != $('input:checkbox[name="risklist"]').length) ) {
		$("input[name='risklist']").each(function() {
			$(this).prop('checked', true);
		});
	}

	//  포트홀 종류 체크 박스 동작 이벤트
	if ( checkboxName == "crack" ) {
		if (checkboxLength == checkedCount) {
			$("#allCrack").prop("checked", true);
		} else {
			if (checkedCount > 0) {
				$("#allCrack").prop("checked", false);
			} else {
				$("#alert_msg").html(requiredMsg);
				$("#pop_alert").stop().fadeIn(300);
				return false;
			}
		}
	}

	if ( checkboxName == "allCrack" && ($('input:checkbox[name="crack"]:checked').length == $('input:checkbox[name="crack"]').length) ) {
		$("#alert_msg").html(requiredMsg);
		$("#pop_alert").stop().fadeIn(300);
		return false;
	} else if ( checkboxName == "allCrack" && ($('input:checkbox[name="crack"]:checked').length != $('input:checkbox[name="crack"]').length) ) {
		$("input[name='crack']").each(function() {
			$(this).prop('checked', true);
		});
	}

	//  처리 상태 체크 박스 동작 이벤트
	if ( checkboxName == "statusstat" ) {
		if (checkboxLength == checkedCount) {
			$("#statusAll").prop("checked", true);
		} else {
			if (checkedCount > 0) {
				$("#statusAll").prop("checked", false);
			} else {
				$("#alert_msg").html(requiredMsg);
				$("#pop_alert").stop().fadeIn(300);
				return false;
			}
		}
	}

	if ( checkboxName == "statusAll" && ($('input:checkbox[name="status"]:checked').length == $('input:checkbox[name="statusstat"]').length) ) {
		$("#alert_msg").html(requiredMsg);
		return false;
	} else if ( checkboxName == "statusAll" && ($('input:checkbox[name="status"]:checked').length != $('input:checkbox[name="statusstat"]').length) ) {
		$("input[name='statusstat']").each(function() {
			$(this).prop('checked', true);
		});
	}

});


$(".risklist").change(function(){
    reSearch();
});

$(".crack").change(function(){
	reSearch();
});

$(".statusstat").change(function(){
	reSearch();
});

$('#sortchk .sorting').on('click', function() {
    // 클릭된 'optionItem'의 data-value 값을 가져옵니다.
    var selectedValue = $(this).data('code');

	data = sortDataList;

	var markerListSort = [];

	if (selectedValue == "asc") {
		data.sort((a, b) => new Date(a.timestamp) - new Date(b.timestamp));
	} else {
		//return dateA - dateB;
		data.sort((a, b) => new Date(b.timestamp) - new Date(a.timestamp));
	}


	$('.infoList li').remove()

		var cnt = 0;
		$.each(data, function(index) {
			var markerdate2 = new Date(data[index].timestamp);

			var startDate = new Date($("#fromDt").val());
			var endDate = new Date($("#toDt").val());

			if (!(startDate < markerdate2 && endDate > markerdate2)) {
				return;
			}
			cnt++;

			var date = new Date(data[index]['timestamp'])

			var dateFormat = date.getFullYear() + '.' + (date.getMonth()+1) + '.'
							+ date.getDate() + ' '
							+ date.getHours() + ':' + date.getMinutes();

			var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 );
			var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate();
			var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours();
			var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes();
			var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds();

			dateFormat  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec;
			var addrPoLocality = (data[index].way.name == null || data[index].way.name == '') ? "<fmt:message key="ROAD_INFO_NOT_EXISTS" bundle="${bundle}"/>" : data[index].way.name;
			var macAddr = data[index]['device-id'];
			var id = data[index].id;

			var name = statusName(data[index].status);
			var className = statusClassName(data[index].status);

			var deviceNm = "";
			var deviceId = "";

			for (var i=0; i< deviceKeyValue.length;i++) {
				if (deviceKeyValue[i].macAddr == macAddr){
					deviceNm = deviceKeyValue[i].deviceNm;
					deviceId = deviceKeyValue[i].deviceId;
				}
			}

			let reg = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/ ]/gim;
			let resultData = id.replace(reg, "");

			markerListSort.push("<li><a class='infoListItem'>" //jj 다국어 리스트
							+ "<div class='info'><div class='tit'>"
							+ "<span class='badge sm " + className + "'>" + name + "</span>"
								//+ "<h3 class='infoTitle' onClick=\"detail('" + id + "', ' " + device_name + "', '" + device_id + "', '" + addr_po_locality + "', '" + dateFormat + "', '" + data[index].point['latitude'] + "', '" + data[index].point['longitude'] + "', 'Y')\"'>" + device_name + " ( " + device_id + " )</h3></div>"
								+ "<h3 class='infoTitle' onClick=\"detail('" + id + "', 'N')\"'>" + deviceNm + " ( " + deviceId + " )</h3></div>"
							+ "<ul class='infoContents'>"
							+ "<li> <fmt:message key="ROAD_NAME" bundle="${bundle}"/> : " + addrPoLocality + "</li>"
							+ "<li> <fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/> : " + dateFormat + "</li>"
							+ "</ul>"
							+ "</div>"
							+ "<div class='infoThumnail'>"
							+ "<img src='${authInfo.restApiUrl}/pothole/" + id + "/thumbnail' alt='대표이미지' onclick=\"originalimg('" + id + "')\">"
							+ "</div>"
							+ "</li>"
			);

		})

		for ( var i = 0; i < markerListSort.length; i++ ) {
            if(i<10) {
                $(".infoList").append(markerListSort[i])
            }
        }

	$(".infoListWrap p").text("<fmt:message key="TOTAL" bundle="${bundle}"/> " + cnt + " <fmt:message key="COUNT2" bundle="${bundle}"/>")



});


$(function() {
	//날짜선택
	$('#search_calender').daterangepicker({
		"locale" : {
			"format" : "YYYY-MM-DD",
			"separator" : " - ",
			"applyLabel" : "<fmt:message key="CONFIRM" bundle="${bundle}"/>",
			"cancelLabel" : "<fmt:message key="CANCEL" bundle="${bundle}"/>",
			"fromLabel" : "From",
			"toLabel" : "~",
			"customRangeLabel" : "Custom",
			"weekLabel" : "W",
			"daysOfWeek" : [
					"<fmt:message key="SUNDAY" bundle="${bundle}"/>",
					"<fmt:message key="MONDAY" bundle="${bundle}"/>",
					"<fmt:message key="TUESDAY" bundle="${bundle}"/>",
					"<fmt:message key="WEDNESDAY" bundle="${bundle}"/>",
					"<fmt:message key="THURSDAY" bundle="${bundle}"/>",
					"<fmt:message key="FRIDAY" bundle="${bundle}"/>",
					"<fmt:message key="SATURDAY" bundle="${bundle}"/>" ],
			"monthNames" : [
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
					"<fmt:message key="DECEMBER" bundle="${bundle}"/>" ],
			"firstDay" : 0
		}
	}, function(start, end, label) {
		$("#fromDt").val(start.format('YYYY-MM-DD'));
		$("#toDt").val(end.format('YYYY-MM-DD'));

	});
});




//결과내재검색패널
function btnClick() {
  const searchOpt = document.getElementById('re-search-container');

  if (searchOpt.style.display === 'none') {
    searchOpt.style.display = 'block';
  } else {
    searchOpt.style.display = 'none';
  }
}

function mapClosePopup() {
	map.closePopup();
}

function reSearch() {

	console.log(allData);
	sortDataList = [];
	infoList = [];
	markers = [];
	markerList = [];

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

	var riskChk = $("input[name='risklist']:checked");
	var crackChk = $("input[name='crack']:checked");
	var statusChk = $("input[name='statusstat']:checked");

	map.eachLayer(function(layer) {
		if ((layer instanceof L.Marker) || (layer instanceof L.MarkerCluster) || (layer instanceof L.MarkerClusterGroup)) {
			map.removeLayer(layer);
		};
	});

	mapClosePopup();
	$('.infoDetailWrap').css('display', 'none');
	$('.infoListWrap').css('display', 'block');

	$('.infoList li').remove();

	for ( var i = 0; i < allData.length; i++ ) {
		var boolRisk = false;
		var boolCrack = false;
		var boolStatus = false;

		// 위험도
		for ( var r = 0; r < riskChk.length; r++ ) {
			if (allData[i].risk.level == riskChk[r].value) {
				boolRisk = true;
			}
		}

		for ( var c = 0; c < crackChk.length; c++ ) {
			if (allData[i].risk[crackChk[c].value] > 0 ) {
				boolCrack = true;
			}
		}

		for ( var d = 0; d < statusChk.length; d++ ) {

			var statusValueChk = "ETC";

			if (allData[i].status == null) {
				statusValueChk = "ETC";
			} else {
				statusValueChk = allData[i].status;
			}

			if ( statusValueChk == statusChk[d].id ) {
				boolStatus = true;
			}
		}

		if(boolRisk && boolCrack && boolStatus){
			markerList.push(i);
		}
	}

	for (var i = 0; i < allData.length; i++) {
		for (var x = 0 ; x < markerList.length ; x++ ) {

   			if (markerList[x] == i) {

   				var item = allData[i];

   				var macAddr = item['device-id'];
   				var id = item.id;

   				var name = statusName(item.status);
   				var className = statusClassName(item.status);

				sortDataList.push(item);

				var deviceId = "";
				var deviceNm = "";

				for ( var s = 0; s < deviceKeyValue.length; s++ ) {
					if (deviceKeyValue[s].macAddr == macAddr){
						deviceId = deviceKeyValue[s].deviceId;
						deviceNm = deviceKeyValue[s].deviceNm;
					}
				}

				var date = new Date(item['timestamp']);

				var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 );
				var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate();
				var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours();
				var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes();
				var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds();

				var cTime  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec;

				var addrPoLocality = (item.way.name == null || item.way.name == '') ? "<fmt:message key="ROAD_INFO_NOT_EXISTS" bundle="${bundle}"/>" : item.way.name;

				var t1 = L.marker([item.point.latitude, item.point.longitude], {
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

				markerCluster.addLayer(t1);
				markers.push(t1);

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

					var popup = L.popup().setLatLng(popupLatLng).setContent(popupContent).openOn(map);
				});

				infoList.push("<li><a class='infoListItem'>"
						+ "<div class='info'><div class='tit'>"
						+ "<span class='badge sm " + className + "'>" + name + "</span>"
						+ "<h3 class='infoTitle' onClick=\"detail('" + id + "', 'N')\"'>" + deviceNm + " ( " + deviceId + " )</h3></div>"
						+ "<ul class='infoContents'>"
						+ "<li> <fmt:message key="ROAD_NAME" bundle="${bundle}"/> : " + addrPoLocality + "</li>"
						+ "<li> <fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/> : " + cTime + "</li>"
						+ "</ul>"
						+ "</div>"
						+ "<div class='infoThumnail'>"
						+ "<img src='${authInfo.restApiUrl}/pothole/" + id + "/thumbnail' alt='대표이미지' onclick=\"originalimg('" + id + "')\">"
						+ "</div>"
						+ "</li>"
				);
  			}
		}
	}

	map.addLayer(markerCluster);

	for (var i = 0; i < infoList.length; i++) {
		if( i < 10 ) {
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

	if ($('#sort').data('code') == 'asc') {
		$('#sortchk .sorting').click();
	}

}

function detail(id, clusterChk){

	var deviceNm, deviceId, addrPoLocality, dateFormat, lat, lng, level, status, potholes, vertical, horizontal, alligators, riskLvNm;

	markerIconCheck();
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

/*     if ( $('.menu_bar_close').css('display') == 'block' ) {
		$('.level_list').css('width', 'calc(100% - 400px)');
    	$('.re-search-container').css('width', 'calc(100% - 400px)');
    	$('.btn_infoWrap').removeClass("off");
    	$('.btn_infoWrap').addClass("on");
	} else if ( $('.menu_bar_close').css('display') == 'none' ) {
		$('.level_list').css('width', 'calc(100% - 180px)');
    	$('.re-search-container').css('width', 'calc(100% - 180px)');
	} */

	$('.btn_infoWrap').removeClass("off");

	$(".infoWrap").addClass("on");
 	$(".infoListWrap p").css('display', 'block');

 	$("#info").hide();
	$('.infoListWrap').css('display', 'none');
	$('.infoDetailWrap').css('display', 'block');

	for (var i = 0; i < riskKeyValue.length; i++) {
		if (Number(riskKeyValue[i].code) == Number(level)){
			riskLvNm = riskKeyValue[i].codeName;
		}
	}

	$("#detail_img").attr("src", "${authInfo.restApiUrl}/pothole/"  + id + "/thumbnail");

	$("#detail_img").removeAttr("onClick");
	$("#detail_img").attr("onclick", "originalimg('" + id + "')");

	$(".itemvalue").prev().attr("class", "level level" + (Number(level)))

	var riskText = getLevelText(riskLvNm);

	$("#riskLv").text("LEVEL" + level + ". " + riskText);

	// 포트홀
	$("#CntPothole").text(potholes + " <fmt:message key="COUNT1" bundle="${bundle}"/>")
	// 수직균열
	$("#CntVertical").text(vertical + " <fmt:message key="COUNT1" bundle="${bundle}"/>")
	// 수평균열
	$("#CntHorizontal").text(horizontal + " <fmt:message key="COUNT1" bundle="${bundle}"/>")
	// 피로균열
	$("#CntAlligators").text(alligators + " <fmt:message key="COUNT1" bundle="${bundle}"/>")

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
	$("#detail_route_name").text(addrPoLocality);

	// 촬영일시
	$("#detail_ctime").text(dateFormat);

	// 현재상태
	$("#detail_state").text(statusName(status));

/* 	if ($(".infoDetailWrap").css("display") == "none") {
	    //$("div").show(); //display :none 일떄
	    $('.infoDetailWrap').css('display', 'block')
	    $('.infoListWrap').css('display', 'none')
	} else {
	    //$("div").hide();  //display :block 일떄
	    $('.infoDetailWrap').css('display', 'none')
			$('.infoListWrap').css('display', 'block')
	}
 */

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
		switch (statusNameByCdna) {
        case 'KR':
            return '미분류';
        case 'US':
            return '(us)미분류';
        case 'JP':
            return '(jp)미분류';
		}
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

///////////////////// Level 매칭
function getLevelText(text) {
	var statusNameByCdna = getCdNa('${authInfo.changedCdNa}', '${authInfo.cdNa}');

	const result = riskKeyValue.find(item => item.codeName === text);

	if (result) {
	    switch (statusNameByCdna) {
        case 'KR':
            return result.codeName;
        case 'US':
            return result.codeNameEng;
        case 'JP':
        	return result.codeNameJP;
		}
	}

}

//선택초기화 버튼 이벤트 ( 결과 내 재검색 옵션 )
function optionReset() {

	$("input[name='risklist']").each(function() {
		$(this).prop('checked', true);
	});

	$("input[name='crack']").each(function() {
		$(this).prop('checked', true);
	});

	$("input[name='statusstat']").each(function() {
		$(this).prop('checked', true);
	});

	reSearch();
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

function originalimg(id) {

	var popupimg = document.getElementById("pop_wrap");

	var modalImg = document.getElementById("pop_img");

	$('#pop_riskPopImg').css('display', 'block')
	$("#pop_img").attr("src", "${authInfo.restApiUrl}/pothole/" + id + "/image");

}

function onMarkerClick(e) {

	// 마커 클릭 이벤트
	// e.target.options.id
	//marker.setIcon(redIcon);
	markerIconCheck();

	// 이전에 클릭된 마커가 있으면 원래 아이콘(blueIcon)으로 변경
    /* if (activeMarker) {
        activeMarker.setIcon(blueIcon);
    } */

	this.setIcon(redIcon);

	// 현재 클릭된 마커를 추적
    //activeMarker = this;
    detail(e.target.options.id, 'N')

	/* detail(e.target.options.id
			, e.target.options.deviceName
			, e.target.options.deviceId
			, e.target.options.addrName
			, e.target.options.ctime
			, e.latlng.lat
			, e.latlng.lng
			, 'N'
		) */
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

///////////////////// 날짜관련
function fnDateFormat(date, format) {

	if (format == 'list') {
		// 2023.01.01 14:03:01
		var month = (date.getMonth() + 1) < 10 ? "0" + ""
				+ (date.getMonth() + 1) : (date.getMonth() + 1);
		var day = date.getDate() < 10 ? "0" + "" + date.getDate()
				: date.getDate();
		var hour = date.getHours() < 10 ? "0" + "" + date.getHours()
				: date.getHours();
		var min = date.getMinutes() < 10 ? "0" + "" + date.getMinutes()
				: date.getMinutes();
		var sec = date.getSeconds() < 10 ? "0" + "" + date.getSeconds()
				: date.getSeconds();

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


function setLevelList(level, id){

	// 레벨1인 경우
	if(level == 1){

	 	var node = document.getElementById('level2_ul')
	 	node.innerHTML = '';
	 	var node = document.getElementById('level3_ul')
	 	node.innerHTML = '';

		$.ajax({
			type: "GET",
			url: "${authInfo.restApiUrl}/administrative?region=" + region,
			async:false,
			data: {

			},
			headers: {
		    	'Authorization': 'Bearer ' + localStorage.getItem("accessToken"),
		    	'Refresh-Token': localStorage.getItem("Refresh-Token")
		    },
		    beforeSend:function(){
				$('#circularG').css('display','block');
		    },
		    complete:function(){
				$('#circularG').css('display','none');
		    },
			success: function(resp) {

				datas = resp.data;

			 	var node = document.getElementById('level1_ul');
			 	node.innerHTML = '';

            	var html = '';

	            for(var i = 0; i <datas.length; i++){
	            	data = datas[i];
	            	//html += '<li class="optionItem" data-code="' + data.id + '">' + data.name + '</li>'
	            	html += '<li class="optionItem" data-code="' + data.id + '" data-lat="' + data.center.latitude + '" data-lng="' + data.center.longitude + '">' + data.name + '</li>'
				}

	            node.innerHTML = html;

			}

		})

	} else if(level == 2) {

	 	var node = document.getElementById('level3_ul')
	 	node.innerHTML = '';

		$.ajax({
			type: "GET",
			url: "${authInfo.restApiUrl}" + "/administrative/" + id + "?region=" + region,
			async:false,
			data: {

			},
			headers: {
		    	'Authorization': 'Bearer ' + localStorage.getItem("accessToken"),
		    	'Refresh-Token': localStorage.getItem("Refresh-Token")
		    },
		    beforeSend:function(){
				$('#circularG').css('display','block');
		    },
		    complete:function(){
				$('#circularG').css('display','none');
		    },
			success: function(resp) {

				datas = resp.data

			 	var node = document.getElementById('level2_ul')
			 	node.innerHTML = '';

            	var html = '';

	            for(var i = 0; i <datas.length; i++){
	            	data = datas[i];
	            	html += '<li class="optionItem" data-code="' + data.id + '" data-lat="' + data.center.latitude + '" data-lng="' + data.center.longitude + '">' + data.name + '</li>'

				}

	            node.innerHTML = html;
			}

		})


	} else if(level == 3) {


	 	$("#level3").data('code', '');

		$.ajax({
			type: "GET",
			//url: "${authInfo.restApiUrl}/administrative/" + id + "?region=" + region,
			url: "${authInfo.restApiUrl}/administrative/" + id,
			async:false,
			data: {
				region:region
			},
			headers: {
		    	'Authorization': 'Bearer ' + localStorage.getItem("accessToken"),
		    	'Refresh-Token': localStorage.getItem("Refresh-Token")
		    },
		    beforeSend:function(){
				$('#circularG').css('display','block');
		    },
		    complete:function(){
				$('#circularG').css('display','none');
		    },
			success: function(resp) {

				datas = resp.data

			 	var node = document.getElementById('level3_ul')
			 	node.innerHTML = '';

            	var html = '<li class="optionItem" data-code="" data-lat="" data-lng="">전체</li>';

	            for(var i = 0; i <datas.length; i++){
	            	data = datas[i];
	            	html += '<li class="optionItem" data-code="' + data.id + '" data-lat="' + data.center.latitude + '" data-lng="' + data.center.longitude + '">' + data.name + '</li>'

				}

	            node.innerHTML = html;

			}

		})

	}

	$(".search_box .optionItem").off("click").on("click", function(){

 		let tmpSelectValue = $(this).text();
		$(this).parents(".selectBox").find(".label").text(tmpSelectValue);
		var value = $(this).data('code');
		var lat = $(this).data('lat');
		var lng = $(this).data('lng');

		if(!value)value = '';
		//tmpSelectBox.find(".label").data('code',value);
		$(this).parent().parent().find(".label").data('code',value);
		$(this).parent().parent().find(".label").data('lat',lat);
		$(this).parent().parent().find(".label").data('lng',lng);

		$(this).parents(".selectBox").removeClass("active");
		$(this).parent(".optionList").css("display", "none");


		var levelChk = $(this).parent(".optionList")[0].id;

		if(levelChk == 'level1_ul'){

			// 하위 레벨 초기화
		 	$('#level4').text('Level4');
		 	$('#level3').text('Level3');
		 	$("#level2").text('Level2');
		 	$('#level4').removeClass("on");
		 	$('#level3').removeClass("on");
		 	$("#level2").removeClass("on");

			searchLv = 1

			setLevelList(2 ,  $('#level1').data('code'))

		} else if (levelChk == 'level2_ul'){


			searchLv = 2

			// 하위 레벨 초기화
		 	$('#level4').text('Level4');
		 	$('#level3').text('Level3');
		 	$('#level4').removeClass("on");
		 	$("#level3").removeClass("on");

			setLevelList(3 ,  $('#level2').data('code'))
		} else if (levelChk == 'level3_ul'){


		 	$('#level4').text('Level4');
		 	$('#level4').removeClass("on");
			searchLv = 3

		}
	});

}

$(document).ready(function() {

	// 날짜 설정 오늘날짜로부터 1주일 (임시10.1)
	var date1 = new Date();
	$('#toDt').val(fnDateFormat(date1, 'select'))
	var date2 = new Date(date1.setDate(date1.getDate() - 30));
	// $('#fromDt').val(dateFormat(date2, 'select'))
	$('#fromDt').val('2023-10-01');

	setLevelList(1, '');
	setLevelList(2, chkAreaCodeLv1);
	setLevelList(3, chkAreaCodeLv2);

	searchLv = 2;

	$('#level1').data('code', '${authInfo.areaCodeLv1}');
	$('#level1').text($('.optionItem[data-code="' + chkAreaCodeLv1 + '"]').text());

	$('#level2').data('code', chkAreaCodeLv2);
	$('#level2').data('lat', baseLat);
	$('#level2').data('lng', baseLng);
	$('#level2').text($('.optionItem[data-code="' + chkAreaCodeLv2 + '"]').text());

	$('.btn_search').click();


})

</script>
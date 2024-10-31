<%@ page language="java"	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"		uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
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


<div class="contents_box item mainpage">
    <div class="contents mainMap">
        <div class="mapWrap">
			<!-- ******************************************************************************************************************* -->
			<!-- Level List 부분 -->
			<!-- ******************************************************************************************************************* -->
			<ul class="search_box level_list" style="min-width: 1170px; margin-top:0px; width: calc(100% - 400px);">
				<li>
					<span class="selectBox resp bottom" id="msgdivCd_span">
						<button class="label" id="level1" data-code="" data-lat="" data-lng="">Level1</button>
						<ul class="optionList" id="level1_ul">
							<li class="optionItem" >전체</li>
							<li class="optionItem" >Kedah, Malaysia</li>
							<li class="optionItem" data-code="dd" >Level1</li>
						</ul>
					</span>
					<span class="selectBox resp bottom" id="msgdivCd_span">
						<button class="label" id="level2" data-code="" data-lat="" data-lng="">Level2</button>
						<ul class="optionList" id="level2_ul">
							<li class="optionItem" >전체</li>
							<li class="optionItem" >07100 Langkawi</li>
							<li class="optionItem" >Level2</li>
						</ul>
					</span>
					<span class="selectBox resp bottom" id="msgdivCd_span">
						<button class="label" id="level3" data-code="" data-lat="" data-lng="">Level3</button>
						<ul class="optionList" id="level3_ul">
							<li class="optionItem" >전체</li>
							<li class="optionItem" >Langkawi International Airport Padang Mat Sirat Pulau Langkawi</li>
							<li class="optionItem" >Level3</li>
						</ul>
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
				<li>
					<button class="btn_re-search" onclick='btnClick()'><fmt:message key="RESULT_IN_SEARCH" bundle="${bundle}"/></button>
				</li>
			</ul>
			<!-- 결과내재검색패널 -->
			<div class="re-search-container" id="re-search-container" style="display: none; width: calc(100% - 400px);">
                <button type="button" id="btn_re-searchWrap" class="btn_re-searchWrap" onclick='btn2Click()'></button>

				<div class="group">
					<dl class="">
						<dt><fmt:message key="RISK_LEVEL" bundle="${bundle}"/></dt>
						<dd>
							<div class="selectOpt">
								<!-- <input type="checkbox" id="riskAll" name="riskAll" checked><label for="riskAll"><fmt:message key="ALL" bundle="${bundle}"/></label> -->
								<c:forEach var="risklist" items="${codeListLv}" varStatus="status">
									<input type="checkbox" id="${risklist.etc2}" class="risklist" name="risklist" value="${risklist.etc3}" checked><label for="${risklist.etc2}">
									<%-- <fmt:message key="${risklist.cdNm}" bundle="${bundle}"/> --%>
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
								<!-- <input type="checkbox" id="allCrack" name="allCrack" checked><label for="allCrack"><fmt:message key="ALL" bundle="${bundle}"/></label> -->
								<c:forEach var="cracklist" items="${codeListDv}" varStatus="status">
									<input type="checkbox" id="${cracklist.etc1}" class="crack" name="crack" value="${cracklist.etc2}" checked><label for="${cracklist.etc1}">
									<%-- <fmt:message key="${cracklist.cdNm}" bundle="${bundle}"/> --%>

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
								<!-- <input type="checkbox" id="statusAll" name="statusAll" checked><label for="statusAll"><fmt:message key="ALL" bundle="${bundle}"/></label> -->
								<c:forEach var="statuslist" items="${codeListSd}" varStatus="status">
									<input type="checkbox" id="${statuslist.cdId}" class="statusstat" name="statusstat" value="${statuslist.comCd}" checked><label for="${statuslist.cdId}">
									<%-- <fmt:message key="${statuslist.cdNm}" bundle="${bundle}"/> --%>

										<c:choose>
											<c:when test="${nowCdNa eq 'KR'}">${statuslist.cdNm}</c:when>
											<c:when test="${nowCdNa eq 'US'}">${statuslist.cdNmEng}</c:when>
											<c:when test="${nowCdNa eq 'JP'}">${statuslist.cdNmJp}</c:when>
										</c:choose>
									</label>
								</c:forEach>
								<input type="checkbox" id="ETC" class="statusstat" name="statusstat" value="ETC" checked><label for="ETC"><fmt:message key="UNCLASSIFIED" bundle="${bundle}" /></label>
								<!-- <input type="checkbox" id="status-1" name="status" checked><label for="status-1">대기</label>
								<input type="checkbox" id="status-2" name="status" checked><label for="status-2">미분류</label>
								<input type="checkbox" id="status-3" name="status" checked><label for="status-3">접수완료</label>
								<input type="checkbox" id="status-4" name="status" checked><label for="status-4">보수진행중</label>
								<input type="checkbox" id="status-5" name="status" checked><label for="status-5">보수완료</label> -->
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
		<!-- ******************************************************************************************************************* -->

		<!-- <div class="MapArea" style="height: calc(100%-64px);"> -->
		<!-- <div class="MapArea" style="height: 94.6%;"> -->
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
	<div class="infoWrap on"> <!-- class="on" -->
		<button type="button" class="btn_infoWrap"></button>

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
                            <span><em id="CntPothole">3개</em><fmt:message key="포트홀" bundle="${bundle}"/></span>
                            <span><em id="CntVertical">1개</em><fmt:message key="수직균열" bundle="${bundle}"/></span>
                            <span><em id="CntHorizontal">0개</em><fmt:message key="수평균열" bundle="${bundle}"/></span>
                            <span><em id="CntAlligators">0개</em><fmt:message key="피로균열" bundle="${bundle}"/></span>
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
                <div class="btnWrap">
                    <div class="btnArea">
                        <button type="button" class="btn_iconTXT" id="btn_Back"><span class="material-symbols-outlined">list</span> <fmt:message key="TO_LIST" bundle="${bundle}"/></button>
                    </div>
                </div>
            </div>
            <!-- e:상세설명 -->

            <!-- 검색목록 -->
            <div class="infoListWrap" style="overflow-y:scroll;">
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

                <ul class="infoList">
                 <!--  <li>
                        <a class="infoListItem" href="#">
                            <div class="info">
                                <h3 class="infoTitle">ID : NFG - 001</h3>
                                <ul class="infoContents">
                                    <li>서울 외곽순환도로</li>
                                    <li>2023.10.25 17:42:01</li>
                                </ul>
                            </div>
                            <div class="infoThumnail">
                                <img src="/img/sample_highway.jpg" alt="대표이미지">
                            </div>
                        </a>
                    </li>
                    <li>
                        <a class="infoListItem" href="#">
                            <div class="info">
                                <h3 class="infoTitle">ID : NFG - 002</h3>
                                <ul class="infoContents">
                                    <li>남부순환도로</li>
                                    <li>2023.10.25 17:42:01</li>
                                </ul>
                            </div>
                            <div class="infoThumnail">
                                <img src="/img/sample_highway02.jpg" alt="대표이미지">
                            </div>
                        </a>
                    </li>
                    <li>
                        <a class="infoListItem" href="#">
                            <div class="info">
                                <h3 class="infoTitle">ID : NFG - 010</h3>
                                <ul class="infoContents">
                                    <li>서울 외곽순환도로</li>
                                    <li>2023.10.25 17:42:01</li>
                                </ul>
                            </div>
                            <div class="infoThumnail">
                                <img src="/img/sample_highway02.jpg" alt="대표이미지">
                            </div>
                        </a>
                    </li> -->
                </ul>
            </div>
            <!-- e:검색목록 -->

            <!-- 검색목록 nodata-->
            <div class="infoListWrapNoData" style="display: none;">
                <h2 class="hidden">검색목록</h2>
                <!-- <p class="itemCount">총 <em>0건</em></p> -->
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

<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDLlGOOgY5Y88zXjRQq_gIHJabQI5eXG1U&callback=initMap"></script>
<script>

	redIcon = L.icon({
		//iconUrl: '/img/marker_1.png',
		iconUrl: '/img/pin_select.png',
		//iconUrl: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',

		//iconSize:     [38, 42], 	// size of the icon
		iconSize:     [32, 32], 	// size of the icon
		//iconAnchor:   [0, 42], 	// point of the icon which will correspond to marker's location
		iconAnchor:   [16, 32], 	// point of the icon which will correspond to marker's location
	});

	blueIcon = L.icon({
		//iconUrl: '/img/marker.png',
		iconUrl: '/img/pin_default.png',
		//iconUrl: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',

		//shadowUrl: 'leaf-shadow.png',
		//markerColor: 'red'

		//iconSize:     [38, 42], 	// size of the icon
		iconSize:     [32, 32], 	// size of the icon
		//shadowSize:   [50, 64], 	// size of the shadow
		//iconAnchor:   [13, 42], 	// point of the icon which will correspond to marker's location
		iconAnchor:   [16, 32], 	// point of the icon which will correspond to marker's location
		//shadowAnchor: [4, 62],  	// the same for the shadow
		//popupAnchor:  [-30, -76] 	// point from which the popup should open relative to the iconAnchor
	});
	var riskKeyValue = [];

	var deviceKeyValue = [];

	var statusKeyValue = [];

	var deviceIdList = "";


	let searchLv;
	let activeMarker = null;

	if (searchLv == undefined) {
		searchLv = 2
		const temp = document.getElementById('level2');
	 	temp.setAttribute('data-code', '2409180');
	 	temp.setAttribute('data-lat', '37.4201556');
	 	temp.setAttribute('data-lng', '127.1262092');
	}

	markerList = [];
	markerList1 = [];

	sortDataList= [];

	<c:forEach var="deList" items="${deviceList}" varStatus="status">

		deviceKeyValue.push({'macAddr':'${deList.macAddr}', 'deviceId':'${deList.deviceId}', 'deviceNm':'${deList.deviceNm}'})
			if (deviceIdList == "" ) {
				deviceIdList += '${deList.macAddr}'
			} else {
				deviceIdList += ',${deList.macAddr}'
			}

	</c:forEach>

	<c:forEach var="statuslist" items="${codeListSd}" varStatus="status">
		//<input type="checkbox" id="${statuslist.cdId}" class="statusstat" name="statusstat" value="${statuslist.comCd}" checked><label for="${statuslist.cdId}">${statuslist.cdNm}</label>
		statusKeyValue.push({'code':'${statuslist.cdId}', 'codeName':'${statuslist.cdNm}', 'codeNameEng':'${statuslist.cdNmEng}', 'codeNameJP':'${statuslist.cdNmJp}', 'codeClass':'${statuslist.etc1}', })
	</c:forEach>

	<c:forEach var="risklist" items="${codeListLv}" varStatus="status">
		riskKeyValue.push({'code':'${risklist.cdId}', 'codeName':'${risklist.cdNm}', 'codeNameEng':'${risklist.cdNmEng}', 'codeNameJP':'${risklist.cdNmJp}', 'codeClass':'${risklist.etc1}', })
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

//
function btn2Click() {
  const searchOpt = document.getElementById('re-search-container');

  if (searchOpt.style.display === 'block') {
    searchOpt.style.display = 'none';
  } else {
    searchOpt.style.display = 'block';
  }
}

// **************************************************************************************************************************************************************
// 결과내 재검색 옵션 적용 후 검색실행
function reSearch() {
	reSearchYn = true;
	markerList = [];
	markerList1 = [];

	markers = [];

	map.eachLayer(function(layer) {
		/* if (layer instanceof L.Marker) {
			map.removeLayer(layer);
		} */


		//if (!(layer instanceof L.Polyline) && !(layer instanceof L.TileLayer)) {
		if ((layer instanceof L.Marker) || (layer instanceof L.MarkerCluster) || (layer instanceof L.MarkerClusterGroup)) {
			map.removeLayer(layer);
		}
	});


	//markerCluster.off();

	map.closePopup();
	$('.infoDetailWrap').css('display', 'none');
	$('.infoListWrap').css('display', 'block');

	var riskChk = $("input[name='risklist']:checked");

	var crackChk = $("input[name='crack']:checked");

	var statusChk = $("input[name='statusstat']:checked");

	sumMarker1 = [];
	sumMarkerTest1 = [];

	for ( var i = 0; i < allData.length; i++ ) {
		var boolRisk = false;
		var boolCrack = false;
		var boolStatus = false;
		// ------------------------------------------------------------------------
		// 위험도
		for ( var r = 0; r < riskChk.length; r++ ) {
			if (allData[i].risk.level == riskChk[r].value) {
				//console.log("i ==> " + i + " r ==> " + riskChk[r].value);
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
			sumMarker1.push(i);
			sumMarkerTest1.push({key:i, value:allData[i].timestamp});
		}
			/*
		if (risk1Chk && (allData[i].risk.level == 1)) {
			sumMarker1.push(i)
			sumMarkerTest1.push({key:i, value:allData[i].timestamp})
		}

		if (risk2Chk && (allData[i].risk.level == 2)) {
			sumMarker1.push(i)
			sumMarkerTest1.push({key:i, value:allData[i].timestamp})
		}

		if (risk3Chk && (allData[i].risk.level == 3)) {
			sumMarker1.push(i)
			sumMarkerTest1.push({key:i, value:allData[i].timestamp})
		}
*/
		// ------------------------------------------------------------------------
		// 균열종류
		/*
		if (potholeChk && (allData[i].risk['count-of-potholes'] > 0)) {
			sumMarker1.push(i)
			sumMarkerTest1.push({key:i, value:allData[i].timestamp})
		}

		if (verticalChk && (allData[i].risk['count-of-vertical-cracks'] > 0)) {
			sumMarker1.push(i)
			sumMarkerTest1.push({key:i, value:allData[i].timestamp})
		}

		if (horizontalChk && (allData[i].risk['count-of-horizontal-cracks'] > 0)) {
			sumMarker1.push(i)
			sumMarkerTest1.push({key:i, value:allData[i].timestamp})
		}

		if (alligatorsChk && (allData[i].risk['count-of-alligators'] > 0)) {
			sumMarker1.push(i)
			sumMarkerTest1.push({key:i, value:allData[i].timestamp})
		}
		*/
		// ------------------------------------------------------------------------
	}

	// Map을 사용하여 키를 기준으로 중복 제거
	var uniqueSumMarkerMap1 = new Map();
	sumMarkerTest1.forEach(item => uniqueSumMarkerMap1.set(item.key, item));

	// Map을 배열로 변환
	var uniqueSumMarker1 = Array.from(uniqueSumMarkerMap1.values());

	var set1 = new Set(sumMarker1);

	const makeMarkerList1 = Array.from(set1);

	var markerCluster = L.markerClusterGroup({
        disableClusteringAtZoom: 19, // 줌 레벨 15 이상에서 클러스터 해제
        maxClusterRadius: 30,        // 클러스터링 반경 50px로 설정
        iconCreateFunction: function(cluster) {
            var count = cluster.getChildCount();
			return L.divIcon({
                //html: '<div style="background-color:black; color:white"><b>테에스으트으</b></div>',
				html: '<div>' + count + '</div>',
                className: 'mycluster',
                iconSize: L.point(40, 40)
            });
        },
		/* iconCreateFunction: function(cluster) {
            return L.divIcon({
                html: '<b>' + cluster.getChildCount() + '</b>',
                className: 'mycluster',
                iconSize: L.point(40, 40)
            });
        },*/
        spiderfyOnMaxZoom: false,
        zoomToBoundsOnClick: false,
		showCoverageOnHover: false // 마우스 오버 시 폴리곤 비활성화
    });

	//var testD1 = response.data;
	var testDD1 = uniqueSumMarker1;
	sortDataList = [];

	for (var i = 0; i < allData.length; i++) {

		//var markerdate = new Date(allData[i].timestamp);

		// if (!(ss < markerdate && ee > markerdate)) {
		// 	markercount--;
		// 	continue;
		// }

		for (var x = 0 ; x < makeMarkerList1.length ; x++ ) {

   			if (makeMarkerList1[x] == i) {
				var item = allData[i];
				sortDataList.push(allData[i]);
				//console.log(deviceKeyValue)
				//var deviceId = fn_device_id(item['device-id'])
				//var deviceNm = fn_device_name(item['device-id'])
				var deviceId = "";
				var deviceNm = "";

				//fn_device_id(item['device-id'])

				for ( var s = 0; s < deviceKeyValue.length; s++ ) {
					if (deviceKeyValue[s].macAddr == item['device-id']){
						deviceId = deviceKeyValue[s].deviceId;
						deviceNm = deviceKeyValue[s].deviceNm;
					}
				}

				//var c_time = fn_create_time(item['created-at'])
				//var date = new Date(fn_create_time(item['timestamp']))

				var date = new Date(item['timestamp'])

				var c_time = date.getFullYear() + '.' + (date.getMonth()+1) + '.'
							+ date.getDate() + '. '
							+ date.getHours() + ':' + date.getMinutes() + '';

				var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 )
				var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate()
				var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours()
				var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes()
				var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds()

				c_time  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec

				var addr_po_locality = (item.way.name == null || item.way.name == '') ? "<fmt:message key="ROAD_INFO_NOT_EXISTS" bundle="${bundle}"/>" : item.way.name

				//===========================================================================================================
				//-----------------------------------------------------------------------------------------------------------
				var t1 = L.marker([item.point.latitude, item.point.longitude], {
					id : item['id'],
					lat : item.point['latitude'],
					lng : item.point['longitude'],
					ctime : c_time,
					deviceId : deviceId,
					deviceName : deviceNm,
					addrName : addr_po_locality,
					icon : blueIcon,
					//icon:redIcon
				})//.addTo(map)
					//.on('mouseover', onClick1)
					.on('click', onClick);

	  			//}

  				//===========================================================================================================
				markerCluster.addLayer(t1);
				markers.push(t1);
				markerId.push(item['id']);

				//ClusterMarkers.addLayer(t);
  			}
		}
	}

	// 마커 클러스터 그룹에 클릭 이벤트 추가
	markerCluster.on('clusterclick', function(event) {
		var cluster = event.layer;
		var childMarkers = cluster.getAllChildMarkers();

		// 팝업 내용 생성
		var popupContent = '<b>Cluster contains ' + childMarkers.length + ' markers:</b><br>';
		//console.log('childMarkers -- ', childMarkers)
		childMarkers.forEach(function(marker, index) {

			/* console.log(marker.options.id + "\n"
						+ marker.options.deviceName + "\n"
						+ marker.options.deviceId + "\n"
						+ marker.options.addrName + "\n"
						+ marker.options.ctime + "\n"
			) */
			var item = marker.options;
			//popupContent += 'Marker ' + (index + 1) + ' : ' + marker.getLatLng().toString() + '<br>';

			const currentTheme = document.documentElement.getAttribute('data-theme');

			var mouseoverTxt, mouseoutTxt;

			if (currentTheme == "light") {
				mouseoverTxt = "onmouseover=\"this.style.color='blue'; this.style.cursor='pointer'\""
				mouseoutTxt = "onmouseout=\"this.style.color='black'\" "
			} else if (currentTheme == "dark") {
				mouseoverTxt = "onmouseover=\"this.style.color='orange'; this.style.cursor='pointer'\""
				mouseoutTxt = "onmouseout=\"this.style.color='white'\" "
			}

			popupContent += "Marker " + (index + 1) + " : <b id='" + marker.options.id + "'"
													//+ "onmouseover=\"this.style.color='blue'; this.style.cursor='pointer'\""
													//+ "onmouseout=\"this.style.color='black'\" "
													+ mouseoverTxt
													+ mouseoutTxt
													+ "onClick=\"detail('" + item.id + "', '" + item.deviceName + "', '" + item.deviceId + "', '" +  item.addrName + "', '" + item.ctime + "', '" + item.lat + "', '" + item.lng + "', 'Y')\">" + marker.getLatLng().toString() + "</b><br>";

		});

		//console.log('markerCluster >>> ', markerCluster);
		// 첫 번째 마커의 위치를 팝업 위치로 사용
		//var popupLatLng = childMarkers[0].getLatLng();
		var popupLatLng = cluster.getLatLng();

		// 팝업 생성 및 오픈
		//cluster.bindPopup(popupContent).openPopup();

		var popup = L.popup()
							.setLatLng(popupLatLng)  // 팝업 위치 설정
							.setContent(popupContent)
							.openOn(map);
	});

	// // 마커 클러스터 그룹에 클릭 이벤트 추가
	// markerCluster.on('clusterclick', function(event) {
	// 	var cluster = event.layer;
	// 	var childMarkers = cluster.getAllChildMarkers();

	// 	// 팝업 내용 생성
	// 	var popupContent = '<b>Cluster contains ' + childMarkers.length + ' markers:</b><br>';
	// 	childMarkers.forEach(function(marker, index) {
	// 		popupContent += 'Marker ' + (index + 1) + ': ' + marker.getLatLng().toString() + '<br>';
	// 	});

	// 	// 팝업 생성 및 오픈
	// 	cluster.bindPopup(popupContent).openPopup();
	// });

	// // 마커 생성 및 클러스터 그룹에 추가
	// for (var i = 0; i < 100; i++) {
	// 	var marker = L.marker(getRandomLatLng()).bindPopup('Marker ' + (i + 1));
	// 	markerCluster.addLayer(marker);
	// }


	map.addLayer(markerCluster);
	potholeCnt = allData.length;
	potholeListData = allData;

	var numItems = $('.infoListItem').length

	$('.infoList li').remove()
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	for (var x = 0 ; x < makeMarkerList1.length ; x++ ) {

		// var markerdate2 = new Date(sortedTestDD1[x].value);

		// if (!(ss < markerdate2 && ee > markerdate2)) {
		// 	//console.log(markerdate)
		// 	continue;
		// }

		$.each(allData, function(index) {

			if (makeMarkerList1[x] == index) {

				var date = new Date(allData[index]['timestamp'])

				var dateFormat = date.getFullYear() + '.' + (date.getMonth()+1) + '.'
								+ date.getDate() + ' '
								+ date.getHours() + ':' + date.getMinutes() ;

				var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 )
				var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate()
				var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours()
				var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes()
				var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds()

				dateFormat  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec

				var addr_po_locality = (allData[index].way.name == null || allData[index].way.name == '') ? "<fmt:message key="ROAD_INFO_NOT_EXISTS" bundle="${bundle}"/>" : allData[index].way.name
				var macAddr = allData[index]['device-id'];
				var id = allData[index].id;

				var name = statusName(allData[index].status);
				var className = statusClassName(allData[index].status);

				var device_name = "";
				var device_id = "";

				for ( var i = 0 ;  i < deviceKeyValue.length ; i++ ) {
					if ( deviceKeyValue[i].macAddr == macAddr ){
						device_name = deviceKeyValue[i].deviceNm;
						device_id = deviceKeyValue[i].deviceId;
					}
				}

				let reg = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/ ]/gim;
				let resultData = id.replace(reg, "");

				//jj

			markerList.push("<li><a class='infoListItem'>"
					+ "<div class='info'><div class='tit'>"
					//+ "<span class='badge sm badge_running'>진행중</span>"
					+ "<span class='badge sm " + className + "'>" + name + "</span>"
						+ "<h3 class='infoTitle' onClick=\"detail('" + id + "', ' " + device_name + "', '" + device_id + "', '" + addr_po_locality + "', '" + dateFormat + "', '" + allData[index].point['latitude'] + "', '" + allData[index].point['longitude'] + "', 'Y')\"'>" + device_name + " ( " + device_id + " )</h3></div>"
					+ "<ul class='infoContents'>"
					+ "<li> <fmt:message key="ROAD_NAME" bundle="${bundle}"/> : " + addr_po_locality + "</li>"
					+ "<li> <fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/> : " + dateFormat + "</li>"
					+ "</ul>"
					+ "</div>"
					+ "<div class='infoThumnail'>"
					+ "<img src='${authInfo.restApiUrl}/pothole/" + id + "/thumbnail' alt='대표이미지' onclick=\"originalimg('" + id + "')\">"
					+ "</div>"
					+ "</li>"
				);


			}
		})
	}
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	for (var i = 0; i < markerList.length; i++) {
		if( i < 10 ) {
			$(".infoList").append(markerList[i])
		}
	}
	lorem.scrollTop = 0;

	if ($('.infoListItem').length < 1 && $(".infoWrap").hasClass("on")) {
		$('.infoListWrapNoData').css('display', 'block')
	} else {
		$('.infoListWrapNoData').css('display', 'none');
	}

	$(".infoListWrap p").text("<fmt:message key="TOTAL" bundle="${bundle}"/> "+ markerList.length + " <fmt:message key="COUNT2" bundle="${bundle}"/>")


}

// **************************************************************************************************************************************************************
// 선택초기화 버튼 이벤트 ( 결과 내 재검색 옵션 )
function optionReset() {

	$("#riskAll").prop("checked", true);
	$("#allCrack").prop("checked", true);
	$("#statusAll").prop("checked", true);

	$("input[name='risklist']").each(function() {
		$(this).prop('checked', true);
		//$("#risklist").prop('checked', true);
	});

	$("input[name='crack']").each(function() {
		$(this).prop('checked', true);
		//$("#crack").prop('checked', true);
	});

	$("input[name='statusstat']").each(function() {
		$(this).prop('checked', true);
		//$("#statusstat").prop('checked', true);
	});

	//$("#renew").click();

	reSearch();
}

	var potholeCnt;
	var potholeListData;
	var markerId = [];
	var img_id;

	markerList = [];
	markerList1 = [];
	markersTemp = [];

	redIconList = [];
	redIconId = "";

	window.initMap = function () {

	};

	var popup = L.popup({autoPan:false});

 	function onClick1(e) {

 		//alert("1", this.getLatLng())
 		//alert("1", e)
 		//$("#dddr").hide();
	    /* popup.setLatLng(e.latlng)
	        .setContent("이곳의 좌표는" + e.latlng.toString())
	        .openOn(map); */
	    //$("#info").hide();
	}

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

/* 	    markerCluster.eachLayer(function(layer) {
			//if (layer.options.id === id) {
			// 마커를 찾았으면 아이콘 변경
				//layer.setIcon(redIcon);
			//}
			//console.log(layer.options.iconChanged)

 			if (layer.options.iconChanged) {
 				layer.setIcon(blueIcon);
			}

		}); */
		markerIconCheck();

		// 클릭된 마커가 있으면 원래 아이콘(blueIcon)으로 변경
	    if (activeMarker) {
	        activeMarker.setIcon(blueIcon);
	        activeMarker = null; // 마커 추적 초기화
	    }


		//optionReset();
		const searchOpt = document.getElementById('re-search-container');

		if(searchOpt.style.display === 'block') {
			searchOpt.style.display = 'none';
		}

		$("#info").hide();

		//$('.infoListWrap').css('display', 'block');
		//$('.infoDetailWrap').css('display', 'none');
		//$('.btn_infoWrap').css(on)
		if (!$('.btn_infoWrap').hasClass('off')) {
			$(".btn_infoWrap").click();
		}

		if ( $('.infoDetailWrap').css('display') == 'block' ) {
			$('.infoDetailWrap').css('display', 'none');
			//lorem.scrollTop = 0;
		}

		//lorem.scrollTop = 0;
	}

 	function originalimg(id) {
 		//console.log(this.src)
 		//window.open(this.src,"new", "width=500, height=400, left=30, top=30,scrollbars=no,titlebar=no,status=no,resizable=no,fullscreen=no");
 		//window.open("https://naverpa-phinf.pstatic.net/MjAyMzA4MThfNiAg/MDAxNjkyMzMxOTU3MDkz.KMY_bOLys2mov7GqVrvO1xRQtMvG8nGZ3uUmlZpDAwYg.jwouDJGKM0ByTtyo3sRPohMWwQ8jrshpkqIU7CIbhzUg.JPEG/%EB%8D%94%EB%A7%88%EA%B3%A1%ED%85%8C%EB%9D%BC%EC%8A%A4_GFA_%EC%8D%B8%EB%84%A4%EC%9D%BC_16923319570698403026879242375162.jpg","new", "width=500, height=400, left=30, top=30,scrollbars=no,titlebar=no,status=no,resizable=no,fullscreen=no");

 		var popupimg = document.getElementById("pop_wrap");

		var modalImg = document.getElementById("pop_img");

		$('#pop_riskPopImg').css('display', 'block')
		$("#pop_img").attr("src", "${authInfo.restApiUrl}/pothole/" + id + "/image");

 	}

	function largeimg(id) {

		var imgsrc = "";

		$.ajax({
			type: "GET",
			//url: "${authInfo.restApiUrl}/api/v1/roads/{id}/image/small",
			url: "${authInfo.restApiUrl}/api/v1/pothole/" + id + "/image/small",
			async:false,
			data: {
				id: id
			},
			headers: {
		    	'Authorization': 'Bearer ' + localStorage.getItem("accessToken"),
		    	'Refresh-Token': localStorage.getItem("Refresh-Token")
		    },
			success: function(response) {
				imgsrc = response.image;
			}

		})

		return imgsrc;

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

//////////////////////////
 function detail(id, device_name, device_id, addr_po_locality, dateFormat, lat, lng, clusterChk){
		//console.log("clusterChk - " + clusterChk)

		// var totalClusters = markerCluster.getLayers().filter(function(layer) {
        // 	return layer instanceof L.MarkerCluster;
    	// }).length;

/* 		// 클릭된 마커가 있으면 원래 아이콘(blueIcon)으로 변경
	    if (activeMarker) {
	        activeMarker.setIcon(blueIcon);
	        activeMarker = null; // 마커 추적 초기화
	    } */
	    if ( $('.menu_bar_close').css('display') == 'block' ) {
			$('.level_list').css('width', 'calc(100% - 400px)');
        	$('.re-search-container').css('width', 'calc(100% - 400px)');
        	$('.btn_infoWrap').removeClass("off");
        	$('.btn_infoWrap').addClass("on");
		} else if ( $('.menu_bar_close').css('display') == 'none' ) {
			$('.level_list').css('width', 'calc(100% - 180px)');
        	$('.re-search-container').css('width', 'calc(100% - 180px)');
		}

		markerCluster.eachLayer(function(layer) {
			if (layer.options.id === id) {
			// 마커를 찾았으면 아이콘 변경
				layer.setIcon(redIcon);
				layer.options.iconChanged = true;
			}

		});

		/*
		// 이전에 클릭된 마커가 있으면 원래 아이콘(blueIcon)으로 변경
	    if (activeMarker) {
	        activeMarker.setIcon(blueIcon);
	    }

		this.setIcon(redIcon);

		// 현재 클릭된 마커를 추적
	    activeMarker = this; */

		$(".infoWrap").addClass("on");
	 	$(".infoListWrap p").css('display', 'block')

	   	markersTemp = markers;

    	markers = markersTemp;

	 	$("#info").hide();
		$('.infoListWrap').css('display', 'block')
		$('.infoDetailWrap').css('display', 'none')

		img_id = id;

		thisData = "";

		for (var i=0; i<allData.length; i++) {

			if (allData[i].id == id) {
				thisData = allData[i]
			}
		}

		var popuptxt = "<div><h1><fmt:message key="DEVICE_NAME" bundle="${bundle}"/> : " + device_name + " ( " + device_id + " )</h1>"
						+ "<fmt:message key="ROAD_NAME" bundle="${bundle}"/> : " + addr_po_locality + " (" + lat + ", " + lng + ")<br>"
						+ "<fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/> : " + dateFormat + "</div>";

		var txtposition = 0.000030;
		var max = map.getMaxZoom()+1;
		var zoom = map.getZoom();
		var no = 2;

		for (var i=0; i<(max-zoom); i++) {
			txtposition = txtposition * no;
		}

		//var lat = Number(lat) + Number(0.00004)
		var lat = Number(lat) //+ Number(txtposition)
		var lng = Number(lng)

		var position = [lat, lng];

		if (clusterChk == 'N') {
			popup.setLatLng(position)
				.setContent(popuptxt)
				.openOn(map);
			//console.log(popup);
		}

		var lvColorKeyValue = [];

		<c:forEach var="lvList" items="${levelList}" varStatus="status">

			lvColorKeyValue.push({'lv':'${lvList.cdId}', 'color':'${lvList.etc1}', 'riskNm':'${lvList.cdNm}'})

		</c:forEach>

		for (var i = 0; i < lvColorKeyValue.length; i++) {
			if (Number(lvColorKeyValue[i].lv) == Number(thisData.risk.level)){
				riskLvNm = lvColorKeyValue[i].riskNm;
				riskColor = lvColorKeyValue[i].color
			}
		}

		$("#detail_img").attr("src", "${authInfo.restApiUrl}/pothole/"  + id + "/thumbnail");

		$("#detail_img").removeAttr("onClick");
		$("#detail_img").attr("onclick", "originalimg('" + id + "')");

		//---console.log(potholeListData)

 		for (var i = 0; i < potholeListData.length; i++) {
			if (potholeListData[i].id == id) {

				//var addrName = potholeListData[i].way == null ? "도로정보 없음" : potholeListData[i].way.name
				var addrName = (potholeListData[i].way.name == null || potholeListData[i].way.name == '' ) ? "<fmt:message key="ROAD_INFO_NOT_EXISTS" bundle="${bundle}"/>" : potholeListData[i].way.name

				//var riskLevel = "level level" + (Number(thisData.risk.level)+1);
				var riskLevel = "level level" + (Number(thisData.risk.level));

				$(".itemvalue").prev().attr("class", riskLevel)

				var riskText = getLevelText(riskLvNm)

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

				//var status = potholeListData[i].status
				//var status = statusName(potholeListData[i].status);
				var statusName = (function(code) {
									    const result = statusKeyValue.find(item => item.code === code);
									    /* if (result) { return result.codeName; } else { return "미분류"; } */
									    var statusNameByCdna = getCdNa('${authInfo.changedCdNa}', '${authInfo.cdNa}');

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
									})(potholeListData[i].status);

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
				$("#detail_title").text(device_name + " ( " + device_id + " )");
				// 디바이스 name
				$("#detail_device_name").text(device_name);
				// 디바이스 ID
				$("#detail_device_id").text(device_id);
				// 좌표
				$("#detail_latlng").text("<fmt:message key="LATITUDE" bundle="${bundle}"/> " + potholeListData[i].point['latitude'] + " / <fmt:message key="LONGITUDE" bundle="${bundle}"/> " + potholeListData[i].point['longitude']);
				// 위험도
				$("#detail_risk_level").text(riskText);
				// 도로명
				//$("#detail_route_name").text();
				$("#detail_route_name").text(addrName);

				// 촬영일시
				$("#detail_ctime").text(dateFormat);

                // 현재상태
				$("#detail_state").text(statusName);

			}

		}

		if ($(".infoDetailWrap").css("display") == "none") {
		    //$("div").show(); //display :none 일떄
		    $('.infoDetailWrap').css('display', 'block')
		    $('.infoListWrap').css('display', 'none')
		} else {
		    //$("div").hide();  //display :block 일떄
		    $('.infoDetailWrap').css('display', 'none')
 			$('.infoListWrap').css('display', 'block')
		}


	}

    $(".btn_iconTXT, #btn_Back").click(function(){
    	map.closePopup();
    	markerIconCheck();

    	$('.infoDetailWrap').css('display', 'none');
		$('.infoListWrap').css('display', 'block');

		//lorem.scrollTop = 0;

			for (var i = 0; i < markers.length; i++) {
				if (redIconId == markers[i].options.id) {
					map.removeLayer(markers[i]);

					var t = L.marker([markers[i].options.lat, markers[i].options.lng], {
						id: markers[i].options.id,
						lat: markers[i].options.lat,
						lng: markers[i].options.lng,
						ctime: markers[i].options.ctime,
						deviceId: markers[i].options.deviceId,
						deviceName: markers[i].options.deviceName,
						addrName: markers[i].options.addrName,
						//icon:blueIcon,
						//icon:redIcon
						icon: blueIcon
					}).on('click', onClick);

					markers[i] = t;
					markerCluster.addLayer(t);
					map.addLayer(markerCluster);
				}
			}
    });

    //  우측 패널 펼치기
    $(".btn_infoWrap").click(function(){

        if($(".infoWrap").hasClass("on")){
        	// 접음
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

            map.closePopup();
        	markerIconCheck();
        } else{

			if ( $('.menu_bar_close').css('display') == 'block' ) {
				$('.level_list').css('width', 'calc(100% - 400px)');
            	$('.re-search-container').css('width', 'calc(100% - 400px)');
			} else if ( $('.menu_bar_close').css('display') == 'none' ) {
				$('.level_list').css('width', 'calc(100% - 180px)');
            	$('.re-search-container').css('width', 'calc(100% - 180px)');
			}

            $('.btn_infoWrap').removeClass("off");

            // 펼침
            $('.infoWrap').addClass('on');
            $('.infoListWrap').css('display', 'block');
        	//$(".infoListWrap p").text("총  건")
        	if($('.infoListItem').length < 1) {
        		$('.infoListWrapNoData').css('display', 'block')
        	}

        	lorem.scrollTop = 0;
        }

    });


    // 좌측 메뉴바 동작
    $(".menu_bar_close").click(function(){

		if ( $('.infoListWrap').css('display') == 'block' ) {
			$('.level_list').css('width', '1485px');
            $('.re-search-container').css('width', '1485px');
		} else if ( $('.infoListWrap').css('display') == 'none' ) {
			$('.level_list').css('width', '1845px');
            $('.re-search-container').css('width', '1845px');
		}

    });


    // 좌측 메뉴바 동작
    $(".menu_bar").click(function(){

		if ( $('.infoListWrap').css('display') == 'block' ) {
			$('.level_list').css('width', '1285px');
            $('.re-search-container').css('width', '1285px');
		} else if ( $('.infoListWrap').css('display') == 'none' ) {
			$('.level_list').css('width', '1645px');
            $('.re-search-container').css('width', '1645px');
		}
    });

    function onClick(e) {

		// 마커 클릭 이벤트
		// e.target.options.id
		//marker.setIcon(redIcon);

		// 이전에 클릭된 마커가 있으면 원래 아이콘(blueIcon)으로 변경
	    if (activeMarker) {
	        activeMarker.setIcon(blueIcon);
	    }

		this.setIcon(redIcon);

		// 현재 클릭된 마커를 추적
	    activeMarker = this;

    	detail(e.target.options.id
				, e.target.options.deviceName
				, e.target.options.deviceId
				, e.target.options.addrName
				, e.target.options.ctime
				, e.latlng.lat
				, e.latlng.lng
				, 'N'
			)
    }


</script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/lozad/dist/lozad.min.js"></script>
<script>
function getCdNa(selectedCnda, authCdNa){
	var changedCdNa = selectedCnda;
	var cdNa = authCdNa;

	if(changedCdNa.length > 0) {
		return changedCdNa;
	} else {
		return cdNa;
	}
}

function statusName(code) {
	var statusNameByCdna = getCdNa('${authInfo.changedCdNa}', '${authInfo.cdNa}');

	// .badge_waiting(대기) .badge_warning(미분류) .badge_danger(접수완료) .badge_running(진행중) .badge_primary(보수완료)
	const result = statusKeyValue.find(item => item.code === code);

	//console.log("codeName:", result.codeName);  // "대기중"
    //console.log("codeClass:", result.codeClass); // "badge_waiting"
    //console.log('statusNameByCdna-result' , result);
    //console.log('statusNameByCdna->code' , code);

	if (result) {
	    switch (statusNameByCdna) {
        case 'KR':
            return result.codeName;
        case 'US':
            return result.codeNameEng;
        case 'JP':
        	return result.codeNameJP;
		}
	   // return result.codeName;
	} else {
		//return "미분류"
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
	// .badge_waiting(대기) .badge_warning(미분류) .badge_danger(접수완료) .badge_running(진행중) .badge_primary(보수완료)
	const result = statusKeyValue.find(item => item.code === code);

	if (result) {
	    //console.log("codeName:", result.codeName);  // "대기중"
	    //console.log("codeClass:", result.codeClass); // "badge_waiting"
	    return result.codeClass;
	} else {
	    //console.log("해당 코드를 찾을 수 없습니다.");
		return "badge_warning"
	}
}


$(document).ready(function() {
	//console.log("↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓")
	//console.log('${authInfo.mapMinSize}')
	//console.log('${authInfo.mapMaxSize}')

	//console.log('다국어 확인 ${codeListLv}'); //jj
	$('.infoListWrapNoData').css('display', 'block');
	var fromDt = '';
	var toDt = '';

	reSearchYn = false;

	fromDt = $('#fromDt').val().replaceAll('-', '');
	toDt = $('#toDt').val().replaceAll('-', '');

	// 날짜 설정 오늘날짜로부터 1주일 (임시10.1)
	var date1 = new Date();
	$('#toDt').val(fnDateFormat(date1, 'select'))
	var date2 = new Date(date1.setDate(date1.getDate() - 30));
	// $('#fromDt').val(dateFormat(date2, 'select'))
	$('#fromDt').val('2023-10-01');


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

	var requiredMsg = '<fmt:message key="CONTENTS_REQUIRED" bundle="${bundle}"/>';

	$("input:checkbox").on('click', function() {

		//alert("11")
		var checkboxName = $(this).attr('name');
		var checkboxLength = $('input:checkbox[name="' + checkboxName + '"]').length;
		var checkedCount = $('input[name="' + checkboxName + '"]:checked').length;

		// ===================================================================================================================
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
					//alert("1개 이상은 필수로 선택되어야 합니다.");
					return false;
				}
			}
		}

		if ( checkboxName == "riskAll" && ($('input:checkbox[name="risklist"]:checked').length == $('input:checkbox[name="risklist"]').length) ) {
			$("#alert_msg").html(requiredMsg);
			$("#pop_alert").stop().fadeIn(300);
			//alert("1개 이상은 필수로 선택되어야 합니다.");
			return false;

		} else if ( checkboxName == "riskAll" && ($('input:checkbox[name="risklist"]:checked').length != $('input:checkbox[name="risklist"]').length) ) {
			$("input[name='risklist']").each(function() {
				$(this).prop('checked', true);
				//$(this).click();
			});
		}
		// ===================================================================================================================
		// ===================================================================================================================
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
					//alert("1개 이상은 필수로 선택되어야 합니다.");
					return false;
				}
			}
		}

		if ( checkboxName == "allCrack" && ($('input:checkbox[name="crack"]:checked').length == $('input:checkbox[name="crack"]').length) ) {
			$("#alert_msg").html(requiredMsg);
			$("#pop_alert").stop().fadeIn(300);
			//alert("1개 이상은 필수로 선택되어야 합니다.");
			return false;
		} else if ( checkboxName == "allCrack" && ($('input:checkbox[name="crack"]:checked').length != $('input:checkbox[name="crack"]').length) ) {
			$("input[name='crack']").each(function() {
				$(this).prop('checked', true);
				//$(this).click();
			});
		}
		// ===================================================================================================================
		// ===================================================================================================================
		//  처리 상태 체크 박스 동작 이벤트
		if ( checkboxName == "statusstat" ) {
			if (checkboxLength == checkedCount) {
				$("#statusAll").prop("checked", true);
			} else {
				if (checkedCount > 0) {
					$("#statusAll").prop("checked", false);
				} else {
					//alert("1개 이상은 필수로 선택되어야 합니다.");
					$("#alert_msg").html(requiredMsg);
					$("#pop_alert").stop().fadeIn(300);
					return false;
				}
			}
		}

		if ( checkboxName == "statusAll" && ($('input:checkbox[name="status"]:checked').length == $('input:checkbox[name="statusstat"]').length) ) {
			//alert("1개 이상은 필수로 선택되어야 합니다.");
			$("#alert_msg").html(requiredMsg);
			return false;
		} else if ( checkboxName == "statusAll" && ($('input:checkbox[name="status"]:checked').length != $('input:checkbox[name="statusstat"]').length) ) {
			$("input[name='statusstat']").each(function() {
				$(this).prop('checked', true);
				//$(this).click();
			});
		}
		// ===================================================================================================================

    });



	//function handleRadioChange() {
        // 선택된 라디오 버튼 확인
        //var selectedValue = document.querySelector('input[name="sortchk"]:checked').value;
        //console.log("선택된 값:", selectedValue);
        // 추가로 처리할 작업을 여기에 작성
		//mapInfo(map);
    //}

    // 모든 라디오 버튼에 change 이벤트 리스너 추가
    //document.querySelectorAll('input[name="sortchk"]').forEach(radio => {
        //radio.addEventListener('change', handleRadioChange);
    //});

    // 페이지 로드 시 선택된 값을 확인 (선택사항)
     //document.addEventListener('DOMContentLoaded', handleRadioChange);

/*
	  // HTML의 <script> 요소를 생성한다
	  const se = document.createElement('script');
	  // <script> 요소의 src 속성을 설정한다
	  se.src = 'https://ipinfo.io?callback=callback';
	  // <body> 요소의 하위 끝에 붙인다
	  // 그리고 콜백 함수를 호출한다
	  document.body.appendChild(se);
	  // 앞서 생성한 <script> 요소를 제거한다
	  document.body.removeChild(se);

	  // 콜백 함수가 호출된다
	  function callback(data) {
	    document.getElementById('client-ip').textContent = data.ip;
	  }
 */
	  //alert(se.r)

	//console.log("${authInfo.restApiUrl}");
	//console.log("${authInfo}");
	markers = []
	setLevelList(1, '');

	//setLevelList(1, '');
	region = "${authInfo.cdNa}"

	//console.log("authInfo - ${authInfo.wtX} / ${authInfo.wtY}")
	//console.log("authInfo - ${authInfo.areaCodeLv1} / ${authInfo.areaCodeLv2}");

	var chkAreaCodeLv1 = '${authInfo.areaCodeLv1}';
	var chkAreaCodeLv2 = '${authInfo.areaCodeLv2}';

	if (chkAreaCodeLv1.length == 0) {
		setLevelList(1, '');
	} else {

		setLevelList(2, '${authInfo.areaCodeLv1}');

		if (chkAreaCodeLv1.length == 0) {
			setLevelList(3, '');
		} else {
			setLevelList(3, '${authInfo.areaCodeLv2}');
		}
	}

	//const selectedItemLv1 = document.querySelector('.optionItem[data-code="${authInfo.areaCodeLv1}"]');
	//const lat1 = selectedItemLv1.dataset.lat;
    //const lng1 = selectedItemLv1.dataset.lng;
	//const area1 = selectedItemLv1.textContent;
	//console.log($('.optionItem[data-code="${authInfo.areaCodeLv1}"]').text());

	$('#level1').data('code', '${authInfo.areaCodeLv1}');
	$('#level1').text($('.optionItem[data-code="${authInfo.areaCodeLv1}"]').text());
	//$('#level1').data('lat', lat2);
	//$('#level1').data('lng', lng2);


	$('#level2').data('code', '${authInfo.areaCodeLv2}');
	$('#level2').data('lat', '${authInfo.wtX}');
	$('#level2').data('lng', '${authInfo.wtY}');
	$('#level2').text($('.optionItem[data-code="${authInfo.areaCodeLv2}"]').text());

/* 	const setLv1 = document.getElementById('level1');
	$('#level1').data('code', '${authInfo.areaCodeLv1}');
	//setLv1.setAttribute('data-code', '${authInfo.areaCodeLv1}')

	$('#level1').text(area1);

	const selectedItemLv2 = document.querySelector('.optionItem[data-code="${authInfo.areaCodeLv2}"]');
	const lat2 = selectedItemLv2.dataset.lat;
    const lng2 = selectedItemLv2.dataset.lng;
	const area2 = selectedItemLv2.textContent;

	const setLv2 = document.getElementById('level2');
	$('#level2').data('code', '${authInfo.areaCodeLv2}');
	$('#level2').data('lat', lat2);
	$('#level2').data('lng', lng2);

	$('#level2').text(area2);  */


/* 	if( region == 'KR' ){
		setLevelList(2, '2306392');
		setLevelList(3, '2409180');
		$('#level1').text('경기도');
		$('#level1').data('code', '2306392');
	 	$('#level1').addClass("on");
	 	$('#level2').text('성남시');
	 	$('#level2').addClass("on");
	 	$('#level3').text('전체');

	 	const temp = document.getElementById('level2');
	 	temp.setAttribute('data-code', '2409180')
	 	temp.setAttribute('data-lat', '37.4201556')
	 	temp.setAttribute('data-lng', '127.1262092')

	} else if (  region == 'JP'){
		setLevelList(2, '2682940');
		setLevelList(3, '2682891');
		$('#level1').text('茨城県');
	 	$('#level1').addClass("on");
	 	$('#level2').text('つくば市');
	 	$('#level2').addClass("on");


	 	const temp = document.getElementById('level2');
	 	temp.setAttribute('data-code', '2682891')


	} */

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

 	function fn_create_time (time) {

 		var date = new Date(time)

		var c_time = date.getFullYear() + '.' + (date.getMonth()+1) + '.'
					+ date.getDate() + '. '
					+ date.getHours() + ':' + date.getMinutes() + '';

		return c_time;
	}

 	function fn_add_marker( response ) {

 		for (var i = 0; i < response.data.length; i++) {

			var item = response.data[i];
			//console.log(deviceKeyValue)
			var deviceId = fn_device_id(item['device-id']);
			var deviceNm = fn_device_name(item['device-id']);

			//var c_time = fn_create_time(item['created-at'])
			var date = new Date(fn_create_time(item['timestamp']));

			var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 );
			var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate();
			var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours();
			var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes();
			var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds();

			c_time  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec;

			var addr_po_locality = (item.way.name == null || item.way.name == '') ? "<fmt:message key="ROAD_INFO_NOT_EXISTS" bundle="${bundle}"/>" : item.way.name;

			//  Create and save a reference to each marker

		}
 	}

// -------------------------------------------------------------------------------------------------------------------------------------------------------------
// 검색버튼 클릭 이벤트
$('.btn_search').on("click", function(){

	reSearchYn = false;

	map.eachLayer(function (layer) {
	    if (!(layer instanceof L.TileLayer)) {
	        map.removeLayer(layer);
	    }
	});
/*
	map.eachLayer(function(layer) {
		if (layer instanceof L.Marker) {
			map.removeLayer(layer);
		}
	});

	map.removeLayer(firstpolyline) */

	var areaCode;

	if(searchLv == 2 || searchLv == 3){

		if ($("#level3").data('code') > 0) {
			map.setView([$("#level3").data().lat, $("#level3").data().lng], map.getZoom())
			//map.setView([$("#level3").data().lat, $("#level3").data().lng], 14)
			areaCode = $("#level3").data('code');
		} else if ($("#level2").data('code') > 0) {
			map.setView([$("#level2").data().lat, $("#level2").data().lng], map.getZoom())
			//map.setView([$("#level2").data().lat, $("#level2").data().lng], 12)
			areaCode = $("#level2").data('code');
		}

	} else {
		$("#alert_msg").html("Level1과 Level2는 필수선택사항입니다.");
		$("#pop_alert").stop().fadeIn(300);
    	$("#pop_alert").stop().fadeIn(300);
	}

	//console.log(">>>>>> ", $("#level2").data().code)
/*
	if ($("#level2").data().code) {
		searchLv = 2
	} */

	/* if (searchLv == undefined) {
		searchLv = 2
		const temp = document.getElementById('level2');
	 	temp.setAttribute('data-code', '2409180');
	 	temp.setAttribute('data-lat', '37.4201556');
	 	temp.setAttribute('data-lng', '127.1262092');
	} */


	//console.log("1 - ", $("#level1").data('code'));
	//console.log("2 - ", $("#level2").data('code'));
	//console.log("3 - ", $("#level3").data('code'));

	/* if ($("#level2").text() == "Level2") {
		searchLv = 1
	} */

	/* if ($("#level2").data().code.length == undefined ) {
		searchLv = 1
	} */

	//console.log("searchLv>> ", searchLv)


/* 	if(searchLv == 2 || searchLv == 3){

		if ($("#level3").data('code') > 0) {
			//map.setView([$("#level3").data().lat, $("#level3").data().lng], map.getZoom())
			map.setView([$("#level3").data().lat, $("#level3").data().lng], 14)
		} else if ($("#level2").data('code') > 0) {
			//map.setView([$("#level2").data().lat, $("#level2").data().lng], map.getZoom())
			map.setView([$("#level2").data().lat, $("#level2").data().lng], 12)
		}

	} else {
		$("#alert_msg").html("Level1과 Level2는 필수선택사항입니다.");
		$("#pop_alert").stop().fadeIn(300);
    	$("#pop_alert").stop().fadeIn(300);
	} */

	$.ajax({
		type: "GET",
		url: "${authInfo.restApiUrl}/pothole",
		//url: "http://localhost:8080/pothole",
		data: {
			on_way:false,
			administrative_id: areaCode,
			//north_west:"latitude:" + map.getBounds().getNorthWest().lat + ",longitude:" + map.getBounds().getNorthWest().lng,
			//north_east:"latitude:" + map.getBounds().getNorthEast().lat + ",longitude:" + map.getBounds().getNorthEast().lng,
			//south_west:"latitude:" + map.getBounds().getSouthWest().lat + ",longitude:" + map.getBounds().getSouthWest().lng,
			//south_east:"latitude:" + map.getBounds().getSouthEast().lat + ",longitude:" + map.getBounds().getSouthEast().lng,
			region:"${authInfo.cdNa}",
			devices: deviceIdList
		},
		success: drawMarkers,
		error: function(request,status,error){

			//console.log("request.status = " + request.status)

		},
		beforeSend:function(){
			$('#circularG').css('display','block')
		},
		complete : function(data) {
			//  실패했어도 완료가 되었을 때 처리
			$('#circularG').css('display','none')
		}
	})

	$.ajax({
		type: "GET",
		//url: "${authInfo.restApiUrl}/pothole",
		url: "${authInfo.restApiUrl}/administrative/boundary" ,
		data: {
			administrative_id: areaCode, //성남시
			region:"${authInfo.cdNa}",
		},
		success: function(resp) {

			datas = resp.data
			console.log('바운더리 확인', datas);

			var boundaryLines = []

			for (var i = 0; i < datas.length-1; i++) {

				//console.log('x - ', datas[i].x, '   / y - ', datas[i].y);

				//var thisData = datas[i];

				var pointA = new L.LatLng(datas[i].y, datas[i].x);
				var pointB = new L.LatLng(datas[i+1].y, datas[i+1].x);

				var pointList = [ pointA, pointB ];

				var riskLvColor = "";

				var linesize = 5;

				var firstpolyline = new L.Polyline(pointList, {
				    //color: 'red',
				    //color: 'Violet',
				    color: '#2f33fb',
				    //weight: 15,
				    weight: linesize,
				    //opacity: 0.1,
				    smoothFactor: 1

				    })//.on('click', function(e) {
				    	//alert('Polyline clicked at ' + e.latlng);
			            // You can also handle other actions here
			            //wayMarkerList(response ,wayname)
			        //});;

				map.addLayer(firstpolyline);

				boundaryLines.push(firstpolyline);
			}

		},
		error: function(request,status,error){

			//console.log("request.status = " + request.status)

		},
		beforeSend:function(){
			$('#circularG').css('display','block')
		},
		complete : function(data) {
			//  실패했어도 완료가 되었을 때 처리
			$('#circularG').css('display','none')

		}
	})


})


	function drawMarkers(response) {

		$("#info").hide();
		//$('.infoListWrap').css('display', 'block')
		$('.infoDetailWrap').css('display', 'none')
		map.closePopup();
		lorem.scrollTop = 0;

        $('#sort').data('code','desc');
        $('#sort').text('<fmt:message key="DATE_DESC" bundle="${bundle}"/>');

        /* // 선택된 옵션에 클래스를 추가하거나 활성화 처리
        if (descOption) {
            // 클래스 추가하여 선택된 상태로 보이게 (예시: active)
            descOption.classList.add('selected');

            // 버튼의 data-code도 업데이트
            document.getElementById('sort').setAttribute('data-code', 'desc');
        } */

		//console.log("API 호출결과 - ", response)

		//var alligators = 0, horizontal = 0, potholes = 0, vertical = 0;

	/* 	for (var i = 0 ; i < response.data.length ; i++ ) {
			console.log("▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ " + i + " " + i + " " + i + " " + i + " " + i + " " + "▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼")
			console.log(
					"count-of-alligators = " +  response.data[i].risk['count-of-alligators'] + "\n" +
					"count-of-horizontal-cracks = " +  response.data[i].risk['count-of-horizontal-cracks'] + "\n" +
					"count-of-potholes = " +  response.data[i].risk['count-of-potholes'] + "\n" +
					"count-of-vertical-cracks = " +  response.data[i].risk['count-of-vertical-cracks']
			)
			alligators += Number(response.data[i].risk['count-of-alligators']);
			horizontal += Number(response.data[i].risk['count-of-horizontal-cracks']);
			potholes += Number(response.data[i].risk['count-of-potholes']);
			vertical += Number(response.data[i].risk['count-of-vertical-cracks']);
		}
		console.log("alligators = " + alligators + " / horizontal = " + horizontal + " / potholes = " + potholes + " / vertical = " + vertical)
 */
		//console.log("************************************************************")

		allData = response.data;

		markerList = []

		markerId = []

		if (!(response.data.length >= 1) ) {
		    if ($(".infoListWrap").css("display") == "none") {
	        	// 접음
	        	$('.infoListWrapNoData').css('display', 'none')

	        } else{
	        	// 펼침
	            if ($(".infoWrap").hasClass("on")) {
	        		$('.infoListWrapNoData').css('display', 'block')
				    $('.infoListWrap').css('display', 'none')
	        	}
	        }

		} else {
			$('.infoListWrapNoData').css('display', 'none')
			//$('.infoListWrap').css('display', 'block')
		}

	// MarkerCluster 그룹 생성
	markerCluster = L.markerClusterGroup({
        disableClusteringAtZoom: 19, // 설정한 줌 레벨  이상에서 클러스터 해제
        maxClusterRadius: 30,        // 클러스터링 반경 50px로 설정
        iconCreateFunction: function(cluster) {
            var count = cluster.getChildCount();
			return L.divIcon({
                //html: '<div style="background-color:black; color:white"><b>테에스으트으</b></div>',
				html: '<div>' + count + '</div>',
                className: 'mycluster',
                iconSize: L.point(40, 40)
            });
        },
		/* iconCreateFunction: function(cluster) {
            return L.divIcon({
                html: '<b>' + cluster.getChildCount() + '</b>',
                className: 'mycluster',
                iconSize: L.point(40, 40)
            });
        },*/
        spiderfyOnMaxZoom: false,
        zoomToBoundsOnClick: false,
		showCoverageOnHover: false // 마우스 오버 시 폴리곤 비활성화
    });

 			sumMarker = [];
 			sumMarkerTest = [];

			var cnt = 0;

			ss = new Date($("#fromDt").val());
			ee = new Date($("#toDt").val());


 		 for (var i = 0; i < response.data.length; i++) {

 			 var markerdate = new Date(response.data[i].timestamp);

 			 if (!(ss < markerdate && ee > markerdate)) {
				continue;
 			 }

			var item = response.data[i];
			//console.log(deviceKeyValue)
			var deviceId = fn_device_id(item['device-id']);
			var deviceNm = fn_device_name(item['device-id']);

			//var c_time = fn_create_time(item['created-at'])
			var date = new Date(fn_create_time(item['timestamp']));

			var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 );
			var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate();
			var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours();
			var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes();
			var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds();

			c_time  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec;

			var addr_po_locality = (item.way.name == null || item.way.name == '') ? "<fmt:message key="ROAD_INFO_NOT_EXISTS" bundle="${bundle}"/>" : item.way.name;

			//===========================================================================================================
			// *********************************************************************************

			var t = L.marker([item.point.latitude, item.point.longitude], {
				id : item['id'],
				lat : item.point['latitude'],
				lng : item.point['longitude'],
				ctime : c_time,
				deviceId : deviceId,
				deviceName : deviceNm,
				addrName : addr_po_locality,
				icon : blueIcon,
				//icon:redIcon
			})//.addTo(map)
				//.on('mouseover', onClick1)
				.on('click', onClick);
			// *********************************************************************************
			// ===========================================================================================================
			markerCluster.addLayer(t);
			markers.push(t);
			markerId.push(item['id']);

			//ClusterMarkers.addLayer(t);

		}

		// 마커 클러스터 그룹에 클릭 이벤트 추가
		markerCluster.on('clusterclick', function(event) {
			var cluster = event.layer;
			var childMarkers = cluster.getAllChildMarkers();

			// 팝업 내용 생성
			var popupContent = '<b>Cluster contains ' + childMarkers.length + ' markers:</b><br>';
			//console.log('childMarkers -- ', childMarkers)
			childMarkers.forEach(function(marker, index) {

				console.log(marker.options.id + "\n"
							+ marker.options.deviceName + "\n"
							+ marker.options.deviceId + "\n"
							+ marker.options.addrName + "\n"
							+ marker.options.ctime + "\n"
				);

				var item = marker.options;
				//popupContent += 'Marker ' + (index + 1) + ' : ' + marker.getLatLng().toString() + '<br>';

				const currentTheme = document.documentElement.getAttribute('data-theme');

				var mouseoverTxt, mouseoutTxt;

				if (currentTheme == "light") {
					mouseoverTxt = "onmouseover=\"this.style.color='blue'; this.style.cursor='pointer'\""
					mouseoutTxt = "onmouseout=\"this.style.color='black'\" "
				} else if (currentTheme == "dark") {
					mouseoverTxt = "onmouseover=\"this.style.color='orange'; this.style.cursor='pointer'\""
					mouseoutTxt = "onmouseout=\"this.style.color='white'\" "
				}


				popupContent += "Marker " + (index + 1) + " : <b id='" + marker.options.id + "'"
														//+ "onmouseover=\"this.style.color='blue'; this.style.cursor='pointer'\""
														//+ "onmouseout=\"this.style.color='black'\" "
														+ mouseoverTxt
														+ mouseoutTxt
														+ "onClick=\"detail('" + item.id + "', '" + item.deviceName + "', '" + item.deviceId + "', '" +  item.addrName + "', '" + item.ctime + "', '" + item.lat + "', '" + item.lng + "', 'Y')\">" + marker.getLatLng().toString() + "</b><br>";
			});

			//console.log('markerCluster >>> ', markerCluster);
			// 첫 번째 마커의 위치를 팝업 위치로 사용
			//var popupLatLng = childMarkers[0].getLatLng();
			var popupLatLng = cluster.getLatLng();

			// 팝업 생성 및 오픈
			//cluster.bindPopup(popupContent).openPopup();

			var popup = L.popup()
						.setLatLng(popupLatLng)  // 팝업 위치 설정
						.setContent(popupContent)
						.openOn(map);
		});

		map.addLayer(markerCluster);

		potholeCnt = response.data.length;
		potholeListData = response.data;

		var numItems = $('.infoListItem').length;

		$('.infoList li').remove();
		//sortedTestDD[i].key
		//console.log("확인할 부분 - ", sortedTestDD)

			//for (var x = 0 ; x < makeMarkerList.length ; x++ ) {
		//for (var x = 0 ; x < sortedTestDD.length ; x++ ) {

			// var markerdate2 = new Date(sortedTestDD[x].value);

			// if (!(ss < markerdate2 && ee > markerdate2)) {
 			// 	//console.log(markerdate)
			// 	continue;
 			//  }

			//testttt(response.data)


			$.each(response.data, function(index) {

				var markerdate2 = new Date(response.data[index].timestamp);

				if (!(ss < markerdate2 && ee > markerdate2)) {
					//console.log(markerdate)
					//continue; each 문 안에서는 continue 가 아닌 return을 사용해야함
					return;
				}

				//if (makeMarkerList[x] == index) {
				//if (sortedTestDD[x].key == index) {

					var date = new Date(response.data[index]['timestamp']);

					var dateFormat = date.getFullYear() + '.' + (date.getMonth()+1) + '.'
									+ date.getDate() + ' '
									+ date.getHours() + ':' + date.getMinutes() ;

					var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 );
					var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate();
					var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours();
					var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes();
					var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds();

					dateFormat  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec;

					//var addr_po_locality = response.data[index].way == null ? "도로정보 없음" : response.data[index].way.name
					//var addr_po_locality = (item.way.name == null || item.way.name == '') ? "도로정보 없음" : item.way.name
					var addr_po_locality = (response.data[index].way.name == null || response.data[index].way.name == '') ? "<fmt:message key="ROAD_INFO_NOT_EXISTS" bundle="${bundle}"/>" : response.data[index].way.name
					var macAddr = response.data[index]['device-id'];
					var id = response.data[index].id;

					//var status = response.data[index].status;
					//var status = statusCheck(response.data[index].status);
					//var name = statusKeyValue.find(item => item.code === response.data[index].status).codeName;
					//var className = statusKeyValue.find(item => item.code === response.data[index].status).codeClass;

					var name = statusName(response.data[index].status);
					var className = statusClassName(response.data[index].status);


					//var dd = Object.keys(object).find(key => object[key] === value);
					/* const result = statusKeyValue.find(item => item.code === "A");

					if (result) {
					    console.log("codeName:", result.codeName);  // "대기중"
					    console.log("codeClass:", result.codeClass); // "badge_waiting"
					} else {
					    console.log("해당 코드를 찾을 수 없습니다.");
					} */

					var device_name = "";
					var device_id = "";

					for (var i=0; i< deviceKeyValue.length;i++) {
						if (deviceKeyValue[i].macAddr == macAddr){
							device_name = deviceKeyValue[i].deviceNm;
							device_id = deviceKeyValue[i].deviceId;
						}
					}

					let reg = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/ ]/gim;
					let resultData = id.replace(reg, "");

					//console.log("status -- ", i , status)
					//Object.keys(object).find(key => object[key] === value);


					//if (potholeChk && (response.data[index].risk['count-of-potholes'] > 0)) {
					//if (verticalChk && (response.data[index].risk['count-of-vertical-cracks'] > 0) ) {
					//if (alligatorsChk && (response.data[index].risk['count-of-alligators'] > 0) ) {


					// .badge_waiting(대기) .badge_warning(미분류) .badge_danger(접수완료) .badge_running(진행중) .badge_primary(보수완료)
					markerList.push("<li><a class='infoListItem'>"
						+ "<div class='info'><div class='tit'>"
						//+ "<span class='badge sm badge_running'>진행중</span>"
						+ "<span class='badge sm " + className + "'>" + name + "</span>"
							+ "<h3 class='infoTitle' onClick=\"detail('" + id + "', ' " + device_name + "', '" + device_id + "', '" + addr_po_locality + "', '" + dateFormat + "', '" + response.data[index].point['latitude'] + "', '" + response.data[index].point['longitude'] + "', 'N')\"'>" + device_name + " ( " + device_id + " )</h3></div>"
						+ "<ul class='infoContents'>"
						+ "<li> <fmt:message key="ROAD_NAME" bundle="${bundle}"/> : " + addr_po_locality + "</li>"
						+ "<li> <fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/> : " + dateFormat + "</li>"
						+ "</ul>"
						+ "</div>"
						+ "<div class='infoThumnail'>"
						+ "<img src='${authInfo.restApiUrl}/pothole/" + id + "/thumbnail' alt='대표이미지' onclick=\"originalimg('" + id + "')\">"
						+ "</div>"
						+ "</li>"
					);
					//}

				//}
			})
		//}

		for ( var i = 0; i < markerList.length; i++ ) {
			if(i<10) {
				$(".infoList").append(markerList[i])
			}
		}

		//$(".infoListWrap p").text("<fmt:message key="TOTAL" bundle="${bundle}"/> "+ response.data.length + " <fmt:message key="COUNT2" bundle="${bundle}"/>")
		$(".infoListWrap p").text("<fmt:message key="TOTAL" bundle="${bundle}"/> "+ markerList.length + " <fmt:message key="COUNT2" bundle="${bundle}"/>");
		//$('.infoListWrap').css('display', 'block');
		// ------------------------------------------------------------------------------------------------------------------------------
		if ( $('.menu_bar_close').css('display') == 'block' ) {
				$('.level_list').css('width', 'calc(100% - 400px)');
            	$('.re-search-container').css('width', 'calc(100% - 400px)');
			} else if ( $('.menu_bar_close').css('display') == 'none' ) {
				$('.level_list').css('width', 'calc(100% - 180px)');
            	$('.re-search-container').css('width', 'calc(100% - 180px)');
			}

            $('.btn_infoWrap').removeClass("off");

            // 펼침
            $('.infoWrap').addClass('on');
            $('.infoListWrap').css('display', 'block');
        	//$(".infoListWrap p").text("총  건")
        	if($('.infoListItem').length < 1) {
        		$('.infoListWrapNoData').css('display', 'block')
        	}

        	lorem.scrollTop = 0;

		// ------------------------------------------------------------------------------------------------------------------------------



		if($('#searchSort').data('code') == "asc"){
			$('#asc').click();
		} else if ($('#searchSort').data('code') == "desc") {
			$('#desc').click();
		}

	}

	old_id = "";
	console.log("authInfo - ${authInfo.wtX} / ${authInfo.wtY}")

	map = L.map('map').setView({lat:"${authInfo.wtX}", lng:"${authInfo.wtY}"}, 12);

	L.control.scale({
		imperial: true, metric: true
	}).addTo(map);

	L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
		//minZoom: 14,
		//maxZoom: 19,
		minZoom: '${authInfo.mapMinSize}',
		maxZoom: '${authInfo.mapMaxSize}',
		attribution: '© OpenStreetMap',
		stylers:[{visibility:'off'}]
	    //stylers:[{visibility:'off'}]
	}).addTo(map);

	//mapInfo(map);
	$('.btn_search').click();

	map.on('click', onMapClick);

	map.on('zoomend', function() {
	    var zoomLevel = map.getZoom();
	    console.log('Zoom level changed to:', zoomLevel);

	    if (zoomLevel > 10) {
	        console.log("High zoom level, change cluster behavior...");
	    } else {
	        console.log("Low zoom level, reset cluster behavior...");
	    }
	  //markerCluster.off();
	});

	map.on("moveend", function() {

		reSearchYn = false;


		//$('.infoList li').remove();
		//$('.infoList div').remove();

		//optionReset();
		/* const searchOpt = document.getElementById('re-search-container');

		if(searchOpt.style.display === 'block') {
			searchOpt.style.display = 'none';
		}

		map.closePopup(); */

		//$('.infoDetailWrap').css('display', 'none')
		//$('.infoListWrap').css('display', 'block')

		//mapInfo(map);
	});

	function nodata(map) {
		//$("div").show(); //display :none 일떄
		$('.infoListWrapNoData').css('display', 'block')
		$('.infoListWrap').css('display', 'none')
	}

	function mapInfo(map) {
		var lat = map.getCenter().lat;
		var lng = map.getCenter().lng;

		map.eachLayer(function(layer) {
			if (layer instanceof L.Marker) {
				map.removeLayer(layer);
			}
		});

		redIconId = "";
		markers = [];
		//console.log($("#level1").data('code'))
		console.log($("#level2").data('code'))
		console.log($("#level3").data('code'))

		var areaCode;

		if(searchLv == 2 || searchLv == 3){

			if ($("#level3").data('code') > 0) {
				//map.setView([$("#level3").data().lat, $("#level3").data().lng], map.getZoom())
				//map.setView([$("#level3").data().lat, $("#level3").data().lng], 14)
				areaCode = $("#level3").data('code');
			} else if ($("#level2").data('code') > 0) {
				//map.setView([$("#level2").data().lat, $("#level2").data().lng], map.getZoom())
				//map.setView([$("#level2").data().lat, $("#level2").data().lng], 12)
				areaCode = $("#level2").data('code');
			}

		} else {
			$("#alert_msg").html("Level1과 Level2는 필수선택사항입니다.");
			$("#pop_alert").stop().fadeIn(300);
	    	$("#pop_alert").stop().fadeIn(300);
		}

	/*
		if ($("#level3").data('code') > 0) {
			//map.setView([$("#level3").data().lat, $("#level3").data().lng], map.getZoom())
			map.setView([$("#level3").data().lat, $("#level3").data().lng], 14)
		} else if ($("#level2").data('code') > 0) {
			//map.setView([$("#level2").data().lat, $("#level2").data().lng], map.getZoom())
			map.setView([$("#level2").data().lat, $("#level2").data().lng], 12)
		}
	*/
 		/* $.ajax({
			type: "GET",
			url: "${authInfo.restApiUrl}/pothole",
			//url: "http://localhost:8080/pothole",
			data: {
				on_way:false,
				administrative_id: areaCode,
				//north_west:"latitude:" + map.getBounds().getNorthWest().lat + ",longitude:" + map.getBounds().getNorthWest().lng,
				//north_east:"latitude:" + map.getBounds().getNorthEast().lat + ",longitude:" + map.getBounds().getNorthEast().lng,
				//south_west:"latitude:" + map.getBounds().getSouthWest().lat + ",longitude:" + map.getBounds().getSouthWest().lng,
				//south_east:"latitude:" + map.getBounds().getSouthEast().lat + ",longitude:" + map.getBounds().getSouthEast().lng,
				region:"${authInfo.cdNa}",
				devices:deviceIdList
			},
			success: drawMarkers,
			error: function(request,status,error){

				//console.log("request.status = " + request.status)

			},
			beforeSend:function(){
				$('#circularG').css('display','block')
			},
			complete : function(data) {
				//  실패했어도 완료가 되었을 때 처리
				$('#circularG').css('display','none')
			}
		}) */




		/* $.ajax({
			type: "GET",
			//url: "${authInfo.restApiUrl}/pothole",
			url: "${authInfo.restApiUrl}/administrative/boundary" ,
			data: {
				administrative_id: areaCode, //성남시
				region:"${authInfo.cdNa}",
			},
			success: function(resp) {

				datas = resp.data
				console.log('바운더리 확인', datas);

				var boundaryLines = []

				for (var i = 0; i < datas.length-1; i++) {

					//console.log('x - ', datas[i].x, '   / y - ', datas[i].y);

					//var thisData = datas[i];

					var pointA = new L.LatLng(datas[i].y, datas[i].x);
					var pointB = new L.LatLng(datas[i+1].y, datas[i+1].x);

					var pointList = [ pointA, pointB ];

					var riskLvColor = ""

					var linesize = 13

					var firstpolyline = new L.Polyline(pointList, {
					    //color: 'red',
					    color: 'red',
					    //weight: 15,
					    weight: linesize,
					    //opacity: 0.1,
					    smoothFactor: 1

					    })//.on('click', function(e) {
					    	//alert('Polyline clicked at ' + e.latlng);
				            // You can also handle other actions here
				            //wayMarkerList(response ,wayname)
				        //});;

					map.addLayer(firstpolyline);

					boundaryLines.push(firstpolyline);
				}

			},
			error: function(request,status,error){

				//console.log("request.status = " + request.status)

			},
			beforeSend:function(){
				$('#circularG').css('display','block')
			},
			complete : function(data) {
				//  실패했어도 완료가 되었을 때 처리
				$('#circularG').css('display','none')

			}
		}) */


	}

    //const lorem = document.querySelector(".infoList");
    lorem = document.querySelector(".infoList");

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


})

function setLevelList(level, id){

	region = "${authInfo.cdNa}"

	// 레벨1인 경우
	if(level == 1){

	 	var node = document.getElementById('level2_ul')
	 	node.innerHTML = '';
	 	var node = document.getElementById('level3_ul')
	 	node.innerHTML = '';
	 	/* var node = document.getElementById('level4_ul')
	 	node.innerHTML = ''; */
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

	 	/* var node = document.getElementById('level4_ul')
	 	node.innerHTML = ''; */

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
		         $('#circularG').css('display','block')
		    },
		    complete:function(){
			      $('#circularG').css('display','none')
		    
		    },
			success: function(resp) {

				datas = resp.data

			 	var node = document.getElementById('level2_ul')
			 	node.innerHTML = '';

            	var html = '';

	            for(var i = 0; i <datas.length; i++){
	            	data = datas[i]
	            	//html += '<li class="optionItem" data-code="' + data.id + '">' + data.name + '</li>'
	            	html += '<li class="optionItem" data-code="' + data.id + '" data-lat="' + data.center.latitude + '" data-lng="' + data.center.longitude + '">' + data.name + '</li>'

				}

	            node.innerHTML = html;
			}

		})


	} else if(level == 3) {

		/* var node = document.getElementById('level4_ul')
	 	node.innerHTML = ''; */

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
		         $('#circularG').css('display','block')
		    },
		    complete:function(){
			      $('#circularG').css('display','none')
		    
		    },
			success: function(resp) {

				datas = resp.data

			 	var node = document.getElementById('level3_ul')
			 	node.innerHTML = '';

            	//var html = '';
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

		if(!value)value='';
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

			//추후처리할수도 있어서 만들어둠
		}
	});


}



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

$('#sortchk .sorting').on('click', function() {
    // 클릭된 'optionItem'의 data-value 값을 가져옵니다.
    var selectedValue = $(this).data('code');

    var risklistLength = $('input:checkbox[name="risklist"]').length;
    var crackLength = $('input:checkbox[name="crack"]').length;
    var statusstatLength = $('input:checkbox[name="statusstat"]').length;

    var risklistcheckeds = $('input[name="risklist"]:checked').length;
    var crackcheckeds = $('input[name="crack"]:checked').length;
    var statusstatcheckeds = $('input[name="statusstat"]:checked').length;

    var riskBoolean = false;
    var crackBoolean = false;
    var statusstatBoolean = false;

    if (risklistLength == risklistcheckeds) {
    	riskBoolean = true;
    }

    if (crackLength == crackcheckeds) {
    	crackBoolean = true;
    }

    if (statusstatLength == statusstatcheckeds) {
    	statusstatBoolean = true;
    }


    var data = allData;

    if (riskBoolean && crackBoolean && statusstatBoolean) {
		data = allData;
    } else {
    	data = sortDataList;
    }

	// ------------------------------------------------------------------------------------------------------------------------------------------------------
	var markerListSort = [];

	//const data = allData;

	//data.sort((a, b) => new Date(a.timestamp) - new Date(b.timestamp));

	//allData.sort((a, b) => {
		//const dateA = new Date(a.querySelector('.infoContents li:nth-child(2)').textContent.replace(' 촬영일시 : ', ''));
		//const dateB = new Date(b.querySelector('.infoContents li:nth-child(2)').textContent.replace(' 촬영일시 : ', ''));

		//const dateA = data.sort((a, b) => new Date(a.timestamp) - new Date(b.timestamp));
		//const dateB = data.sort((b, a) => new Date(b.timestamp) - new Date(a.timestamp));

		if (selectedValue == "asc") {
			//return dateB - dateA;
			console.log(">>>>>>>  asc  <<<<<<<")
			data.sort((a, b) => new Date(a.timestamp) - new Date(b.timestamp));
		} else {
			//return dateA - dateB;
			console.log(">>>>>>>  desc  <<<<<<<")
			data.sort((a, b) => new Date(b.timestamp) - new Date(a.timestamp));
		}

	//});

	console.log(data);
	///console.log("sort - ", allData)

	$('.infoList li').remove()
	//sortedTestDD[i].key
	//console.log("확인할 부분 - ", sortedTestDD)

	//for (var x = 0 ; x < makeMarkerList.length ; x++ ) {
	//for (var x = 0 ; x < sortedTestDD.length ; x++ ) {

		var cnt = 0;
		$.each(data, function(index) {
		//$.each(response.data, function(index) {

			//var markerdate2 = new Date(response.data[index].timestamp);
			var markerdate2 = new Date(data[index].timestamp);

			if (!(ss < markerdate2 && ee > markerdate2)) {
				//console.log(markerdate)
				//continue; each 문 안에서는 continue 가 아닌 return을 사용해야함
				return;
			}
			cnt++;
				//var date = new Date(response.data[index]['timestamp'])
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

			//var addr_po_locality = response.data[index].way == null ? "도로정보 없음" : response.data[index].way.name
			//var addr_po_locality = (item.way.name == null || item.way.name == '') ? "도로정보 없음" : item.way.name
			//var addr_po_locality = (response.data[index].way.name == null || response.data[index].way.name == '') ? "도로정보 없음" : response.data[index].way.name
			var addr_po_locality = (data[index].way.name == null || data[index].way.name == '') ? "<fmt:message key="ROAD_INFO_NOT_EXISTS" bundle="${bundle}"/>" : data[index].way.name;
			//var macAddr = response.data[index]['device-id'];
			var macAddr = data[index]['device-id'];
			//var id = response.data[index].id;
			var id = data[index].id;

			var name = statusName(data[index].status);
			var className = statusClassName(data[index].status);

			var device_name = "";
			var device_id = "";

			for (var i=0; i< deviceKeyValue.length;i++) {
				if (deviceKeyValue[i].macAddr == macAddr){
					device_name = deviceKeyValue[i].deviceNm;
					device_id = deviceKeyValue[i].deviceId;
				}
			}

			let reg = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/ ]/gim;
			let resultData = id.replace(reg, "");

			markerListSort.push("<li><a class='infoListItem'>" //jj 다국어 리스트
							+ "<div class='info'><div class='tit'>"
							//+ "<span class='badge sm badge_running'>진행중</span>"
							+ "<span class='badge sm " + className + "'>" + name + "</span>"
								+ "<h3 class='infoTitle' onClick=\"detail('" + id + "', ' " + device_name + "', '" + device_id + "', '" + addr_po_locality + "', '" + dateFormat + "', '" + data[index].point['latitude'] + "', '" + data[index].point['longitude'] + "', 'Y')\"'>" + device_name + " ( " + device_id + " )</h3></div>"
							+ "<ul class='infoContents'>"
							+ "<li> <fmt:message key="ROAD_NAME" bundle="${bundle}"/> : " + addr_po_locality + "</li>"
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

	//$(".infoListWrap p").text("<fmt:message key="TOTAL" bundle="${bundle}"/> " + data.length + " <fmt:message key="COUNT2" bundle="${bundle}"/>")
	$(".infoListWrap p").text("<fmt:message key="TOTAL" bundle="${bundle}"/> " + cnt + " <fmt:message key="COUNT2" bundle="${bundle}"/>")


	// ------------------------------------------------------------------------------------------------------------------------------------------------------

	/*
	var selectedValue = $(this).data('value');
	console.log("선택된 값:", selectedValue);

	// infoList 요소 가져오기
	const infoList = document.querySelector('.infoList');

	// li 요소들을 배열로 변환
	const itemsArray = Array.from(infoList.children);

	// 각 li 요소에서 촬영일시를 추출하여 정렬
	itemsArray.sort((a, b) => {
		const dateA = new Date(a.querySelector('.infoContents li:nth-child(2)').textContent.replace(' 촬영일시 : ', ''));
		const dateB = new Date(b.querySelector('.infoContents li:nth-child(2)').textContent.replace(' 촬영일시 : ', ''));

		if (selectedValue == "desc") {
			return dateB - dateA;
		} else {
			return dateA - dateB;
		}

	});

	// 정렬된 순서로 infoList에 다시 추가
	itemsArray.forEach(item => infoList.appendChild(item));
	*/


});

/* $("input:checkbox").on('click', function() {

	 alert("dfdf")
	if ( $(this).prop('checked') ) {
      $(this).parent().addClass("selected");
    } else {
      $(this).parent().removeClass("selected");
    }
  }); */


$(".risklist").change(function(){

	/* alert("체크박스!");

	if($("#checkBoxId").is(":checked")){
        alert("체크박스 체크했음!");
    }else{
        alert("체크박스 체크 해제!");
    } */
    //alert("22")
    reSearch();
});

$(".crack").change(function(){
	reSearch();
});

$(".statusstat").change(function(){
	reSearch();
});


</script>



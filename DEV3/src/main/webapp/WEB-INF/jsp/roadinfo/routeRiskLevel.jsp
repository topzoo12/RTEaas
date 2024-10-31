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

	<!-- ******************************************************************************************************************* -->
	<!-- ******************************************************************************************************************* -->
	<div class="contents mainMap">
    <!-- <div id="riskInfopopup" style="position:absolute; z-index: 9999999; display: none; width:300px; height:400px; background:skyblue;" > -->
    	<!-- div class="riskInfopopup" style="right:410px; width:140px;">
            <div>
                <input type="checkbox" id="risk1" name="risk1" checked style="left:1100px; appearance:auto; position:static;"/><label for="risk1" style="color:white">risk1</label>
            </div>
            <div>
            	<input type="checkbox" id="risk2" name="risk2" checked style="left:1100px; appearance:auto; position:static;"/><label for="risk2" style="color:white">risk2</label>
            </div>
            <div>
                <input type="checkbox" id="risk3" name="risk3" checked style="left:1100px; appearance:auto; position:static;"/><label for="risk3" style="color:white">risk3</label>
            </div>
            <div>
                <input type="checkbox" id="risk4" name="risk4" checked style="left:1100px; appearance:auto; position:static;"/><label for="risk4" style="color:white">risk4</label>
            </div>
        </div -->
        <!-- div class="riskInfopopup" style="right:560px; width:140px;">
            <div>
                <input type="checkbox" id="pothole" name="pothole" checked style="left:1100px; appearance:auto; position:static;"/><label for="Pothole" style="color:white">포트홀</label>
            </div>
            <div><input type="checkbox" id="vertical" name="vertical" checked style="left:1100px; appearance:auto; position:static;"/><label for="Vertical" style="color:white">수직균열</label>
            </div>
            <div>
                <input type="checkbox" id="horizontal" name="horizontal" checked style="left:1100px; appearance:auto; position:static;"/><label for="Horizontal" style="color:white">수평균열</label>
            </div>
            <div>
                <input type="checkbox" id="alligators" name="alligators" checked style="left:1100px; appearance:auto; position:static;"/><label for="Alligators" style="color:white">피로균열</label>
            </div>
        </div -->
        <div class="riskInfopopup" >
	        <c:forEach var="lvList" items="${levelList}" varStatus="status">
				<!--
				<input type="checkbox" id="${monthColor.etc2}" class="risklist" name="risklist" value="${monthColor.etc3}" checked><label for="${monthColor.etc2}">${monthColor.cdNm}</label>
				 -->
				<span id="riskbgcolorLv1" style="background:${lvList.etc1}">&nbsp;</span>
				<span id="${lvList.cdId}">
				<%-- ${lvList.cdNm} --%>
					<c:choose>
						<c:when test="${nowCdNa eq 'KR'}">${lvList.cdNm}</c:when>
						<c:when test="${nowCdNa eq 'US'}">${lvList.cdNmEng}</c:when>
						<c:when test="${nowCdNa eq 'JP'}">${lvList.cdNmJp}</c:when>
					</c:choose>
				</span>
			</c:forEach>
        </div>
        <div class="mapWrap">
		<!-- ******************************************************************************************************************* -->
		<!-- Level List 부분 -->
		<!-- ******************************************************************************************************************* -->
			<%-- <ul class="search_box level_list" style="min-width: 1170px; margin-top:0px; width: calc(100% - 40px);">
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
					<!-- <span class="selectBox resp bottom" id="msgdivCd_span">
		                <button class="label" id="level4" data-code="" data-lat="" data-lng="">Level4</button>
		                <ul class="optionList" id="level4_ul">
		                    <li class="optionItem" >전체</li>
		                    <li class="optionItem" >Langkawi International Airport Padang Mat Sirat Pulau Langkawi</li>
		                    <li class="optionItem" >Level3</li>
		                </ul>
		            </span> -->
		            <span class="search" style="display: none;">
						<input type="text" value="" name="deviceNm" id="deviceNm" class="input1" placeholder="디바이스명">
					</span>
					<span class="stl">
						<fmt:message key="PERIOD" bundle="${bundle}" />
							<span class="remark2"></span>
					</span>
					<span class="date">
						<input type="text" value="${fromDt}" name="start" id="fromDt" class="input2" readonly>
						~ <input type="text" value="${toDt}" name="end" id="toDt" class="input2" readonly>
						<button class="search_calender" id="search_calender"></button>
					</span>
					<!-- 검색영역 최신순 오래된순 -->
					<!-- <div class="array-container">
	                       <span class="selectBox text bottom" id="select_asc_sort">
	                       	<button class="label" id="searchSort" data-code="desc" onchange="changeSortSelect()">최신순</button>
	                           <ul class="optionList" id="sortchk">
	                               <li class="optionItem sorting" data-code="desc">최신순</li>
	                               <li class="optionItem sorting" data-code="asc">오래된순</li>
	                           </ul>
	                       </span>
	                   </div> -->
					<button class="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>
					<!-- <button onclick='abc()'>abc</button> -->

					<!-- <button class="btn" onclick="ttt()"><fmt:message key="ROUTE" bundle="${bundle}"/></button> -->


				</li>
		    </ul> --%>
	    <!--
	    결과내재검색패널

		<!-- ******************************************************************************************************************* -->
		<!-- ******************************************************************************************************************* -->

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
                <%-- <div class="btnWrap">
                    <div class="btnArea">
                        <button type="button" class="btn_iconTXT" id="btn_Back"><span class="material-symbols-outlined">list</span> <fmt:message key="TO_LIST" bundle="${bundle}"/></button>
                    </div>
                </div> --%>
            </div>
            <!-- e:상세설명 -->

            <!-- 검색목록 -->
            <div class="infoListWrap" style="overflow-y:scroll;">
                <div class="infoListTop">
                    <!-- <h2 class="hidden">검색목록</h2>
                    <div class="array-container">
                        <span class="selectBox text bottom" id="select_asc_sort">
                        	<button class="label" id="sort" data-code="desc" onchange="changeSortSelect()"><fmt:message key="DATE_DESC" bundle="${bundle}"/></button>
                            <ul class="optionList" id="sortchk">
                                <li class="optionItem sorting" id="desc" data-code="desc"><fmt:message key="DATE_DESC" bundle="${bundle}"/></li>
                                <li class="optionItem sorting" id="asc" data-code="asc"><fmt:message key="DATE_ASC" bundle="${bundle}"/></li>
                            </ul>
                        </span>
                    </div> --!>
                    <!-- <p class="itemCount">총 <em>0건</em></p> -->
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
            <%-- <div class="infoListWrapNoData" style="display: none;">
                <h2 class="hidden">검색목록</h2>
                <!-- <p class="itemCount">총 <em>0건</em></p> -->
                <div class="nodata">
                    <span class="material-symbols-outlined">warning</span>
						<fmt:message key="NO_SEARCH_DATA" bundle="${bundle}"/>
						<!--  검색된 데이터가 없습니다. -->
                </div>
            </div> --%>
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

/* 	$('.infoListWrap').css('display', 'none');
	$(".infoListWrap p").css('display', 'hidden');
	$('.infoDetailWrap').css('display', 'none');

	$('.infoWrap').removeClass('on'); */
	redIconId = "";

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

	var monthColorKeyValue = [];

	<c:forEach var="monthColor" items="${codeListMc}" varStatus="status">
		monthColorKeyValue.push({'code':'${monthColor.cdId}', 'codeName':'${monthColor.cdNm}', 'color':'${monthColor.etc1}', })
	</c:forEach>


	//결과내재검색패널
	function btnClick() {
		const searchOpt = document.getElementById('re-search-container');

		if(searchOpt.style.display === 'none') {
			searchOpt.style.display = 'block';
		}else {
			searchOpt.style.display = 'none';
		}
	}

	var potholeCnt;
	var potholeListData;
	var markerId = [];

	markerOnOff = "";

	var img_id;


	markerList = [];
	markersTemp = [];

	testlines = [];

	allData = [];

	let activeMarker = null;

	let searchLv;

	/* if (searchLv == undefined) {
		searchLv = 2
		const temp = document.getElementById('level2');
	 	temp.setAttribute('data-code', '2409180');
	 	temp.setAttribute('data-lat', '37.4201556');
	 	temp.setAttribute('data-lng', '127.1262092');
	} */

	window.initMap = function () {

	};

	var popup = L.popup();

 	function removeLine(e) {
 		map.removeLayer(firstpolyline)
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

		//optionReset();
		//const searchOpt = document.getElementById('re-search-container');

		//if(searchOpt.style.display === 'block') {
			//searchOpt.style.display = 'none';
		//}
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

 	function openPopup(id, deviceNm, deviceId, addr_po_locality, dateFormat, lat, lng) {

 		//openPopup(id, device_name, device_id, addr_po_locality, dateFormat, lat, lng)

 		var popuptxt = "<div><h1><fmt:message key="DEVICE_NAME" bundle="${bundle}"/> : " + deviceNm + " ( " + deviceId + " )</h1>"
						+ "<fmt:message key="ROAD_NAME" bundle="${bundle}"/> : " + addr_po_locality + " (" + lat + ", " + lng + ")<br>"
						+ "<fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/> : " + dateFormat + "</div>";

		var txtposition = 0.000030;
		var max = map.getMaxZoom()+1;
		var zoom = map.getZoom();
		var no = 2;

		for (var i=0; i<(max-zoom); i++) {
			txtposition = txtposition * no;
		}

		//lat = Number(lat) + Number(0.00004)
		lat = Number(lat) + Number(txtposition)
		lng = Number(lng)

		var position = [lat, lng];

		popup.setLatLng(position)
			.setContent(popuptxt)
			.openOn(map);

 	}

	//  우측 패널 펼치기
    $(".btn_infoWrap").click(function(){
    	//infoDetailWrap


    	//console.log(">> ",)
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

				/* if ( $('.menu_bar_close').css('display') == 'block' ) {
					$('.level_list').css('width', 'calc(100% - 40px)');
	            	$('.re-search-container').css('width', 'calc(100% - 40px)');
				} else if ( $('.menu_bar_close').css('display') == 'none' ) {
					$('.level_list').css('width', 'calc(100% - 40px)');
	            	$('.re-search-container').css('width', 'calc(100% - 40px)');
				} */

	            $('.btn_infoWrap').addClass("off");
	        } else {

				/* if ( $('.menu_bar_close').css('display') == 'block' ) {
					$('.level_list').css('width', 'calc(100% - 400px)');
	            	$('.re-search-container').css('width', 'calc(100% - 400px)');
				} else if ( $('.menu_bar_close').css('display') == 'none' ) {
					$('.level_list').css('width', 'calc(100% - 180px)');
	            	$('.re-search-container').css('width', 'calc(100% - 180px)');
				} */

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


 	function onClick(e) {

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

/*
 		var id = e.target.options.id;

	   	markersTemp = markers;

    	for (var i = 0; i < markers.length; i++) {
			map.removeLayer(markers[i])
		}

    	for (var i = 0; i < markersTemp.length; i++) {

    		if (id == markersTemp[i].options.id) {
    			iconColor = redIcon;
    		} else {
    			iconColor = blueIcon;
    		}

    		var t = L.marker([markersTemp[i].options.lat, markersTemp[i].options.lng], {
	    			id: markersTemp[i].options.id,
	    			lat: markersTemp[i].options.lat,
	    			lng: markersTemp[i].options.lng,
	    			ctime: markersTemp[i].options.ctime,
	    			deviceId: markersTemp[i].options.deviceId,
	    			deviceName: markersTemp[i].options.deviceName,
	    			addrName: markersTemp[i].options.addrName,
	    			//icon:blueIcon,
	    			//icon:redIcon
	    			icon: iconColor
    			}).addTo(map)
    				//.on('mouseover', onClick1)
    		    	.on('click', onClick);

    	}

    	markers = markersTemp;
 */
// ▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽
// ▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽
/*  		var deviceNm = e.target.options.deviceName;
 		var deviceId = e.target.options.deviceId;

 		var addr_po_locality = e.target.options.addrName;

 		var lat = e.target.options.lat
 		var lng = e.target.options.lng

 		var dateFormat = e.target.options.ctime

 		openPopup(id, deviceNm, deviceId, addr_po_locality, dateFormat, lat, lng) */
// △△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△
// △△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△



    }

	//////////// Level 관련
	function getLevelText(level){

		var zerolv = "0" + level;

		console.log('lvColorKeyValue 확인', lvColorKeyValue);
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

</script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

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



function mapInfo(map) {

	var lat = map.getCenter().lat;
	var lng = map.getCenter().lng;

	markerList = [];

	/* map.eachLayer(function(layer) {
		if (layer instanceof L.Marker) {
			map.removeLayer(layer);
		}
	}); */

	map.eachLayer(function (layer) {
	    if (!(layer instanceof L.TileLayer)) {
	        map.removeLayer(layer);
	    }
	});

/* 	var areaCode;

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
 */

	$.ajax({
		type: "GET",
		//url: "${authInfo.restApiUrl}/pothole",
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
			devices:deviceIdList
		},
		success: drawLine,
		error: function(request,status,error){

			//console.log("request.status = " + request.status)

		},
		beforeSend:function(){
			$('#circularG').css('display','block')
		},
		complete : function(data) {
			//  실패했어도 완료가 되었을 때 처리
			$('#circularG').css('display','none');
			ttt();

		}
	})











}
	var lines = []

//777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
	function drawLine(response) {

		$("#info").hide();
		//$('.infoListWrap').css('display', 'block')
		$('.infoDetailWrap').css('display', 'none')
		map.closePopup();

		console.log("abc => ", response)
		allData = response.data;

		sumMarkerSort = [];

		for (var i = 0; i < lines.length; i++) {
			map.removeLayer(lines[i])
		}

		for (var i = 0; i < markers.length; i++) {
			map.removeLayer(markers[i])
		}

		markers = []

		lines = []
		markerId = []

		point = []

		var lvColorKeyValue = [];
		var riskText = '';

		// riskLv1
		//obj.css("color","색상");
		for (var i = 1; i <= lvColorKeyValue.length; i++) {
			$('#riskbgcolorLv'+ i).css("background-color", lvColorKeyValue[i-1].color)
			//$('#riskLv'+i).text(lvColorKeyValue[i-1].lvNm)
			$('#riskLv'+i).text(lvColorKeyValue[i].lvNm)
			// $('#riskLv'+ i).css("font-weight", "bold")
		}

			// MarkerCluster 그룹 생성
			markerCluster = L.markerClusterGroup({
	        disableClusteringAtZoom: 20, // 줌 레벨 15 이상에서 클러스터 해제
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


		//ss = new Date($("#fromDt").val());
		//ee = new Date($("#toDt").val());

	 	for (var i = 0 ; i < response.data.length ; i++) {

	 		var markerdate = new Date(response.data[i].timestamp);

	 		/* if (!(ss < markerdate && ee > markerdate)) {
 				//console.log(markerdate)
				continue;
 			 } */

	 		/* if (response.data[i].way != null) {

				var wayLength = response.data[i].way.points.length;

				let wayname = response.data[i].way.name;

				 for (var x = 1 ; x < wayLength ; x++ ) {
						var pointA = new L.LatLng(response.data[i].way.points[x-1].latitude, response.data[i].way.points[x-1].longitude);
						var pointB = new L.LatLng(response.data[i].way.points[x].latitude, response.data[i].way.points[x].longitude);

						var pointList = [ pointA, pointB ];
						//var test = response.data[i].way.points[0].latitude + ", " + response.data[i].way.points[0].longitude;

						var riskLvColor = ""

						for (var z = 0 ; z < lvColorKeyValue.length ; z++) {
 							if (Number(lvColorKeyValue[z].lv) == response.data[i].risk.level){
								riskLvColor = lvColorKeyValue[z].color;
							}
						}

						var linesize = map.getZoom()-7

						var firstpolyline = new L.Polyline(pointList, {
						    //color: 'red',
						    color: riskLvColor,
						    //weight: 15,
						    weight: linesize,
						    //opacity: 0.1,
						    smoothFactor: 1

						    }).on('click', function(e) {
					            //var dff = 'fssss';
					            //var dataList = response.data[i];

						    	//alert('Polyline clicked at ' + e.latlng);
					            // You can also handle other actions here
					            //console.log(e.target._leaflet_id)
					            //console.log('Polyline clicked at ' + e.latlng)
					            //console.log(">>>>>>>>>> " + dff)
					            console.log(wayname)
					            wayMarkerList(response ,wayname)
					            //console.log("=============================================")
					            //console.log(dataList)
					            //alert("11")

					        });;

						map.addLayer(firstpolyline);

						lines.push(firstpolyline);
				}
			} */
		// --------------------------------------------------------------------------------------------------------------------------------
		// 마커 생성 부분
		// --------------------------------------------------------------------------------------------------------------------------------

		//if ((ss < markerdate && ee > markerdate)) {

			//if (selectedValue == "on") {

		 		var item = response.data[i];

				var deviceId = fn_device_id(item['device-id'])
				var deviceNm = fn_device_name(item['device-id'])

				var lat = item.point['latitude'];
				var lng = item.point['longitude'];

				//var c_time = fn_create_time(item['created-at'])
				var date = new Date(item['timestamp'])
				//var date = new Date(response.data[index]['timestamp'])

				var dateFormat = date.getFullYear() + '.' + (date.getMonth()+1) + '.'
								+ date.getDate() + ' '
								+ date.getHours() + ':' + date.getMinutes() ;

				var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 )
				var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate()
				var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours()
				var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes()
				var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds()

				dateFormat  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec

				var addr_po_locality = (item.way.name == null || item.way.name == '') ? "도로정보 없음" : item.way.name

				var t = L.marker([item.point.latitude, item.point.longitude], {
						id: item['id'],
						lat: lat,
						lng: lng,
						ctime: dateFormat,
						deviceId: deviceId,
						deviceName: deviceNm,
						addrName: addr_po_locality,
						icon: blueIcon,
						//icon:redIcon
					})//.addTo(map)
						.on('click', onClick);

				markerCluster.addLayer(t);
				markers.push(t);
				markerId.push(item['id']);
			//} else {
				/* map.eachLayer(function(layer) {
					if (layer instanceof L.Marker) {
						map.removeLayer(layer);
					}
				}); */
				map.removeLayer(markerCluster);
			//}
		//}
		// --------------------------------------------------------------------------------------------------------------------------------
		// --------------------------------------------------------------------------------------------------------------------------------
		map.addLayer(markerCluster);

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
				)
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
				)
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

	 	$('.infoList li').remove()
		$('.infoList div').remove()

		//$(".infoWrap").addClass("on");
		//$(".infoListWrap p").css('display', 'block')
		//$(".infoListWrap p").text("총 "+ markerInRoute.length + " 건")

		/* $.each(response.data, function(index) {
		//==================================================================================================================
		//==================================================================================================================
			//for (var x = 0 ; x < response.data.length ; x++) {
				//if (markerInRoute[x] == index) {
					//if (makeMarkerList[x] == index) {
					//if (sortedTestDD[x].key == index) {
					//console.log(deviceKeyValue)

					var date = new Date(response.data[index]['timestamp'])

					var dateFormat = date.getFullYear() + '.' + (date.getMonth()+1) + '.'
									+ date.getDate() + ' '
									+ date.getHours() + ':' + date.getMinutes() ;

					var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 )
					var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate()
					var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours()
					var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes()
					var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds()

					dateFormat  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec

					//var addr_po_locality = response.data[index].way == null ? "도로정보 없음" : response.data[index].way.name
					//var addr_po_locality = (item.way.name == null || item.way.name == '') ? "도로정보 없음" : item.way.name
					var addr_po_locality = (response.data[index].way.name == null || response.data[index].way.name == '') ? "도로정보 없음" : response.data[index].way.name
					var macAddr = response.data[index]['device-id'];
					var id = response.data[index].id;

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

						markerList.push("<li><a class='infoListItem'>"
							+ "<div class='info'><h3 class='infoTitle' onClick=\"detail('" + id + "', ' " + device_name + "', '" + device_id + "', '" + addr_po_locality + "', '" + dateFormat + "', '" + response.data[index].point['latitude'] + "', '" + response.data[index].point['longitude'] + "')\"'>" + device_name + " ( " + device_id + " )</h3>"
							+ "<ul class='infoContents'>"
							+ "<li> <fmt:message key="ROAD_NAME" bundle="${bundle}"/> : " + addr_po_locality + "</li>"
							+ "<li> <fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/> : " + dateFormat + "</li>"
							+ "</ul>"
							+ "</div>"
							+ "<div class='infoThumnail'>"
							+ "<img src='${authInfo.restApiUrl}/pothole/" + id + "/thumbnail' alt='대표이미4지' onclick=\"originalimg('" + id + "')\">"
							+ "</div>"
							+ "</li>"
						);


						//}
					//}
				//}
			//==================================================================================================================
			//==================================================================================================================
		}) */
/*
		for (var i=0; i<markerList.length; i++) {
			if(i<10) {
				$(".infoList").append(markerList[i])
			}
		}
		$(".infoListWrap p").text("<fmt:message key="TOTAL" bundle="${bundle}"/> "+ response.data.length + " <fmt:message key="COUNT2" bundle="${bundle}"/>") */
		// 여기네여기

	 	//console.log(map._layers)
	 	// ************************************************************************************************
		// ************************************************************************************************

	// ------------------------------------------------------------------------------------------------------------------
	//  마커 start
	// ------------------------------------------------------------------------------------------------------------------
/*


		for (var i = 0; i < response.data.length; i++) {

			var item = response.data[i];

			var deviceId = fn_device_id(item['device-id'])
			var deviceNm = fn_device_name(item['device-id'])

			var lat = item.point['latitude'];
			var lng = item.point['longitude'];

			//var c_time = fn_create_time(item['created-at'])
			var date = new Date(item['timestamp'])
			//var date = new Date(response.data[index]['timestamp'])

			var dateFormat = date.getFullYear() + '.' + (date.getMonth()+1) + '.'
							+ date.getDate() + ' '
							+ date.getHours() + ':' + date.getMinutes() ;

			var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 )
			var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate()
			var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours()
			var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes()
			var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds()

			dateFormat  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec

			var addr_po_locality = (item.way.name == null || item.way.name == '') ? "도로정보 없음" : item.way.name

			var t = L.marker([item.point.latitude, item.point.longitude], {
					id: item['id'],
					lat: lat,
					lng: lng,
					ctime: dateFormat,
					deviceId: deviceId,
					deviceName: deviceNm,
					addrName: addr_po_locality,
					icon: blueIcon,
					//icon:redIcon
				}).addTo(map)
					.on('click', onClick);

			markers.push(t);
			markerId.push(item['id']);


		} */


	// ------------------------------------------------------------------------------------------------------------------
	//  마커 end
	// ------------------------------------------------------------------------------------------------------------------



		// Loop through the data
		/* for (var i = 0; i < markers.length; i++) {
			map.removeLayer(markers[i])
		}
		markers = []
		markerId = [] */

		potholeCnt = response.data.length;
		potholeListData = response.data;

	}
//777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777



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


$(document).ready(function() {

	//console.log("##################>>>> - ${codeListMc}" );

	let now1 = new Date('2023-03-30');
	//console.log("현재 : ", now1);

	let oneMonthAgo = new Date(now1.setMonth(now1.getMonth() - 1)); // 한달
	//console.log("한달 전 : ", oneMonthAgo);

	let now2 = new Date('2023-12-22');
	//console.log("현재 : ", now2);

	let oneMonthLater = new Date(now2.setMonth(now2.getMonth() + 1));
	//console.log("한달 후 : ", oneMonthLater)

	//0.0025


	//var fromDt = '';
	//var toDt = '';


	//fromDt = $('#fromDt').val().replaceAll('-', '');
	//toDt = $('#toDt').val().replaceAll('-', '');

	// 날짜 설정 오늘날짜로부터 1주일 (임시10.1)
	var date1 = new Date();
	//$('#toDt').val(fnDateFormat(date1, 'select'))
	var date2 = new Date(date1.setDate(date1.getDate() - 30));
	// $('#fromDt').val(dateFormat(date2, 'select'))
	//$('#fromDt').val('2023-10-01')


	lvColorKeyValue = [];

	<c:forEach var="lvList" items="${levelList}" varStatus="status">

		lvColorKeyValue.push({'lv':'${lvList.cdId}', 'color':'${lvList.etc1}', 'riskNm':'${lvList.cdNm}', 'riskNmEng' : '${lvList.cdNmEng}', 'riskNmJp' : '${lvList.cdNmJp}'})

	</c:forEach>



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
	filterYN = "N";
	markers = [];

	//setLevelList(1, '');
	region = "${authInfo.cdNa}";

	/* if( region == 'KR' ){
		setLevelList(2, '2306392');
		setLevelList(3, '2409180');
		$('#level1').text('경기도');
	 	$('#level1').addClass("on");
	 	$('#level2').text('성남시');
	 	$('#level2').addClass("on");

	 	const temp = document.getElementById('level2');
	 	temp.setAttribute('data-code', '2409180');
	 	temp.setAttribute('data-lat', '37.4201556');
	 	temp.setAttribute('data-lng', '127.1262092');

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
	//setLevelList(1, '');


	deviceKeyValue = [];
	deviceIdList = "";

	<c:forEach var="deList" items="${deviceList}" varStatus="status">

		deviceKeyValue.push({'macAddr':'${deList.macAddr}', 'deviceId':'${deList.deviceId}', 'deviceNm':'${deList.deviceNm}'})

		if (deviceIdList == "" ) {
           	deviceIdList += '${deList.macAddr}'
		} else {
			deviceIdList += ',${deList.macAddr}'
		}

	</c:forEach>





	old_id = "";

		//map = L.map('map').setView({lat:37.470613, lng:127.126118}, 14);
		//map = L.map('map').setView({lat:37.412079, lng:127.135001}, 18);
		map = L.map('map').setView({lat:"${authInfo.wtX}", lng:"${authInfo.wtY}"}, 12);

		L.control.scale({
			imperial: true, metric: true
		}).addTo(map);

	//L.tileLayer('https://mt0.google.com/vt/lyrs=m&h1=kr{z}&x={x}&y={y}&z={z}', {
	//L.tileLayer('https://tiles.osm.kr/hot/{z}/{x}/{y}.png', {
	L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
		//minZoom: 14,
		//maxZoom: 19,
		minZoom: '${authInfo.mapMinSize}',
		maxZoom: '${authInfo.mapMaxSize}',
	    attribution: '© OpenStreetMap'
	    //stylers:[{visibility:'off'}]
	}).addTo(map);

	// swagger.js
	mapInfo(map);

	map.on('click', onMapClick);



	map.on("moveend", function(){

/* 		reSearchYn = false;

		$('.infoList li').remove()
		$('.infoList div').remove()

		optionReset();
		const searchOpt = document.getElementById('re-search-container'); */

		// 접음
        $('.infoWrap').removeClass('on');
        $('.infoWrap').addClass('off');
    	$('.infoDetailWrap').css('display', 'none');
    	$('.infoListWrap').css('display', 'none');
    	//$(".infoListWrap p").text("")
    	$(".infoListWrap p").css('display', 'hidden');
    	$('.infoListWrapNoData').css('display', 'none');

        $('.btn_infoWrap').addClass("off");

		//if(searchOpt.style.display === 'block') {
			//searchOpt.style.display = 'none';
		//}
		mapInfo(map);
		//ttt();

		map.closePopup();

		//$('.infoDetailWrap').css('display', 'none')
		//$('.infoListWrap').css('display', 'block')


	})



	function removeLine() {

 		map.removeLayer(firstpolyline)
 		map.removeLayer(map._layers)
 	}

	//var markers = []

	function nodata(map) {

		    //$("div").show(); //display :none 일떄
		    $('.infoListWrapNoData').css('display', 'block')
		    $('.infoListWrap').css('display', 'none')

	}

})


function wayMarkerList(response , wayname) {


	if ( $('.menu_bar_close').css('display') == 'block' ) {
		$('.level_list').css('width', 'calc(100% - 400px)');
    	$('.re-search-container').css('width', 'calc(100% - 400px)');
	} else if ( $('.menu_bar_close').css('display') == 'none' ) {
		$('.level_list').css('width', 'calc(100% - 180px)');
    	$('.re-search-container').css('width', 'calc(100% - 180px)');
	}

	 $('.btn_infoWrap').removeClass("off");



	markerList = [];
	markerInRoute = [];

	for ( var i = 0 ; i < response.data.length ; i++ ) {
		if (response.data[i].way.name == wayname) {
			console.log(response.data[i]);
			markerInRoute.push(i);
		}
	}

	$('.infoList li').remove()
	$('.infoList div').remove()

	$(".infoWrap").addClass("on");
	$(".infoListWrap p").css('display', 'block')
	$(".infoListWrap p").text("총 "+ markerInRoute.length + " 건")

	$.each(response.data, function(index) {
	//==================================================================================================================
	//==================================================================================================================
		for (var x = 0 ; x < markerInRoute.length ; x++) {
			if (markerInRoute[x] == index) {
				//if (makeMarkerList[x] == index) {
				//if (sortedTestDD[x].key == index) {
				//console.log(deviceKeyValue)

				var date = new Date(response.data[index]['timestamp'])

				var dateFormat = date.getFullYear() + '.' + (date.getMonth()+1) + '.'
								+ date.getDate() + ' '
								+ date.getHours() + ':' + date.getMinutes() ;

				var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 )
				var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate()
				var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours()
				var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes()
				var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds()

				dateFormat  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec

				//var addr_po_locality = response.data[index].way == null ? "도로정보 없음" : response.data[index].way.name
				//var addr_po_locality = (item.way.name == null || item.way.name == '') ? "도로정보 없음" : item.way.name
				var addr_po_locality = (response.data[index].way.name == null || response.data[index].way.name == '') ? "도로정보 없음" : response.data[index].way.name
				var macAddr = response.data[index]['device-id'];
				var id = response.data[index].id;

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

					markerList.push("<li><a class='infoListItem'>"
						+ "<div class='info'><h3 class='infoTitle' onClick=\"detail('" + id + "', ' " + device_name + "', '" + device_id + "', '" + addr_po_locality + "', '" + dateFormat + "', '" + response.data[index].point['latitude'] + "', '" + response.data[index].point['longitude'] + "')\"'>" + device_name + " ( " + device_id + " )</h3>"
						+ "<ul class='infoContents'>"
						+ "<li> <fmt:message key="ROAD_NAME" bundle="${bundle}"/> : " + addr_po_locality + "</li>"
						+ "<li> <fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/> : " + dateFormat + "</li>"
						+ "</ul>"
						+ "</div>"
						+ "<div class='infoThumnail'>"
						+ "<img src='${authInfo.restApiUrl}/pothole/" + id + "/thumbnail' alt='대표이미4지' onclick=\"originalimg('" + id + "')\">"
						+ "</div>"
						+ "</li>"
					);


					//}
				}
			}
		//==================================================================================================================
		//==================================================================================================================
	})



	for (var i=0; i<markerList.length; i++) {
		if(i<10) {
			$(".infoList").append(markerList[i])
		}
	}



}

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

/* ///////////////////// Level 매칭
function getLevelText(text) {

	var result ='' ;
	switch (text) {
	  case '양호':
		result = '<fmt:message key="양호" bundle="${bundle}"/>';
	    break;

	  case '주의':
		result = '<fmt:message key="주의" bundle="${bundle}"/>';
	    break;

	  case '위험':
		result = '<fmt:message key="위험" bundle="${bundle}"/>';
		break;

	  case '심각':
		 result = '<fmt:message key="심각" bundle="${bundle}"/>';
		 break;

	}

	return result;
} */

//////////////////////////
// ===============================================================================================================================
function detail(id, device_name, device_id, addr_po_locality, dateFormat, lat, lng, clusterChk){

	markerCluster.eachLayer(function(layer) {
		if (layer.options.id === id) {
		// 마커를 찾았으면 아이콘 변경
			layer.setIcon(redIcon);
			layer.options.iconChanged = true;
		}

	});


	$(".infoWrap").addClass("on");
 	$(".infoListWrap p").css('display', 'block')

   	markersTemp = markers;

 	console.log("clusterChk - " + clusterChk)

	$(".infoWrap").addClass("on");
 	$(".infoListWrap p").css('display', 'block')

   	markersTemp = markers;

	/* if (clusterChk == 'N') {

		if (redIconId.length > 0) {
			console.log(redIconId)
		}

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
				}).addTo(map)
					//.on('mouseover', onClick1)
					.on('click', onClick);

				markers[i] = t;
			}
		}

		for (var i = 0; i < markers.length; i++) {
			if (id == markers[i].options.id) {
				map.removeLayer(markers[i])

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
					icon: redIcon
				}).addTo(map)
					//.on('mouseover', onClick1)
					.on('click', onClick);

				redIconId = markers[i].options.id;
				markers[i] = t;

			}
		}
	} */

	markers = markersTemp;

 	$("#info").hide();
	//$('.infoListWrap').css('display', 'block')
	$('.infoDetailWrap').css('display', 'none')

	img_id = id;

	thisData = "";

	for (var i=0; i<allData.length; i++) {

		if (allData[i].id == id) {
			thisData = allData[i]
		}
	}

		var popuptxt = "<div><h1>디바이스명 : " + device_name + " ( " + device_id + " )</h1>"
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
		var lat = Number(lat) + Number(txtposition)
		var lng = Number(lng)

		var position = [lat, lng];

		if (clusterChk == 'N') {
			popup.setLatLng(position)
				.setContent(popuptxt)
				.openOn(map);
		}

	/* var lvColorKeyValue = [];

	<c:forEach var="lvList" items="${levelList}" varStatus="status">

		lvColorKeyValue.push({'lv':'${lvList.cdId}', 'color':'${lvList.etc1}', 'riskNm':'${lvList.cdNm}'})

	</c:forEach> */

	for (var i = 0; i < lvColorKeyValue.length; i++) {
		if (Number(lvColorKeyValue[i].lv) == Number(thisData.risk.level)){
			riskLvNm = lvColorKeyValue[i].riskNm;
			riskColor = lvColorKeyValue[i].color
		}
	}

	$("#detail_img").attr("src", "${authInfo.restApiUrl}/pothole/"  + id + "/thumbnail");

	$("#detail_img").removeAttr("onClick");
	$("#detail_img").attr("onclick", "originalimg('" + id + "')");

	//console.log(potholeListData)

		for (var i = 0; i < potholeListData.length; i++) {
		if (potholeListData[i].id == id) {

			//var addrName = potholeListData[i].way == null ? "도로정보 없음" : potholeListData[i].way.name
			var addrName = (potholeListData[i].way.name == null || potholeListData[i].way.name == '' ) ? "도로정보 없음" : potholeListData[i].way.name

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
			$("#CntPothole").text(thisData.risk['count-of-potholes'] + " 개")
			// 수직균열
			$("#CntVertical").text(thisData.risk['count-of-vertical-cracks'] + " 개")
			// 수평균열
			$("#CntHorizontal").text(thisData.risk['count-of-horizontal-cracks'] + " 개")
			// 피로균열
			$("#CntAlligators").text(thisData.risk['count-of-alligators'] + " 개")

			// detail영역
			$("#detail_title").text(device_name + " ( " + device_id + " )");
			// 디바이스 name
			$("#detail_device_name").text(device_name);
			// 디바이스 ID
			$("#detail_device_id").text(device_id);
			// 좌표
			$("#detail_latlng").text("위도 " + potholeListData[i].point['latitude'] + " / 경도 " + potholeListData[i].point['longitude']);
			// 위험도
			$("#detail_risk_level").text(riskText);
			// 도로명
			//$("#detail_route_name").text();
			$("#detail_route_name").text(addrName);

			// 촬영일시
			$("#detail_ctime").text(dateFormat);

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
// ===============================================================================================================================




function setLevelList(level, id){


	//region = 'KR'
	region = "${authInfo.cdNa}"

	// 레벨1인 경우
	if(level == 1){

	 	var node = document.getElementById('level2_ul')
	 	node.innerHTML = '';
	 	var node = document.getElementById('level3_ul')
	 	node.innerHTML = '';
	 	//var node = document.getElementById('level4_ul')
	 	//node.innerHTML = '';

		$.ajax({
			type: "GET",
			//url: "${authInfo.restApiUrl}"+ "/administrative?region=" + region,
			url: "${authInfo.restApiUrl}/administrative?",
			async:false,
			data: {
				region:region
			},
		    beforeSend:function(){
		         $('#circularG').css('display','block')
		    },
		    complete:function(){
			      $('#circularG').css('display','none')
		    
		    },
			success: function(resp) {

				datas = resp.data

			 	var node = document.getElementById('level1_ul')
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
	 	//var node = document.getElementById('level4_ul')
	 	//node.innerHTML = '';

		$.ajax({
			type: "GET",
			//url: "${authInfo.restApiUrl}" + "/administrative/" + id + "?region=" + region,
			url: "${authInfo.restApiUrl}/administrative/" + id,
			async:false,
			data: {
				region:region
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

	 	//var node = document.getElementById('level4_ul')
	 	//node.innerHTML = '';

	 	$("#level3").data('code', '');

		$.ajax({
			type: "GET",
			//url: "${authInfo.restApiUrl}" + "/administrative/" + id + "?region=" + region,
			url: "${authInfo.restApiUrl}/administrative/" + id,
			async:false,
			data: {
				region:region
			},
		    beforeSend:function(){
		         $('#circularG').css('display','block')
		    },
		    complete:function(){
			      $('#circularG').css('display','none')
		    
		    },
			success: function(resp) {

				datas = resp.data
				//console.log(datas)

			 	var node = document.getElementById('level3_ul')
			 	node.innerHTML = '';

            	//var html = '<li class="optionItem" data-code="'+id+'">전체</li>';
            	var html = '<li class="optionItem" data-code="" data-lat="" data-lng="">전체</li>';

	            for(var i = 0; i <datas.length; i++){
	            	data = datas[i]
	            	//console.log(i + " = ", data)
	            	//html += '<li class="optionItem" data-code="' + data.id + '">' + data.name + '</li>'
	            	html += '<li class="optionItem" data-code="' + data.id + '" data-lat="' + data.center.latitude + '" data-lng="' + data.center.longitude + '">' + data.name + '</li>'

				}

	            node.innerHTML = html;

			}

		})

	} /* else if(level == 4) {


		$.ajax({
			type: "GET",
			//url: "${authInfo.restApiUrl}" + "/administrative/" + id + "/way",
			url: "${authInfo.restApiUrl}/administrative/" + id + "/way/point",
			async:false,
			data: {
				region:region
			},
		    beforeSend:function(){
		         $('#circularG').css('display','block')
		    },
		    complete:function(){
			      $('#circularG').css('display','none')
		    
		    },
			success: function(resp) {

				datas = resp.data
				console.log(datas)

			 	var node = document.getElementById('level4_ul')
			 	node.innerHTML = '';

            	//var html = '';
            	//var html = '<li class="optionItem" data-code="'+id+'">전체</li>';
            	var html = '<li class="optionItem" data-code="" data-lat="" data-lng="">전체</li>';

	            for(var i = 0; i <datas.length; i++){
	            	data = datas[i];
	            	//html += '<li class="optionItem" data-code="'+ data.name +'">' + data.name + '</li>'
	            	//html += '<li class="optionItem" data-code="' + data.way.id + '" data-lat="' + data.way.center.latitude + '" data-lng="' + data.way.center.longitude + '">' + data.name + '</li>'
	            	html += '<li class="optionItem">' + data.name + '</li>'

				}

	            node.innerHTML = html;

			}

		})

	} */





	//$(".optionItem").on("click", function(){
	$(".optionItem").off("click").on("click", function(){
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

			setLevelList(4 ,  $('#level3').data('code'))

			//추후처리할수도 있어서 만들어둠
		} else if (levelChk == 'level4_ul'){
			searchLv = 4
		}
	});


}

//검색버튼 클릭 이벤트
$('.btn_search').on("click", function(){

	reSearchYn = false;

	map.eachLayer(function (layer) {
	    if (!(layer instanceof L.TileLayer)) {
	        map.removeLayer(layer);
	    }
	});

/* 	if ($("#level3").text() == "Level3") {
		searchLv = 2
	}
	if ($("#level2").text() == "Level2") {
		searchLv = 1
	} */

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



	$.ajax({
		type: "GET",
		//url: "${authInfo.restApiUrl}/pothole",
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
			devices:deviceIdList
		},
		success: drawLine,
		error: function(request,status,error){

			//console.log("request.status = " + request.status)

		},
		beforeSend:function(){
			$('#circularG').css('display','block')
		},
		complete : function(data) {
			//  실패했어도 완료가 되었을 때 처리
			$('#circularG').css('display','none');
			//ttt();

		}
	})





})

	// 재검색버튼 클릭 이벤트
	$('.btn_option_search').on("click", function(){

		filterYN = 'Y';

		console.log("=======================");
		console.log(map);
		map.setView([map.getCenter().lat, map.getCenter().lng], map.getZoom())


	})



	 // 선택초기화 버튼 이벤트 ( 결과 내 재검색 옵션 )
 	function optionReset() {

 		$("#riskAll").prop("checked", true);
 		$("#allCrack").prop("checked", true);
 		$("#statusAll").prop("checked", true);

 		$("input[name='risk']").each(function() {
 			$(this).prop('checked', true);
 		});

 		$("input[name='crack']").each(function() {
 			$(this).prop('checked', true);
 		});

 		$("input[name='status']").each(function() {
 			$(this).prop('checked', true);
 		});
 	}


	// ---- reSearch() ---------

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




	/* $('#sortchk .sorting').on('click', function() {
	    // 클릭된 'optionItem'의 data-value 값을 가져옵니다.
	    alert("111")

	    var selectedValue = $(this).data('code');

		//console.log("#############################################################")
		//console.log(selectedValue)
		//console.log("#############################################################")
		// ------------------------------------------------------------------------------------------------------------------------------------------------------
		var markerListSort = [];

		const data = allData;

		if (selectedValue == "asc") {
			//return dateB - dateA;
			console.log(">>>>>>>  asc  <<<<<<<")
			data.sort((a, b) => new Date(a.timestamp) - new Date(b.timestamp));
		} else {
			//return dateA - dateB;
			console.log(">>>>>>>  desc  <<<<<<<")
			data.sort((a, b) => new Date(b.timestamp) - new Date(a.timestamp));
		}


		$('.infoList li').remove()

			$.each(data, function(index) {
				var markerdate2 = new Date(data[index].timestamp);

				if (!(ss < markerdate2 && ee > markerdate2)) {
					//console.log(markerdate)
					//continue; each 문 안에서는 continue 가 아닌 return을 사용해야함
					return;
				}


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

				var addr_po_locality = (data[index].way.name == null || data[index].way.name == '') ? "도로정보 없음" : data[index].way.name;

				var macAddr = data[index]['device-id'];

				var id = data[index].id;

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

				markerListSort.push("<li><a class='infoListItem'>"
					+ "<div class='info'><div class='tit'><span class='badge sm badge_running'>진행중</span><h3 class='infoTitle' onClick=\"detail('" + id + "', ' " + device_name + "', '" + device_id + "', '" + addr_po_locality + "', '" + dateFormat + "', '" + data[index].point['latitude'] + "', '" + data[index].point['longitude'] + "')\"'>" + device_name + " ( " + device_id + " )</h3></div>"
					+ "<ul class='infoContents'>"
					+ "<li> 도로명 : " + addr_po_locality + "</li>"
					+ "<li> 촬영일시 : " + dateFormat + "</li>"
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

		$(".infoListWrap p").text("총 "+ data.length + " 건")
		// ------------------------------------------------------------------------------------------------------------------------------------------------------

	}); */


	function markerOn() {
        // 선택된 라디오 버튼 확인
        //var selectedValue = document.querySelector('input[name="sortchk"]:checked').value;
        //console.log("선택된 값:", selectedValue);

        //console.log(">>>> " , markerList)
        //console.log("========================================================================")
        //console.log(">>>>22222 " , markers)

        console.log("markers  >>>> ", markers)

        let markerCheck = false;

		map.eachLayer(function(layer) {
			if (layer instanceof L.Marker) {
				markerCheck = true; // 마커가 하나라도 있으면 true로 설정
			}
		});


        /* map.eachLayer(function(layer) {
            if (layer instanceof L.Marker) {
            	markerCheck = true; // 마커가 하나라도 있으면 true로 설정\
            	alert(markerCheck)
            }
        }); */
    	// MarkerCluster 그룹 생성
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

		if (!markerCheck) {
			for (var i = 0 ; i < markers.length ; i++ ) {

	       		//console.log(i , " =- " , markers[i].options.lat)
	       		var t = L.marker([markers[i].options.lat, markers[i].options.lng], {
	       			id : markers[i].options.id,
	       			lat : markers[i].options.lat,
	       			lng : markers[i].options.lng,
	       			ctime : markers[i].options.c_time,
	       			deviceId : markers[i].options.deviceId,
	       			deviceName : markers[i].options.deviceNm,
	       			addrName : markers[i].options.addr_po_locality,
	       			icon : blueIcon,
	       			//icon:redIcon
	       		})//.addTo(map)
	       		.on('click', onClick);

	       		markerCluster.addLayer(t);
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
					)
					var item = marker.options;
					//popupContent += 'Marker ' + (index + 1) + ' : ' + marker.getLatLng().toString() + '<br>';

					popupContent += "Marker " + (index + 1) + " : <b id='" + marker.options.id + "'"
															+ "onmouseover=\"this.style.color='blue'; this.style.cursor='pointer'\""
															+ "onmouseout=\"this.style.color='black'\" "
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

			//console.log("item = ", item)

			map.addLayer(markerCluster);



		}


        /* if (selectedValue == "desc") {
        	map.eachLayer(function(layer) {
		        if (layer instanceof L.Marker) {
		            map.removeLayer(layer);
		        }
		    });
        } else {

        	for (var i = 0 ; i < markers.length ; i++ ) {

        		//console.log(i , " =- " , markers[i].options.lat)
        		L.marker([markers[i].options.lat, markers[i].options.lng], {
        			id : markers[i].options.id,
        			lat : markers[i].options.lat,
        			lng : markers[i].options.lng,
        			ctime : markers[i].options.c_time,
        			deviceId : markers[i].options.deviceId,
        			deviceName : markers[i].options.deviceNm,
        			addrName : markers[i].options.addr_po_locality,
        			icon : blueIcon,
        			//icon:redIcon
        		}).addTo(map).on('click', onClick);

        	}
        } */

    }

/* 	function markerOff() {
		map.eachLayer(function(layer) {
	        if (layer instanceof L.Marker) {
	            map.removeLayer(layer);
	        }
	    });
	} */

	function originalimg(id) {

 		var popupimg = document.getElementById("pop_wrap");

		var modalImg = document.getElementById("pop_img");

		$('#pop_riskPopImg').css('display', 'block')
		$("#pop_img").attr("src", "${authInfo.restApiUrl}/pothole/" + id + "/image");

 	}

	function ttt() {


		/* testlines.forEach(function(polyline) {
	        polyline.remove();  // 각 polyline 객체를 맵에서 제거
	    }); */


		//map.remove(map)
		//map.removeLayer(map._layers)
		//mapInfo(map)

		/* var areaCode;

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
		} */


		//console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>> ", areaCode)
		/* $.ajax({
			type: "GET",
			//url: "${authInfo.restApiUrl}/pothole",
			url: "${authInfo.restApiUrl}/administrative/boundary" ,
			data: {
				//administrative_id: areaCode,
				administrative_id: "2409180", //성남시
				region:"${authInfo.cdNa}",
			},
			success: function(resp) {

				datas = resp.data
				console.log('바운더리 확인', datas);

				var boundaryLines = []

				for (var i = 0; i < datas.length-1; i++) {

 				var pointA = new L.LatLng(datas[i].y, datas[i].x);
 				var pointB = new L.LatLng(datas[i+1].y, datas[i+1].x);

 				var pointList = [ pointA, pointB ];

 				var riskLvColor = ""

 				var linesize = 13

 				var firstpolyline = new L.Polyline(pointList, {
 				    //color: 'red',
 				    color: 'Violet',
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
      }); */


		$.ajax({
			type: "GET",
			url: "${authInfo.restApiUrl}/detected-road" ,
			//url: "${authInfo.restApiUrl}//detected-road-by-date",
			//url: "http://localhost:8081/detected-road",
			data: {
				on_way:false,
				north_west:"latitude:" + (map.getBounds().getNorthWest().lat + 0.0025) + ",longitude:" + (map.getBounds().getNorthWest().lng - 0.0025),
				north_east:"latitude:" + (map.getBounds().getNorthEast().lat + 0.0025) + ",longitude:" + (map.getBounds().getNorthEast().lng + 0.0025),
				south_west:"latitude:" + (map.getBounds().getSouthWest().lat - 0.0025) + ",longitude:" + (map.getBounds().getSouthWest().lng - 0.0025),
				south_east:"latitude:" + (map.getBounds().getSouthEast().lat + 0.0025) + ",longitude:" + (map.getBounds().getSouthEast().lng + 0.0025),
				region:"${authInfo.cdNa}"
			},
			success: function(resp) {
				datas = resp.data
	            console.log('탐지도로 데이터 확인--->> ', datas);
				console.log('포트홀 데이터 확인-->> ', allData);

				var crackList = [];
				var crackListLv11 = [];
				var crackListLv22 = [];
				var crackListLv33 = [];
				var crackListLv44 = [];
				var elseddd = [];

				for (var i = 0; i < allData.length; i++) {

					if ( allData[i].risk.level == 1 ) {
						//console.log( i + " 번째  riskLv = " + allData[i].risk.level);
						crackListLv11.push(allData[i].id);

					} else if ( allData[i].risk.level == 2 ) {

						crackListLv22.push(allData[i].id);

					} else if ( allData[i].risk.level == 3 ) {

						crackListLv33.push(allData[i].id);

					} else if ( allData[i].risk.level == 4 ) {

						crackListLv44.push(allData[i].id);
					} else {
						elseddd.push(allData[i].id);
					}
				}

				console.log("====================================================================================================")
					console.log(elseddd)
					console.log(crackListLv11)
					console.log(crackListLv22)
					console.log(crackListLv33)
					console.log(crackListLv44)
				console.log("====================================================================================================")
				//var testlines = [];
				/*
					let now1 = new Date('2023-03-30');
					console.log("현재 : ", now1);

					let oneMonthAgo = new Date(now1.setMonth(now1.getMonth() - 1)); // 한달
					console.log("한달 전 : ", oneMonthAgo);

					let now2 = new Date('2023-12-22');
					console.log("현재 : ", now2);

					let oneMonthLater = new Date(now2.setMonth(now2.getMonth() + 1));
					console.log("한달 후 : ", oneMonthLater)
 				*/
					//0.0025
					//let now1 = new Date();
					//console.log("현재 : ", now1);

					//console.log("날짜 : " , new Date(datas[0].timestamp));

/*
				var fromDt = '';
				var toDt = '';

/*
				//fromDt = $('#fromDt').val().replaceAll('-', '');
				//toDt = $('#toDt').val().replaceAll('-', '');

				// 날짜 설정 오늘날짜로부터 1주일 (임시10.1)
				var date1 = new Date();
				//$('#toDt').val(fnDateFormat(date1, 'select'))
				var date2 = new Date(date1.setDate(date1.getDate() - 30));
				// $('#fromDt').val(dateFormat(date2, 'select'))
				//$('#fromDt').val('2023-10-01')

				var now11 = new Date();
				//console.log("현재 : ", now11);

				var oneMonthAgo = new Date(now11.setMonth(now11.getMonth() - 1)); // 한달
				var twoMonthAgo = new Date(now11.setMonth(now11.getMonth() - 2)); // 두달
				var threeMonthAgo = new Date(now11.setMonth(now11.getMonth() - 3)); // 세달
				var fourMonthAgo = new Date(now11.setMonth(now11.getMonth() - 4)); // 네달


				//console.log("now11 -->> : " + now11.getMonth());
				//console.log("oneMonthAgo -->> : " + oneMonthAgo.getMonth());
				//console.log("twoMonthAgo -->> : " + twoMonthAgo.getMonth());
				//console.log("threeMonthAgo -->> : " + threeMonthAgo.getMonth());
				//console.log("fourMonthAgo -->> : " + fourMonthAgo.getMonth());


				// console.log(now11 - new Date(datas[0].timestamp))
				// detectedRoadDate

				var crackList = [];
				var crackListLv1 = [];
				var crackListLv2 = [];
				var crackListLv3 = [];
				var crackListLv4 = [];
				var elsedd = [];
		*/
				/* for (var i = 0; i < datas.length; i++) {

					//var roadInfo = datas[i].detectedRoadInfo;

					for (var ii = 0; ii < roadInfo.length; ii++) {

						if (roadInfo[ii].riskLevel > 0) {
							console.log("riskLevel - " + ii);

							//for (var iii = ii; iii < (ii+10); iii++) {
								//crackList.push(iii)
							//}

							if (roadInfo[ii].riskLevel == 1) {
								crackListLv1.push(ii);
							} else if (roadInfo[ii].riskLevel == 2) {
								crackListLv2.push(ii);
							} else if (roadInfo[ii].riskLevel == 3) {
								crackListLv3.push(ii);
							} else if (roadInfo[ii].riskLevel == 4) {
								crackListLv4.push(ii);
							} else {
								elsedd.push(ii);
							}
						}
					}
				}


				console.log("===================================================")
				console.log(crackListLv1);
				console.log(crackListLv2);
				console.log(crackListLv3);
				console.log(crackListLv4);
				console.log(elsedd);
				console.log("===================================================") */

				//var crackList = [];
				var crackListLv1 = [];
				var crackListLv2 = [];
				var crackListLv3 = [];
				var crackListLv4 = [];
				//var elsedd = [];

				color = lvColorKeyValue.find(item => item.lv === '99').color;
				//lvColorKeyValue.find(item => item.lv === zerolv)

				function deg2rad(deg) {
			        return deg * (Math.PI/180)
			    }

				for (var i = 0; i < datas.length; i++) {

					//var roadInfo = datas[i].detectedRoadInfo;
					if (i < datas.length-1) {
						var pointA = new L.LatLng(datas[i].latitude, datas[i].longitude);
						var pointB = new L.LatLng(datas[i+1].latitude, datas[i+1].longitude);

						var pointList = [ pointA, pointB ];

						var linesize = map.getZoom()-7

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
					        map.addLayer(firstpolyline);
						}
					}

					/* if (datas[i].riskLevel > 0) {
						//console.log("riskLevel - " + i);

						if (datas[i].riskLevel == 1) {
							crackListLv1.push(i);
						} else if (datas[i].riskLevel == 2) {
							crackListLv2.push(i);
						} else if (datas[i].riskLevel == 3) {
							crackListLv3.push(i);
						} else if (datas[i].riskLevel == 4) {
							crackListLv4.push(i);
						} else {
							elsedd.push(i);
						}
					} */

				}

/* 				<c:forEach var="lvList" items="${levelList}" varStatus="status">
					riskText = getLevelText('${lvList.cdNm}');

					lvColorKeyValue.push({'lv':'${lvList.cdId}', 'lvNm': riskText, 'color':'${lvList.etc1}'})

				</c:forEach>
 */

				//console.log('레벨컬러키벨류 - ', lvColorKeyValue)

				// riskLv1
				//obj.css("color","색상");
				//for (var i = 1; i <= lvColorKeyValue.length; i++) {
					//$('#riskbgcolorLv'+ i).css("background-color", lvColorKeyValue[i-1].color)
					//$('#riskLv'+i).text(lvColorKeyValue[i-1].lvNm)
					// $('#riskLv'+ i).css("font-weight", "bold")
				//}


				var cnt = 0;

				var tttcnt = 0;

				// ------------------------------------------------------------------------------------------------------------------------
				// Lv1 리스트 처리 부분
				// ▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽
				//for (datas) {
				for (var a = 0; a < datas.length; a++) {
					for (var b = 0; b < crackListLv11.length; b++) {

						if ( datas[a].id == crackListLv11[b] ) {
							//console.log("인덱스 >> ", a , " - ", datas[a]);
							crackListLv1.push(a);
							//tttcnt++;
						}
					}


					for (var b = 0; b < crackListLv22.length; b++) {

						if ( datas[a].id == crackListLv22[b] ) {
							crackListLv2.push(a);
						}
					}

					for (var c = 0; c < crackListLv33.length; c++) {

						if ( datas[a].id == crackListLv33[c] ) {
							crackListLv3.push(a);
						}
					}

					for (var d = 0; d < crackListLv44.length; d++) {

						if ( datas[a].id == crackListLv33[d] ) {
							crackListLv4.push(a);
						}
					}


				}

				//console.log("갯수는 - " + tttcnt)




				for (var x = 0; x < crackListLv1.length; x++) {

					var rangeSumM = 0;
					var rangeSumP = 0;

					for (var xx = crackListLv1[x]; xx > 0; xx--) {
						if (xx == 84) {
							console.log("11")
						}
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

							var linesize = map.getZoom()-7

							var firstpolyline = new L.Polyline(pointList, {
							    //color: 'green',
							    //color: lvColorKeyValue[datas[crackListLv1[x]].riskLevel-1].color,
							    color: lvColorKeyValue[datas[crackListLv1[x]].riskLevel].color,
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
						        map.addLayer(firstpolyline);
							} else {


						    	break;
							}

						    // -----------------------------------------------------------------------------------------------------

						    if (rangeSumM > 25 ) {
						    	break;
						    }
						}
					}
					console.log("-----------------------------------------------------------------------------------------------------")
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

							var linesize = map.getZoom()-7

							var firstpolyline = new L.Polyline(pointList, {
							    //color: 'green',
							    //color: lvColorKeyValue[datas[crackListLv1[x]].riskLevel-1].color,
							    color: lvColorKeyValue[datas[crackListLv1[x]].riskLevel].color,
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
						        map.addLayer(firstpolyline);
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

							var linesize = map.getZoom()-7

							var firstpolyline = new L.Polyline(pointList, {
							    //color: 'blue',
							    //color: lvColorKeyValue[datas[crackListLv2[x]].riskLevel-1].color,
							    color: lvColorKeyValue[datas[crackListLv2[x]].riskLevel].color,
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
						        map.addLayer(firstpolyline);
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

							var linesize = map.getZoom()-7

							var firstpolyline = new L.Polyline(pointList, {
							    //color: 'blue',
							    //color: lvColorKeyValue[datas[crackListLv2[x]].riskLevel-1].color,
							    color: lvColorKeyValue[datas[crackListLv2[x]].riskLevel].color,
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
						        map.addLayer(firstpolyline);
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

							var linesize = map.getZoom()-7

							var firstpolyline = new L.Polyline(pointList, {
							    //color: 'orange',
							    //color: lvColorKeyValue[datas[crackListLv3[x]].riskLevel-1].color,
							    color: lvColorKeyValue[datas[crackListLv2[x]].riskLevel].color,
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
						        map.addLayer(firstpolyline);
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

							var linesize = map.getZoom()-7

							var firstpolyline = new L.Polyline(pointList, {
							    //color: 'orange',
							    //color: lvColorKeyValue[datas[crackListLv3[x]].riskLevel-1].color,
							    color: lvColorKeyValue[datas[crackListLv2[x]].riskLevel].color,
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
						        map.addLayer(firstpolyline);
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


				// ------------------------------------------------------------------------------------------------------------------------
				// Lv4 리스트 처리 부분
				// ▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽▽

				for (var x = 0; x < crackListLv4.length; x++) {

					var rangeSumM = 0;
					var rangeSumP = 0;

					for (var xx = crackListLv4[x]; xx > 0; xx--) {

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

							var linesize = map.getZoom()-7

							var firstpolyline = new L.Polyline(pointList, {
							    //color: 'red',
							    //color: lvColorKeyValue[datas[crackListLv4[x]].riskLevel-1].color,
							    color: lvColorKeyValue[datas[crackListLv2[x]].riskLevel].color,
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
						        map.addLayer(firstpolyline);
							}

						    // -----------------------------------------------------------------------------------------------------

						    if (rangeSumM > 25 ) {
						    	break;
						    }
						}
					}

					for (var xx = crackListLv4[x]; xx < datas.length; xx++) {

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

							var linesize = map.getZoom()-7

							var firstpolyline = new L.Polyline(pointList, {
							    //color: 'red',
							    //color: lvColorKeyValue[datas[crackListLv4[x]].riskLevel-1].color,
							    color: lvColorKeyValue[datas[crackListLv2[x]].riskLevel].color,
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
						        map.addLayer(firstpolyline);
							}

						    // -----------------------------------------------------------------------------------------------------

						    if (rangeSumP > 25 ) {
						    	break;
						    }
						}
					}
				}

				// △△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△△
				// Lv4 리스트 처리 부분
				// ------------------------------------------------------------------------------------------------------------------------


				/* for (var i = 0; i < datas.length; i++) {
				//for (var i = datas.length-1; i > 0; i--) {


					//console.log(datas[i].detectedRoadDate)
					//detectedRoadDate:"2024-01-20"
				/********************************************************************************************************************

					// 주어진 날짜를 '2023-10-01' 형식에서 Date 객체로 변환
    				//const givenDate = new Date(dateString);
    				const givenDate = new Date(datas[i].detectedRoadDate);

    				// 현재 날짜
    			    const now = new Date();

    			    // 현재 연도와 월
    			    const currentYear = now.getFullYear();
    			    const currentMonth = now.getMonth() + 1; // 0이 1월이므로 +1

    			 	// 주어진 날짜의 연도와 월
    			    const givenYear = givenDate.getFullYear();
    			    const givenMonth = givenDate.getMonth() + 1; // 0이 1월이므로 +1

    			    // 월 차이 계산 (연도를 고려)
    			    let monthDifference = (currentYear - givenYear) * 12 + (currentMonth - givenMonth);

    			    // 9월의 데이터를 제외
    			    //if (monthDifference === 0) {
    			        //return null; // 현재 달(9월)이므로 제외
    			        //continue;
    			    //}

    			    if (monthDifference !== null) {
    			        console.log(givenDate + '는 현재와 ' + monthDifference + '개월 차이입니다.');
    			    } else {
    			       // console.log(`${date}는 현재 달이므로 제외됩니다.`);
    			    }

					//if ( monthDifference == 1 ) {
						//color = (monthColorKeyValue.find(item => item.code === 'one')).color;
					//} else if ( monthDifference == 2 ) {
						//color = (monthColorKeyValue.find(item => item.code === 'two')).color;
					//} else if ( monthDifference == 3 ) {
						//color = (monthColorKeyValue.find(item => item.code === 'thre')).color;
					//} else {
						//color = (monthColorKeyValue.find(item => item.code === 'else')).color;
					//}



					*********************************************************************************************************************
					if (datas[i].detectedRoadDate == "2024-01-20") {
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
					}

					var positionDatas = datas[i].detectedRoadInfo;

					for (var x = 1; x < positionDatas.length; x++) {

						//console.log(x, " ->> ", now11 - new Date(positionDatas[x-1].timestamp))

						//console.log(">>>>> " + x + " - " +  positionDatas[x-1].riskLevel);
						if (crackList.includes(x)) {
							color = "red";
						} else {
							color = "gray";
						}


						var pointA = new L.LatLng(positionDatas[x-1].latitude, positionDatas[x-1].longitude);
						var pointB = new L.LatLng(positionDatas[x].latitude, positionDatas[x].longitude);

						var pointList = [ pointA, pointB ];

						var linesize = map.getZoom()-7

						var firstpolyline = new L.Polyline(pointList, {
						    //color: 'red',
						    //color: 'gray',
						    color: color,
						    //color: 'lightgray',
						    //weight: 15,
						    weight: linesize,
						    //opacity: 0.1,
						    smoothFactor: 1

						    })//.on('click', function(e) {
					            //wayMarkerList(response ,wayname)

					        //});;

				        var pointATime = new Date( positionDatas[x-1].timestamp );
				        var pointBTime = new Date( positionDatas[x].timestamp );

				        //var date2 = new Date(date1.setDate(date1.getDate() - 30));

				        var BAsecond = (pointBTime - pointATime) / 1000;

				        	//console.log( pointATime + " / " + pointBTime )
				        	//console.log( (pointBTime - pointATime) / 1000 )

						if (BAsecond < 10) {
					        map.addLayer(firstpolyline);
						}

						testlines.push(firstpolyline);
					}
				} */

				//console.log("====================================================================================================")
				//console.log("====================================================================================================")
			},
			error: function(request,status,error){

				//console.log("request.status = " + request.status)dddddddddddddddddddddddddd

			},
			beforeSend:function(){
				$('#circularG').css('display','block')
			},
			complete : function(data) {
				//  실패했어도 완료가 되었을 때 처리
				$('#circularG').css('display','none')

			}
		})
	}


	function abc() {

		/**************************************************************************************************************************************/
		//north_west:"latitude:" + (map.getBounds().getNorthWest().lat + 0.0025) + ",longitude:" + (map.getBounds().getNorthWest().lng - 0.0025),
		//north_east:"latitude:" + (map.getBounds().getNorthEast().lat + 0.0025) + ",longitude:" + (map.getBounds().getNorthEast().lng + 0.0025),
		//south_west:"latitude:" + (map.getBounds().getSouthWest().lat - 0.0025) + ",longitude:" + (map.getBounds().getSouthWest().lng - 0.0025),
		//south_east:"latitude:" + (map.getBounds().getSouthEast().lat + 0.0025) + ",longitude:" + (map.getBounds().getSouthEast().lng - 0.0025),

		//var dd1 = [map.getBounds().getNorthWest().lat-0.0125, map.getBounds().getNorthEast().lat-0.0125, map.getBounds().getSouthWest().lat+0.0125, map.getBounds().getSouthEast().lat-0.0125, map.getBounds().getNorthWest().lat-0.0125];
		//var dd2 = [map.getBounds().getNorthWest().lng+0.0125, map.getBounds().getNorthEast().lng-0.0125, map.getBounds().getSouthWest().lng+0.0125, map.getBounds().getSouthEast().lng+0.0125, map.getBounds().getNorthWest().lng+0.0125];

		var dd1 = [	map.getBounds().getNorthWest().lat,
					map.getBounds().getNorthEast().lat,
					map.getBounds().getSouthEast().lat,
					map.getBounds().getSouthWest().lat,
					map.getBounds().getNorthWest().lat ];
		var dd2 = [	map.getBounds().getNorthWest().lng,
					map.getBounds().getNorthEast().lng,
					map.getBounds().getSouthEast().lng,
					map.getBounds().getSouthWest().lng,
					map.getBounds().getNorthWest().lng ];

		var cc1 = [	map.getBounds().getNorthWest().lat+0.0025,
					map.getBounds().getNorthEast().lat+0.0025,
					map.getBounds().getSouthEast().lat-0.0025,
					map.getBounds().getSouthWest().lat-0.0025,
					map.getBounds().getNorthWest().lat+0.0025 ];
		var cc2 = [	map.getBounds().getNorthWest().lng-0.0025,
					map.getBounds().getNorthEast().lng+0.0025,
					map.getBounds().getSouthEast().lng+0.0025,
					map.getBounds().getSouthWest().lng-0.0025,
					map.getBounds().getNorthWest().lng-0.0025 ];

		var tlines = []

		for (var a = 0 ; a < dd1.length-1 ; a++ ) {

			var pointA = new L.LatLng(dd1[a], dd2[a]);
			var pointB = new L.LatLng(dd1[a+1], dd2[a+1]);

			var pointList = [ pointA, pointB ];

			var riskLvColor = ""

			var linesize = 13

			var firstpolyline11 = new L.Polyline(pointList, {
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

			map.addLayer(firstpolyline11);

			tlines.push(firstpolyline11);
		}

		for (var aa = 0 ; aa < cc1.length-1 ; aa++ ) {

			var pointA = new L.LatLng(cc1[aa], cc2[aa]);
			var pointB = new L.LatLng(cc1[aa+1], cc2[aa+1]);

			var pointList = [ pointA, pointB ];

			var riskLvColor = ""

			var linesize = 13

			var firstpolyline22 = new L.Polyline(pointList, {
			    //color: 'red',
			    color: 'blue',
			    //weight: 15,
			    weight: linesize,
			    //opacity: 0.1,
			    smoothFactor: 1

			    })//.on('click', function(e) {
			    	//alert('Polyline clicked at ' + e.latlng);
		            // You can also handle other actions here
		            //wayMarkerList(response ,wayname)

		        //});;

			map.addLayer(firstpolyline22);

			tlines.push(firstpolyline22);
		}

	/**************************************************************************************************************************************/
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


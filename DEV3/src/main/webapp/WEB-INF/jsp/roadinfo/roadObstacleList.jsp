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
				<input type="text" value="" name="" id="" class="input1" placeholder="영상이름">
				<span class="stl"><fmt:message key="PERIOD" bundle="${bundle}"/><span class="remark2"></span></span>
				<span class="date">
                	<input type="text" value="${fromDt}" name="start" id="fromDt" class="input2" readonly> ~ <input type="text" value="${toDt}" name="end" id="toDt" class="input2" readonly>
                	<button class="search_calender" id="search_calender"></button>
            	</span>
            <button class="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>
        </li>
        <button class="btn_subPrimary btn_mapinfo" id ="btn_mapinfo" onclick='showMap()'>지도정보보기</button>

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
						<th>영상이름</th>
						<th>촬영일자</th>
						<th>동물</th>
						<th>보행자</th>
						<th>공사표지판</th>
						<th>라바콘</th>
						<th>상자</th>
						<th>낙석</th>
						<th>쓰레기</th>
						<th>맨홀</th>
						<th>포트홀</th>
						<th>보수된포트홀</th>
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
			<button class="btn_bgPrimary btn_obstacleList" id ="btn_obstacleList" onclick='hideMap()'>장애물 목록보기</button>
		</div>
		<div class="contents mainMap">
			<div class="mapWrap">
				<!-- ******************************************************************************************************************* -->
				<!-- Level List 부분 start -->
				<!-- ******************************************************************************************************************* -->
				<%-- <ul class="search_box level_list" style="min-width: 1170px; margin-top:0px; display: none;">
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
					<li>
						<button class="btn_re-search" onclick='btnClick()'><fmt:message key="RESULT_IN_SEARCH" bundle="${bundle}"/></button>
					</li>
				</ul> --%>

				<!-- 결과내재검색패널 -->
				<div class="re-search-container" id="re-search-container" style="display: none; width: calc(100% - 400px);">
					<button type="button" id="btn_re-searchWrap" class="btn_re-searchWrap" onclick='btnClick()'></button>
					<div class="group">
						<dl class="">
							<dt>탐지 객체</dt>
							<dd>
								<div class="selectOpt">
									<input type="checkbox" id="allCheck" class="" name="" value=""><label for="allCheck">전체</label>
									<input type="checkbox" id="object1" class="" name="" value="" checked><label for="object1">동물</label>
									<input type="checkbox" id="object2" class="" name="" value=""><label for="object2">보행자</label>
									<input type="checkbox" id="object3" class="" name="" value=""><label for="object3">공사표지판</label>
									<input type="checkbox" id="object4" class="" name="" value=""><label for="object4">라바콘</label>
									<input type="checkbox" id="object5" class="" name="" value="" checked><label for="object5">낙하물</label>
									<input type="checkbox" id="object6" class="" name="" value="" checked><label for="object6">낙석</label>
									<input type="checkbox" id="object7" class="" name="" value=""><label for="object7">쓰레기</label>
									<input type="checkbox" id="object8" class="" name="" value=""><label for="object8">맨홀</label>
									<input type="checkbox" id="object9" class="" name="" value=""><label for="object9">포트홀</label>
									<input type="checkbox" id="object10" class="" name="" value=""><label for="object10">보수된포트홀</label>
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
								<span>동물<em id="">0</em></span>
								<span>보행자<em id="">0</em></span>
								<span>공사표지판<em id="">1</em></span>
								<span>라바콘<em id="">0</em></span>
								<span>낙하물<em id="">0</em></span>
								<span>낙석<em id="">0</em></span>
								<span>쓰레기<em id="">1</em></span>
								<span>맨홀<em id="">0</em></span>
								<span>포트홀<em id="">1</em></span>
								<span>보수된포트홀<em id="">0</em></span>
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
								<dd id="detail_ctime">2024.11.22 11:08</dd>
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
						<span class="fileName">파일명 : <em>수정구로_20241113.dat</em></span>
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

var selectedId = '';
var selectedVideoName ='';

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


//결과내재검색패널
function btnClick() {
  const searchOpt = document.getElementById('re-search-container');

  if (searchOpt.style.display === 'none') {
    searchOpt.style.display = 'block';
  } else {
    searchOpt.style.display = 'none';
  }

}


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

	var params = {
			'videoName': ''
			,'from': $('#fromDt').val().replaceAll('-','')
			,'to': $('#toDt').val().replaceAll('-','')
			,'coId': "${authInfo.cdNa}"
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
			//var result = resp.data[0];

			console.log('비디오 결과', resp.data);

			var result = resp.data;

 			var appendRow = "";

 			result.forEach (function (el, index) {

				appendRow += '<tr>'
					+'<td><label class="checkbox"><input class="checkbox" type="checkbox" id="'+ el.id +'" name ="videolist"><span class="icon"></span></label></td>'
					+'<td align="center" class="listtd">'+el.videoName+'</td>'
					//+'<td align="center" class="listtd">'+el.videoStartTime+'</td>'
					+'<td align="center" class="listtd">'+dateFormat(new Date(el.videoStartTime), 'list')+'</td>'
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
			//$('#totCnt').text(result.length);

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

/* 	var riskChk = $("input[name='risklist']:checked");
	var crackChk = $("input[name='crack']:checked");
	var statusChk = $("input[name='statusstat']:checked"); */

	map.eachLayer(function(layer) {
		if ((layer instanceof L.Marker) || (layer instanceof L.MarkerCluster) || (layer instanceof L.MarkerClusterGroup)) {
			map.removeLayer(layer);
		};
	});

	mapClosePopup();

	$('.infoDetailWrap').css('display', 'none');
	$('.infoListWrap').css('display', 'block');


/////////////////////////여기다가 마커 추가해보자!
/*
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
 */
////////////////////////////
	var videoIds = []; // 추후 다중 선택을 위해 숫자형 배열로 전달
	videoIds.push(selectedId);

	console.log('비디오 네임 확인', selectedVideoName);
	console.log('비디오 아이디 확인', selectedId );

	$('.infoListTop .fileName em').remove();
	$('.infoList li').remove();
	$('.infoListTop .fileName').append('<em>' + selectedVideoName + '</em>');

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
			console.log('이미지 결과', resp);

			var result = resp.data;

 			var appendRow = "";

 			result.forEach (function (el, index) {

 				var sum = 0;
 				var totalObjects = Object.values(el.obstacleImage).reduce((sum, item) => sum + item, 0);

 				console.log('토탈 개수', totalObjects);

				appendRow += "<li><a class='infoListItem'>"
					+ "<div class='info'>"
					+ "<ul class='infoContents'>"
					+ "<li onClick=\"detail('" + el.id + "', 'N')\"'> <fmt:message key="ROAD_NAME" bundle="${bundle}"/> : " + el.wayName + "</li>"
					+ "<li> <fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/> : " + dateFormat(new Date(el.systemTime), 'list') + "</li>"
					+ "<li> 탐지객체수 : " +totalObjects +"</li>"
					+ "</ul>"
					+ "</div>"
					+ "<div class='infoThumnail'>"
					//+ "<img src='${authInfo.restApiUrl}/obs/" + el.id + "/thumbnail' alt='대표이미지' onclick=\"originalimg('" + el.id + "')\">"   // 배포시 ajax
					+ "<img src='http://localhost:8080/obs/" + el.id + "/thumbnail' alt='대표이미지' onclick=\"originalimg('" + el.id + "')\">"
					+ "</div>"
					+ "</li>"
			});

 			$(".infoList").append(appendRow);

 			$(".infoListWrap .infoListTop p").text("<fmt:message key="TOTAL" bundle="${bundle}"/> " + result.length + " <fmt:message key="COUNT2" bundle="${bundle}"/>")

		}
	});

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
    detail(e.target.options.id, 'N');

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

function detail(id, clusterChk){

	var deviceNm, deviceId, addrPoLocality, dateFormat, lat, lng, level, status, potholes, vertical, horizontal, alligators, riskLvNm;

/* 	markerIconCheck();
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
 */
	var lat = Number(lat);
	var lng = Number(lng);

	var position = [lat, lng];

/* 	if (clusterChk == 'N') {
		popup.setLatLng(position)
			.setContent(popuptxt)
			.openOn(map);
	}
 */

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
	$("#detail_img").attr("src", "http://localhost:8080/obs/"  + id + "/thumbnail");
	//$("#detail_img").attr("src", "${authInfo.restApiUrl}/obs/"  + id + "/thumbnail");  //개발 배포 ajax

	$("#detail_img").removeAttr("onClick");
	$("#detail_img").attr("onclick", "originalimg('" + id + "')");


	$("#riskLv").text("LEVEL" + level + ". " + riskText);

	// 포트홀
	$("#CntPothole").text(potholes)
	// 수직균열
	$("#CntVertical").text(vertical + " <fmt:message key="COUNT1" bundle="${bundle}"/>")
	// 수평균열
	$("#CntHorizontal").text(horizontal + " <fmt:message key="COUNT1" bundle="${bundle}"/>")
	// 피로균열
	$("#CntAlligators").text(alligators + " <fmt:message key="COUNT1" bundle="${bundle}"/>")

	// detail영역
	$("#detail_title").text();
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

	//$("#pop_img").attr("src", "${authInfo.restApiUrl}/obs/" + id + "/image");   // 배포시 ajax
	$("#pop_img").attr("src", "http://localhost:8080/obs/" + id + "/image");
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
			//$('.level_list').css('width', 'calc(100% - 40px)');
        	$('.re-search-container').css('width', 'calc(100% - 40px)');
		} else if ( $('.menu_bar_close').css('display') == 'none' ) {
			//$('.level_list').css('width', 'calc(100% - 40px)');
        	$('.re-search-container').css('width', 'calc(100% - 40px)');
		}

        $('.btn_infoWrap').addClass("off");

        map.closePopup();
    	markerIconCheck();
    } else{

 		if ( $('.menu_bar_close').css('display') == 'block' ) {
			//$('.level_list').css('width', 'calc(100% - 400px)');
        	$('.re-search-container').css('width', 'calc(100% - 400px)');
		} else if ( $('.menu_bar_close').css('display') == 'none' ) {
			//$('.level_list').css('width', 'calc(100% - 180px)');
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
   var date2 = new Date(date1.setDate(date1.getDate()-30));
   // $('#fromDt').val(dateFormat(date2, 'select'))
   //$('#fromDt').val('2023-10-01');

    $('#fromDt').val(getThreeMonthAgo())

 	getList();

	//체크박스 컨트롤
    $("input:checkbox[name='videolist']").on('click', function() {
        var checkboxName = $(this).attr('name');
        var checkedCount = $('input[name="' + checkboxName + '"]:checked').length;

        selectedId = $(this).attr('id');  // 선택된 체크박스의 ID

		 // 선택된 체크박스와 동일한 ID를 가진 tr 행을 찾기
		 var selectedRow = $('#table-1 tbody tr').filter(function() {
		     return $(this).find('input:checkbox').attr('id') === selectedId;
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
    });




})
///////////////////// 날짜관련
function dateFormat(date, format){


   if (format == 'list'){
      // 2023.01.01 14:03:01
      var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 );
      var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate();
      var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours();
      var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes();
      var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds();

      dateString  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec

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
		$("#alert_msg").html("비디오를 1개 이상 선택해주세요.");
		$("#pop_alert").stop().fadeIn(300);
		return false;
	}

    $('#mapDetetionInfo').css('display', 'block');
	$('.btnAreaTop').css('display', 'block');

	$('#btn_mapinfo').css('display', 'none');

	//getVideoImageList();

	map.invalidateSize();

	//mapInfo(map);
}

function hideMap() {
	$('#mapDetetionInfo').css('display', 'none');
	$('.btnAreaTop').css('display', 'none');
	$('#btn_mapinfo').css('display', 'block');
}

function mapInfo(map) {

	var lat = map.getCenter().lat;
	var lng = map.getCenter().lng;

	markerList = [];

	map.eachLayer(function (layer) {
	    if (!(layer instanceof L.TileLayer)) {
	        map.removeLayer(layer);
	    }
	});

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




</script>
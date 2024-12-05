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

    <ul class="search_box">
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
    </ul>
    <ul class="contents">
        <li class="view">
            <table class="table">
                <colgroup>
                    <col style="width: 5%">
                    <col style="width: 15%">
                    <col style="width: 10%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 9%">
                </colgroup>
                <thead>
                    <tr>
						<th><input class="checkbox" type="checkbox" id="checked"><label for="checked"></label></th>
						<th>영상이름</th>
						<th>촬영일자</th>
						<th>동물</th>
						<th>보행자</th>
						<th>공사표지판</th>
						<th>라바콘</th>
						<th>낙하물</th>
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
                        <col style="width: 5%">
						<col style="width: 15%">
						<col style="width: 10%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 8%">
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
						<tr class="">
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
						<tr class="">
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
						<tr class="">
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
						<tr class="on">
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
						<tr class="">
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
						<tr class="">
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
		<div class="btnAreaTop">
			<button class="btn_re-search" onclick='btnClick()'><fmt:message key="RESULT_IN_SEARCH" bundle="${bundle}"/></button>
			<button class="btn_bgPrimary btn_obstacleList" onclick='hideMap()'>장애물 목록보기</button>
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

			<div class="MapArea" style="height: 100%;">
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
				<div class="infoDetailWrap" style="display:;">
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
				<div class="infoListWrap" style="overflow-y:auto; display: none;">
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

	//getList();
});

//jquery-3.3.1 부분 적용
/*  var newJquery = $.noConflict(true);

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
	        //url: '/excel/yearly/download.do',
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
	}); */

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


 	//getList();


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

function showMap() {
	$('#mapDetetionInfo').css('display', 'block');
}

function hideMap() {
	$('#mapDetetionInfo').css('display', 'none');
}





</script>
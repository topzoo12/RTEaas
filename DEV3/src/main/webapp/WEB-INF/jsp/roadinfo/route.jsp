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
        <!-- div class="riskInfopopup" >
            <div>
                <span id="riskbgcolorLv1">&nbsp;</span>
                <span id="riskLv1">양호</span>
            </div>
            <div>
                <span id="riskbgcolorLv2">&nbsp;</span>
                <span id="riskLv2">양호</span>
            </div>
            <div>
                <span id="riskbgcolorLv3">&nbsp;</span>
                <span id="riskLv3">양호</span>
            </div>
            <div>
                <span id="riskbgcolorLv4">&nbsp;</span>
                <span id="riskLv4">양호</span>
            </div>
        </div-->
        <div class="mapWrap">
	<!-- ******************************************************************************************************************* -->
	<!-- Level List 부분 -->
	<!-- ******************************************************************************************************************* -->
		<ul class="search_box level_list" style="min-width: 1170px; margin-top:0px; width: calc(100% - 40px);">
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
						<input type="text" value="" name="deviceNm" id="deviceNm" class="input1" placeholder="<fmt:message key="DEVICE_NAME" bundle="${bundle}"/>">
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
					<!-- 검색영역 최신순 오래된순 -->
					<%-- <div class="array-container">
                        <span class="selectBox text bottom" id="select_asc_sort">
                        	<button class="label" id="searchSort" data-code="desc" onchange="changeSortSelect()"><fmt:message key="DATE_DESC" bundle="${bundle}"/></button>
                            <ul class="optionList" id="sortchk">
                                <li class="optionItem sorting" data-code="desc"><fmt:message key="DATE_DESC" bundle="${bundle}"/></li>
                                <li class="optionItem sorting" data-code="asc"><fmt:message key="DATE_ASC" bundle="${bundle}"/></li>
                            </ul>
                        </span>
                    </div> --%>
					<button class="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>

					<!-- 파일 업로드 테스트 -->
					<!--<form id="uploadForm">
							<label for="file" style="color:white">Choose a file:</label>
							<input type="file"  style="color:white" id="file" name="file" required>
							<input type="submit" value="파일 업로드">
						</form> -->
					<!-- 파일 업로드 테스트 -->
				</li>
				<li>
					<button class="btn_re-search" onclick='btnClick()'><fmt:message key="RESULT_IN_SEARCH" bundle="${bundle}"/></button>
				</li>
	    </ul>
	    <!-- 결과내재검색패널 -->
			<div class="re-search-container" id="re-search-container" style="display: none; width: calc(100% - 40px);">
                <button type="button" id="btn_re-searchWrap" class="btn_re-searchWrap" onclick='btn2Click()'></button>
<%--
				<div class="group">
					<dl class="">
						<dt><fmt:message key="RISK_LEVEL" bundle="${bundle}"/></dt>
						<dd>
							<div class="selectOpt">
								<input type="checkbox" id="riskAll" name="riskAll" checked><label for="riskAll"><fmt:message key="ALL" bundle="${bundle}"/></label>
								<c:forEach var="risklist" items="${codeListLv}" varStatus="status">
									<input type="checkbox" id="${risklist.etc2}" class="risklist" name="risklist" value="${risklist.etc3}" checked><label for="${risklist.etc2}">
									<!-- <fmt:message key="${risklist.cdNm}" bundle="${bundle}"/> --!>
									<c:choose>
										<c:when test="${nowCdNa eq 'KR'}">${risklist.cdNm}</c:when>
										<c:when test="${nowCdNa eq 'US'}">${risklist.cdNmEng}</c:when>
										<c:when test="${nowCdNa eq 'JP'}">${risklist.cdNmJp}</c:when>
									</c:choose>

									</label>
								</c:forEach>
								<!-- <input type="checkbox" id="risk1" class="risklist" name="risk" value="1" checked><label for="risk1">1</label>
								<input type="checkbox" id="risk2" class="risklist" name="risk" value="2" checked><label for="risk2">2</label>
								<input type="checkbox" id="risk3" class="risklist" name="risk" value="3" checked><label for="risk3">3</label>
								<input type="checkbox" id="risk4" class="risklist" name="risk" value="4" checked><label for="risk4">4</label>
								<input type="checkbox" id="risk5" class="risklist" name="risk" value="5" checked><label for="risk5">5</label> -->
						</div>
						</dd>
					</dl>
				</div>
				<div class="group">
					<dl class="">
						<dt><fmt:message key="TYPE" bundle="${bundle}"/></dt>
						<dd>
							<div class="selectOpt">
								<input type="checkbox" id="allCrack" name="allCrack" checked><label for="allCrack"><fmt:message key="ALL" bundle="${bundle}"/></label>
									<c:forEach var="cracklist" items="${codeListDv}" varStatus="status">
										<input type="checkbox" id="${cracklist.etc1}" class="crack" name="crack" value="${cracklist.etc2}" checked><label for="${cracklist.etc1}">
										<!-- <fmt:message key="${cracklist.cdNm}" bundle="${bundle}"/> --!>

										<c:choose>
											<c:when test="${nowCdNa eq 'KR'}">${cracklist.cdNm}</c:when>
											<c:when test="${nowCdNa eq 'US'}">${cracklist.cdNmEng}</c:when>
											<c:when test="${nowCdNa eq 'JP'}">${cracklist.cdNmJp}</c:when>
										</c:choose>

										</label>
									</c:forEach>
								<!-- <input type="checkbox" id="pothole" class="crack" name="crack" value="count-of-potholes" checked><label for="pothole">포트홀</label>
								<input type="checkbox" id="horizontal" class="crack" name="crack" value="count-of-horizontal-cracks" checked><label for="horizontal">수평균열</label>
								<input type="checkbox" id="vertical" class="crack" name="crack" value="count-of-vertical-cracks" checked><label for="vertical">수직균열</label>
								<input type="checkbox" id="alligators" class="crack" name="crack" value="count-of-alligators" checked><label for="alligators">피로균열</label> -->
						</div>
						</dd>
					</dl>
				</div>
				<div class="group">
					<dl class="">
						<dt><fmt:message key="STATUS" bundle="${bundle}"/></dt>
						<dd>
							<div class="selectOpt">
								<input type="checkbox" id="statusAll" name="statusAll" checked><label for="statusAll"><fmt:message key="ALL" bundle="${bundle}"/></label>
								<c:forEach var="statuslist" items="${codeListSd}" varStatus="status">
									<input type="checkbox" id="${statuslist.cdId}" class="statusstat" name="statusstat" value="${statuslist.comCd}" checked><label for="${statuslist.cdId}">
									<fmt:message key="${statuslist.cdNm}" bundle="${bundle}"/>

										<c:choose>
											<c:when test="${nowCdNa eq 'KR'}">${statuslist.cdNm}</c:when>
											<c:when test="${nowCdNa eq 'US'}">${statuslist.cdNmEng}</c:when>
											<c:when test="${nowCdNa eq 'JP'}">${statuslist.cdNmJp}</c:when>
										</c:choose>
									</label>
								</c:forEach>
								<input type="checkbox" id="ETC" class="statusstat" name="statusstat" value="ETC" checked><label for="ETC">미분류</label>
								<!-- <input type="checkbox" id="status-1" name="status" checked><label for="status-1">대기</label>
								<input type="checkbox" id="status-2" name="status" checked><label for="status-2">미분류</label>
								<input type="checkbox" id="status-3" name="status" checked><label for="status-3">접수완료</label>
								<input type="checkbox" id="status-4" name="status" checked><label for="status-4">보수진행중</label>
								<input type="checkbox" id="status-5" name="status" checked><label for="status-5">보수완료</label> -->
						</div>
						</dd>
					</dl>
					<div class="submitarea">
						<button class="btn_iconTXT btn_r btn_m btn_resetOpt" onclick="optionReset()"><fmt:message key="RESET_SELECT" bundle="${bundle}"/></button>
					</div>
				</div> --%>
				<div class="group">
					<dl class="">
						<dt><fmt:message key="MARKER_YN" bundle="${bundle}"/></dt>
						<dd>
							<div class="selectOpt">
								<input type="radio" id="on" name="markerPower" onclick="markerOn()"><label for="on">ON</label>
								<input type="radio" id="off" name="markerPower" checked onclick="markerOff()"><label for="off">OFF</label>
							</div>
						</dd>
					</dl>
					<div class="submitarea">
						<%-- <button class="btn_iconTXT btn_r btn_m btn_resetOpt" onclick="optionReset()"><fmt:message key="RESET_SELECT" bundle="${bundle}"/></button> --%>
						<%-- <button class="btn_deepdark btn_r btn_m" onclick="reSearch()"><fmt:message key="SEARCH_2" bundle="${bundle}"/></button> --%>
					</div>
				</div>
			</div>
		<!-- ******************************************************************************************************************* -->
		<!-- ******************************************************************************************************************* -->

           <!--  <div class="searchMap">
                <ul class="searchMap_box">
                    <li>
                        <span class="selectBox bottom" id="coId_span">
                          <button class="label" id="coId" data-code="A0001">시/도 선택</button>
                          <ul class="optionList" id="aa1" style="display: none;">
                            <li class="optionItem" data-code="A0001">서울특별시</li>
                            <li class="optionItem" data-code="A0002">부산광역시</li>
                            <li class="optionItem" data-code="A0003">대구광역시</li>
                            <li class="optionItem" data-code="A0005">세종특별자치시</li>
                          </ul>
                        </span>

                        <span class="selectBox bottom" id="taskDiv_span">
                            <button class="label" id="taskDiv" data-code="">시/군/구 선택</button>
                            <ul class="optionList" style="display: none;">
                                <li class="optionItem">전체</li>
                                <li class="optionItem" data-code="GA001">강남구</li>
                                <li class="optionItem" data-code="GA002">서초구</li>
                                <li class="optionItem" data-code="GA003">송파구</li>
                                <li class="optionItem" data-code="GA004">관악구</li>
                                <li class="optionItem" data-code="GA005">종로구</li>
                              </ul>
                        </span>

                        <span class="selectBox bottom" id="taskDiv_span">
                            <button class="label" id="taskDiv" data-code="">읍/면/동 선택</button>
                            <ul class="optionList" style="display: none;">
                                <li class="optionItem">전체</li>
                                <li class="optionItem" data-code="GA001">논현동</li>
                                <li class="optionItem" data-code="GA002">도곡동</li>
                                <li class="optionItem" data-code="GA003">신사동</li>
                                <li class="optionItem" data-code="GA004">세곡동</li>
                                <li class="optionItem" data-code="GA005">삼성동</li>
                              </ul>
                        </span>
						<input type="text" value="" name="coNm" id="aa2" class="input1" height="100%" placeholder="">
                        <button class="btn_l btn_deepdark">검색</button>
                    </li>
                </ul>

            </div> -->




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
        <div class="infoWrap off"> <!-- class="on" -->
            <button type="button" class="btn_infoWrap off"></button>



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
                <div class="btnWrap">
                    <div class="btnArea">
                        <button type="button" class="btn_iconTXT" id="btn_Back"><span class="material-symbols-outlined">list</span> <fmt:message key="TO_LIST" bundle="${bundle}"/></button>
                        <!-- <div style="display: none;">
                            <button type="button" class="btn_m btn_r btn_secondary">보류</button>
                            <button type="button" class="btn_m btn_r btn_primary">상세설정관리</button>
                        </div> -->
                    </div>
                </div>
            </div>
            <!-- e:상세설명 -->

            <!-- 검색목록 -->
            <!-- div class="infoListWrap"-->
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
                <%--
                <h2 class="hidden">검색목록</h2>
                <p class="itemCount">총 <em>0 건</em></p>

                <c:forEach var="infoList" items="${selectListCo}" varStatus="status">
					<li class="optionItem" data-code="${selectco.coId}">${selectco.coNm}</li>
				</c:forEach>
				 --%>
                <ul class="infoList" style="display: block;">
                    <!-- <li>
                        <a class="infoListItem" href="#">
                            <div class="info">
                                <h3 class="infoTitle">복합가스측정기 001</h3>
                                <ul class="infoContents">
                                    <li>서울북부지방법원,검찰청,도보영성황당,서울북부지방법원</li>
                                    <li>GV7X+V9 서울특별시</li>
                                </ul>
                            </div>
                            <div class="infoThumnail">
                                <img src="/img/sample_highway.jpg" alt="대표이미지">
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
                    	<fmt:message key="NO_SEARCH_DATA" bundle="${bundle}"/><!--  검색된 데이터가 없습니다. -->
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

/* 	$('.infoListWrap').css('display', 'none');
	$(".infoListWrap p").css('display', 'hidden');
	$('.infoDetailWrap').css('display', 'none');

	$('.infoWrap').removeClass('on'); */

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
	var statusKeyValue = [];

	<c:forEach var="statuslist" items="${codeListSd}" varStatus="status">
		statusKeyValue.push({'code':'${statuslist.cdId}', 'codeName':'${statuslist.cdNm}', 'codeNameEng':'${statuslist.cdNmEng}', 'codeNameJP':'${statuslist.cdNmJp}', 'codeClass':'${statuslist.etc1}', })
	</c:forEach>

	<c:forEach var="risklist" items="${codeListLv}" varStatus="status">
		riskKeyValue.push({'code':'${risklist.cdId}', 'codeName':'${risklist.cdNm}', 'codeNameEng':'${risklist.cdNmEng}', 'codeNameJP':'${risklist.cdNmJp}', 'codeClass':'${risklist.etc1}', })
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

	//
	function btn2Click() {
	  const searchOpt = document.getElementById('re-search-container');

	  if (searchOpt.style.display === 'block') {
	    searchOpt.style.display = 'none';
	  } else {
	    searchOpt.style.display = 'block';
	  }
	}

	var potholeCnt;
	var potholeListData;
	var markerId = [];

	markerOnOff = "";
	markerCheck = true;

	var img_id;


	markerList = [];
	markersTemp = [];

	let searchLv;
	let activeMarker = null;

	if (searchLv == undefined) {
		searchLv = 2
		const temp = document.getElementById('level2');
	 	temp.setAttribute('data-code', '2409180');
	 	temp.setAttribute('data-lat', '37.4201556');
	 	temp.setAttribute('data-lng', '127.1262092');
	}

	window.initMap = function () {

	};

	var popup = L.popup();

 	function removeLine(e) {
 		map.removeLayer(firstpolyline)
 	}

 	function onMapClick(e) {
		/* popup.setLatLng(e.latlng)
		    .setContent("이곳의 좌표는" + e.latlng.toString() + "  \\ncenter = " + map.getCenter())
		    .openOn(map); */

		// 클릭된 마커가 있으면 원래 아이콘(blueIcon)으로 변경
	    if (activeMarker) {
	        activeMarker.setIcon(blueIcon);
	        activeMarker = null; // 마커 추적 초기화
	    }

		optionReset();
		const searchOpt = document.getElementById('re-search-container');

		if(searchOpt.style.display === 'block') {
			searchOpt.style.display = 'none';
		}

		$("#info").hide();
		$('.infoListWrap').css('display', 'block')
		$('.infoDetailWrap').css('display', 'none')

	}

 	/* function openPopup(id, deviceNm, deviceId, addr_po_locality, dateFormat, lat, lng) {

 		//openPopup(id, device_name, device_id, addr_po_locality, dateFormat, lat, lng)

 		var popuptxt = "<div><h1><fmt:message key="DEVICE_NAME" bundle="${bundle}"/> : " + deviceNm + " ( " + deviceId + " )</h1>"
						+ "<fmt:message key="ROAD_NAME" bundle="${bundle}"/> : " + addr_po_locality + " (" + lat + ", " + lng + ")<br>"
						+ "<fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/> : " + dateFormat + "</div>";

		var txtposition = 0.000015;
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

 	} */

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

        	if ($('.infoListWrapNoData').css('display') == 'block') {


        		$(".infoListWrap p").text("<fmt:message key="TOTAL" bundle="${bundle}"/> "+ 0 + " <fmt:message key="COUNT2" bundle="${bundle}"/>");
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

</script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script>
 var defaultMarkerOnOff = false;
$(document).ready(function() {

	var fromDt = '';
	var toDt = '';


	fromDt = $('#fromDt').val().replaceAll('-', '');
	toDt = $('#toDt').val().replaceAll('-', '');

	// 날짜 설정 오늘날짜로부터 1주일 (임시10.1)
	var date1 = new Date();
	$('#toDt').val(fnDateFormat(date1, 'select'))
	var date2 = new Date(date1.setDate(date1.getDate() - 30));
	// $('#fromDt').val(dateFormat(date2, 'select'))
	$('#fromDt').val('2023-10-01')



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

	setLevelList(1, '');
	region = "${authInfo.cdNa}";

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


	/* if( region == 'KR' ){
		setLevelList(2, '2306392');
		setLevelList(3, '2409180');
		$('#level1').text('경기도');
		$('#level1').data('code', '2306392');
	 	$('#level1').addClass("on");
	 	$('#level2').text('성남시');
	 	$('#level2').addClass("on");
	 	$('#level3').text('전체');

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
		//maxZoom: 19,
		//minZoom:12,
		minZoom: '${authInfo.mapMinSize}',
		maxZoom: '${authInfo.mapMaxSize}',
	    attribution: '© OpenStreetMap'
	    //stylers:[{visibility:'off'}]
	}).addTo(map);

	// swagger.js
	//mapInfo(map);
	//$('.btn_search').click();

	map.on('click', onMapClick);

	map.on("moveend", function(){

		reSearchYn = false;
/*
		$('.infoList li').remove()
		$('.infoList div').remove()

		optionReset();
		const searchOpt = document.getElementById('re-search-container');

		if(searchOpt.style.display === 'block') {
			searchOpt.style.display = 'none';
		}

		map.closePopup();

		$('.infoDetailWrap').css('display', 'none')
		//$('.infoListWrap').css('display', 'block')

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

		$('.btn_infoWrap').addClass("off"); */

		//mapInfo(map);
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
	//-----------------------------------------------------------------------------------------------------------------------
	//-----------------------------------------------------------------------------------------------------------------------
	function mapInfo(map) {

		var lat = map.getCenter().lat;
		var lng = map.getCenter().lng;

		map.eachLayer(function(layer) {
			if (layer instanceof L.Marker) {
				map.removeLayer(layer);
			}
		});

		$("input[name='markerPower'][id='off']").prop("checked", true);

		$.ajax({
			type: "GET",
			url: "${authInfo.restApiUrl}/pothole",
			data: {
				on_way:false,
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
				$('#circularG').css('display','none')

			}
		})
	}


	//////////// Level 관련

	function getLevelText(text) {

		const result = riskKeyValue.find(item => item.codeName === text);

		if (result) {
		    switch ('${nowCdNa}') {
	        case 'KR':
	            return result.codeName;
	        case 'US':
	            return result.codeNameEng;
	        case 'JP':
	        	return result.codeNameJP;
			}
		}

	}


/* 	function getLevelText(text){
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
	}
	 */

	//-----------------------------------------------------------------------------------------------------------------------

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

				var riskLvColor = ""

				var linesize = 5

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

$('.btn_search').click();

	//-----------------------------------------------------------------------------------------------------------------------

	var lines = []

	function drawLine(response) {

		$("#info").hide();
		//$('.infoListWrap').css('display', 'block')
		$('.infoDetailWrap').css('display', 'none');
		map.closePopup();
		console.log('response -> ', response);

		allData = response.data;

		sumMarkerSort = [];

		for (var i = 0; i < lines.length; i++) {
			map.removeLayer(lines[i]);
		}

		for (var i = 0; i < markers.length; i++) {
			map.removeLayer(markers[i]);
		}

		markers = [];

		lines = [];
		markerId = [];

		point = [];

		var lvColorKeyValue = [];
		var riskText = '';

		<c:forEach var="lvList" items="${levelList}" varStatus="status">
			riskText = getLevelText('${lvList.cdNm}');

			lvColorKeyValue.push({'lv':'${lvList.cdId}', 'lvNm': riskText, 'color':'${lvList.etc1}'});

			//lvColorKeyValue.push({'lv':'${lvList.cdId}', 'lvNm':'${lvList.cdNm}', 'color':'${lvList.etc1}'})
		</c:forEach>


		//console.log('레벨컬러키벨류', lvColorKeyValue)

		// riskLv1
		//obj.css("color","색상");
		for (var i = 1; i <= lvColorKeyValue.length; i++) {
			$('#riskbgcolorLv'+ i).css("background-color", lvColorKeyValue[i-1].color);
			$('#riskLv'+i).text(lvColorKeyValue[i-1].lvNm);
			// $('#riskLv'+ i).css("font-weight", "bold")
		}

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


		ss = new Date($("#fromDt").val());
		ee = new Date($("#toDt").val());

	 	for (var i = 0 ; i < response.data.length ; i++) {

	 		var markerdate = new Date(response.data[i].timestamp);

	 		if (!(ss < markerdate && ee > markerdate)) {
 				//console.log(markerdate)
				continue;
 			 }

	 		if (response.data[i].way != null) {

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
					            //console.log(wayname)
					            wayMarkerList(response ,wayname)
					            //console.log("=============================================")
					            //console.log(dataList)
					            //alert("11")

					        });;

						map.addLayer(firstpolyline);

						lines.push(firstpolyline);
				}
			}
		// --------------------------------------------------------------------------------------------------------------------------------
		// 마커 생성 부분
		// --------------------------------------------------------------------------------------------------------------------------------


		/* var selectedValue = document.querySelector('input[name="markerPower"]:checked').value;
		console.log("↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓")
		console.log(selectedValue)
		console.log("↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑") */

		//selectedValue = "on";

		//const selectedValue = document.querySelector('input[name="markerPower"]:checked').value;

		    // 결과를 화면에 표시
		//document.getElementById("result").innerText = "선택된 값: " + selectedValue;
		//console.log("선택된 값: " + selectedValue)


		/* $('input:checkbox[name=markerPower]').each(function (index) {
			//if($(this).is(":checked")==true){
		    	console.log($(this).val());
		    //}
		}) */

		if ((ss < markerdate && ee > markerdate)) {

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

				var addr_po_locality = (item.way.name == null || item.way.name == '') ? "<fmt:message key="ROAD_INFO_NOT_EXISTS" bundle="${bundle}"/>" : item.way.name

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
						//.on('click', onClick);

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
		}
		// --------------------------------------------------------------------------------------------------------------------------------
		// --------------------------------------------------------------------------------------------------------------------------------
		if (defaultMarkerOnOff) {
			map.addLayer(markerCluster);
		}

		// 여기야 여기



		}

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


	 if ( response.data.length > 0 ) {
		 $('.infoListWrapNoData').css('display', 'none');
		 $(".infoListWrap p").text("<fmt:message key="TOTAL" bundle="${bundle}"/> "+ response.data.length + " <fmt:message key="COUNT2" bundle="${bundle}"/>");
	 }



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
	$(".infoListWrap p").text("<fmt:message key="TOTAL" bundle="${bundle}"/> "+ markerInRoute.length + " <fmt:message key="COUNT2" bundle="${bundle}"/>")

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
				var addr_po_locality = (response.data[index].way.name == null || response.data[index].way.name == '') ? "<fmt:message key="ROAD_INFO_NOT_EXISTS" bundle="${bundle}"/>" : response.data[index].way.name
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

	$('.infoDetailWrap').css('display', 'none')
	$('.infoListWrap').css('display', 'block')

});
///////////////////// Level 매칭
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
}

//////////////////////////
// ===============================================================================================================================
function detail(id, device_name, device_id, addr_po_locality, dateFormat, lat, lng, clusterChk){

	$(".infoWrap").addClass("on");
 	$(".infoListWrap p").css('display', 'block')

   	markersTemp = markers;

 	console.log("clusterChk - " + clusterChk)

	$(".infoWrap").addClass("on");
 	$(".infoListWrap p").css('display', 'block')

   	markersTemp = markers;

	if (clusterChk == 'N') {

		if (redIconId.length > 0) {
			console.log(redIconId)
		}

		/* for (var i = 0; i < markers.length; i++) {
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
		} */

		/* for (var i = 0; i < markers.length; i++) {
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
		} */
	}

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
	var lat = Number(lat) + Number(txtposition)
	var lng = Number(lng)

	var position = [lat, lng];

	var markerPowerChk = $('input[name=markerPower]:checked').val();

	if (markerCheck == false) {
		popup.setLatLng(position)
			.setContent(popuptxt)
			.openOn(map);
	}


	var lvColorKeyValue = [];

	<c:forEach var="lvList" items="${levelList}" varStatus="status">

		lvColorKeyValue.push({'lv':'${lvList.cdId}', 'color':'${lvList.etc1}', 'riskNm':'${lvList.cdNm}'})

	</c:forEach>

	for (var i = 0; i < lvColorKeyValue.length; i++) {
		if (Number(lvColorKeyValue[i].lv) == Number(thisData.risk.level)){
			riskLvNm = lvColorKeyValue[i].riskNm;
			riskColor = lvColorKeyValue[i].color;
		}
	}



	//console.log(potholeListData)

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

			var statusName = (function(code) {
			    const result = statusKeyValue.find(item => item.code === code);
			    /* if (result) { return result.codeName; } else { return "미분류"; } */

			    if (result) {
				    switch ('${nowCdNa}') {
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
			})(potholeListData[i].status);

			$("#detail_img").attr("src", "${authInfo.restApiUrl}/pothole/"  + id + "/thumbnail");

			$("#detail_img").removeAttr("onClick");
			$("#detail_img").attr("onclick", "originalimg('" + id + "')");

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
			$("#detail_latlng").text("위도 " + potholeListData[i].point['latitude'] + " / 경도 " + potholeListData[i].point['longitude']);
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
$('.btn_search1').on("click", function(){

	reSearchYn = false;

	if (searchLv == undefined) {
		searchLv = 2
		const temp = document.getElementById('level2');
	 	temp.setAttribute('data-code', '2409180')
	 	temp.setAttribute('data-lat', '37.4201556')
	 	temp.setAttribute('data-lng', '127.1262092')
	}

	/* if ($("#level3").text() == "Level3") {
		searchLv = 2
	} */
	/* if ($("#level2").text() == "Level2") {
		searchLv = 1
	} */

	if(searchLv == 2 || searchLv == 3){

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
	}


})

	// 재검색버튼 클릭 이벤트
	$('.btn_option_search').on("click", function(){

		filterYN = 'Y';

		//search_option_risk1 = []
		//search_option_risk2 = []
		//search_option_risk3 = []
		//search_option_risk4 = []

		//search_option_pothole = []
		//search_option_vertical = []
		//search_option_horizontal = []
		//search_option_alligators = []

		//console.log(response)
		//mapinfo(map)
		console.log("=======================");
		console.log(map);
		map.setView([map.getCenter().lat, map.getCenter().lng], map.getZoom())

/* 		console.log("risk1 - " + $("#risk1").is(":checked"))
		console.log("risk2 - " + $("#risk2").is(":checked"))
		console.log("risk3 - " + $("#risk3").is(":checked"))
		console.log("risk4 - " + $("#risk4").is(":checked"))

		console.log($("#pothole").is(":checked"))
		console.log($("#vertical").is(":checked"))
		console.log($("#horizontal").is(":checked"))
		console.log($("#alligators").is(":checked")) */





		//alert("21231")

		/*
		if(searchLv == 2 || searchLv == 3 || searchLv == 4){
			if ($("#level4").data('code') > 0) {
				map.setView([$("#level3").data('lat'), $("#level3").data('lng')], map.getZoom())
			} else if ($("#level3").data('code') > 0) {
				map.setView([$("#level3").data('lat'), $("#level3").data('lng')], map.getZoom())
			} else if ($("#level2").data('code') > 0) {
				map.setView([$("#level2").data('lat'), $("#level2").data('lng')], map.getZoom())
			}
		} else {
			$("#alert_msg").html("Level1과 Level2는 필수선택사항입니다.");
			$('#pop_alert').stop().fadeIn(300);
        	$('#pop_alert').stop().fadeIn(300);
		} */


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

/* 	document.addEventListener('DOMContentLoaded', function() {
	    const radioButtons = document.querySelectorAll('input[name="markerPower"]');

	    // 라디오 버튼 클릭 이벤트 추가
	    radioButtons.forEach(radio => {
	        radio.addEventListener('change', function() {
	            if (radio.checked) {
	                console.log(radio.id + " 버튼이 선택되었습니다.");
	                //markerOnOff = radio.id;
	                selectedValue = radio.id;
	            }
	        });
	    });
	}); */

	function reSearch() {
		//const selectedValue = document.querySelector('input[name="markerPower"]:checked').value;
		//const selectedValue = document.querySelector('input[name="markerPower"]:checked');

		//var boolMarkerDraw = true;

		var selectedId = document.querySelector('input[name="markerPower"]:checked').id;
		console.log(">>> ", selectedId)
		/* console.log("↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓")
		console.log(selectedValue)
		console.log("↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑")
		if(selectedId="on"){
			boolMarkerDraw = true;
		} else if(selectedId="off"){
			boolMarkerDraw = false;
		}
		if(boolMarkerDraw) */
		if (selectedId == "on") {

		    // 결과를 화면에 표시
			//document.getElementById("result").innerText = "선택된 값: " + selectedValue;
			//console.log("선택된 값: " , selectedValue.value)
			//console.log(markerOnOff)


			reSearchYn = true;
			markerList1 = [];
			//moveend();
			//mapInfo(map);
			//mapInfo(map);

			map.eachLayer(function(layer) {
				if (layer instanceof L.Marker) {
					map.removeLayer(layer);
				}
			});

			// console.log(allData)
			// console.log("+++++++++++++++++++++++++++++++++++++++++++++++++")
			// for ( var ii = 0; ii < allData.length; ii++ ) {
			// 	if (allData[ii].risk.level == 1) {
			// 		console.log("level-" + ii +  " -> " , allData[ii])
			// 	}
			// }

			var risk0Chk = $('#riskAll').is(':checked');
			var risk1Chk = $('#risk1').is(':checked');
			var risk2Chk = $('#risk2').is(':checked');
			var risk3Chk = $('#risk3').is(':checked');
			var risk4Chk = $('#risk4').is(':checked');
			var risk5Chk = $('#risk5').is(':checked');

			var potholeChk = $('#pothole').is(':checked');
			var verticalChk = $('#vertical').is(':checked');
			var horizontalChk = $('#horizontal').is(':checked');
			var alligatorsChk = $('#alligators').is(':checked');

			sumMarker1 = []
			sumMarkerTest1 = []

			for ( var i = 0; i < allData.length; i++ ) {

				// ------------------------------------------------------------------------
				// 위험도
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

				// ------------------------------------------------------------------------
				// 균열종류
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

			for (var i = 0; i < allData.length; i++) {

				//var markerdate = new Date(allData[i].timestamp);

				// if (!(ss < markerdate && ee > markerdate)) {
				// 	markercount--;
				// 	continue;
				// }

				for (var x = 0 ; x < makeMarkerList1.length ; x++ ) {

		   			if (makeMarkerList1[x] == i) {
						var item = allData[i];
						//console.log(deviceKeyValue)
						//var deviceId = fn_device_id(item['device-id'])
						//var deviceNm = fn_device_name(item['device-id'])
						var deviceId = "";
						var deviceNm = "";

						//fn_device_id(item['device-id'])

						for ( var s = 0; s < deviceKeyValue.length; s++ ) {
							if (deviceKeyValue[s].macAddr == item['device-id']){
								device_id = deviceKeyValue[s].deviceId;
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
							//.on('click', onClick);

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
			/* markerCluster.on('clusterclick', function(event) {
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

				console.log('markerCluster >>> ', markerCluster);
				// 첫 번째 마커의 위치를 팝업 위치로 사용
				//var popupLatLng = childMarkers[0].getLatLng();
				var popupLatLng = cluster.getLatLng();

				// 팝업 생성 및 오픈
				//cluster.bindPopup(popupContent).openPopup();

				var popup = L.popup()
									.setLatLng(popupLatLng)  // 팝업 위치 설정
									.setContent(popupContent)
									.openOn(map);
			}); */
			map.addLayer(markerCluster);
		} else {

			map.eachLayer(function(layer) {
				if (layer instanceof L.Marker) {
					map.removeLayer(layer);
				}
			});

		}


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

	var requiredMsg = '<fmt:message key="CONTENTS_REQUIRED" bundle="${bundle}"/>';

	$("input:checkbox").on('click', function() {

		var checkboxName = $(this).attr('name');
		var checkboxLength = $('input:checkbox[name="' + checkboxName + '"]').length;
		var checkedCount = $('input[name="' + checkboxName + '"]:checked').length;

		// ===================================================================================================================
		//  위험도 체크 박스 동작 이벤트
		if ( checkboxName == "risk" ) {
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

		if ( checkboxName == "riskAll" && ($('input:checkbox[name="risk"]:checked').length == $('input:checkbox[name="risk"]').length) ) {
			$("#alert_msg").html(requiredMsg);
			$("#pop_alert").stop().fadeIn(300);
			//alert("1개 이상은 필수로 선택되어야 합니다.");
			return false;

		} else if ( checkboxName == "riskAll" && ($('input:checkbox[name="risk"]:checked').length != $('input:checkbox[name="risk"]').length) ) {
			$("input[name='risk']").each(function() {
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
		if ( checkboxName == "status" ) {
			if (checkboxLength == checkedCount) {
				$("#statusAll").prop("checked", true);
			} else {
				if (checkedCount > 0) {
					$("#statusAll").prop("checked", false);
				} else {
					alert(requiredMsg);
					return false;
				}
			}
		}

		if ( checkboxName == "statusAll" && ($('input:checkbox[name="status"]:checked').length == $('input:checkbox[name="status"]').length) ) {
			alert(requiredMsg);
			return false;
		} else if ( checkboxName == "statusAll" && ($('input:checkbox[name="status"]:checked').length != $('input:checkbox[name="status"]').length) ) {
			$("input[name='status']").each(function() {
				$(this).prop('checked', true);
				//$(this).click();
			});
		}
		// ===================================================================================================================

    });


	$('#sortchk .sorting').on('click', function() {
	    // 클릭된 'optionItem'의 data-value 값을 가져옵니다.
	    alert("111")

	    var selectedValue = $(this).data('code');

		console.log("#############################################################")
		console.log(selectedValue)
		console.log("#############################################################")
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

				var addr_po_locality = (data[index].way.name == null || data[index].way.name == '') ? "<fmt:message key="ROAD_INFO_NOT_EXISTS" bundle="${bundle}"/>" : data[index].way.name;

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

		$(".infoListWrap p").text("<fmt:message key="TOTAL" bundle="${bundle}"/> "+ data.length + " <fmt:message key="COUNT2" bundle="${bundle}"/>")
		// ------------------------------------------------------------------------------------------------------------------------------------------------------

	});


	function markerOn() {
        // 선택된 라디오 버튼 확인
        //var selectedValue = document.querySelector('input[name="sortchk"]:checked').value;
        //console.log("선택된 값:", selectedValue);

        //console.log(">>>> " , markerList)
        //console.log("========================================================================")
        //console.log(">>>>22222 " , markers)

        console.log("markers  >>>> ", markers)

        markerCheck = false;

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
	       		//.on('click', onClick);

	       		markerCluster.addLayer(t);
			}


			// 마커 클러스터 그룹에 클릭 이벤트 추가
			/* markerCluster.on('clusterclick', function(event) {
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

				console.log('markerCluster >>> ', markerCluster);
				// 첫 번째 마커의 위치를 팝업 위치로 사용
				//var popupLatLng = childMarkers[0].getLatLng();
				var popupLatLng = cluster.getLatLng();

				// 팝업 생성 및 오픈
				//cluster.bindPopup(popupContent).openPopup();

				var popup = L.popup()
									.setLatLng(popupLatLng)  // 팝업 위치 설정
									.setContent(popupContent)
									.openOn(map);
			}); */

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

	function markerOff() {

		markerCheck = true;

		map.eachLayer(function(layer) {
	        if (layer instanceof L.Marker) {
	            map.removeLayer(layer);
	        }
	    });
	}

	function originalimg(id) {

 		var popupimg = document.getElementById("pop_wrap");

		var modalImg = document.getElementById("pop_img");

		$('#pop_riskPopImg').css('display', 'block')
		$("#pop_img").attr("src", "${authInfo.restApiUrl}/pothole/" + id + "/image");

 	}

	function ttt() {

		console.log('${authInfo.restApiUrl}')


		$.ajax({
			type: "GET",
			//url: "${authInfo.restApiUrl}/detected-road" ,
			url: "http://localhost:8081/detected-road",
			//url: "https://datahub.zieumtn.com/gis-dev/detected-road",
			data: {
				on_way:false,
				north_west:"latitude:" + map.getBounds().getNorthWest().lat + ",longitude:" + map.getBounds().getNorthWest().lng,
				north_east:"latitude:" + map.getBounds().getNorthEast().lat + ",longitude:" + map.getBounds().getNorthEast().lng,
				south_west:"latitude:" + map.getBounds().getSouthWest().lat + ",longitude:" + map.getBounds().getSouthWest().lng,
				south_east:"latitude:" + map.getBounds().getSouthEast().lat + ",longitude:" + map.getBounds().getSouthEast().lng,
				region:"${authInfo.cdNa}"
			},
			success: function(resp) {
				datas = resp.data
	            console.log('탐지도로 데이터 확인--->>', datas);


				//console.log("====================================================================================================")
				//console.log("====================================================================================================")
				var testlines = []

				/* for (var i = 0; i < datas.length; i++) {

					var positionDatas = datas[i].detectedRoadInfo;

					for (var x = 1; x < positionDatas.length; x++) {

						var pointA = new L.LatLng(positionDatas[x-1].latitude, positionDatas[x-1].longitude);
						var pointB = new L.LatLng(positionDatas[x].latitude, positionDatas[x].longitude);

						var pointList = [ pointA, pointB ];

						var linesize = map.getZoom()-7

						var firstpolyline = new L.Polyline(pointList, {
						    //color: 'red',
						    color: 'black',
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
				for (var i = 1; i < datas.length; i++) {

					var pointA = new L.LatLng(datas[i-1].latitude, datas[i-1].longitude);
					var pointB = new L.LatLng(datas[i].latitude, datas[i].longitude);

					var pointList = [ pointA, pointB ];

					var linesize = map.getZoom()-7

					var firstpolyline = new L.Polyline(pointList, {
					    //color: 'red',
					    color: 'black',
					    //weight: 15,
					    weight: linesize,
					    //opacity: 0.1,
					    smoothFactor: 1

					    })

			        var pointATime = new Date( datas[i-1].timestamp );
			        var pointBTime = new Date( datas[i].timestamp );

			        var BAsecond = (pointBTime - pointATime) / 1000;

					if (BAsecond < 10) {
				        map.addLayer(firstpolyline);
					}

					testlines.push(firstpolyline);

				}


				//console.log("====================================================================================================")
				//console.log("====================================================================================================")
			},
			error: function(request,status,error){

				console.log("request.status = " + request.status);
				console.log(error);

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

	//$('.btn_search').trigger('click');

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


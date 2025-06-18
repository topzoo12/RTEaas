<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<c:set var="nowCdNa" value="${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}"/>

<div %@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<!--달력-->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

	<div class="contentsWrap">
		<p class="title ${fav}">${pageName.srnNm}</p>

		<ul class="search_box" style="min-width: 1500px;">
			<li>
				<span class="selectBox resp bottom" id="msgdivCd_span">
						<button class="label" id="level0" data-code="" data-lat="" data-lng="">Level0</button>
						<ul class="optionList" id="level0_ul"></ul>
				</span>
				<span class="selectBox resp bottom" id="msgdivCd_span">
						<button class="label" id="level1" data-code="">Level1</button>
						<ul class="optionList" id="level1_ul"></ul>
				</span> <span class="selectBox resp bottom" id="msgdivCd_span">
						<button class="label" id="level2" data-code="">Level2</button>
						<ul class="optionList" id="level2_ul"></ul>
				</span> <span class="selectBox resp bottom" id="msgdivCd_span">
						<button class="label" id="level3" data-code="">Level3</button>
						<ul class="optionList" id="level3_ul"></ul>

				</span>

				<span class="stl"><fmt:message key="PERIOD" bundle="${bundle}" /><span class="remark2"></span></span>
				<span class="date"> <input type="text" value="${fromDt}" name="start" id="fromDt" class="input2" readonly> ~ <input type="text" value="${toDt}" name="end" id="toDt" class="input2" readonly>
						<button class="search_calender" id="search_calender"></button>
				</span>
				 <span class="search" style="display: none;"> <input type="text" value="" name="deviceNm" id="deviceNm" class="input1" placeholder="디바이스명">
				</span>
				<!--  <input type="radio" name="sortchk" value='asc' checked style="left:1100px; appearance:auto; position:static;"/><label style="color:white">오름차순</label>
	           	 <input type="radio" name="sortchk" value='desc' style="left:1100px; appearance:auto; position:static;"/><label style="color:white">내림차순</label>
				 -->

				<button class="btn_search">
					<fmt:message key="SEARCH" bundle="${bundle}" />
				</button>
			</li>
			<!-- 검색 결과 내 재검색 버튼 -->
	        <li style="margin-right: auto; margin-left: 240px;">
			    <button class="btn_re-search" onclick='btnClick()'>
			        <fmt:message key="RESULT_IN_SEARCH" bundle="${bundle}"/>
			    </button>
			</li>

		</ul>
		<!-- 검색 결과 내 재검색 -->
		<div class="re-search-container" id="re-search-container" style="display: none; width: 100% ;">
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
								  <input type="checkbox"
								         id="${cracklist.etc1}"
								         class="crack"
								         name="crack"
								         value="${cracklist.etc2}"
								         <c:if test="${cracklist.etc1 eq 'pothole'}">checked</c:if>
								  >
								  <label for="${cracklist.etc1}">
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

				</div>
				<div class="group">
					<dl class="">
						<dt><fmt:message key="ROAD_TYPE" bundle="${bundle}"/></dt>
						<dd>
							<div class="selectOpt">
							  <input type="checkbox" id="road1" class="roadstatus" name="roadstatus" value="road1" checked>
							  <label for="road1">고속도로</label>

							  <input type="checkbox" id="road2" class="roadstatus" name="roadstatus" value="road2" checked>
							  <label for="road2">고속화도로</label>

							  <input type="checkbox" id="road3" class="roadstatus" name="roadstatus" value="road3" checked>
							  <label for="road3">일반국도</label>

							  <input type="checkbox" id="road4" class="roadstatus" name="roadstatus" value="road4" checked>
							  <label for="road4">지방도</label>

							  <input type="checkbox" id="road5" class="roadstatus" name="roadstatus" value="road5" checked>
							  <label for="road5">시군구도</label>

							  <input type="checkbox" id="road6" class="roadstatus" name="roadstatus" value="road6" checked>
							  <label for="road6">주거도로</label>

							  <input type="checkbox" id="road7" class="roadstatus" name="roadstatus" value="road7" checked>
							  <label for="road7">미분류도로</label>

							  <input type="checkbox" id="road8" class="roadstatus" name="roadstatus" value="road8" checked>
							  <label for="road8">보조도로</label>

							  <input type="checkbox" id="road9" class="roadstatus" name="roadstatus" value="road9" checked>
							  <label for="road9">기타유형</label>

							  <input type="checkbox" id="roadnull" class="roadstatus" name="roadstatus" value="roadnull" checked>
							  <label for="roadnull">정보없음</label>
							</div>
						</dd>
					</dl>
					<div class="submitarea">
						<input type="checkbox" id="renew">
						<button class="btn_iconTXT btn_r btn_m btn_resetOpt" onclick="optionReset()"><fmt:message key="RESET_SELECT" bundle="${bundle}"/></button>
					</div>
				</div>
		</div>
		<ul class="contents">
			<li class="view">
				<div class="stitle">
					<div class="">
						<ul class="optList">


	 							<!-- <c:forEach var="risklist" items="${codeListLv}" varStatus="status">
	 								<li><a href="#" onclick="setListByLv(${risklist.cdId+0})" id="selectLv${risklist.cdId+0}">
			                           <c:choose>
											<c:when test="${nowCdNa eq 'KR'}">${risklist.cdNm}</c:when>
											<c:when test="${nowCdNa eq 'US'}">${risklist.cdNmEng}</c:when>
											<c:when test="${nowCdNa eq 'JP'}">${risklist.cdNmJp}</c:when>
										</c:choose>
									</a></li>
		                        </c:forEach> -->
		                       <!--  다국어 적용 전
								<li><a href="#" onclick="setListByLv(0)" id="selectLv0"><fmt:message key="보통" bundle="${bundle}" /></a></li>
								<li><a href="#" onclick="setListByLv(1)" id="selectLv1"><fmt:message key="주의" bundle="${bundle}" /></a></li>
								<li><a href="#" onclick="setListByLv(2)" id="selectLv2"><fmt:message key="위험" bundle="${bundle}" /></a></li>
								<li><a href="#" onclick="setListByLv(3)" id="selectLv3"><fmt:message key="심각" bundle="${bundle}" /></a></li>
								-->
						</ul>
						<p class="tl">
							<span class="cnt">
							<fmt:message key="TOTAL" bundle="${bundle}" />
							<strong id="totCnt">0</strong>
							<fmt:message key="COUNT2" bundle="${bundle}" />
							</span>
						</p>
					</div>
					<div class="array-container">
		                 <span class="selectBox text bottom" id="select_asc_sort2">
		                    <button class="label" id="sort2" data-code="desc"><fmt:message key="DATE_DESC" bundle="${bundle}"/></button>
		                     <ul class="optionList" id="sortchk2">
		                         <li class="optionItem" data-value="desc"><fmt:message key="DATE_DESC" bundle="${bundle}"/></li>
		                         <li class="optionItem" data-value="asc"><fmt:message key="DATE_ASC" bundle="${bundle}"/></li>
		                     </ul>
		                 </span>
                    </div>
				</div>

				<div class="riskListWrap">
					<ul class="riskList grid" id="riskList2">

					</ul>
				</div>
			</li>
		</ul>
	</div>

	<div class="pop_wrap" id="pop_riskPop" style="display: none;">
		<div class="pop_box">
			<div class="pop_content">
				<h3 class="pop_tit"></h3>
				<div class="pop_riskInfo">
				<button id="btn_re-search_move" class="btn_re-search" onclick='btnClick()'><fmt:message key="RESULT_IN_SEARCH" bundle="${bundle}"/></button>
					<!-- Swiper -->
					<div class="riskSlide">
						<div class="swiper">
							<div class="swiper-wrapper" id="swiperId">

								<div class="swiper-slide">
									<div class="riskSlide_item">
										<img src="" alt="도로위험 이미지" class="riskPopImg">
										<span class="txtBox"><fmt:message key="LONGITUDE" bundle="${bundle}"/> - / <fmt:message key="LATITUDE" bundle="${bundle}"/> -</span>
									</div>
								</div>
							<!--
								<div class="swiper-slide">
									<div class="riskSlide_item">
										<img src="http://123.212.42.108:28080/pothole/image/s/346024" alt="도로위험 이미지" class="riskPopImg" >
										<span class="txtBox">경도 132.1 / 위도 37.001</span>
									</div>
								</div>
							 -->
							</div>
						</div>
						<!-- Add Arrows -->
						<!-- <div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
						<div class="swiper-pagination"></div> -->
					</div>
					<div class="infoDetail">
						<div class="level" id="popup_level_icon">
							<span id="popup_level">LEVEL. -</span>
						</div>
						<div class="itemvalue">
							<span><em id="portholeCnt">-</em> <fmt:message key="POTHOLE" bundle="${bundle}" /></span>
							<span><em id="vertiCnt">-</em> <fmt:message key="VERTICAL_CRACK" bundle="${bundle}" /></span>
							<span><em id="horiCnt">-</em> <fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}" /></span>
							<span><em id="piroCnt">-</em> <fmt:message key="FATIGUE_CRACK" bundle="${bundle}" /></span>
						</div>
						<dl class="">
							<dt>
								<fmt:message key="DEVICE_NAME" bundle="${bundle}" />
							</dt>
							<dd id="popup_deviceNm"></dd>
							<dt>
								<fmt:message key="DEVICE_ID" bundle="${bundle}" />
							</dt>
							<dd id="popup_deviceId"></dd>
							<dt>
								<fmt:message key="RISK_LEVEL" bundle="${bundle}" />
							</dt>
							<dd id="popup_level2"></dd>
							<dt>
								<fmt:message key="COORDINATES" bundle="${bundle}" />
							</dt>
							<dd id="popup_do"></dd>
							<dt>
								<fmt:message key="ROAD_NAME" bundle="${bundle}" />
							</dt>
							<dd id="popup_roadNm"></dd>
							<dt>
								<fmt:message key="PHOTO_DATETIME" bundle="${bundle}" />
							</dt>
							<dd id="popup_date"></dd>

							<dt>
								<fmt:message key="ROAD_STATUS" bundle="${bundle}" />
							</dt>
							<dd id="popup_road_status">
								<span class="selectBox bottom" id="select_road_status">
                                    <select name="road_status" id="road_status">
                                     <option value="Unclassified">
                                    	 <fmt:message key="UNCLASSIFIED" bundle="${bundle}" />
                                     </option>

                                   	 <c:forEach var="statuslist" items="${codeListSd}" varStatus="status">
	                                     <option value="${statuslist.cdId}">
		                                    <c:choose>
													<c:when test="${nowCdNa eq 'KR'}">${statuslist.cdNm}</c:when>
													<c:when test="${nowCdNa eq 'US'}">${statuslist.cdNmEng}</c:when>
													<c:when test="${nowCdNa eq 'JP'}">${statuslist.cdNmJp}</c:when>
											</c:choose>
										 </option>
                                    </c:forEach>

                                   <!--  다국어 적용 전
                                   <option value="Unclassified">미분류</option>
                                    <option value="A">대기중</option>
                                    <option value="B">복구중</option>
                                    <option value="C">복구완료</option>
                                    -->
                                    </select>
								</span>
							</dd>
						</dl>
					</div>
				</div>
				<div class="pop_btn">
					<span class="btn_m btn_primary btn_r" id="road_detail_save"><fmt:message key="SAVE" bundle="${bundle}" /></span>
					<span class="btn_m btn_darkline btn_r pop_close" id="road_detail_cancel"><fmt:message key="CANCEL" bundle="${bundle}" /></span>
				</div>
			</div>
		</div>
	</div>


	<!-- 검색목록 nodata-->
	<div class="infoListWrapNoData" style="display: none;">
		<h2 class="hidden">검색목록</h2>
		<div class="nodata">
			<span class="material-symbols-outlined">warning</span>
			<fmt:message key="NO_SEARCH_DATA" bundle="${bundle}" />
			<!--  검색된 데이터가 없습니다. -->
		</div>
	</div>


	<div class="pop_wrap" id="pop_riskPopImg" style="display: none;">
		<div class="pop_riskPopImg">
			<div class="photo_area">
				 <img src="" alt="도로위험목록 이미지" id="popup_imgDetail">
			</div>
		</div>
		<button class="riskPopImg_close" id=""></button>
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

	<script type="module">
		import Swiper from 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.mjs'
		const swiper = new Swiper()
	</script>

	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

	<script language="javascript">

		var modifyStatus = false;
		var dataTemp;
		var potTemp;
		var wayDatas = []

		var potImg = [];
		var fromDt = '';
		var toDt = '';

		var searchLv = 0;

		var region = '${cdNa}';
		//var wayId =  region == 'KR' ? '2409180' : '2682891' // 성남 or 츠쿠바시
		var wayId = ${authInfo.areaCodeLv2};

		let prependNumber = 1;
		var swiper = new Swiper('.swiper', {
			initialSlide : 0,
			slidesPerView : 1,
			autoplay : false,
			watchOverflow : true,
			loop : false,
			on : {
				slideChange : function() {

				}
			}

		});

		var statusKeyValue = [];

		<c:forEach var="statuslist" items="${codeListSd}" varStatus="status">
		statusKeyValue.push({'code':'${statuslist.cdId}', 'codeName':'${statuslist.cdNm}', 'codeNameEng':'${statuslist.cdNmEng}', 'codeNameJP':'${statuslist.cdNmJp}', 'codeClass':'${statuslist.etc1}', })
		</c:forEach>

		function statusClassName(code) {
			// .badge_waiting(대기) .badge_warning(미분류) .badge_danger(접수완료) .badge_running(진행중) .badge_primary(보수완료)
			const result = statusKeyValue.find(item => item.code === code);

			if (result) {
			    return result.codeClass;
			} else {
				return "badge_warning";
			}
		}

		///////////////////// device 정보 관련
		var deviceList = [];
		<c:forEach var="deList" items="${deviceList}" varStatus="status">
		deviceList.push({
			'macAddr' : '${deList.macAddr}',
			'deviceId' : '${deList.deviceId}',
			'deviceNm' : '${deList.deviceNm}'
		})
		</c:forEach>

		/////////////////////  맥주소와 디바이스 정보 매칭
		function getDeviceName(macAddr) {

			var deviceInfo = [];
			deviceList.forEach(function(data, index) {
				if (data.macAddr == macAddr) {
					deviceInfo.deviceNm = data.deviceNm;
					deviceInfo.deviceId = data.deviceId;

				}
			})

			return deviceInfo;

		}
		///////////// 재검색
		function btnClick() {
		  const searchOpt = document.getElementById('re-search-container');

		  if (searchOpt.style.display === 'none') {
		    searchOpt.style.display = 'block';
		  } else {
		    searchOpt.style.display = 'none';
		  }
		}

		/////////////////// level 표기 관련
		var riskLvList = [];

		<c:forEach var="lvList" items="${levelList}" varStatus="status">
			riskLvList.push({ 'lv' : '${lvList.cdId}', 'color' : '${lvList.etc1}', 'riskNm' : '${lvList.cdNm}', 'riskNmEng' : '${lvList.cdNmEng}', 'riskNmJp' : '${lvList.cdNmJp}'});
		</c:forEach>

		///////////////////// Level 매칭 - 다국어 적용
		function getLevelText(level) {
			var zerolv = "0" + level;

			var result = riskLvList.find(item => item.lv === zerolv);

			switch ('${nowCdNa}') {
		        case 'KR':
		            return result.riskNm;
		        case 'US':
		        	return result.riskNmEng;
		        case 'JP':
		        	return result.riskNmJp;
			}

		}
		//포트홀 현재 상태 etc를 null이랑 맵핑
		function normalizeStatus(status) {
		    return status === null ? 'ETC' : status;
		}
		//도로 유형 필터링 기준 정의
		const roadTypeGroups = {
		  road1: ['motorway', 'motorway_link'],
		  road2: ['trunk', 'trunk_link'],
		  road3: ['primary', 'primary_link'],
		  road4: ['secondary', 'secondary_link'],
		  road5: ['tertiary', 'tertiary_link'],
		  road6: ['residential', 'residential_link'],
		  road7: ['unclassified'],
		  road8: ['service', 'living_street', 'track', 'road'],
		  road9: [
		    'footway', 'path', 'pedestrian', 'cycleway', 'bridleway', 'steps', 'platform',
		    'corridor', 'crossing', 'bus_stop', 'busway', 'bus_guideway', 'construction',
		    'proposed', 'planned', 'abandoned', 'disused', 'razed', 'no', 'yes',
		    'elevator', 'emergency_access_point', 'emergency_bay', 'escape', 'raceway',
		    'passing_place', 'rest_area', 'services'
		  ],
		 roadnull: [null]
		};
		///////////////////// 검사 결과 내 재검색
		function setListByStatus() {
		    var start = new Date();
		    var cnt = 0;
		    var node = document.getElementById('riskList2');
		    node.innerHTML = '';

		    var listHtml = '';

		    // 필터 체크값들 가져오기
		    var selectedRisk = new Set();
		    $('input[name="risklist"]:checked').each(function () {
		        selectedRisk.add($(this).val());
		    });

		    var selectedCracks = [];
		    $('input[name="crack"]:checked').each(function () {
		        selectedCracks.push($(this).val());
		    });

		    var selectedStatus = new Set();
		    $('input[name="statusstat"]:checked').each(function () {
		        var val = $(this).val();
		        selectedStatus.add(val.startsWith('SD') ? val.replace('SD', '') : val);
		    });

		    var selectedRoadTypes = new Set();
		    $('input[name="roadstatus"]:checked').each(function () {
		        selectedRoadTypes.add($(this).val());
		    });

		    for (var i = 0; i < wayDatas.length; i++) {
		        var item = wayDatas[i];
		        var pothole = item.pothole;
		        var roadType = item.highway ?? null;
		        var roadNm = item.name ?? '';

		        var potholeCnt = pothole.risk['count-of-potholes'];
		        var vertical = pothole.risk['count-of-vertical-cracks'];
		        var horizontal = pothole.risk['count-of-horizontal-cracks'];
		        var cracks = pothole.risk['count-of-alligators'];

		        // 크랙 필터
		        var boolCrack = selectedCracks.some(function (crack) {
		            return pothole.risk[crack] > 0;
		        });

		        // 도로 유형 필터
		        var boolRoadType = false;
		        for (let roadKey of selectedRoadTypes) {
		            if (roadTypeGroups[roadKey].includes(roadType)) {
		                boolRoadType = true;
		                break;
		            }
		        }

		        var className = statusClassName(pothole['status']);

		        if (
		            selectedRisk.has(String(pothole.risk.level)) &&
		            boolCrack &&
		            selectedStatus.has(normalizeStatus(pothole.status)) &&
		            boolRoadType
		        ) {
		            cnt++;
		            var date = dateFormat(new Date(pothole['timestamp']), 'list');
		            var deviceInfo = getDeviceName(pothole['device-id']);

		            var html = '<li>';
		            html += '<a class="riskPop">';
		            html += '<div class="riskItem">';
		            html += '<span class="num">' + cnt + '</span>';
		            html += '<div class="deviceInfo">';
		            html += '<span class="deviceId">' + deviceInfo.deviceId + '</span>';
		            html += '<span class="deviceName">' + deviceInfo.deviceNm + '</span>';
		            html += '</div>';
		            html += "<span class='badge sm2 " + className + "'>" + getRoadStatus(pothole['status']) + "</span>";
		            html += '<span class="time">' + date + '</span>';
		            html += '<span class="risk">';
		            html += '<span><fmt:message key="POTHOLE" bundle="${bundle}"/> ' + potholeCnt + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>';
		            html += '<span><fmt:message key="VERTICAL_CRACK" bundle="${bundle}"/> ' + vertical + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>';
		            html += '<span><fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}"/> ' + horizontal + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>';
		            html += '<span><fmt:message key="FATIGUE_CRACK" bundle="${bundle}"/> ' + cracks + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>';
		            html += '</span>';
		            html += '<span class="place">' + roadNm + '</span>';
		            html += '</div>';
		            html += "<button type='button' class='btn_more' onclick=\"getDetail('" + roadNm + "','" + i + "')\"></button>";
		            html += '</a>';
		            html += '</li>';

		            listHtml += html;
		        }
		    }

		    var end = new Date();
		    console.log(end - start);

		    $('.riskList').html(listHtml);
		    $('#totCnt').text(cnt);
		    $('.infoListWrapNoData').css('display', cnt === 0 ? 'block' : 'none');
		    $('#circularG').css('display', 'none');
		}



		//////////////////
		var potholeData = [];

		////상세 보기
		function getDetail(roadNm, wayDataIndex) {

			var wayData = wayDatas[wayDataIndex];

		 	potholeData = wayData.pothole;

			swiper = new Swiper(
					'.swiper',
					{
						initialSlide : 0,
						slidesPerView : 1,
						autoplay : false,
						watchOverflow : true,
						loop : false,
					});

			var node = document.getElementById('swiperId');
			node.innerHTML = '';

			potImg = [];
			potInfo = [];

			$('#pop_riskPop').css('display', 'block');

			$('#popup_roadNm').text(roadNm); // 도로명

			var risk = potholeData.risk;

			var text = '<div class="swiper-slide">'
		            + '<div class="riskSlide_item">'
		            + '<img src="${authInfo.restApiUrl}/pothole/'
		            + potholeData.id
		            + '/image" alt="도로위험 이미지" class="riskPopImg" '
		            + 'onclick="getDetailImg(\''
		            + potholeData.id
		            + '\')">'
		            + '<span class="txtBox"><fmt:message key="LATITUDE" bundle="${bundle}"/> '
		            + potholeData.point.latitude
		            + ' / <fmt:message key="LONGITUDE" bundle="${bundle}"/> '
		            + potholeData.point.longitude
		            + '</span>'
		            + '</div>'
		            + '</div>';

			$('#swiperId').append(text);

			$('#piroCnt').text(potholeData.risk['count-of-alligators'] + '<fmt:message key="COUNT1" bundle="${bundle}"/>');
			$('#portholeCnt').text(potholeData.risk['count-of-potholes'] + '<fmt:message key="COUNT1" bundle="${bundle}"/>');
			$('#vertiCnt').text(potholeData.risk['count-of-vertical-cracks'] + '<fmt:message key="COUNT1" bundle="${bundle}"/>');
			$('#horiCnt').text(potholeData.risk['count-of-horizontal-cracks'] + '<fmt:message key="COUNT1" bundle="${bundle}"/>');

			var lv = potholeData.risk['level'];
			var levelText = getLevelText(lv.toString());
			//$('#popup_level').text('LEVEL' + (lv + 1) + " " + levelText)
			$('#popup_level').text('LEVEL' + lv + ". " + levelText);

			// 아이콘
			$("#popup_level_icon").removeAttr('class');
			$("#popup_level_icon").attr('class', 'level');
			//$('#popup_level_icon').addClass('level' + (lv + 1))
			$('#popup_level_icon').addClass('level' + lv);

			// 디바이스 정보
			var deviceInfo = getDeviceName(potholeData['device-id']);
			$('#popup_deviceNm').text(deviceInfo.deviceNm);
			$('#popup_deviceId').text(deviceInfo.deviceId);

			$('.pop_tit').text('<fmt:message key="ROAD_RISK_DETAIL" bundle="${bundle}"/> : ' + deviceInfo.deviceNm + " ( " + deviceInfo.deviceId + " )");

			// 기타
			$('#popup_level2').text(levelText); // 위험도

			$('#popup_deviceNm').text(deviceInfo.deviceNm);
			$('#popup_deviceId').text(deviceInfo.deviceId);

			$('#popup_do').text('<fmt:message key="LATITUDE" bundle="${bundle}"/> ' + potholeData.point.latitude + ' / <fmt:message key="LONGITUDE" bundle="${bundle}"/> ' + potholeData.point.longitude);
			$('#popup_date').text( dateFormat(new Date(potholeData.timestamp), 'list'));

			var statusCode = potholeData['status'] == null ? 'Unclassified' : potholeData['status'];

			$('#road_status').val(statusCode).prop("selected",true);

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
			$("input[name='roadstatus']").each(function() {
				$(this).prop('checked', true);
			});
			setListByStatus();
		}

		//다국어 추가
       var statusList = [];
       <c:forEach var="statuslist" items="${codeListSd}" varStatus="status">
      	 statusList.push({ 'codeId' : '${statuslist.cdId}', 'statusNm' : '${statuslist.cdNm}', 'statusNmEng' : '${statuslist.cdNmEng}', 'statusNmJp' : '${statuslist.cdNmJp}'});
		</c:forEach>

		function getRoadStatus(statusCode) {
			var result ='' ;

			if (statusCode != null ){
				var result = statusList.find(item => item.codeId === statusCode);

				switch ('${nowCdNa}') {
			        case 'KR':
			            return result.statusNm;
			        case 'US':
			        	return result.statusNmEng;
			        case 'JP':
			        	return result.statusNmJp;
				}

			} else {
				return '<fmt:message key="UNCLASSIFIED" bundle="${bundle}"/>';
			}
			return result;
		}

		function getDetailImg(id) {
			$('#pop_riskPopImg').css('display', 'block');
			var pic = document.querySelector('#popup_imgDetail');
			pic.setAttribute("src", "${authInfo.restApiUrl}/pothole/" + id + "/image");
		}

		///////////////////// 날짜관련
		function dateFormat(date, format) {

			if (format == 'list') {
				// 2023.01.01 14:03:01
				var month = (date.getMonth() + 1) < 10 ? "0" + "" + (date.getMonth() + 1) : (date.getMonth() + 1);
				var day = date.getDate() < 10 ? "0" + "" + date.getDate() : date.getDate();
				var hour = date.getHours() < 10 ? "0" + "" + date.getHours() : date.getHours();
				var min = date.getMinutes() < 10 ? "0" + "" + date.getMinutes() : date.getMinutes();
				//var sec = date.getSeconds() < 10 ? "0" + "" + date.getSeconds() : date.getSeconds();

				dateString = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min;
				//+ ":" + sec;

			} else if (format == 'select') {

				// 2023-01-02
				var month = (date.getMonth() + 1) < 10 ? "0" + "" + (date.getMonth() + 1) : (date.getMonth() + 1);
				var day = date.getDate() < 10 ? "0" + "" + date.getDate() : date.getDate();

				dateString = date.getFullYear() + '-' + month + '-' + day;
			}

			return dateString;
		}

		const sortButton2 = document.querySelector('#sort2');
	    const optionList2 = document.querySelector('#sortchk2');
		var sortValue = 'desc';

		 // 옵션 클릭 시 정렬 및 드롭다운 닫기
		    document.querySelectorAll('#sortchk2 .optionItem').forEach(function(item) {
		        item.addEventListener('click', function() {
		            const value = this.getAttribute('data-value');
		            sortButton2.setAttribute('data-code', value);
		            sortButton2.textContent = this.textContent;
		            optionList2.classList.remove('show'); // 드롭다운 닫기

		            sortValue = value;
		            sortList(value);
		        });
		    });


		 function sortList(sortStatus){

			  const riskList = document.querySelector('.riskList');

			    if (sortStatus == 'desc') {
			        wayDatas.sort((a, b) => {
			            const dateA = new Date(a.pothole.timestamp);
			            const dateB = new Date(b.pothole.timestamp);
			            return dateB - dateA; // 내림차순 정렬
			        });
			    } else {
			        wayDatas.sort((a, b) => {
			            const dateA = new Date(a.pothole.timestamp);
			            const dateB = new Date(b.pothole.timestamp);
			            return dateA - dateB; // 오름차순 정렬
			        });
			    }

			    setListByStatus();

		 }

		///////////////////// 조회
		function getList() {

		/* 	$("#selectAll").removeAttr('class');
			$("#selectLv0").removeAttr('class');
			$("#selectLv1").removeAttr('class');
			$("#selectLv2").removeAttr('class');
			$("#selectLv3").removeAttr('class'); */



			var sortStatus = sortButton2 != null? sortButton2.getAttribute('data-code'): "desc" ;

			var node = document.getElementById('riskList2');
			node.innerHTML = '';

			fromDt = $('#fromDt').val().replaceAll('-', '');
			toDt = $('#toDt').val().replaceAll('-', '');
			var coId = '${authInfo.coId}';

			// var wayId = region == 'KR' ? '2409180' : '2409180' // 최초조회시 기본 성남 (일본좌표아직없음)

			/* if (searchLv != 0) {
				wayId = searchLv == 2 ? $('#level2').data('code')
						: $('#level3').data('code');
			}
 */
			 if (searchLv != 0) {
					if (searchLv == 3) {
						wayId = $('#level3').data('code');
					} else if (searchLv == 2) {
						wayId = $('#level2').data('code');
					} else if (searchLv == 1) {
						wayId = $('#level1').data('code');
					}
				}

			$.ajax({
				type : "GET",
				//url : "http://localhost:8080/administrative/" + wayId + "/each-way/risk?from=" + fromDt + "&to=" + toDt + "&sortStatus=" + sortStatus +"&coId=" + coId,
				url : "${authInfo.restApiUrl}/administrative/" + wayId + "/each-way/risk?from=" + fromDt + "&to=" + toDt + "&sortStatus=" + sortStatus +"&coId=" + coId,
				async : true,
				data : {
				},
				headers : {
					'Authorization' : 'Bearer '
							+ localStorage.getItem("accessToken"),
					'Refresh-Token' : localStorage
							.getItem("Refresh-Token")
				},
			    beforeSend:function(){
					$('#circularG').css('display','block');
			    },
			    complete:function(){
					$('#circularG').css('display','none');
			    },
				success : function(resp) {
					wayDatas = resp.data

					if (!wayDatas) {
						wayDatas = [];
					}

				/*
					//도로 레벨 4 선택시
					if (searchLv == 4) {
						var level4Code = $('#level4').data('code');

						var filteredArray = wayDatas.filter(function(item) {
						    return item.name.toString() === level4Code;
						});
						wayDatas = filteredArray;

					} */



					setListByStatus();


				} ,
			error : function(err){
				console.log(err);
			}
		})

	}

		function setLevelList(level, id) {
			if(level == 0){
				var node = document.getElementById('level0_ul')
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

					 	var node = document.getElementById('level0_ul');
					 	node.innerHTML = '';

		            	var html = '';

			            for(var i = 0; i <datas.length; i++){
			            	data = datas[i];
			            	var lat = data.center?.latitude ?? null;
			            	var lng = data.center?.longitude ?? null;
			            	//html += '<li class="optionItem" data-code="' + data.id + '">' + data.name + '</li>'
			            	html += '<li class="optionItem" data-iso3166="'+ data.iso3166 +'" data-code="' + data.id + '" data-lat="' + lat + '" data-lng="' + lng + '">' + data.name + '</li>'
						}

			            node.innerHTML = html;

					}

				})
			}
			// 레벨1인 경우
			if (level == 1) {

				var node = document.getElementById('level2_ul')
				node.innerHTML = '';
				var node = document.getElementById('level3_ul')
				node.innerHTML = '';

				$.ajax({
					type : "GET",
					url: "${authInfo.restApiUrl}" + "/administrative/" + id + "?region=" + region,
					async : false,
					data : {

					},
					headers : {
						'Authorization' : 'Bearer '
								+ localStorage.getItem("accessToken"),
						'Refresh-Token' : localStorage
								.getItem("Refresh-Token")
					},
					beforeSend:function(){
						$('#circularG').css('display','block')
					},
					complete : function(data) {
						//  실패했어도 완료가 되었을 때 처리
						$('#circularG').css('display','none')
					},
					success : function(resp) {
						datas = resp.data

						var node = document.getElementById('level1_ul')
						node.innerHTML = '';

						var html = '';

						for (var i = 0; i < datas.length; i++) {
							data = datas[i]

			            	//html += '<li class="optionItem" data-code="' + data.id + '">' + data.name + '</li>'
			            	//html += '<li class="optionItem" data-iso3166="'+ data.iso3166 +'" data-code="' + data.id + '" data-lat="' + lat + '" data-lng="' + lng + '">' + data.name + '</li>'

							html += '<li class="optionItem" data-code="' + data.id + '">'
									+ data.name + '</li>'

						}

						node.innerHTML = html;
					},
					error : function(err){
						console.log(err);
					}

				})

			} else if (level == 2) {

				var node = document.getElementById('level3_ul')
				node.innerHTML = '';

				$.ajax({
					type : "GET",
					url : "${authInfo.restApiUrl}" + "/administrative/" + id + "?region=" + region,
					async : false,
					data : {

					},
					headers : {
						'Authorization' : 'Bearer '
								+ localStorage.getItem("accessToken"),
						'Refresh-Token' : localStorage
								.getItem("Refresh-Token")
					},
					beforeSend:function(){
						$('#circularG').css('display','block')
					},
					complete : function(data) {
						$('#circularG').css('display','none')
					},
					success : function(resp) {

						datas = resp.data

						var node = document.getElementById('level2_ul')
						node.innerHTML = '';

						var html = '';

						for (var i = 0; i < datas.length; i++) {
							data = datas[i]
							html += '<li class="optionItem" data-code="' + data.id + '">'
									+ data.name + '</li>'

						}

						node.innerHTML = html;
					},
					error : function(err){
						console.log(err);
					}

				})

			}

 			else if (level == 3) {

				$.ajax({
					type : "GET",
					url : "${authInfo.restApiUrl}" + "/administrative/" + id + "?region=" + region,
					async : false,
					data : {

					},
					headers : {
						'Authorization' : 'Bearer '
								+ localStorage.getItem("accessToken"),
						'Refresh-Token' : localStorage
								.getItem("Refresh-Token")
					},
					beforeSend:function(){
						$('#circularG').css('display','block')
					},
					complete : function(data) {
						//  실패했어도 완료가 되었을 때 처리
						$('#circularG').css('display','none')
					},
					success : function(resp) {

						datas = resp.data

						var node = document.getElementById('level3_ul')
						node.innerHTML = '';

						var html = '<li class="optionItem" data-code="'+id+'">전체</li>';

						for (var i = 0; i < datas.length; i++) {
							data = datas[i]
							html += '<li class="optionItem" data-code="' + data.id + '">'
									+ data.name + '</li>'

						}

						node.innerHTML = html;
					},
					error : function(err){
						console.log(err);
					}

				})

			}

 		/* 	else if (level == 4) {

				$.ajax({
					type : "GET",
					url : "${authInfo.restApiUrl}" + "/administrative/" + id + "/way",
					async : false,
					data : {

					},
					headers : {
						'Authorization' : 'Bearer '
								+ localStorage.getItem("accessToken"),
						'Refresh-Token' : localStorage
								.getItem("Refresh-Token")
					},
					beforeSend:function(){
						$('#circularG').css('display','block')
					},
					complete : function(data) {
						//  실패했어도 완료가 되었을 때 처리
						$('#circularG').css('display','none')
					},
					success : function(resp) {

						datas = resp.data

						console.log('웨이 확인', datas);
						var node = document.getElementById('level4_ul')
						node.innerHTML = '';

						var html = '';

						for (var i = 0; i < datas.length; i++) {
							data = datas[i];
							html += '<li class="optionItem" data-code="'+ data.name +'">'
									+ data.name + '</li>'

						}

						node.innerHTML = html;
					},
					error : function(err){
						console.log(err);
					}

				})

			} */

			$(".optionItem").off("click").on("click", function(){
						let tmpSelectValue = $(this).text();
						$(this).parents(".selectBox").find(".label").text(
								tmpSelectValue);
						var value = $(this).data('code');
						if (!value)
							value = '';

						$(this).parent().parent().find(".label").data('code',
								value);
						$(this).parents(".selectBox").removeClass("active");
						$(this).parent(".optionList").css("display", "none");

						var levelChk = $(this).parent(".optionList")[0].id;
						if(levelChk == 'level0_ul'){
							// 하위 레벨 초기화
						 	$('#level4').text('Level4');
						 	$('#level3').text('Level3');
						 	$("#level2").text('Level2');
						 	$("#level1").text('Level1');
						 	$('#level4').removeClass("on");
						 	$('#level3').removeClass("on");
						 	$("#level2").removeClass("on");
						 	$("#level1").removeClass("on");

							searchLv = 0
							setLevelList(1 ,  $('#level0').data('code'))
						}
						if (levelChk == 'level1_ul') {

							// 하위 레벨 초기화
							$('#level4').text('Level4');
							$('#level3').text('Level3');
							$("#level2").text('Level2');
							$('#level4').removeClass("on");
							$('#level3').removeClass("on");
							$("#level2").removeClass("on");

							searchLv = 1

							setLevelList(2, $('#level1').data('code'))

						} else if (levelChk == 'level2_ul') {

							searchLv = 2

							// 하위 레벨 초기화
							$('#level4').text('Level4');
							$('#level3').text('Level3');
							$('#level4').removeClass("on");
							$("#level3").removeClass("on");

							setLevelList(3, $('#level2').data('code'))
						} else if (levelChk == 'level3_ul') {

							$('#level4').text('Level4');
							$('#level4').removeClass("on");
							searchLv = 3

							setLevelList(4, $('#level3').data('code'))


						}

						/* else if (levelChk == 'level4_ul') {
							searchLv = 4
						} */
					});

		}

		$(document).ready(function() {

			//체크박스 이벤트 추가
			 $('input[name="risklist"], input[name="crack"], input[name="statusstat"],input[name="roadstatus"]').change(function() {
				 //$('#loadingSpinner').css('display', 'inline-block');
				 setListByStatus();
		     });
			// 날짜 설정 오늘날짜로부터 1주일 (임시10.1)
			var date1 = new Date();
			$('#toDt').val(dateFormat(date1, 'select'))
			var date2 = new Date(date1.setDate(date1.getDate() - 30));

			$('#fromDt').val('2023-10-01')
			setLevelList(0, '');
			var area_code_lv0 = $('.optionItem[data-iso3166="'+ region +'"]').attr('data-code');
			//console.log(area_code_lv0);
			setLevelList(1, area_code_lv0);
			//setLevelList(1, '');


			// 조회
			getList();

			setLevelList(2, '${authInfo.areaCodeLv1}');
			setLevelList(3, '${authInfo.areaCodeLv2}');

			const selectedItemLv1 = document.querySelector('.optionItem[data-code="${authInfo.areaCodeLv1}"]');
			const area1 = selectedItemLv1.textContent;
			const selectedItemLv2 = document.querySelector('.optionItem[data-code="${authInfo.areaCodeLv2}"]');
			const area2 = selectedItemLv2.textContent;
			$('#level0').text($('.optionItem[data-iso3166="' + region + '"]').text());
			$('#level1').text(area1);
			$('#level1').data('code', '${authInfo.areaCodeLv1}');
			$('#level1').addClass("on");

			$('#level2').text(area2);
			$('#level2').data('code', '${authInfo.areaCodeLv2}');
			$('#level2').addClass("on");

			searchLv = 2;

			// 이미지 크게보기 클릭 이벤트
			$('.riskPopImg').on("click", function() {
				$('#pop_riskPopImg').css('display', 'block')

			})

			// 이미지 창 닫기 이벤트
			$('.riskPopImg_close').on("click", function() {
				$('#pop_riskPopImg').css('display', 'none')
			})

			// 검색버튼 클릭 이벤트
			$('.btn_search').on("click", function() {

				if (searchLv == 1 || searchLv == 2 || searchLv == 3 || searchLv == 4) {
					getList();
				} else {
					$("#alert_msg").html("<fmt:message key="REQ_LV1_LV2" bundle="${bundle}"/>");
					$('#pop_alert').stop().fadeIn(300);
					$('#pop_alert').stop().fadeIn(300);
				}

				/* //필터 초기화
				$(".optList li a").removeAttr('class');
				$("#selectAll").attr('class', 'level');
				$('#selectAll').addClass('active') */
			})

		});

		$(function() {
			//날짜선택
			$('#search_calender')
					.daterangepicker(
							{
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


		$('#road_status_ul').on('click', '.optionItem', function () {
	        var selectedText = $(this).text();

	        // 버튼에 선택한 값 반영
	        $('#road_status').text(selectedText);
	        $('#road_status').data('code', selectedText);
	    });


		$('#road_detail_save').on('click', function () {
	        var status = $("#road_status option:selected").val();

	        var statusCode = status == 'Unclassified' ? null : status;

	         $.ajax({
	            type: 'POST',
	            data: {
	                "id": potholeData['id'],
	                "status": statusCode
	            },
	            url: '${authInfo.restApiUrl}/pothole/road-status',
	            //url: 'http://localhost:8081/pothole/road-status',
	            success: function (resp) {
	            	modifyStatus = true;

	            	pop_close();

	                $("#alert_msg").html("<fmt:message key="SAVE_COMPLETE" bundle="${bundle}"/>");
					$('#pop_alert').stop().fadeIn(300);
		        	$('#pop_alert').stop().fadeIn(300);


	            },
	            error: function (err) {
	                console.error(err);
	            }
	        });

		});

		/*팝업*/
		let $pop_wrap = $('.pop_wrap')

	    function pop_close(){
	 		getList();

	        $pop_wrap.stop().fadeOut(300);
	    }

	</script>
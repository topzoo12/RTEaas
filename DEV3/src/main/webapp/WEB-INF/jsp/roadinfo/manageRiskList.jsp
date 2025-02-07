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

		<ul class="search_box" style="min-width: 1390px;">
			<li><span class="selectBox resp bottom" id="msgdivCd_span">
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
			</button></li>

		</ul>
		<ul class="contents">
			<li class="view">
				<div class="stitle">
					<div class="">
						<ul class="optList">
							<li><a href="#" onclick="setListByStatus('ALL')" class="active" id="selectAll"><fmt:message key="ALL" bundle="${bundle}" /></a></li>

								<c:forEach var="risklist" items="${codeListSd}" varStatus="status">
	 								<li><a href="#" onclick="setListByStatus('${risklist.cdId}')" id="select${risklist.cdId}">
			                           <c:choose>
											<c:when test="${nowCdNa eq 'KR'}">${risklist.cdNm}</c:when>
											<c:when test="${nowCdNa eq 'US'}">${risklist.cdNmEng}</c:when>
											<c:when test="${nowCdNa eq 'JP'}">${risklist.cdNmJp}</c:when>
										</c:choose>
									</a></li>
		                        </c:forEach>

		                        <li><a href="#" onclick="setListByStatus('ETC')" id="selectETC"><fmt:message key="UNCLASSIFIED" bundle="${bundle}" /></a></li>
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
				<!-- <img src="/img/sample_highway03.jpg" alt="도로위험목록 이미지" id="popup_imgDetail"> -->
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

		///////////////////// 포트홀 조치상태별 검색
		var clickedStatus = 'ALL';

		function setListByStatus(status) {

			clickedStatus = status;

			var cnt = 0;
			var node = document.getElementById('riskList2')
			node.innerHTML = '';

			$(".optList li a").removeAttr('class');

			if (status == 'ALL') {
				$('#selectAll').addClass('active');
			} else {
				$('#select'+ status).addClass('active');
			}

			var date = '';
			var deviceInfo = {
				deviceId : '',
				deviceNm : ''
			};
			var imgUrl = '/img/no_imagesBG.png';
			var potholeCnt = 0;
			var vertical = 0;
			var horizontal = 0;
			var cracks = 0;
			var portId = '';

			for (var i = 0; i < wayDatas.length; i++) {

				var pothole = wayDatas[i].pothole;
				var roadNm = wayDatas[i].name;
				if (roadNm == null) roadNm = ''   //way id는 있으나 도로명 없는 경우

				if (status != 'ALL') { // 레벨 맞게 검색

					if (status == pothole['status'] || (status == 'ETC' && pothole['status'] == null)) {
						cnt++;
						date = dateFormat(new Date(pothole['timestamp']), 'list');
						deviceInfo = getDeviceName(pothole['device-id']);

						//포트홀 개수
						potholeCnt = pothole.risk['count-of-potholes'];
						vertical = pothole.risk['count-of-vertical-cracks'];
						horizontal = pothole.risk['count-of-horizontal-cracks'];
						cracks = pothole.risk['count-of-alligators'];

						var className = statusClassName(pothole['status']);

						/* var parentWayInfo = '';

						$.ajax({
							type : "GET",
							url : "${authInfo.restApiUrl}/administrative/parent-wayinfo/"+ pothole.id ,
							//url : "http://localhost:8080/administrative/parent-wayinfo/"+ pothole.id ,
							async : false,
							success : function(resp) {
								parentWayInfo = resp.data // 데이터
							}
						})
 						*/
						var html = '<li>'
							html += '<a class="riskPop">'
							html += '<div class="riskItem">'
							html += '<span class="num">' + cnt + '</span>'
							html += '<div class="deviceInfo">'
							html += '<span class="deviceId">' + deviceInfo.deviceId + '</span>'
							html += '<span class="deviceName">' + deviceInfo.deviceNm + '</span>'
							html += '</div>'
							html += "<span class='badge sm2 " + className + "'>" + getRoadStatus(pothole['status']) + "</span>"
							html += '<span class="time">' + date + '</span>'
							html += '<span class="risk">'
							html += '<span><fmt:message key="POTHOLE" bundle="${bundle}"/> ' + potholeCnt + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
							html += '<span><fmt:message key="VERTICAL_CRACK" bundle="${bundle}"/> ' + vertical + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
							html += '<span><fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}"/> ' + horizontal + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
							html += '<span><fmt:message key="FATIGUE_CRACK" bundle="${bundle}"/> ' + cracks + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
							html += '</span>'
							html += '<span class="place">' + roadNm + '</span>'

							html += '</div>'
							html += "<button type='button' class='btn_more' onclick=\"getDetail('" + roadNm+ "','" + i + "')\"'></button>"
							html += '</a>'
							html += '</li>'

							$('.riskList').append(html);
					}

				} else {
					cnt++;
					date = dateFormat(new Date(pothole['timestamp']), 'list');
					deviceInfo = getDeviceName(pothole['device-id']);

					//포트홀 개수
					potholeCnt = pothole.risk['count-of-potholes'];
					vertical = pothole.risk['count-of-vertical-cracks'];
					horizontal = pothole.risk['count-of-horizontal-cracks'];
					cracks = pothole.risk['count-of-alligators'];

					var className = statusClassName(pothole['status']);

					/*
					var parentWayInfo = '';

					$.ajax({
						type : "GET",
						url : "${authInfo.restApiUrl}/administrative/parent-wayinfo/"+ pothole.id ,
						//url : "http://localhost:8080/administrative/parent-wayinfo/"+ pothole.id ,
						async : false,
						success : function(resp) {
							parentWayInfo = resp.data // 데이터
						}
					})
 					*/

					var html = '<li>'
						html += '<a class="riskPop">'
						html += '<div class="riskItem">'
						html += '<span class="num">' + cnt + '</span>'
						html += '<div class="deviceInfo">'
						html += '<span class="deviceId">' + deviceInfo.deviceId + '</span>'
						html += '<span class="deviceName">' + deviceInfo.deviceNm + '</span>'
						html += '</div>'
						html += "<span class='badge sm2 " + className + "'>" + getRoadStatus(pothole['status']) + "</span>"
						html += '<span class="time">' + date + '</span>'
						html += '<span class="risk">'
						html += '<span><fmt:message key="POTHOLE" bundle="${bundle}"/> ' + potholeCnt + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
						html += '<span><fmt:message key="VERTICAL_CRACK" bundle="${bundle}"/> ' + vertical + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
						html += '<span><fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}"/> ' + horizontal + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
						html += '<span><fmt:message key="FATIGUE_CRACK" bundle="${bundle}"/> ' + cracks + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
						html += '</span>'
						html += '<span class="place">' + roadNm + '</span>'

						html += '</div>'
						html += "<button type='button' class='btn_more' onclick=\"getDetail('" + roadNm+ "','" + i + "')\"'></button>"
						html += '</a>'
						html += '</li>'

						$('.riskList').append(html);

				}

			}

			$('#totCnt').text(cnt)
			if (cnt == 0) {
				$('.infoListWrapNoData').css('display', 'block')
			} else {
				$('.infoListWrapNoData').css('display', 'none')
			}
			$('#circularG').css('display', 'none')

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

			    setListByStatus(clickedStatus);

		 }

		///////////////////// 조회
		function getList(status) {

			$("#selectAll").removeAttr('class');
			$("#selectLv0").removeAttr('class');
			$("#selectLv1").removeAttr('class');
			$("#selectLv2").removeAttr('class');
			$("#selectLv3").removeAttr('class');

			if (status == 'ALL') {
				$('#selectAll').addClass('active');
			} else {
				$('#select'+ status).addClass('active');
			}

			var sortStatus = sortButton2 != null? sortButton2.getAttribute('data-code'): "desc" ;

			var node = document.getElementById('riskList2');
			node.innerHTML = '';

			fromDt = $('#fromDt').val().replaceAll('-', '');
			toDt = $('#toDt').val().replaceAll('-', '');
			var coId = '${authInfo.coId}';

			// var wayId = region == 'KR' ? '2409180' : '2409180' // 최초조회시 기본 성남 (일본좌표아직없음)

			if (searchLv != 0) {
				wayId = searchLv == 2 ? $('#level2').data('code')
						: $('#level3').data('code');
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

					var cnt = 0;
					var date = '';
					var deviceInfo = {
						deviceId : '',
						deviceNm : ''
					};
					var imgUrl = '/img/no_imagesBG.png';
					var potholeCnt = 0;
					var vertical = 0;
					var horizontal = 0;
					var cracks = 0;
					var portId = '';

					for (var i = 0; i < wayDatas.length; i++) {

						var pothole = wayDatas[i].pothole;
						var roadNm = wayDatas[i].name;
						cnt++;

						imgUrl = '${authInfo.restApiUrl}/pothole/'+ pothole.id + '/thumbnail'
						date = dateFormat(new Date(pothole['timestamp']), 'list')
						deviceInfo = getDeviceName(pothole['device-id'])

						// 위험도 레벨
						var lv = pothole.risk['level'];
						var iconClass = lv == 0 ? 'badge_primary'
								: lv == 1 ? 'badge_warning'
										: lv == 2 ? 'badge_negative'
														: 'badge_danger'

						//포트홀 개수
						potholeCnt = pothole.risk['count-of-potholes']
						vertical = pothole.risk['count-of-vertical-cracks']
						horizontal = pothole.risk['count-of-horizontal-cracks']
						cracks = pothole.risk['count-of-alligators']

						var className = statusClassName(pothole['status']);

						/* var parentWayInfo = '';

						$.ajax({
							type : "GET",
							url : "${authInfo.restApiUrl}/administrative/parent-wayinfo/"+ pothole.id ,
							//url : "http://localhost:8080/administrative/parent-wayinfo/"+ pothole.id ,
							async : false,
							success : function(resp) {
								parentWayInfo = resp.data // 데이터

								console.log('parentWayInfo ', parentWayInfo);
							}
						})

						*/


						var html = '<li>'
							html += '<a class="riskPop">'
							html += '<div class="riskItem">'
							html += '<span class="num">' + cnt + '</span>'
							html += '<div class="deviceInfo">'
							html += '<span class="deviceId">'
									+ deviceInfo.deviceId + '</span>'
							html += '<span class="deviceName">'
									+ deviceInfo.deviceNm + '</span>'
							html += '</div>'
							html += "<span class='badge sm2 " + className + "'>" + getRoadStatus(pothole['status']) + "</span>"
							html += '<span class="time">' + date
									+ '</span>'
							html += '<span class="risk">'
							html += '<span><fmt:message key="POTHOLE" bundle="${bundle}"/> '
									+ potholeCnt
									+ '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
							html += '<span><fmt:message key="VERTICAL_CRACK" bundle="${bundle}"/> '
									+ vertical
									+ '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
							html += '<span><fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}"/> '
									+ horizontal
									+ '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
							html += '<span><fmt:message key="FATIGUE_CRACK" bundle="${bundle}"/> '
									+ cracks
									+ '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
							html += '</span>'
							html += '<span class="place">' +  roadNm
									+ '</span>'
							html += '</div>'

							html += "<button type='button' class='btn_more' onclick=\"getDetail('" + roadNm+ "','" + i + "')\"'></button>"
							html += '</a>'
							html += '</li>'

							$('.riskList').append(html);

						}

					$('#circularG').css('display', 'none')

					$('#totCnt').text(cnt)
					if (cnt == 0) {
						$('.infoListWrapNoData')
								.css('display', 'block')
					} else {
						$('.infoListWrapNoData').css('display', 'none')
					}

					setListByStatus(status);


				} ,
			error : function(err){
				console.log(err);
			}
		})

	}

		function setLevelList(level, id) {

			// 레벨1인 경우
			if (level == 1) {

				var node = document.getElementById('level2_ul')
				node.innerHTML = '';
				var node = document.getElementById('level3_ul')
				node.innerHTML = '';

				$.ajax({
					type : "GET",
					url : "${authInfo.restApiUrl}" + "/administrative?region=" + region,
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

			// 날짜 설정 오늘날짜로부터 1주일 (임시10.1)
			var date1 = new Date();
			$('#toDt').val(dateFormat(date1, 'select'))
			var date2 = new Date(date1.setDate(date1.getDate() - 30));

			$('#fromDt').val('2023-10-01')
			// 레벨 조회 부분 생성
			setLevelList(1, '');

			// 조회
			getList('ALL');

			setLevelList(2, '${authInfo.areaCodeLv1}');
			setLevelList(3, '${authInfo.areaCodeLv2}');

			const selectedItemLv1 = document.querySelector('.optionItem[data-code="${authInfo.areaCodeLv1}"]');
			const area1 = selectedItemLv1.textContent;
			const selectedItemLv2 = document.querySelector('.optionItem[data-code="${authInfo.areaCodeLv2}"]');
			const area2 = selectedItemLv2.textContent;

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

				if (searchLv == 2 || searchLv == 3 || searchLv == 4) {
					getList('ALL');
				} else {
					$("#alert_msg").html("<fmt:message key="REQ_LV1_LV2" bundle="${bundle}"/>");
					$('#pop_alert').stop().fadeIn(300);
					$('#pop_alert').stop().fadeIn(300);
				}

				//필터 초기화
				$(".optList li a").removeAttr('class');
				$("#selectAll").attr('class', 'level');
				$('#selectAll').addClass('active')
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
	 		getList(clickedStatus);

	        $pop_wrap.stop().fadeOut(300);
	    }

	</script>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<c:set var="nowCdNa" value="${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}"/>

	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

	<script type="module">
		import Swiper from 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.mjs'
		const swiper = new Swiper()
	</script>

	 <link rel="stylesheet" href="/css/swiper-bundle.min.css" />

	<div class="contentsWrap">
		<p class="title ${fav}">${pageName.srnNm}</p>

		<div class="contents dashboard">
			<div class="dashboardCol1">
				<div class="dashboardRow">
					<div class="stitle">
						<p class="tl">
							<fmt:message key="ROAD_SURFACE_STATUS" bundle="${bundle}"/>
							<span class="cnt"><fmt:message key="LAST_YEAR" bundle="${bundle}"/></span>
					</div>
					<!-- Swiper -->
					<div class="stateSlide">
						<div class="swiper">
							<div class="swiper-wrapper" id="swiperId">

							</div>
						</div>
						<!-- Add Arrows -->
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
				<div class="dashboardRow">
					<div class="stitle">
						<p class="tl">
							<fmt:message key="ROAD_RISK_TREND" bundle="${bundle}"/><span class="cnt"></span>
						</p>
					</div>
					<div class="chart_area">

						<div class="chartWrap">
							<canvas id="myChart" height="120%"></canvas>
						</div>
					</div>
				</div>
			</div>

			<div class="dashboardCol2">
				<div class="dashboardRow">
					<div class="stitle">
						<p class="tl">
							<fmt:message key="ROAD_RISK" bundle="${bundle}"/> Worst5<span class="cnt"></span>
						</p>
					</div>



					<div class="worstList">

						<article class="beefup example-opensingle is-open">
							<div class="beefup__head worstHead">
								<div>
									<!-- <h3>서부간선도로</h3>
									<span>위험 23건</span> <span>2023.11.17 16:12:48</span> -->
									<h3>No search data</h3>
									<span><fmt:message key="CRITICAL" bundle="${bundle}"/> -<fmt:message key="COUNT2" bundle="${bundle}"/></span> <span></span>
								</div>
								<span class="badge_risk badge_danger"></span>
							</div>

							<div class="beefup__body worstBody">
								<div class="worstInfo">
									<p class="infoPhoto">

									<img id="detail_img" src="/img/sample_highway03.jpg" alt="no data" onclick=""> <span class="noPhoto"style="display: none;">
									<span class="material-symbols-outlined">no_photography</span></span>
									</p>
									<div class="infoDetail">
										<dl class="">
											<dt><fmt:message key="DEVICE_ID" bundle="${bundle}"/></dt>
											<dd id="detail_device_id">-</dd>
											<dt><fmt:message key="DEVICE_NAME" bundle="${bundle}"/></dt>
											<dd id="detail_device_name">-</dd>
											<dt><fmt:message key="RISK_LEVEL" bundle="${bundle}"/></dt>
											<dd id="detail_risk_level">-</dd>
											<dt><fmt:message key="COORDINATES" bundle="${bundle}"/></dt>
											<dd id="detail_latlng"><fmt:message key="LONGITUDE" bundle="${bundle}"/> - / <fmt:message key="LATITUDE" bundle="${bundle}"/> -</dd>
											<dt><fmt:message key="ROAD_NAME" bundle="${bundle}"/></dt>
											<dd id="detail_route_name">-</dd>
											<dt><fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/></dt>
											<dd id="detail_ctime">-</dd>
											<dt><fmt:message key="ROAD_STATUS" bundle="${bundle}" /></dt>
											<dd id="popup_road_status">미분류</dd>
										</dl>
									</div>
								</div>
								<div class="itemvalue">
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="POTHOLE" bundle="${bundle}"/></span>
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="VERTICAL_CRACK" bundle="${bundle}"/></span>
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}"/></span>
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="FATIGUE_CRACK" bundle="${bundle}"/></span>
								</div>
							</div>
						</article>

						<article class="beefup example-opensingle">
							<div class="beefup__head worstHead">
								<div>
									<h3>No search data</h3>
									<span><fmt:message key="CRITICAL" bundle="${bundle}"/> -<fmt:message key="COUNT2" bundle="${bundle}"/></span> <span></span>
								</div>
								<span class="badge_risk badge_danger"></span>
							</div>

							<div class="beefup__body worstBody">
								<div class="worstInfo">
									<p class="infoPhoto">
										<img id="detail_img" src="/img/sample_highway03.jpg"
											alt="대표이미지" onclick=""> <span class="noPhoto"
											style="display: none;"> <span
											class="material-symbols-outlined">no_photography</span>
										</span>
									</p>
									<div class="infoDetail">
										<dl class="">
											<dt><fmt:message key="DEVICE_ID" bundle="${bundle}"/></dt>
											<dd id="detail_device_id">-</dd>
											<dt><fmt:message key="DEVICE_NAME" bundle="${bundle}"/></dt>
											<dd id="detail_device_name">-</dd>
											<dt><fmt:message key="RISK_LEVEL" bundle="${bundle}"/></dt>
											<dd id="detail_risk_level">LEVEL. -</dd>
											<dt><fmt:message key="COORDINATES" bundle="${bundle}"/></dt>
											<dd id="detail_latlng"><fmt:message key="LONGITUDE" bundle="${bundle}"/> - / <fmt:message key="LATITUDE" bundle="${bundle}"/> -</dd>
											<dt><fmt:message key="ROAD_NAME" bundle="${bundle}"/></dt>
											<dd id="detail_route_name">-</dd>
											<dt><fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/></dt>
											<dd id="detail_ctime"></dd>
											<dt><fmt:message key="ROAD_STATUS" bundle="${bundle}" /></dt>
											<dd id="popup_road_status">미분류</dd>
										</dl>
									</div>
								</div>
								<div class="itemvalue">
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="POTHOLE" bundle="${bundle}"/></span>
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="VERTICAL_CRACK" bundle="${bundle}"/></span>
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}"/></span>
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="FATIGUE_CRACK" bundle="${bundle}"/></span>
								</div>
							</div>
						</article>

						<article class="beefup example-opensingle">
							<div class="beefup__head worstHead">
								<div>
									<h3>No search data</h3>
									<span><fmt:message key="CRITICAL" bundle="${bundle}"/> -<fmt:message key="COUNT2" bundle="${bundle}"/></span> <span></span>
								</div>
								<span class="badge_risk badge_danger"></span>
							</div>

							<div class="beefup__body worstBody">
								<div class="worstInfo">
									<p class="infoPhoto">
										<img id="detail_img" src="/img/sample_highway03.jpg"
											alt="대표이미지" onclick=""> <span class="noPhoto"
											style="display: none;"> <span
											class="material-symbols-outlined">no_photography</span>
										</span>
									</p>
									<div class="infoDetail">
										<dl class="">
											<dt><fmt:message key="DEVICE_ID" bundle="${bundle}"/></dt>
											<dd id="detail_device_id">-</dd>
											<dt><fmt:message key="DEVICE_NAME" bundle="${bundle}"/></dt>
											<dd id="detail_device_name">-</dd>
											<dt><fmt:message key="RISK_LEVEL" bundle="${bundle}"/></dt>
											<dd id="detail_risk_level">LEVEL. -</dd>
											<dt><fmt:message key="COORDINATES" bundle="${bundle}"/></dt>
											<dd id="detail_latlng"><fmt:message key="LONGITUDE" bundle="${bundle}"/> - / <fmt:message key="LATITUDE" bundle="${bundle}"/> -</dd>
											<dt><fmt:message key="ROAD_NAME" bundle="${bundle}"/></dt>
											<dd id="detail_route_name">-</dd>
											<dt><fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/></dt>
											<dd id="detail_ctime"></dd>
											<dt><fmt:message key="ROAD_STATUS" bundle="${bundle}" /></dt>
											<dd id="popup_road_status">미분류</dd>
										</dl>
									</div>
								</div>
								<div class="itemvalue">
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="POTHOLE" bundle="${bundle}"/></span>
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="VERTICAL_CRACK" bundle="${bundle}"/></span>
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}"/></span>
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="FATIGUE_CRACK" bundle="${bundle}"/></span>
								</div>
							</div>
						</article>

						<article class="beefup example-opensingle">
							<div class="beefup__head worstHead">
								<div>
									<h3>No search data</h3>
									<span><fmt:message key="CRITICAL" bundle="${bundle}"/> -<fmt:message key="COUNT2" bundle="${bundle}"/></span> <span></span>
								</div>
								<span class="badge_risk badge_danger"></span>
							</div>

							<div class="beefup__body worstBody">
								<div class="worstInfo">
									<p class="infoPhoto">
										<img id="detail_img" src="/img/sample_highway03.jpg"
											alt="대표이미지" onclick=""> <span class="noPhoto"
											style="display: none;"> <span
											class="material-symbols-outlined">no_photography</span>
										</span>
									</p>
									<div class="infoDetail">
										<dl class="">
											<dt><fmt:message key="DEVICE_ID" bundle="${bundle}"/></dt>
											<dd id="detail_device_id">-</dd>
											<dt><fmt:message key="DEVICE_NAME" bundle="${bundle}"/></dt>
											<dd id="detail_device_name">-</dd>
											<dt><fmt:message key="RISK_LEVEL" bundle="${bundle}"/></dt>
											<dd id="detail_risk_level">LEVEL. -</dd>
											<dt><fmt:message key="COORDINATES" bundle="${bundle}"/></dt>
											<dd id="detail_latlng"><fmt:message key="LONGITUDE" bundle="${bundle}"/> - / <fmt:message key="LATITUDE" bundle="${bundle}"/> -</dd>
											<dt><fmt:message key="ROAD_NAME" bundle="${bundle}"/></dt>
											<dd id="detail_route_name">-</dd>
											<dt><fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/></dt>
											<dd id="detail_ctime"></dd>
											<dt><fmt:message key="ROAD_STATUS" bundle="${bundle}" /></dt>
											<dd id="popup_road_status">미분류</dd>
										</dl>
									</div>
								</div>
								<div class="itemvalue">
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="POTHOLE" bundle="${bundle}"/></span>
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="VERTICAL_CRACK" bundle="${bundle}"/></span>
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}"/></span>
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="FATIGUE_CRACK" bundle="${bundle}"/></span>
								</div>
							</div>
						</article>

						<article class="beefup example-opensingle">
							<div class="beefup__head worstHead">
								<div>
									<h3>No search data</h3>
									<span><fmt:message key="CRITICAL" bundle="${bundle}"/> -<fmt:message key="COUNT2" bundle="${bundle}"/></span> <span></span>
								</div>
								<span class="badge_risk badge_danger"></span>
							</div>

							<div class="beefup__body worstBody">
								<div class="worstInfo">
									<p class="infoPhoto">
										<img id="detail_img" src="/img/sample_highway03.jpg"
											alt="대표이미지" onclick=""> <span class="noPhoto"
											style="display: none;"> <span
											class="material-symbols-outlined">no_photography</span>
										</span>
									</p>
									<div class="infoDetail">
										<dl class="">
											<dt><fmt:message key="DEVICE_ID" bundle="${bundle}"/></dt>
											<dd id="detail_device_id">-</dd>
											<dt><fmt:message key="DEVICE_NAME" bundle="${bundle}"/></dt>
											<dd id="detail_device_name">-</dd>
											<dt><fmt:message key="RISK_LEVEL" bundle="${bundle}"/></dt>
											<dd id="detail_risk_level">LEVEL. -</dd>
											<dt><fmt:message key="COORDINATES" bundle="${bundle}"/></dt>
											<dd id="detail_latlng"><fmt:message key="LONGITUDE" bundle="${bundle}"/> - / <fmt:message key="LATITUDE" bundle="${bundle}"/> -</dd>
											<dt><fmt:message key="ROAD_NAME" bundle="${bundle}"/></dt>
											<dd id="detail_route_name">-</dd>
											<dt><fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/></dt>
											<dd id="detail_ctime"></dd>
											<dt><fmt:message key="ROAD_STATUS" bundle="${bundle}" /></dt>
											<dd id="popup_road_status">미분류</dd>
										</dl>
									</div>
								</div>
								<div class="itemvalue">
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="POTHOLE" bundle="${bundle}"/></span>
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="VERTICAL_CRACK" bundle="${bundle}"/></span>
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}"/></span>
									<span><em>-<fmt:message key="COUNT1" bundle="${bundle}"/></em><fmt:message key="FATIGUE_CRACK" bundle="${bundle}"/></span>
								</div>
							</div>
						</article>

						<%-- <article class="beefup example-opensingle">
							<div class="beefup__head worstHead">
								<div>
									<h3>남부순환로</h3>
									<span>위험 11건</span> <span>2023.11.17 16:12:48</span>
								</div>
								<span class="badge_risk badge_danger"></span>
							</div>

							<div class="beefup__body worstBody">
								<div class="worstInfo">
									<p class="infoPhoto">
										<img id="detail_img" src="/img/sample_highway03.jpg"
											alt="대표이미지" onclick=""> <span class="noPhoto"
											style="display: none;"> <span
											class="material-symbols-outlined">no_photography</span>
										</span>
									</p>
									<div class="infoDetail">
										<dl class="">
											<dt><fmt:message key="DEVICE_ID" bundle="${bundle}"/></dt>
											<dd id="detail_device_id">AAA-001</dd>
											<dt><fmt:message key="DEVICE_NAME" bundle="${bundle}"/></dt>
											<dd id="detail_device_name">디바이스A</dd>
											<dt><fmt:message key="RISK_LEVEL" bundle="${bundle}"/></dt>
											<dd id="detail_risk_level">LEVEL4. 심각</dd>
											<dt><fmt:message key="COORDINATES" bundle="${bundle}"/></dt>
											<dd id="detail_latlng">경도 132.1 / 위도 37.001</dd>
											<dt><fmt:message key="ROAD_NAME" bundle="${bundle}"/></dt>
											<dd id="detail_route_name">서울 외곽순환도로</dd>
											<dt><fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/></dt>
											<dd id="detail_ctime">2023.11.20 14:54:17</dd>
										</dl>
									</div>
								</div>
								<div class="itemvalue">
									<span><em>3개</em><fmt:message key="POTHOLE" bundle="${bundle}"/></span>
									<span><em>1개</em><fmt:message key="VERTICAL_CRACK" bundle="${bundle}"/></span>
									<span><em>0개</em><fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}"/></span>
									<span><em>0개</em><fmt:message key="FATIGUE_CRACK" bundle="${bundle}"/></span>
								</div>
							</div>
						</article> --%>
					</div>
				</div>
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

<div class="pop_wrap" id="pop_riskPopImg" style="display: none;">
	<div class="pop_riskPopImg">
		<div class="photo_area">
			<img src="/img/sample_highway03.jpg" alt="도로위험목록 이미지" id="popup_imgDetail">
		</div>
	</div>
	<button class="riskPopImg_close" id=""></button>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery.beefup.min.js"></script>
<script>
	var context = document.getElementById('myChart').getContext('2d');

	var myChart = new Chart(context,
			{
				type : 'bar',
				options : {
					scales : {
						y : {
							beginAtZero : true
						}
					},
					legend : {
						position : 'bottom',
					},
				}
			});
</script>

<script language="javascript">

	var potholeKeyValue = [];

	<c:forEach var="potholeDvList" items="${codeListDv}" varStatus="status">
		potholeKeyValue.push({ 'codeId' : '${potholeDvList.cdId}', 'potholeNm' : '${potholeDvList.cdNm}', 'potholeNmEng' : '${potholeDvList.cdNmEng}', 'potholeNmJp' : '${potholeDvList.cdNmJp}', 'potholeEtc2' : '${potholeDvList.etc2}'});
	</c:forEach>

		///////////////////// 날짜관련
		function dateFormat(date, format) {

			if (format == 'list') {
				// 2023.01.01 14:03:01
				var month = (date.getMonth() + 1) < 10 ? "0" + "" + (date.getMonth() + 1) : (date.getMonth() + 1);
				var day = date.getDate() < 10 ? "0" + "" + date.getDate(): date.getDate();
				var hour = date.getHours() < 10 ? "0" + "" + date.getHours() : date.getHours();
				var min = date.getMinutes() < 10 ? "0" + "" + date.getMinutes() : date.getMinutes();
				var sec = date.getSeconds() < 10 ? "0" + "" + date.getSeconds() : date.getSeconds();

				dateString = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec;

			} else if (format == 'select') {

				// 2023-01-02
				var month = (date.getMonth() + 1) < 10 ? "0" + "" + (date.getMonth() + 1) : (date.getMonth() + 1);
				var day = date.getDate() < 10 ? "0" + "" + date.getDate() : date.getDate();

				dateString = date.getFullYear() + '-' + month + '-' + day;
			}

			return dateString;
		}

		/////// 현재 기준 1년 전 date
		function getFromYearDate(){

			var today = new Date();

			today.setFullYear(today.getFullYear() - 1);
			today.setDate(today.getDate() - 1);

			var fromDate = dateFormat(today, 'select');
			return fromDate.replaceAll('-','');

		}

		/////////////////////  맥주소와 디바이스 정보 매칭
		function getDeviceName(macAddr) {
			var deviceInfo = [];

			var params = {
					'deviceNm':$('').val()
				};

				$.ajax({
					type : 'POST',
					data : params,
					dataType : 'text',
					async: false,
					url : '/getSysDeviceList.do',
					success : function (resp) {

						var json = JSON.parse(resp);
						var result = json.result;
						var deviceList = result;

						deviceList.forEach(function(data, index) {
							if (data.macAddr == macAddr) {
								deviceInfo.deviceNm = data.deviceNm;
								deviceInfo.deviceId = data.deviceId;

							}
						})

					},
					error : function(err){
						console.log(err);
					},
					beforeSend:function(){
						$('#circularG').css('display','block');
					},
					complete : function(data) {
						//  실패했어도 완료가 되었을 때 처리
						$('#circularG').css('display','none');
					}
				});

				return deviceInfo;

		}


		/////////////////// level 표기 관련
		var riskLvList = [];

		<c:forEach var="lvList" items="${levelList}" varStatus="status">
			riskLvList.push({ 'lv' : '${lvList.cdId}', 'color' : '${lvList.etc1}', 'riskNm' : '${lvList.cdNm}', 'riskNmEng' : '${lvList.cdNmEng}', 'riskNmJp' : '${lvList.cdNmJp}'});
		</c:forEach>


		///////////////////// Level 매칭
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
			        	return result.statusNmJp;;
				}

			} else {
				switch ('${nowCdNa}') {
		        case 'KR':
		            return '미분류';
		        case 'US':
		            return '(us)미분류';
		        case 'JP':
		            return '(jp)미분류';
				}
			}
			return result;
		}


		let prependNumber = 1;

		$('.example-opensingle').beefup({
			openSingle : true,
		});

		var region = '${cdNa}';

		function getPotholesByRoad() {
			var today = new Date();

			var fromDt = getFromYearDate();
			var toDt = dateFormat(today, 'select').replaceAll('-','');

			$.ajax({
				type : "GET",
				//url : 'http://localhost:8080/dashboard/potholesbyroad?from='+fromDt+'&to='+toDt+'&region='+ region,
				url : '${authInfo.restApiUrl}/dashboard/potholesbyroad?from='+fromDt+'&to='+toDt+'&region='+ region,
				//url : '${authInfo.restApiUrl}/dashboard/potholesbyroad?from=20230101&to=20241201&region='+ region, //url : 'http://localhost:8081/dashboard/potholesbyroad?from=20230101&to=20231201&region='+ region,
				async : false,
				data : {

				},
				headers : {
					'Authorization' : 'Bearer ' + localStorage.getItem("accessToken"),
					'Refresh-Token' : localStorage.getItem("Refresh-Token")
				},
				beforeSend:function(){
					$('#circularG').css('display','block');
				},
				complete : function(data) {
					//  실패했어도 완료가 되었을 때 처리
					$('#circularG').css('display','none');
				},
				success : function(resp) {

					datas = resp.data;

					var html = '';

					for (var i = 0; i < datas.length; i++) {
						data = datas[i];

						html += '<div class="swiper-slide">';
						//html += '<div class="swiper-slide" onclick="getDetailPage(\'' + fromDt + '\', \'' + toDt + '\', \'' + region + '\', \'' + data.wayName + '\')">';

						html += '<div class="stateSlide_item">';
						html += '<span class="stateLevel level'+ data.level +'"></span>';
						html += '<strong><em>' + data.count
								+ '</em><fmt:message key="COUNT2" bundle="${bundle}"/></strong>';
						html += '<p>' + data.wayName + '</p>';
						html += '</div>';
						html += '</div>';
					}

					$('#swiperId').append(html);

					const swiper = new Swiper('.swiper', {
						initialSlide : 0,
						slidesPerView : 4,
						autoplay : true,
						loop : true,
						spaceBetween : 12,
						navigation : {
							nextEl : '.swiper-button-next',
							prevEl : '.swiper-button-prev',
						},
						breakpoints : {
							1260 : {
								slidesPerView : 3,
							},
							1600 : {
								slidesPerView : 4,
							},
						},
					});

				}
			})

		}

	/*  클릭시 manageRiskList.jsp로 이동
		function getDetailPage(fromDt, toDt, region, wayName){
			console.log('디테일 페이지 이동', fromDt, ' 기간 ' , toDt, '지역', region , wayName);  // 현재 대시보드에서는 region으로만 쿼리조건 나누고, wayId로는 안쓰는데 -> manageRiskList 같은 경우 wayId로 쿼리 던져서 api 조건 불일치

		} */

		function getWorstRoad() {

			var region = '${cdNa}';

			var fromDt = getFromYearDate();

			$.ajax({
				type : "GET",
				//url : 'http://localhost:8081/dashboard/worstroad?from='+ fromDt +'&region='+ region,
				url : '${authInfo.restApiUrl}/dashboard/worstroad?from='+ fromDt +'&region='+ region,
				async : false,
				data : {

				},
				headers : {
					'Authorization' : 'Bearer '
							+ localStorage.getItem("accessToken"),
					'Refresh-Token' : localStorage
							.getItem("Refresh-Token")
				},
				beforeSend : function() {
					$('#circularG').css('display','block')
				},
				complete : function(data, status) {
					$('#circularG').css('display','none')
				},
				error	: function(xhr, status, error) {
					$('#circularG').css('display','none')
				},
				success : function(resp) {
					datas = resp.data;

					for (var i = 0; i < datas.length; i++) {
						var data = datas[i];
						var level = data.level;
						var levelText = getLevelText(level);
						var deviceMacAddr = data.id.substr(15);
						var deviceInfo = getDeviceName(deviceMacAddr);
						var date1 = dateFormat(new Date(data.timestamp), 'list');

						var iconClass = level == 1 ? 'badge_warning'
									  : level == 2 ? 'badge_negative'
									  : level == 3 ? 'badge_danger'
									  : 'badge_primary';
						$('.badge_risk:eq(' + i + ')').removeClass('badge_danger');
						$('.badge_risk:eq(' + i + ')').removeClass('badge_warning');
						$('.badge_risk:eq(' + i + ')').removeClass('badge_negative');
						$('.badge_risk:eq(' + i + ')').removeClass('badge_primary');

						// 벳지 스타일 적용 + 다국어
						$('.badge_risk:eq(' + i + ')').addClass(iconClass);
					 	$('.badge_risk:eq(' + i + ')').text(levelText);

						//HEAD
						// 이름
						$('.beefup__head:eq(' + i + ').worstHead h3').text(data.wayName);
						// 건수
						$('.beefup__head:eq(' + i + ').worstHead span:eq(0)').text('<fmt:message key="TOTAL" bundle="${bundle}"/> ' + data.count +'<fmt:message key="COUNT2" bundle="${bundle}"/> ');
						// 시간
						$('.beefup__head:eq(' + i + ').worstHead span:eq(1)').text(date1);

						//BODY
						//이미지
						$('.infoPhoto:eq(' + i + ') img').eq(0).attr("src", '${authInfo.restApiUrl}/pothole/' + data.id +'/thumbnail');
						//이미지 클릭
						$('.infoPhoto:eq(' + i + ') img').eq(0).attr("onclick", "getDetailImg("+ "'" + data.id + "'" +");");

						// 디바이스ID
						$('.infoDetail:eq(' + i + ') dd').eq(0).text(deviceInfo.deviceId);
						// 디바이스명
						$('.infoDetail:eq(' + i + ') dd').eq(1).text(deviceInfo.deviceNm);
						// 위험도
						$('.infoDetail:eq(' + i + ') dd').eq(2).text(levelText);

						// 위치
						$('.infoDetail:eq(' + i + ') dd').eq(3).text('<fmt:message key="LATITUDE" bundle="${bundle}"/> ' + data.latitude + ' / <fmt:message key="LONGITUDE" bundle="${bundle}"/> ' + data.longitude);
						// 도로명
						$('.infoDetail:eq(' + i + ') dd').eq(4).text(data.wayName);
						// 촬영일시
						$('.infoDetail:eq(' + i + ') dd').eq(5).text(date1);
						// 조치상태
						$('.infoDetail:eq(' + i + ') dd').eq(6).text(getRoadStatus(data['status']));

						// FOOTER
						// 포트홀
						$('.itemvalue:eq(' + i + ') em').eq(0).text(data.countOfPotholes);
						// 수직균열
						$('.itemvalue:eq(' + i + ') em').eq(1).text(data.countOfVerticalCrack);
						// 수평군열
						$('.itemvalue:eq(' + i + ') em').eq(2).text(data.countOfHorizontalCrack);
						// 피로균열
						$('.itemvalue:eq(' + i + ') em').eq(3).text(data.countOfAlligators);


					}

					/*
					 $('#swiperId').append(html); */
					//$('#removeSwiper').remove();
				}
			})

		}

		function getChart() {
			var port = [ '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-' ];
			var hori = [ '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-' ];
			var verti = [ '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-' ];
			var piro = [ '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-' ];
			var level = [ '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-' ];

			var region = "${authInfo.cdNa}";
			var date = new Date();

			$.ajax({
				type : "GET",
				url : "${authInfo.restApiUrl}/statistics/yearly/month/count",
				//url : "http://localhost:8080/statistics/yearly/month/count",
				async : true,
				data : {
					region : region
				},
				headers : {
					'Authorization' : 'Bearer '
							+ localStorage.getItem("accessToken"),
					'Refresh-Token' : localStorage.getItem("Refresh-Token")
				},
				beforeSend:function(){
					$('#circularG').css('display','block');
				},
				complete : function(data) {
					//  실패했어도 완료가 되었을 때 처리
					$('#circularG').css('display','none');
				},
				success : function(resp) {

					$('#table-1 tbody tr').remove();

					var datas = resp.data;

				   // 현재 날짜 기준으로 1년 전 연도/월 계산
				    const now = new Date();
				    const currentYear = now.getFullYear();
				    const currentMonth = now.getMonth() + 1;

				    // 1년 전 날짜 계산
				    const oneYearAgo = new Date(now.setFullYear(now.getFullYear() - 1));
				    const oneYearAgoYear = oneYearAgo.getFullYear();
				    const oneYearAgoMonth = oneYearAgo.getMonth() + 2;

				    // 라벨을 월별로 준비 (1년간 월별 데이터에 맞는 라벨 생성)
				    var labels = [];
				    var labelIndexs = [];
				    var label = '';

				    for (let i = oneYearAgoMonth; i <= 12; i++) {
				    	label = oneYearAgoYear + '/'+ i.toString().padStart(2, '0');
				        labels.push(label);
				        labelIndexs.push(label.replaceAll('/',''));
				    }

				    for (let i = 1; i < oneYearAgoMonth; i++) {
				        label = currentYear + '/'+ i.toString().padStart(2, '0');
				        labels.push(label);
				        labelIndexs.push(label.replaceAll('/',''));
				    }

				    // 인덱스 계산 (월에 맞는 배열 인덱스)
				    datas.forEach(function(data) {
				        var yearMonth = data['year'] + data['month'];
						var idx = labelIndexs.indexOf(yearMonth);

				        port[idx] = data['count-of-potholes'];
				        hori[idx] = data['count-of-horizontal-cracks'];
				        verti[idx] = data['count-of-vertical-cracks'];
				        piro[idx] = data['count-of-alligators'];
				        level[idx] = Math.round(data['level']);
				    });

					var appendRow = "";
					var data = {
						port : port,
						hori : hori,
						verti : verti,
						piro : piro,
						level : level
					};

					//균열 종류 (포트홀, 수직균열, 수평균열, 피로균열)
					var gubunByCdna = [];

					switch ('${nowCdNa}') {
				        case 'KR':
				        	potholeKeyValue.forEach(item => {gubunByCdna.push(item.potholeNm);})
				        	break;
				        case 'US':
				        	potholeKeyValue.forEach(item => {gubunByCdna.push(item.potholeNmEng);})
				        	break;
				        case 'JP':
				        	potholeKeyValue.forEach(item => {gubunByCdna.push(item.potholeNmJp);})
				        	break;
					}

					var gubun = [];

					// 균열 종류  -> 심각도(평균) 추가
					gubunByCdna.forEach(item => {gubun.push(item);})
					gubun.push('<fmt:message key="RISK_AVG" bundle="${bundle}"/>');

					// data json keyname
					var gubun2 = [ 'port', 'verti', 'hori', 'piro', 'level' ];

					for (var i = 0; i <gubun.length; i++) {

						appendRow += '<tr>'
								+ '<td align="center" class="listtd">'
								+ gubun[i] + '</td>'
						var val = data[gubun2[i]];

						for (var j = 0; j < 12; j++) {
							appendRow += '<td align="center" class="listtd">'
									+ val[j] + '</td>';
						}
					}

					$('#table-1 > tbody').append(appendRow);

					chartInfo(data, labels);
				}

			})
			getPotholesByRoad();

		}

		function chartInfo(data, labels) {

			Chart.getChart('myChart').destroy()

			var context = document.getElementById('myChart').getContext('2d');

			var myChart = new Chart(context, {
				type : 'bar',
				data : {
					labels : labels,
					datasets : [
							{
								label : '<fmt:message key="POTHOLE" bundle="${bundle}"/>',
								data : [ data['port'][0], data['port'][1],
										data['port'][2], data['port'][3],
										data['port'][4], data['port'][5],
										data['port'][6], data['port'][7],
										data['port'][8], data['port'][9],
										data['port'][10], data['port'][11],
										data['port'][12] ],
								backgroundColor : [ 'rgba(255, 99, 132, 0.4)',

								],
								borderColor : [ 'rgba(255, 99, 132, 1)',

								],
								borderWidth : 1,
								borderRadius : 5,
								borderSkipped : false,
							},
							{
								label : '<fmt:message key="VERTICAL_CRACK" bundle="${bundle}"/>',
								data : [ data['verti'][0], data['verti'][1],
										data['verti'][2], data['verti'][3],
										data['verti'][4], data['verti'][5],
										data['verti'][6], data['verti'][7],
										data['verti'][8], data['verti'][9],
										data['verti'][10], data['verti'][11],
										data['verti'][12] ],
								backgroundColor : [ 'rgba(255, 206, 86, 0.4)',

								],
								borderColor : [ 'rgba(255, 206, 86, 1)',

								],
								borderWidth : 1,
								borderRadius : 5,
								borderSkipped : false,
							},
							{
								label : '<fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}"/>',
								data : [ data['hori'][0], data['hori'][1],
										data['hori'][2], data['hori'][3],
										data['hori'][4], data['hori'][5],
										data['hori'][6], data['hori'][7],
										data['hori'][8], data['hori'][9],
										data['hori'][10], data['hori'][11],
										data['hori'][12] ],
								backgroundColor : [ 'rgba(155, 106, 86, 0.4)',

								],
								borderColor : [ 'rgba(155, 106, 86, 1)',

								],
								borderWidth : 1,
								borderRadius : 5,
								borderSkipped : false,
							},
							{
								label : '<fmt:message key="FATIGUE_CRACK" bundle="${bundle}"/>',
								data : [ data['piro'][0], data['piro'][1],
										data['piro'][2], data['piro'][3],
										data['piro'][4], data['piro'][5],
										data['piro'][6], data['piro'][7],
										data['piro'][8], data['piro'][9],
										data['piro'][10], data['piro'][11],
										data['piro'][12] ],
								backgroundColor : [ 'rgba(39, 126, 255, 0.4)',

								],
								borderColor : [ 'rgba(39, 126, 255, 1)',

								],
								borderWidth : 1,
								borderRadius : 5,
								borderSkipped : false,
							} ]
				},
				options : {
					scales : {
						y : {
							beginAtZero : true
						}
					},
					legend : {
						position : 'bottom',
					},
				}
			});
		}

		function getDetailImg(id){
			$('#pop_riskPopImg').css('display','block');
			var pic = document.querySelector('#popup_imgDetail');
			pic.setAttribute("src", "${authInfo.restApiUrl}/pothole/"+ id +"/image" );
		}

		// 이미지 창 닫기 이벤트
		$('.riskPopImg_close').on("click", function(){
			$('#pop_riskPopImg').css('display','none');
		})

		$(document).ready(function() {

			getWorstRoad();

			getChart();

		});
	</script>
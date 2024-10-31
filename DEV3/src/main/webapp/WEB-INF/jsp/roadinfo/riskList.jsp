<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="bundleName"	value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<c:set var="nowCdNa" value="${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />

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
					<ul class="optionList" id="level1_ul">
						<li class="optionItem">전체</li>
						<li class="optionItem">Kedah, Malaysia</li>
						<li class="optionItem" data-code="dd">Level1</li>
					</ul>
			</span> <span class="selectBox resp bottom" id="msgdivCd_span">
					<button class="label" id="level2" data-code="">Level2</button>
					<ul class="optionList" id="level2_ul">
						<li class="optionItem">전체</li>
						<li class="optionItem">07100 Langkawi</li>
						<li class="optionItem">Level2</li>
					</ul>
			</span> <span class="selectBox resp bottom" id="msgdivCd_span">
					<button class="label" id="level3" data-code="">Level3</button>
					<ul class="optionList" id="level3_ul">
						<li class="optionItem">전체</li>
						<li class="optionItem">Langkawi International Airport Padang Mat Sirat Pulau Langkawi</li>
						<li class="optionItem">Level3</li>
					</ul>
			</span>

			<span class="stl"><fmt:message key="PERIOD" bundle="${bundle}" />
			<span class="remark2"></span></span>
			<span class="date"> <input type="text" value="${fromDt}" name="start" id="fromDt" class="input2" readonly> ~ <input type="text" value="${toDt}" name="end" id="toDt" class="input2" readonly>
				<button class="search_calender" id="search_calender"></button>
			</span> <span class="search" style="display: none;"> <input type="text" value="" name="deviceNm" id="deviceNm" class="input1" placeholder="디바이스명">
			</span>
				<button class="btn_search">
					<fmt:message key="SEARCH" bundle="${bundle}" />
				</button></li>
		</ul>
		<ul class="contents">
			<li class="view">
				<div class="stitle">
					<div class="">
						<ul class="optList">
							<li><a href="#" onclick="setListByLv(999)" class="active" id="selectAll"><fmt:message key="ALL" bundle="${bundle}" /></a></li>
							<c:forEach var="risklist" items="${codeListLv}" varStatus="status">
								<li><a href="#" onclick="setListByLv(${risklist.cdId+0})" id="selectLv${risklist.cdId+0}">
									<c:choose>
											<c:when test="${nowCdNa eq 'KR'}">${risklist.cdNm}</c:when>
											<c:when test="${nowCdNa eq 'US'}">${risklist.cdNmEng}</c:when>
											<c:when test="${nowCdNa eq 'JP'}">${risklist.cdNmJp}</c:when>
									</c:choose>
								</a></li>
							</c:forEach>
						</ul>
						<!-- 다국어 적용 전
						<ul class="optList">
							<li><a href="#" onclick="setListByLv(999)" class="active" id="selectAll"><fmt:message key="ALL" bundle="${bundle}" /></a></li>
							<li><a href="#" onclick="setListByLv(0)" id="selectLv0"><fmt:message key="보통" bundle="${bundle}" /></a></li>
							<li><a href="#" onclick="setListByLv(1)" id="selectLv1"><fmt:message key="주의" bundle="${bundle}" /></a></li>
							<li><a href="#" onclick="setListByLv(2)" id="selectLv2"><fmt:message key="위험" bundle="${bundle}" /></a></li>
							<li><a href="#" onclick="setListByLv(3)" id="selectLv3"><fmt:message key="심각" bundle="${bundle}" /></a></li>
						</ul> -->
						<p class="tl">
							<span class="cnt"> <fmt:message key="TOTAL"
									bundle="${bundle}" /> <strong id="totCnt">0</strong> <fmt:message
									key="COUNT2" bundle="${bundle}" />
							</span>
						</p>
					</div>

					<div class="array-container">
						<span class="selectBox text bottom" id="select_asc_sort2">
							<button class="label" id="sort2" data-code="desc">
								<fmt:message key="DATE_DESC" bundle="${bundle}" />
							</button>
							<ul class="optionList" id="sortchk2">
								<li class="optionItem" data-value="desc"><fmt:message key="DATE_DESC" bundle="${bundle}" /></li>
								<li class="optionItem" data-value="asc"><fmt:message key="DATE_ASC" bundle="${bundle}" /></li>
							</ul>
						</span>
					</div>
				</div>

				<div class="riskListWrap">
					<ul class="riskList" id="riskList2">
			<!--  <li>
					<a class="riskPop">
							<div class="riskItem">
								<span class="num">1</span>
								<p class="tumnail"><img src="/img/sample_highway.jpg" alt="도로위험목록 이미지"></p>
								<div class="deviceInfo">
									<span class="deviceId">Device-AAA</span>
									<span class="deviceName">디바이스A</span>
								</div>
								<span class="badge_risk badge_primary"></span>
								<span class="time">2023.10.30 09:42:23</span>
								<span class="risk"><span>포트홀 3개</span><span>균열 0개</span></span>
								<span class="place">서울 외곽순환도로</span>
							</div>
							<button type="button" class="btn_more"></button>
						</a>
					</li>
					-->
					</ul>
				</div>
			</li>
		</ul>
	</div>

	<div class="pop_wrap" id="pop_riskPop" style="display: none;">
		<div class="pop_box">
			<div class="pop_content">
				<h3 class="pop_tit">도로위험 상세정보 : Device-AAA</h3>
				<div class="pop_riskInfo">
					<div class="viewOpt">
						<button class="btn_slide active" id="btn_slide" title="슬라이드형" onClick="getSlideList()"></button>
						<button class="btn_album" id="btn_album" title="앨범형" onClick="getAlbumList()"></button>
					</div>
					<!-- Album -->
					<div class="riskAlbum">
						<div class="swiper-count">
							총 <em>00</em>건
						</div>
						<div class="gallery-list">
							<div class="gallery-thum-box" id="riskAlbumId">
								<div class="gallery-thum">
									<img src="/img/sample_highway.jpg" class="active">
								</div>
								<div class="gallery-thum">
									<img src="/img/sample_highway02.jpg">
								</div>
								<div class="gallery-thum">
									<img src="/img/sample_highway03.jpg">
								</div>
								<div class="gallery-thum">
									<img src="/img/sample_highway.jpg">
								</div>
								<div class="gallery-thum">
									<img src="/img/sample_highway02.jpg">
								</div>
								<div class="gallery-thum">
									<img src="/img/sample_highway03.jpg">
								</div>
								<div class="gallery-thum">
									<img src="/img/sample_highway.jpg">
								</div>
								<div class="gallery-thum">
									<img src="/img/sample_highway02.jpg">
								</div>
								<div class="gallery-thum">
									<img src="/img/sample_highway03.jpg">
								</div>
								<div class="gallery-thum">
									<img src="/img/sample_highway.jpg">
								</div>
								<div class="gallery-thum">
									<img src="/img/sample_highway02.jpg">
								</div>
								<div class="gallery-thum">
									<img src="/img/sample_highway03.jpg">
								</div>
							</div>
							<span class="txtBox">경도 132.1 / 위도 37.001</span>
						</div>
					</div>

					<!-- Swiper -->
					<div class="riskSlide" style="display: none;">
						<div class="gallery-main-box gallery-main-swiper swiper-container">
							<div class="swiper-wrapper" id="swiperId">
								<div class="swiper-slide">
									<div class="riskSlide_item">
										<img src="" alt="도로위험 이미지" class="riskPopImg">
										<span class="txtBox">경도 132.1 / 위도 37.001</span>
									</div>
								</div>
							</div>

						</div>
						<!-- Add Arrows -->
						<div class="control-wrap">
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>

						</div>
						<div class="swiper-count">
							<span id="slide-index">1</span> <span id="slide-length">/5</span>
						</div>
						<div class="thumb-control-wrap">
							<div class="thumb-swiper-button-prev"></div>
							<div class="thumb-swiper-button-next"></div>
						</div>
						<div
							class="gallery-thumb-box gallery-thumb-swiper swiper-container">
							<div class="swiper-wrapper" id="thumbSwiperId">
								<div class="swiper-slide">
									<p class="info-img object-fit">
										<img src="https://user-images.githubusercontent.com/33821863/148932761-33a8f83e-f88b-468f-9b8c-d999ef3a7b71.jpg" alt="Sample">
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="infoDetail">
						<div class="level" id="popup_level_icon">
							<span id="popup_level">LEVEL4. 심각</span>
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
							<!-- db 데이터 및 다국어 필요 -->
							<dd id="popup_road_status">미분류</dd>
						</dl>
					</div>
				</div>
				<div class="pop_btn">
					<span class="btn_m btn_secondary btn_r pop_close" id=""><fmt:message key="CONFIRM" bundle="${bundle}" /></span>
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
		</div>
	</div>

	<div class="pop_wrap" id="pop_riskPopImg" style="display: none;">
		<div class="pop_riskPopImg">
			<div class="photo_area">
				<img src="/img/sample_highway03.jpg" alt="도로위험목록 이미지"
					id="popup_imgDetail">
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
<!--
	<script type="module">
		import Swiper from 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.mjs'
		const swiper = new Swiper()
	</script>
-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

	<script language="javascript">
		var dataTemp;
		var potTemp;

		var potImg = [];
		var fromDt = '';
		var toDt = '';

		var searchLv = 0;

		var region = '${cdNa}';
		//var wayId =  region == 'KR' ? '2409180' : '2682891' // 성남 or 츠쿠바시
		var wayId = ${authInfo.areaCodeLv2};

		let prependNumber = 1;
		var existSwiperData = false;

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
					deviceInfo.deviceNm = data.deviceNm
					deviceInfo.deviceId = data.deviceId

				}
			})

			return deviceInfo

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


		///////////////////// 레벨별 검색

		var clickedRiskLevel= 999;

		function setListByLv(lv) {
			clickedRiskLevel= lv;
			var cnt = 0;
			var node = document.getElementById('riskList2')
			node.innerHTML = '';

			$(".optList li a").removeAttr('class');

			if (lv == 999) {
				$("#selectAll").attr('class', 'level');
				$('#selectAll').addClass('active');
			} else {
				$("#selectLv"+lv).attr('class', 'level');
				$('#selectLv'+lv).addClass('active');
			}

			if (!dataTemp) {
				datas = [];
			}

			// 내용 초기화
			for (var i = 0; i < dataTemp.length; i++) {

				var data = dataTemp[i]
				var lev = Math.round(data.level)

				if (lev == lv || lv == '999') {

					var pothole = data.pothole == null ? null : data['pothole'] // 포트홀 정보

					if (pothole) {

						cnt++;
						// 위험도 레벨
						var iconClass = lev == 0 ? 'badge_primary'
								      : lev == 1 ? 'badge_warning'
									  : lev == 2 ? 'badge_negative'
												 : 'badge_danger';

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

						date = dateFormat(new Date(pothole['timestamp']), 'list');
						deviceInfo = getDeviceName(pothole['device-id']);

						imgUrl = '${authInfo.restApiUrl}/pothole/' + pothole.id + '/thumbnail';

						potholeCnt = data['count-of-potholes'];
						vertical = data['count-of-vertical-cracks'];
						horizontal = data['count-of-horizontal-cracks'];
						cracks = data['count-of-alligators'];

						var roadNm = data.name == "" ? "도로정보없음" : data.name;

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
						html += '<p class="tumnail">'
						html += '<img src="'+ imgUrl +'" alt="도로위험목록 이미지">'
						html += '</p>'
						html += '<div class="deviceInfo">'
						html += '<span class="deviceId">' + deviceInfo.deviceId + '</span>'
						html += '<span class="deviceName">' + deviceInfo.deviceNm + '</span>'
						html += '</div>'
						/* html += '<span class="badge_risk '+ iconClass + '"></span>' */
						html += '<span class="badge_risk '+ iconClass + '">'+ getLevelText(lev)+'</span>'
						html += '<span class="time">' + date + '</span>'
						html += '<span class="risk">'
						html += '<span><fmt:message key="POTHOLE" bundle="${bundle}"/> '+ potholeCnt + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
						html += '<span><fmt:message key="VERTICAL_CRACK" bundle="${bundle}"/> ' + vertical + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
						html += '<span><fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}"/> ' + horizontal + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
						html += '<span><fmt:message key="FATIGUE_CRACK" bundle="${bundle}"/> ' + cracks + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
						html += '</span>'
						html += '<span class="place">' + roadNm + '</span>'
						/* html += '<span class="road_status">' + getRoadStatus(pothole['status'])
								+ '</span>' */
						html += '</div>'
						html += "<button type='button' class='btn_more' onclick=\"getDetail('" + data.name + "','" + wayId + "','" + fromDt + "','" + toDt + "')\"'></button>"
						html += '</a>'
						html += '</li>'

						$('.riskList').append(html);

					}

					$('#circularG').css('display', 'none')

				}

			}

			$('#totCnt').text(cnt)
			if (cnt == 0) {
				$('.infoListWrapNoData').css('display', 'block')
			} else {
				$('.infoListWrapNoData').css('display', 'none')
			}

		}

		// Swiper 인스턴스 변수
		var mainSwiper, thumbSwiper;

		function initializeSwipers() {
		  // Swiper 1 초기화
		  if (mainSwiper) {
			  mainSwiper.destroy(true, true);
		  }

		  mainSwiper = new Swiper('.gallery-main-swiper', {
			  initialSlide : 0,
		        effect: 'fade',
		        spaceBetween: 10,
		        cssMode: false,
		        allowTouchMove: false,
		        autoplay : false,
		        loop: false,
		        navigation: {
		            nextEl: '.swiper-button-next',
		            prevEl: '.swiper-button-prev'
		        },
		        breakpoints: {
		            1024: {
		                loopedSlides: 5
		            },
		            768: {
		                loopedSlides: 3
		            },
		            480: {
		                loopedSlides: 2
		            }
		        }
		        , on : {

		        }
		  });

		  // Swiper 2 초기화
		  if (thumbSwiper) {
			  thumbSwiper.destroy(true, true);
		  }

		  thumbSwiper = new Swiper('.gallery-thumb-swiper', {
			  initialSlide: 0,
			    spaceBetween: 5,
			    cssMode: false,
			    watchSlidesProgress: true,
			    slideToClickedSlide: true,
			    autoplay: false,
			    loop: false,
			    navigation: {
		            nextEl: '.thumb-swiper-button-next',
		            prevEl: '.thumb-swiper-button-prev'
		        },
			    breakpoints: {
			        1024: {
			            slidesPerView: 5, // 한 화면에 보일 섬네일 개수
			            loopedSlides: 5   // 위 섬네일 개수와 동일한 수치 설정
			        },
			        768: {
			            slidesPerView: 3,
			            loopedSlides: 3
			        },
			        480: {
			            slidesPerView: 2,
			            loopedSlides: 2
			        }
			    },
			    on: {

			    }
		  });
		}

	//메인 스와이퍼 prev-next 버튼 더블 클릭 방지
	    let isClickable = true;

	    function preventDoubleClick(e) {
	      if (!isClickable) {
	        e.preventDefault();
	        e.stopImmediatePropagation();
	        return;
	      }
	      isClickable = false;
	      setTimeout(() => {
	        isClickable = true;
	      }, 500); // Adjust delay as needed
	    }

	    const nextButton = document.querySelector('.swiper-button-next');
	    const prevButton = document.querySelector('.swiper-button-prev');

	    nextButton.addEventListener('click', preventDoubleClick);
	    prevButton.addEventListener('click', preventDoubleClick);

		//포토홀 팝업 오른쪽 상세정보
		function getPotholeDetailInfo(pothole, index){
			detailIndex = index;

			document.querySelectorAll('.gallery-thum img').forEach(img => {
                img.classList.remove('active');
            });

            var clickedImage = document.querySelector('.gallery-thum:nth-child(' + (index + 1) + ') img');
            if (clickedImage) {
                clickedImage.classList.add('active');
            }

			var temp = pothole;

			$('#piroCnt').text(temp.risk['count-of-alligators'] + '<fmt:message key="COUNT1" bundle="${bundle}"/>');
			$('#portholeCnt').text(temp.risk['count-of-potholes'] + '<fmt:message key="COUNT1" bundle="${bundle}"/>');
			$('#vertiCnt').text(temp.risk['count-of-vertical-cracks'] + '<fmt:message key="COUNT1" bundle="${bundle}"/>');
			$('#horiCnt').text(temp.risk['count-of-horizontal-cracks'] + '<fmt:message key="COUNT1" bundle="${bundle}"/>');
			var lv = Math.round(temp.risk['level']);
			var levelText = getLevelText(lv.toString());
			$('#popup_level').text('LEVEL' + lv + ". " + levelText);

			// 아이콘
			$("#popup_level_icon").removeAttr('class');
			$("#popup_level_icon").attr('class', 'level');
			$('#popup_level_icon').addClass('level' + lv );

			// 디바이스 정보
			var deviceInfo = getDeviceName(temp['device-id']);
			$('#popup_deviceNm').text(deviceInfo.deviceNm);
			$('#popup_deviceId').text(deviceInfo.deviceId);

			$('.pop_tit').text('<fmt:message key="ROAD_RISK_DETAIL" bundle="${bundle}"/> : ' + deviceInfo.deviceNm + " ( " + deviceInfo.deviceId + " )");

			// 기타
			$('#popup_level2').text(levelText); // 위험도

			$('#popup_deviceNm').text(deviceInfo.deviceNm);
			$('#popup_deviceId').text(deviceInfo.deviceId);

			$('#popup_do').text('<fmt:message key="LATITUDE" bundle="${bundle}"/> ' + temp.point.latitude + ' / <fmt:message key="LONGITUDE" bundle="${bundle}"/> ' + temp.point.longitude );
			 $('#popup_date').text( dateFormat(new Date(temp.timestamp),'list'));
			$('#popup_road_status').text(getRoadStatus(temp['status']));

			$('.gallery-list .txtBox').text( '<fmt:message key="LATITUDE" bundle="${bundle}"/> ' + temp.point.latitude + ' / <fmt:message key="LONGITUDE" bundle="${bundle}"/> '+ temp.point.longitude );

		}

		var detailIndex = 0;

		function getSlideList(){
			mainSwiper.slideTo(detailIndex);
			//mainSwiper.slideTo(0);
		}

		function getAlbumList(){

			 if (!$('#btn_album').hasClass('active')) {
		            $('.riskSlide').hide();
		            $('.riskAlbum').show();
		            $('#btn_album').addClass('active');
		            $('#btn_slide').removeClass('active');
		        }
			var node = document.getElementById('riskAlbumId');
			node.innerHTML = '';

			var cnt = 0;
			for (var j = 0; j < datas.length; j++) {
				data = datas[j];
				potholes = datas[j].potholes;

				$('#popup_roadNm').text(data.name);

				for (var i = 0; i < potholes.length; i++) {
					var totalIndex = cnt;

					cnt++;
					var pothole = potholes[i]
					var risk = pothole.risk

					potInfo.push(potholes[i])

					var text = '<div class="gallery-thum">'
					    + '<img src="${authInfo.restApiUrl}/pothole/' + potholes[i].id + '/thumbnail" '
					    + 'alt="도로위험 이미지" '
					    + 'onclick=\'getPotholeDetailInfo(' + JSON.stringify(potholes[i]) + ', ' + totalIndex + ')\' '
					   // + 'onclick=\'getPotholeDetailInfo(' + JSON.stringify(potholes[i]) + ', ' + i + ')\' '
					    + 'ondblclick=\'getDetailImg(' + '"'+ potholes[i].id + '"' +')\'>'
					    + '</div>';

				    $('#riskAlbumId').append(text);

				}
			}

			document.querySelector('.gallery-thum:nth-child(' + (detailIndex + 1) + ') img').scrollIntoView(false);

			$('.swiper-count em').text(cnt);

			$('.gallery-list .txtBox').text( '<fmt:message key="LATITUDE" bundle="${bundle}"/> ' + potInfo[detailIndex].point.latitude + ' / <fmt:message key="LONGITUDE" bundle="${bundle}"/> '+ potInfo[detailIndex].point.longitude );

			getPotholeDetailInfo(potInfo[detailIndex], detailIndex);

			/* 앨범 버튼 클릭시 - 첫번째 포트홀정보로 초기화
			$('.gallery-list .txtBox').text(
					'<fmt:message key="LATITUDE" bundle="${bundle}"/> ' + potInfo[0].point.latitude
					+ ' / <fmt:message key="LONGITUDE" bundle="${bundle}"/> '+ potInfo[0].point.longitude
			);
			getPotholeDetailInfo(potInfo[0], 0); */

		}

		///////////////////// 상세보기
		function getDetail(roadNm, wayId, fromDt, toDt) {

			 // 초기 상태 설정: 슬라이드 버튼이 활성화된 상태와 .riskSlide가 표시되도록 설정
		    $('#btn_album').removeClass('active');
		    $('#btn_slide').removeClass('active');
			$('#btn_slide').addClass('active');

		    $('.riskSlide').show();
		    $('.riskAlbum').hide();

			var node = document.getElementById('swiperId')
			node.innerHTML = '';

			var node2 = document.getElementById('thumbSwiperId')
			node2.innerHTML = '';

			potImg = [];
			potInfo = [];

			initializeSwipers();
			var thumbSwiperInfo = '';

			$('#pop_riskPop').css('display', 'block')

			$.ajax({
				type : "GET",
				url : "${authInfo.restApiUrl}/administrative/" + wayId + "/way/" + roadNm + "/pothole?from=" + fromDt + "&to=" + toDt,
				//url : "http://localhost:8080/administrative/" + wayId + "/way/" + roadNm + "/pothole?from=" + fromDt + "&to=" + toDt,
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
					datas = resp.data;

					for (var j = 0; j < datas.length; j++) {
						data = datas[j];
						potholes = datas[j].potholes;

						$('#popup_roadNm').text(data.name);

						for (var i = 0; i < potholes.length; i++) {

							var pothole = potholes[i];
							var risk = pothole.risk;

							potInfo.push(potholes[i]);

							var text = '<div class="swiper-slide" style="pointer-events:auto;">'
									+ '<div class="riskSlide_item" onclick=\"getDetailImg(\'' + potholes[i].id + "')" + '">'
									+ '<img src="${authInfo.restApiUrl}/pothole/'+ potholes[i].id +'/image" alt="도로위험 이미지" class="riskPopImg" >'
									+ '<span class="txtBox"><fmt:message key="LATITUDE" bundle="${bundle}"/> ' + potholes[i].point.latitude + ' / <fmt:message key="LONGITUDE" bundle="${bundle}"/> ' + potholes[i].point.longitude + '</span>'
									+ '</div>'
									+ '</div>';

							potImg.push(text);
							$('#swiperId').append(text);

							thumbSwiperInfo ='<div class="swiper-slide">'
									+'<p class="info-img object-fit">'
									+'<img src="${authInfo.restApiUrl}/pothole/'+ potholes[i].id +'/thumbnail" alt="도로위험 이미지"></p>'
						            +'</div>'

							$('#thumbSwiperId').append(thumbSwiperInfo);

							if (i === 0) {
								$('#thumbSwiperId .swiper-slide:nth-child(' + (i + 1) + ') .info-img img').addClass('active');
							}
						}
					}

					getPotholeDetailInfo(potInfo[0], 0);
					$('#slide-length').text('/ ' + potInfo.length);

				}
			})

	    // main slider 실행
	    mainSwiper = new Swiper('.gallery-main-swiper', {
	    	initialSlide : 0,
	        effect: 'fade',
	        cssMode: false,
	        spaceBetween: 10,
	        allowTouchMove: false,
	        autoplay : false,
	        loop: false,
	        navigation: {
	            nextEl: '.swiper-button-next',
	            prevEl: '.swiper-button-prev'
	        },
	        breakpoints: {
	            1024: {
	                loopedSlides: 5
	            },
	            768: {
	                loopedSlides: 3
	            },
	            480: {
	                loopedSlides: 2
	            }
	        }
	        , on : {
		        slideChange: function(swiper) {
		            this.currentSlideIndex = this.activeIndex;
		            detailIndex = this.activeIndex;

		            getSwiperDetailInfo(this.currentSlideIndex);
		            $('#slide-index').text(this.currentSlideIndex + 1);
		        },
		        click: function(swiper) {
		        	if (potInfo[this.currentSlideIndex].id != "undefined") {
		        		getDetailImg(potInfo[this.currentSlideIndex].id);
		        	} else {
		        		getDetailImg(potInfo[this.currentSlideIndex]);
		        	}
		        }

	        }
	    });

		 if (thumbSwiper) {
			 thumbSwiper.destroy(true, true);
		  }

		thumbSwiper = new Swiper('.gallery-thumb-swiper', {
		    initialSlide: 0,
		    spaceBetween: 5,
		    cssMode: false,
		    watchSlidesProgress: true,
		    slideToClickedSlide: true,
		    autoplay: false,
		    loop: false,
		    navigation: {
	            nextEl: '.thumb-swiper-button-next',
	            prevEl: '.thumb-swiper-button-prev'
	        },
		    breakpoints: {
		        1024: {
		            slidesPerView: 5, // 한 화면에 보일 섬네일 개수
		            loopedSlides: 5   // 위 섬네일 개수와 동일한 수치 설정
		        },
		        768: {
		            slidesPerView: 3,
		            loopedSlides: 3
		        },
		        480: {
		            slidesPerView: 2,
		            loopedSlides: 2
		        }
		    },
		    on: {
		        init: function(swiper) {
		        	setupCustomNavigation(swiper);
		            updateSwiperAlignment(swiper);

		            $('#slide-index').text('1');
		        },
		        resize: function(swiper) {
		        	setupCustomNavigation(swiper);
		            updateSwiperAlignment(swiper);

		        },

		        click: function(swiper, e) {
		            var clickedIndex = swiper.clickedIndex;

		            if (clickedIndex != null) {
		            	getSwiperDetailInfo(clickedIndex);
		                mainSwiper.slideTo(clickedIndex);
		            	$('#slide-index').text(clickedIndex + 1);
		            }

		        }
		    }
		});
	////////////////////
		// transitionend 이벤트 리스너 추가
		/* const handleTransitionEnd = (event) => {
		    const cssMode = mainSwiper.params.cssMode;
		    if (cssMode === undefined) {
		        console.log('cssMode is undefined, skipping...');
		        return;
		    }
		};

		document.querySelector('.gallery-thumb-swiper').addEventListener('transitionEnd', handleTransitionEnd);
 */
		/////////
        function setupCustomNavigation(swiper) {
            var nextButton = document.querySelector('.thumb-swiper-button-next');
            var prevButton = document.querySelector('.thumb-swiper-button-prev');

            var slidesPerView = swiper.params.slidesPerView;
		    var slideCount = swiper.slides.length;

		    if( slideCount <= slidesPerView ) {
		    	document.querySelector('.thumb-swiper-button-next').addEventListener('click', function(event) {
		    	    event.preventDefault();
		    	});

		    	document.querySelector('.thumb-swiper-button-prev').addEventListener('click', function(event) {
		    	    event.preventDefault();
		    	});

		    } else {
		    	var slidesPerView = swiper.params.slidesPerView;

		    	if(slidesPerView !== null) {
		    		nextButton.addEventListener('click', function() {

		                var newIndex = swiper.activeIndex + slidesPerView -1;
		                swiper.slideTo(newIndex);
		            });

		            prevButton.addEventListener('click', function() {

		                var newIndex = swiper.activeIndex - slidesPerView -1;
		                swiper.slideTo(newIndex);
		            });
		    	}
		    }
        }

		function updateSwiperAlignment(swiper) {
		    var slidesPerView = swiper.params.slidesPerView;
		    var slideCount = swiper.slides.length;


		    if (slideCount < slidesPerView) {
		        // 갯수가 slidesPerView보다 작으면 중앙정렬
		        swiper.allowTouchMove = false; // 드래그 비활성화
           		swiper.isLocked = true;
		        document.querySelector('.gallery-thumb-box').classList.add('centered');
		        document.querySelector('.gallery-thumb-box').classList.remove('left-aligned');

		    } else {
		        // 갯수가 slidesPerView보다 크면 왼쪽정렬
		        swiper.allowTouchMove = true;
           		swiper.isLocked = false;
		        document.querySelector('.gallery-thumb-box').classList.add('left-aligned');
		        document.querySelector('.gallery-thumb-box').classList.remove('centered');
		    }
		}


		    mainSwiper.controller.control = thumbSwiper;
		    thumbSwiper.controller.control = mainSwiper;

		    function getSwiperDetailInfo(clickedIndex){
		    	document.querySelectorAll('.gallery-thumb-box .swiper-slide .info-img img').forEach(img => {
                    img.classList.remove('active');
                });
                var clickedImage = document.querySelector('.gallery-thumb-box .swiper-slide:nth-child(' + (clickedIndex + 1) + ') .info-img img');
                if (clickedImage) {
                    clickedImage.classList.add('active');
                }

                var node = document.getElementById('swiperId');
                node.innerHTML = '';

                $('#swiperId').append(potImg[clickedIndex]);

                var data = potInfo[clickedIndex];

                // 이미지와 상관 없는 부분 데이터 삽입
                $('#piroCnt').text(data.risk['count-of-alligators'] + '<fmt:message key="COUNT1" bundle="${bundle}"/>');
                $('#portholeCnt').text(data.risk['count-of-potholes'] + '<fmt:message key="COUNT1" bundle="${bundle}"/>');
                $('#vertiCnt').text(data.risk['count-of-vertical-cracks'] + '<fmt:message key="COUNT1" bundle="${bundle}"/>');
                $('#horiCnt').text(data.risk['count-of-horizontal-cracks'] + '<fmt:message key="COUNT1" bundle="${bundle}"/>');
                var lv = Math.round(data.risk['level']);
                var levelText = getLevelText(lv.toString());
                $('#popup_level').text('LEVEL' + lv + ". " + levelText);

                // 아이콘
                $("#popup_level_icon").removeAttr('class');
                $("#popup_level_icon").attr('class', 'level');
                $('#popup_level_icon').addClass('level' +lv);

                // 디바이스 정보
                var deviceInfo = getDeviceName(data['device-id']);
                $('#popup_deviceNm').text(deviceInfo.deviceNm);
                $('#popup_deviceId').text(deviceInfo.deviceId);

                $('.pop_tit').text('<fmt:message key="ROAD_RISK_DETAIL" bundle="${bundle}"/> : ' + deviceInfo.deviceNm + " ( " + deviceInfo.deviceId + " )");

                // 기타
                $('#popup_level2').text(levelText);
                $('#popup_deviceNm').text(deviceInfo.deviceNm);
                $('#popup_deviceId').text(deviceInfo.deviceId);
                $('#popup_do').text('<fmt:message key="LATITUDE" bundle="${bundle}"/> ' + data.point.latitude + ' / <fmt:message key="LONGITUDE" bundle="${bundle}"/> ' + data.point.longitude);
                $('#popup_date').text(dateFormat(new Date(data.timestamp), 'list'));
                $('#popup_road_status').text(getRoadStatus(data['status']));

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

		const sortButton2 = document.querySelector('#sort2');
	    const optionList2 = document.querySelector('#sortchk2');

		 // 옵션 클릭 시 정렬 및 드롭다운 닫기
	    document.querySelectorAll('#sortchk2 .optionItem').forEach(function(item) {
	        item.addEventListener('click', function() {
	            const value = this.getAttribute('data-value');
	            sortButton2.setAttribute('data-code', value);
	            sortButton2.textContent = this.textContent;
	            optionList2.classList.remove('show'); // 드롭다운 닫기
	            sortList(value);
	        });
	    });

		 function sortList(sortStatus){
			  const riskList = document.querySelector('.riskList');

			  dataTemp = datas.filter(data => data.pothole);

			  if (sortStatus == 'desc') {
				  dataTemp.sort((a, b) => {
			            const dateA = new Date(a.pothole.timestamp);
			            const dateB = new Date(b.pothole.timestamp);
			            return dateB - dateA; // 내림차순 정렬
			        });
			    } else {
			    	dataTemp.sort((a, b) => {
			            const dateA = new Date(a.pothole.timestamp);
			            const dateB = new Date(b.pothole.timestamp);
			            return dateA - dateB; // 오름차순 정렬
			        });
			    }

			    setListByLv(clickedRiskLevel);
		 }

		 var datas = [];

		///////////////////// 조회
		function getList(riskLevel) {
			clickedRiskLevel = riskLevel;

			$("#selectAll").removeAttr('class');
			$("#selectLv0").removeAttr('class');
			$("#selectLv1").removeAttr('class');
			$("#selectLv2").removeAttr('class');
			$("#selectLv3").removeAttr('class');
			$("#selectLv99").removeAttr('class');

			if (riskLevel == 999) {
				$("#selectAll").attr('class', 'level');
				$('#selectAll').addClass('active');
			} else {
				$("#selectLv"+riskLevel).attr('class', 'level');
				$('#selectLv'+riskLevel).addClass('active');
			}

			var sortStatus = sortButton2 != null? sortButton2.getAttribute('data-code'): "desc" ;

			var node = document.getElementById('riskList2');
			node.innerHTML = '';

			$('#circularG').css('display', 'block');

			fromDt = $('#fromDt').val().replaceAll('-', '');
			toDt = $('#toDt').val().replaceAll('-', '');
			// var wayId = region == 'KR' ? '2409180' : '2409180' // 최초조회시 기본 성남 (일본좌표아직없음)

			if (searchLv != 0) {
				wayId = searchLv == 2 ? $('#level2').data('code') : $('#level3').data('code');
			}

			$.ajax({
				type : "GET",
				url : "${authInfo.restApiUrl}/administrative/" + wayId + "/way/risk?from=" + fromDt + "&to=" + toDt + "&sortStatus=" + sortStatus,
				//url : "http://localhost:8080/administrative/" + wayId + "/way/risk?from=" + fromDt + "&to=" + toDt  + "&sortStatus=" + sortStatus,
				async : true,
				data : {

				},
				headers : {
					'Authorization' : 'Bearer ' + localStorage.getItem("accessToken"),
					'Refresh-Token' : localStorage.getItem("Refresh-Token")
				},
				beforeSend : function() {
					$('#circularG').css('display', 'block');
				},
				complete : function() {
					$('#circularG').css('display', 'none');

				},
				success : function(resp) {
					datas = resp.data;
					//datas = resp.data.ways // 행정구역 id로 매핑 시 리턴 데이터

					if (!datas) {
						datas = [];
					}

					//도로 레벨 4 선택시
					/* if (searchLv == 4) {

						var arry = datas.filter(function(item, index, self) {
							if (item.name.toString() == $('#level4').data('code')) {
								datas = [];
								datas.push(item);
							}
						})

					}
 					*/

					var cnt = 0
					dataTemp = datas;

					for (var i = 0; i < datas.length; i++) {
						/* for (var i=0; i< 10 ; i++){ */
						var data = datas[i];
						var pothole = data.pothole == null ? null : data['pothole'];

						if (pothole) {
							cnt++;

							// 위험도 레벨
							var lv = Math.round(data.level);

							var iconClass = lv == 0 ? 'badge_primary'
									      : lv == 1 ? 'badge_warning'
										  : lv == 2 ? 'badge_negative'
													: 'badge_danger';

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

							date = dateFormat(new Date(pothole['timestamp']), 'list');
							deviceInfo = getDeviceName(pothole['device-id']);

							imgUrl = '${authInfo.restApiUrl}/pothole/' + pothole.id + '/thumbnail';

							potholeCnt = data['count-of-potholes'];
							vertical = data['count-of-vertical-cracks'];
							horizontal = data['count-of-horizontal-cracks'];
							cracks = data['count-of-alligators'];

							portId = pothole.id;
						/*
							var parentWayInfo = '';

								$.ajax({
									type : "GET",
									url : "${authInfo.restApiUrl}/administrative/parent-wayinfo/"+ portId ,
									//url : "http://localhost:8080/administrative/parent-wayinfo/"+ portId ,
									async : false,
									success : function(resp) {
										parentWayInfo = resp.data // 데이터
									}
								})

						 */

							var roadNm = data.name == "" ? "도로정보없음" : data.name;

							var html = '<li>';
							html += '<a class="riskPop">'
							html += '<div class="riskItem">'
							html += '<span class="num">' + cnt + '</span>'
							html += '<p class="tumnail">'
							html += '<img src="'+ imgUrl +'" alt="도로위험목록 이미지">'
							html += '</p>'
							html += '<div class="deviceInfo">'
							html += '<span class="deviceId">' + deviceInfo.deviceId + '</span>'
							html += '<span class="deviceName">' + deviceInfo.deviceNm + '</span>'
							html += '</div>'
							html += '<span class="badge_risk '+ iconClass + '">'+ getLevelText(lv)+'</span>'
							html += '<span class="time">' + date + '</span>'
							html += '<span class="risk">'
							html += '<span><fmt:message key="POTHOLE" bundle="${bundle}"/> ' + potholeCnt + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
							html += '<span><fmt:message key="VERTICAL_CRACK" bundle="${bundle}"/> ' + vertical + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
							html += '<span><fmt:message key="HORIZONTAL_CRACK" bundle="${bundle}"/> ' + horizontal + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
							html += '<span><fmt:message key="FATIGUE_CRACK" bundle="${bundle}"/> ' + cracks + '<fmt:message key="COUNT1" bundle="${bundle}"/></span>'
							html += '</span>'
							html += '<span class="place">' + roadNm + '</span>'
							/* html += '<span class="road_status">' + getRoadStatus(pothole['status'])
									+ '</span>' */

							html += '</div>'
							html += "<button type='button' class='btn_more' onclick=\"getDetail('" + data.name + "','" + wayId + "','" + fromDt + "','" + toDt + "')\"'></button>"
							html += '</a>'
							html += '</li>'

							$('.riskList').append(html);

						}

					}

					$('#circularG').css('display', 'none');

					$('#totCnt').text(cnt);
					if (cnt == 0) {
						$('.infoListWrapNoData').css('display', 'block');
					} else {
						$('.infoListWrapNoData').css('display', 'none');
					}

					setListByLv(riskLevel);
				}

			})

		}

		function setLevelList(level, id) {

			region = "${authInfo.cdNa}";
			// 레벨1인 경우
			if (level == 1) {

				var node = document.getElementById('level2_ul');
				node.innerHTML = '';
				var node = document.getElementById('level3_ul');
				node.innerHTML = '';

				$.ajax({
					type : "GET",
					url : "${authInfo.restApiUrl}" + "/administrative?region=" + region,
					//url : "http://localhost:8080" + "/administrative?region=" + region,
					async : false,
					headers : {
						'Authorization' : 'Bearer '
								+ localStorage.getItem("accessToken"),
						'Refresh-Token' : localStorage
								.getItem("Refresh-Token")
					},
					beforeSend : function() {
						$('#circularG').css('display', 'block');
					},
					complete : function() {
						$('#circularG').css('display', 'none');

					},
					error : function(err){
						$('#circularG').css('display', 'none');
						console.log(err);
					},
					success : function(resp) {
						datas = resp.data;

						var node = document.getElementById('level1_ul');
						node.innerHTML = '';

						var html = '';

						for (var i = 0; i < datas.length; i++) {
							data = datas[i];
							html += '<li class="optionItem" data-code="' + data.id + '">' + data.name + '</li>';
						}

						node.innerHTML = html;

					}

				})

			} else if (level == 2) {

				var node = document.getElementById('level3_ul');
				node.innerHTML = '';

				$.ajax({
					type : "GET",
					url : "${authInfo.restApiUrl}" + "/administrative/" + id + "?region=" + region,
					//url : "http://localhost:8080" + "/administrative/" + id + "?region=" + region,
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
						$('#circularG').css('display', 'block');
					},
					complete : function() {
						$('#circularG').css('display', 'none');

					},
					success : function(resp) {
						datas = resp.data;

						var node = document.getElementById('level2_ul');
						node.innerHTML = '';

						var html = '';

						for (var i = 0; i < datas.length; i++) {
							data = datas[i]
							html += '<li class="optionItem" data-code="' + data.id + '">' + data.name + '</li>';
						}

						node.innerHTML = html;

					}

				})

			} else if (level == 3) {

				$.ajax({
					type : "GET",
					url : "${authInfo.restApiUrl}" + "/administrative/" + id + "?region=" + region,
					//url : "http://localhost:8080" + "/administrative/" + id + "?region=" + region,
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
						$('#circularG').css('display', 'block');
					},
					complete : function() {
						$('#circularG').css('display', 'none');

					},
					success : function(resp) {
						datas = resp.data;

						var node = document.getElementById('level3_ul');
						node.innerHTML = '';

						var html = '<li class="optionItem" data-code="'+id+'"><fmt:message key="ALL" bundle="${bundle}"/></li>';

						for (var i = 0; i < datas.length; i++) {
							data = datas[i];
							html += '<li class="optionItem" data-code="' + data.id + '">' + data.name + '</li>';
						}

						node.innerHTML = html;

					}

				})

			}

			$(".optionItem").off("click").on("click", function(){
						let tmpSelectValue = $(this).text();
						$(this).parents(".selectBox").find(".label").text(tmpSelectValue);
						var value = $(this).data('code');
						if (!value) value = '';
						//tmpSelectBox.find(".label").data('code',value);
						$(this).parent().parent().find(".label").data('code', value);
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

							searchLv = 1;

							setLevelList(2, $('#level1').data('code'));

						} else if (levelChk == 'level2_ul') {

							searchLv = 2

							// 하위 레벨 초기화
							$('#level4').text('Level4');
							$('#level3').text('Level3');
							$('#level4').removeClass("on");
							$("#level3").removeClass("on");

							setLevelList(3, $('#level2').data('code'));

						} else if (levelChk == 'level3_ul') {

							$('#level4').text('Level4');
							$('#level4').removeClass("on");
							searchLv = 3

							setLevelList(4, $('#level3').data('code'));

						}
					});

		}

		$(document).ready(function() {

			var date1 = new Date();
			$('#toDt').val(dateFormat(date1, 'select'));
			var date2 = new Date(date1.setDate(date1.getDate() - 30));
			// $('#fromDt').val(dateFormat(date2, 'select'))
			$('#fromDt').val('2023-10-01');
			// 레벨 조회 부분 생성
			setLevelList(1, '');
			// 조회
			getList(999);

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

			/* if (region == 'KR') {
				setLevelList(2, '2306392');
				setLevelList(3, '2409180');
				$('#level1').text('경기도');
				$('#level1').addClass("on");
				$('#level2').text('성남시');
				$('#level2').addClass("on");

				const temp = document.getElementById('level2');
				temp.setAttribute('data-code', '2409180')

			} else if (region == 'JP') {
				setLevelList(2, '2682940');
				setLevelList(3, '2682891');
				$('#level1').text('茨城県');
				$('#level1').addClass("on");
				$('#level2').text('つくば市');
				$('#level2').addClass("on");

				const temp = document.getElementById('level2');
				temp.setAttribute('data-code', '2682891')

			}
			 */

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
					getList(999);
				} else {
					$("#alert_msg").html("<fmt:message key="REQ_LV1_LV2" bundle="${bundle}"/>");
					$('#pop_alert').stop().fadeIn(300);
					$('#pop_alert').stop().fadeIn(300);
				}

				//필터 초기화
				$(".optList li a").removeAttr('class');
				$("#selectAll").attr('class', 'level');
				$('#selectAll').addClass('active');

			})

			  // 초기 상태 설정: 슬라이드 버튼이 활성화된 상태와 .riskSlide가 표시되도록 설정
		    $('#btn_slide').addClass('active');
		    $('.riskSlide').show();
		    $('.riskAlbum').hide();

		    // 슬라이드 버튼 클릭 이벤트
		    $('#btn_slide').on('click', function() {
		        if (!$(this).hasClass('active')) {
		            $('.riskSlide').show();
		            $('.riskAlbum').hide();
		            $(this).addClass('active');
		            $('#btn_album').removeClass('active');
		        }
		    });

	/* 	    // 앨범 버튼 클릭 이벤트
		    $('#btn_album').on('click', function() {
		        if (!$(this).hasClass('active')) {
		            $('.riskSlide').hide();
		            $('.riskAlbum').show();
		            $(this).addClass('active');
		            $('#btn_slide').removeClass('active');
		        }
		    });
 	*/

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

		$('.pop_close').on('click', function () {
			getList(clickedRiskLevel);
		})

	</script>
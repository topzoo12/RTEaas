<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hpbfn11yfe"></script>

<c:forEach var="weather" items="${weather.response.body.items.item}" varStatus="status">
${weather.category}
<c:if test="${weather.category eq 'T1H'}">
<c:set var="T1H" value="${weather.fcstValue}" />
</c:if>
<c:if test="${weather.category eq 'PTY'}">
<c:set var="PTY" value="${weather.fcstValue}" />
</c:if>
<c:if test="${weather.category eq 'SKY'}">
<c:set var="SKY" value="${weather.fcstValue}" />
</c:if>
</c:forEach>
<div class="contents_box item mainpage">
	<ul class="contents">
		<li class="item weather">
			<p class="stitle">
				2022.11.14 <span>07:39 AM</span>
			</p>

			<div class="weather_box">
				<p class="address">서울특별시 도봉구 쌍문1동 <span></span></p>
				<div class="weather_data">
				<p class="temperature tem_icon1">${T1H}<sup>o</sup></p>
				<p class="change">
				<c:if test="${PTY eq '0'}">
					<c:choose>
					<c:when test="${SKY eq '1'}">맑음</c:when>
					<c:when test="${SKY eq '3'}">구름많음</c:when>
					<c:when test="${SKY eq '4'}">흐림</c:when>
					<c:otherwise>${SKY}</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${PTY ne '0'}">
					<c:choose>
					<c:when test="${PTY eq '1'}">비1111111111111111111111</c:when>
					<c:when test="${PTY eq '2'}">진눈깨비</c:when>
					<c:when test="${PTY eq '3'}">눈</c:when>
					<c:when test="${PTY eq '4'}">소나기</c:when>
					<c:when test="${PTY eq '5'}">빗방울</c:when>
					<c:when test="${PTY eq '6'}">빗방울눈날림</c:when>
					<c:when test="${PTY eq '7'}">눈날림</c:when>
					<c:otherwise>${PTY}</c:otherwise>
					</c:choose>
				</c:if>
				</p>
				<p class="etc">체감 <strong>10.3º</strong> <span>|</span> 습도 <strong>43%</strong> <span>|</span> 바람(북동풍) <strong>7.5m/s</strong></p>
				<p class="basic">
					<span class="rain">0%</span>
					<span class="rays">높음</span>
					<span class="sunup">6:33</span>
					<span class="sunset">17:33</span>
				</p>
				<p class="service">기상청 www.weather.go.kr  제공</p>
				</div>
			</div>

			<p class="stitle2">
				도봉구 전체속도 <span><strong>서행</strong><b>22.7</b>km/h</span>
			</p>

			<div class="weather_box"><img src="./img/img_speed.png"></div>
		</li>
		<li class="item map_box">
			<p class="stitle">
				측정장치 정보
			</p>

			<div class="map" id="map">
			<!--
				<span class="map_icon error" data-id="error"></span>
				<span class="map_icon ok" data-id="ok"></span>

				<div class="monitoring_popup" id="monitoring_popup" style="display: block">
					<button class="pop_cancel">
						<span></span>
						<span></span>
					</button>

					<h3>도봉구 주민센터</h3>
					<h1>서울특별시 도봉구 도봉로 169나길</h1>

					<p class="box_border box_border2 alarm_result2 error">
						<span>번호 A001</span>
						<strong>비정상(데이터 미수신)</strong>
					</p>

					<p class="stl border-bottom">
						측정 항목 총 21 종
						<a href="#">실시간 대기현황</a>
					</p>

					<p class="stl">
						최종 점검일 2022.09.16
						<a href="#">유지보수현황</a>
					</p>
				</div>
			 -->
			</div>

		</li>
		<li class="item result_box">
			<p class="stitle">
				도봉구 대기질
			</p>

			<div class="result">
				<dl class="tab">
					<dt><span class="best on" data-id="best">Best 5</span><span class="worst" data-id="worst">Worst 5</span></dt>
					<dd><dd>
				</dl>

				<div class="result_data" id="best">
					<div class="area">
						<h1>1. 쌍문 1동 <span class="state1"></span></h1>
						<div class="con on">
							<ul>
								<li>산소</li>
								<li>31㎍/㎥</li>
								<li>온도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>일산화탄소</li>
								<li>31㎍/㎥</li>
								<li>습도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화질소</li>
								<li>31㎍/㎥</li>
								<li>대기압</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>오존</li>
								<li>31㎍/㎥</li>
								<li>암모니아</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>미세먼지</li>
								<li>31㎍/㎥</li>
								<li>에탄올</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>초미세먼지</li>
								<li>31㎍/㎥</li>
								<li>프로판</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>탄화수소</li>
								<li>31㎍/㎥</li>
								<li>카본</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>교통량(유동인구)</li>
								<li>31㎍/㎥</li>
								<li>아황산가스</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화탄소</li>
								<li>31㎍/㎥</li>
								<li>카드뮴</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>가연성가스</li>
								<li>31㎍/㎥</li>
								<li>크롬</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li></li>
								<li></li>
								<li>이황화탄소</li>
								<li>0.003ppm</li>
							</ul>
						</div>
					</div>

					<div class="area">
						<h1>2. 쌍문 4동 <span class="state1"></span></h1>
						<div class="con">
							<ul>
								<li>산소</li>
								<li>31㎍/㎥</li>
								<li>온도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>일산화탄소</li>
								<li>31㎍/㎥</li>
								<li>습도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화질소</li>
								<li>31㎍/㎥</li>
								<li>대기압</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>오존</li>
								<li>31㎍/㎥</li>
								<li>암모니아</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>미세먼지</li>
								<li>31㎍/㎥</li>
								<li>에탄올</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>초미세먼지</li>
								<li>31㎍/㎥</li>
								<li>프로판</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>탄화수소</li>
								<li>31㎍/㎥</li>
								<li>카본</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>교통량(유동인구)</li>
								<li>31㎍/㎥</li>
								<li>아황산가스</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화탄소</li>
								<li>31㎍/㎥</li>
								<li>카드뮴</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>가연성가스</li>
								<li>31㎍/㎥</li>
								<li>크롬</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li></li>
								<li></li>
								<li>이황화탄소</li>
								<li>0.003ppm</li>
							</ul>
						</div>
					</div>

					<div class="area">
						<h1>3. 창 5동 <span class="state2"></span></h1>
						<div class="con">
							<ul>
								<li>산소</li>
								<li>31㎍/㎥</li>
								<li>온도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>일산화탄소</li>
								<li>31㎍/㎥</li>
								<li>습도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화질소</li>
								<li>31㎍/㎥</li>
								<li>대기압</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>오존</li>
								<li>31㎍/㎥</li>
								<li>암모니아</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>미세먼지</li>
								<li>31㎍/㎥</li>
								<li>에탄올</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>초미세먼지</li>
								<li>31㎍/㎥</li>
								<li>프로판</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>탄화수소</li>
								<li>31㎍/㎥</li>
								<li>카본</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>교통량(유동인구)</li>
								<li>31㎍/㎥</li>
								<li>아황산가스</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화탄소</li>
								<li>31㎍/㎥</li>
								<li>카드뮴</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>가연성가스</li>
								<li>31㎍/㎥</li>
								<li>크롬</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li></li>
								<li></li>
								<li>이황화탄소</li>
								<li>0.003ppm</li>
							</ul>
						</div>
					</div>


					<div class="area">
						<h1>4. 방학 2동 <span class="state3"></span></h1>
						<div class="con">
							<ul>
								<li>산소</li>
								<li>31㎍/㎥</li>
								<li>온도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>일산화탄소</li>
								<li>31㎍/㎥</li>
								<li>습도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화질소</li>
								<li>31㎍/㎥</li>
								<li>대기압</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>오존</li>
								<li>31㎍/㎥</li>
								<li>암모니아</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>미세먼지</li>
								<li>31㎍/㎥</li>
								<li>에탄올</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>초미세먼지</li>
								<li>31㎍/㎥</li>
								<li>프로판</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>탄화수소</li>
								<li>31㎍/㎥</li>
								<li>카본</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>교통량(유동인구)</li>
								<li>31㎍/㎥</li>
								<li>아황산가스</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화탄소</li>
								<li>31㎍/㎥</li>
								<li>카드뮴</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>가연성가스</li>
								<li>31㎍/㎥</li>
								<li>크롬</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li></li>
								<li></li>
								<li>이황화탄소</li>
								<li>0.003ppm</li>
							</ul>
						</div>
					</div>

					<div class="area">
						<h1>5. 도봉 1동 <span class="state4"></span></h1>
						<div class="con">
							<ul>
								<li>산소</li>
								<li>31㎍/㎥</li>
								<li>온도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>일산화탄소</li>
								<li>31㎍/㎥</li>
								<li>습도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화질소</li>
								<li>31㎍/㎥</li>
								<li>대기압</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>오존</li>
								<li>31㎍/㎥</li>
								<li>암모니아</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>미세먼지</li>
								<li>31㎍/㎥</li>
								<li>에탄올</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>초미세먼지</li>
								<li>31㎍/㎥</li>
								<li>프로판</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>탄화수소</li>
								<li>31㎍/㎥</li>
								<li>카본</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>교통량(유동인구)</li>
								<li>31㎍/㎥</li>
								<li>아황산가스</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화탄소</li>
								<li>31㎍/㎥</li>
								<li>카드뮴</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>가연성가스</li>
								<li>31㎍/㎥</li>
								<li>크롬</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li></li>
								<li></li>
								<li>이황화탄소</li>
								<li>0.003ppm</li>
							</ul>
						</div>
					</div>

					<div class="ex">
						<p>
							<span class="state_icon1">종음(0~30)</span>
							<span class="state_icon2">보통(31~80)</span>
							<span class="state_icon3">나쁨(81~150)</span>
							<span class="state_icon4">매우나쁨(151~)</span>
						</p>
						<p class="txt">
							본 순위는 미세먼지(PM10)를 기준으로 하였습니다.
						</p>
					</div>
				</div>

				<div class="result_data" id="worst">
					<div class="area">
						<h1>1. 쌍문 1동 <span class="state4"></span></h1>
						<div class="con on">
							<ul>
								<li>산소</li>
								<li>31㎍/㎥</li>
								<li>온도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>일산화탄소</li>
								<li>31㎍/㎥</li>
								<li>습도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화질소</li>
								<li>31㎍/㎥</li>
								<li>대기압</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>오존</li>
								<li>31㎍/㎥</li>
								<li>암모니아</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>미세먼지</li>
								<li>31㎍/㎥</li>
								<li>에탄올</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>초미세먼지</li>
								<li>31㎍/㎥</li>
								<li>프로판</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>탄화수소</li>
								<li>31㎍/㎥</li>
								<li>카본</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>교통량(유동인구)</li>
								<li>31㎍/㎥</li>
								<li>아황산가스</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화탄소</li>
								<li>31㎍/㎥</li>
								<li>카드뮴</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>가연성가스</li>
								<li>31㎍/㎥</li>
								<li>크롬</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li></li>
								<li></li>
								<li>이황화탄소</li>
								<li>0.003ppm</li>
							</ul>
						</div>
					</div>

					<div class="area">
						<h1>2. 쌍문 4동 <span class="state4"></span></h1>
						<div class="con">
							<ul>
								<li>산소</li>
								<li>31㎍/㎥</li>
								<li>온도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>일산화탄소</li>
								<li>31㎍/㎥</li>
								<li>습도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화질소</li>
								<li>31㎍/㎥</li>
								<li>대기압</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>오존</li>
								<li>31㎍/㎥</li>
								<li>암모니아</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>미세먼지</li>
								<li>31㎍/㎥</li>
								<li>에탄올</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>초미세먼지</li>
								<li>31㎍/㎥</li>
								<li>프로판</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>탄화수소</li>
								<li>31㎍/㎥</li>
								<li>카본</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>교통량(유동인구)</li>
								<li>31㎍/㎥</li>
								<li>아황산가스</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화탄소</li>
								<li>31㎍/㎥</li>
								<li>카드뮴</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>가연성가스</li>
								<li>31㎍/㎥</li>
								<li>크롬</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li></li>
								<li></li>
								<li>이황화탄소</li>
								<li>0.003ppm</li>
							</ul>
						</div>
					</div>

					<div class="area">
						<h1>3. 창 5동 <span class="state4"></span></h1>
						<div class="con">
							<ul>
								<li>산소</li>
								<li>31㎍/㎥</li>
								<li>온도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>일산화탄소</li>
								<li>31㎍/㎥</li>
								<li>습도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화질소</li>
								<li>31㎍/㎥</li>
								<li>대기압</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>오존</li>
								<li>31㎍/㎥</li>
								<li>암모니아</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>미세먼지</li>
								<li>31㎍/㎥</li>
								<li>에탄올</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>초미세먼지</li>
								<li>31㎍/㎥</li>
								<li>프로판</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>탄화수소</li>
								<li>31㎍/㎥</li>
								<li>카본</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>교통량(유동인구)</li>
								<li>31㎍/㎥</li>
								<li>아황산가스</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화탄소</li>
								<li>31㎍/㎥</li>
								<li>카드뮴</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>가연성가스</li>
								<li>31㎍/㎥</li>
								<li>크롬</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li></li>
								<li></li>
								<li>이황화탄소</li>
								<li>0.003ppm</li>
							</ul>
						</div>
					</div>


					<div class="area">
						<h1>4. 방학 2동 <span class="state4"></span></h1>
						<div class="con">
							<ul>
								<li>산소</li>
								<li>31㎍/㎥</li>
								<li>온도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>일산화탄소</li>
								<li>31㎍/㎥</li>
								<li>습도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화질소</li>
								<li>31㎍/㎥</li>
								<li>대기압</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>오존</li>
								<li>31㎍/㎥</li>
								<li>암모니아</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>미세먼지</li>
								<li>31㎍/㎥</li>
								<li>에탄올</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>초미세먼지</li>
								<li>31㎍/㎥</li>
								<li>프로판</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>탄화수소</li>
								<li>31㎍/㎥</li>
								<li>카본</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>교통량(유동인구)</li>
								<li>31㎍/㎥</li>
								<li>아황산가스</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화탄소</li>
								<li>31㎍/㎥</li>
								<li>카드뮴</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>가연성가스</li>
								<li>31㎍/㎥</li>
								<li>크롬</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li></li>
								<li></li>
								<li>이황화탄소</li>
								<li>0.003ppm</li>
							</ul>
						</div>
					</div>

					<div class="area">
						<h1>5. 도봉 1동 <span class="state4"></span></h1>
						<div class="con">
							<ul>
								<li>산소</li>
								<li>31㎍/㎥</li>
								<li>온도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>일산화탄소</li>
								<li>31㎍/㎥</li>
								<li>습도</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화질소</li>
								<li>31㎍/㎥</li>
								<li>대기압</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>오존</li>
								<li>31㎍/㎥</li>
								<li>암모니아</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>미세먼지</li>
								<li>31㎍/㎥</li>
								<li>에탄올</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>초미세먼지</li>
								<li>31㎍/㎥</li>
								<li>프로판</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>탄화수소</li>
								<li>31㎍/㎥</li>
								<li>카본</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>교통량(유동인구)</li>
								<li>31㎍/㎥</li>
								<li>아황산가스</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>이산화탄소</li>
								<li>31㎍/㎥</li>
								<li>카드뮴</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li>가연성가스</li>
								<li>31㎍/㎥</li>
								<li>크롬</li>
								<li>0.003ppm</li>
							</ul>
							<ul>
								<li></li>
								<li></li>
								<li>이황화탄소</li>
								<li>0.003ppm</li>
							</ul>
						</div>
					</div>

					<div class="ex">
						<p>
							<span class="state_icon1">종음(0~30)</span>
							<span class="state_icon2">보통(31~80)</span>
							<span class="state_icon3">나쁨(81~150)</span>
							<span class="state_icon4">매우나쁨(151~)</span>
						</p>
						<p class="txt">
							본 순위는 미세먼지(PM10)를 기준으로 하였습니다.
						</p>
					</div>
				</div>
			</div>
		</li>
	</ul>

	<div class="graph_box">
		<ul class="search">
			<li><span class="dust">미세먼지</span><span class="ultradust">초미세먼지</span></li>
			<li><span class="selectBox top border wd200">
				  <button class="label">측정소 전체</button>
				  <ul class="optionList">
					<li class="optionItem">도봉구</li>
					<li class="optionItem">도봉구</li>
					<li class="optionItem">도봉구</li>
					<li class="optionItem">도봉구</li>
					<li class="optionItem">도봉구</li>
					<li class="optionItem">도봉구</li>
				  </ul>
				</span>
				<span class="more" data-id="1">더보기</span>
			</li>
		</ul>
		<div class="graph">
			<img src="./img/img_graph_air.png">
		</div>
	</div>
</div>
<script>

var mapOptions = {
    center: new naver.maps.LatLng(${y}, ${x}),
    zoom: 14
};
var map = new naver.maps.Map('map', mapOptions);

<c:forEach var="device" items="${deviceList}" varStatus="status">

var marker_${device.fcltsUuid} = new naver.maps.Marker({
	icon: {
        url: '/img/map_icon_'+<c:if test="${device.stat eq '정상'}">'ok'</c:if><c:if test="${device.stat ne '정상'}">'error'</c:if>+'.png',
        //size: new naver.maps.Size(50, 52),
        //origin: new naver.maps.Point(0, 0),
        //anchor: new naver.maps.Point(25, 26)
    },
    position: new naver.maps.LatLng(${device.fcltsItlpcLo}, ${device.fcltsItlpcLa}),
    map: map
});

var infoWindow_${device.fcltsUuid} = new naver.maps.InfoWindow({
    content:
    	'<div class="monitoring_popup" style="display:block">'
    	+'<button class="pop_cancel" onClick="infoWindow_${device.fcltsUuid}.close()">'
		+'	<span></span>'
		+'	<span></span>'
		+'</button>'
		+'<h3>${device.fcltsNm}</h3>'
		+'<h1>${device.fcltsItlpcAddr}</h1>'
		+'<p class="box_border box_border2 alarm_result2 '+<c:if test="${device.stat eq '정상'}">'ok'</c:if><c:if test="${device.stat ne '정상'}">'error'</c:if>+'">'
		+'	<span>번호 ${device.fcltsUuid}</span>'
		+'	<strong>${device.stat}</strong>'
		+'</p>'
		+'<p class="stl border-bottom">측정 항목 총 21 종<a href="/status/statusRealTimeList.do">실시간 대기현황</a></p>'
		+'<p class="stl">최종 점검일 ${device.checkDt}<a href="/device/maintList.do">유지보수현황</a></p>'

	,maxWidth: 380,
	//anchorColor: "#e0e0e0",
    backgroundColor: "",
    anchorSize: new naver.maps.Size(0, 0),
    //borderColor: "#e0e0e0",
    borderWidth: 0

//padding: 25px 25px;
//border-radius: 10px;
//box-shadow: 3px 3px 10px rgb(0 0 0 / 8%);
});

naver.maps.Event.addListener(marker_${device.fcltsUuid}, 'click', getClickHandler_${device.fcltsUuid}());

function getClickHandler_${device.fcltsUuid}() {
    return function(e) {
        var marker = marker_${device.fcltsUuid},
            infoWindow = infoWindow_${device.fcltsUuid};

        if (infoWindow.getMap()) {
            infoWindow.close();
        } else {
            infoWindow.open(map, marker);
        }
    }
}

</c:forEach>


</script>
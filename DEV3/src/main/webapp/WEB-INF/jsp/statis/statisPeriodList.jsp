<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!--달력-->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<div class="contents_bg"></div>
<p class="title ${fav}">${pageName.srnNm}</p>

<ul class="search_box">
	<li>
		<span class="stl">측정기간<span class="remark2"></span></span>
		<span class="date">
			<input type="text" value="${fromDt}" name="start" id="fromDt" class="input2" readonly> ~ <input type="text" value="${toDt}" name="end" id="toDt" class="input2" readonly>
			<button class="search_calender" id="search_calender"></button>
		</span>

		<span class="stl">측정소명<span class="remark2"></span></span>
		<span class="id search">
			<input type="text" value="" name="group_id" id="deviceNm" class="input1" placeholder="선택" readonly>
			<button class="search_btn pop_open" data-pop="search"></button>
			<input type="hidden" id="deviceId">
		<span>
	</li>
	<li>
		<button class="btn_search" id="btn_search">Search</button>
	</li>
</ul>

<ul class="contents">
	<li class="view">
		<div class="stitle">
			<p class="tl">총 <strong id="totCnt">${totCnt}</strong> 건</p>
			<p class="bbs_btn">
				<a href="#" class="btn_bbs btn_excel">엑셀 다운로드</a>
			</p>
		</div>
		<table class="table">
			<colgroup>
				<col style="width: ">

				<c:forEach var="io" items="${ioList}" varStatus="status">
					<c:choose>
						<c:when test="${status.last}">
							<col style="width: 77px">
						</c:when>
						<c:otherwise>
							<col style="width: 60px">
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<!--
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 60px">
				<col style="width: 77px">
				 -->
			</colgroup>
			<thead>
				<tr>
				<th>측정<br>일</th>

				<c:forEach var="io" items="${ioList}" varStatus="status">
					<th><c:out value="${io.cdNm}"/></th>
				</c:forEach>
				<!--
				<th>산소</th>
				<th>일산화<br>탄소</th>
				<th>이산화<br>질소</th>
				<th>오존</th>
				<th>미세<br>먼지</th>
				<th>초미세<br>먼지</th>
				<th>탄화<br>수소</th>
				<th>교통량</th>
				<th>이산화<br>탄소</th>
				<th>가연성<br>가스</th>
				<th>온도</th>
				<th>습도</th>
				<th>대기압</th>
				<th>암모<br>니아</th>
				<th>에탄올</th>
				<th>프로판</th>
				<th>벤젠</th>
				<th>부탄</th>
				<th>수소</th>
				<th>진동</th>
				<th>포름<br>알데히드</th>
				 -->
				</tr>
			</thead>
		</table>
		<div class="tbody" style="overflow-y:scroll">
			<table class="table" id="table-1">
				<colgroup>
					<col style="width: ">

					<c:forEach var="io" items="${ioList}" varStatus="status">
						<col style="width: 60px">
					</c:forEach>
				</colgroup>
	        	<tbody>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
						<td><c:out value="${result.getDt}"/></td>

						<c:forEach var="io" items="${ioList}" varStatus="status">
							<td>&nbsp;</td>
						</c:forEach>
						</tr>
					</c:forEach>
	        	</tbody>
			</table>
		</div>


	</li>
</ul>

<!-- 측정소검색 20221019 시작 -->
<div class="pop_wrap" id="pop_search">
    <div class="pop_box">
		<div class="pop_content">
			<h3 class="pop_tit">
			   측정소 조회
			</h3>

			<ul class="search_box">
				<li>
					<span class="id">
						<input type="text" value="" name="name" id="ps_deviceNm" class="input1" placeholder="">
					<span>
				</li>
				<li>
					<button class="btn_search" id="ps_search">Search</button>
				</li>
			</ul>

			<ul class="contents">
				<li class="view">
					<div class="stitle">
						<p class="tl">총 <strong id="ps_totCnt">0</strong> 건</p>
					</div>

					<table class="table">
							<colgroup>
								<col style="width: 48px">
								<col style="width: 90px">
								<col style="width: 90px">
								<col style="width: 190px">
								<col style="width: calc(100% - 478px)">
							</colgroup>
							<thead>
								<tr>
								<th>No</th>
								<th>구역(동)</th>
								<th>측정소ID</th>
								<th>측정소명</th>
								<th>위치정보</th>
								</tr>
							</thead>
						</table>
						<div class="tbody2">
						<table class="table" id="table-ps">
							<colgroup>
								<col style="width: 48px">
								<col style="width: 90px">
								<col style="width: 90px">
								<col style="width: 190px">
								<col style="width: calc(100% - 495px)">
							</colgroup>
							<tbody>

							<c:forEach var="presult" items="${presultList}" varStatus="status">
								<tr class="<c:if test="${presult.rowno eq '1'}">on</c:if>">
								<td><c:out value="${presult.rowno}"/></td>
								<td><c:out value="${presult.fcltsItlpcNmDs}"/></td>
								<td><c:out value="${presult.fcltsUuid}"/></td>
								<td><c:out value="${presult.fcltsNm}"/></td>
								<td><c:out value="${presult.fcltsItlpcAddr}"/></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						</div>

					<div class="pop_btn">
						<span class="btn_close pop_close">닫기</span>
						<button class="btn_select ps_select">선택</button>
					</div>
				</li>
			</ul>
		</div>
    </div>
</div>
<!-- 측정소검색 20221019  끝 -->
<script language="javascript">
getMasterPopSearch();
$('.btn_excel').on('click', function () {
	var params = {
			'fromDt':$('#fromDt').val()
			,'toDt':$('#toDt').val()
			,'deviceId':$('#deviceId').val()
		};
		if(validSearch(params)){
			location.href='/excelStatisPeriodList.do'
						+'?fromDt='+params.fromDt
						+'&toDt='+params.toDt
						+'&deviceId='+params.deviceId;
		}
	});
$(function() {

	//날짜선택
   $('.search_box #search_calender').daterangepicker({
	   maxSpan: {
            days: 365
        },
		"locale": {
			"format": "YYYY-MM-DD",
			"separator": " - ",
			"applyLabel": "확인",
			"cancelLabel": "취소",
			"fromLabel": "From",
			"toLabel": "~",
			"customRangeLabel": "Custom",
			"weekLabel": "W",
			"daysOfWeek": [
				"일",
				"월",
				"화",
				"수",
				"목",
				"금",
				"토"
			],
			"monthNames": [
				"1월",
				"2월",
				"3월",
				"4월",
				"5월",
				"6월",
				"7월",
				"8월",
				"9월",
				"10월",
				"11월",
				"12월"
			],
			"firstDay": 0
		}
	},function(start, end, label) {
			$("#fromDt").val(start.format('YYYY-MM-DD'));
			$("#toDt").val(end.format('YYYY-MM-DD'));
			//console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' ~ ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
	});

});

	$('#btn_search').on('click', function () {
		getMaster();
	});
	$('#ps_search').on('click', function () {
		getMasterPopSearch();
	});
	$('.ps_select').on('click', function () {

        var row = $('#table-ps > tbody > .on');
        if(!row.length){
        	return
        }
        $('#deviceId').val(row.find('td:eq(2)').text());
        $('#deviceNm').val(row.find('td:eq(3)').text());
        $('#pop_search').hide();
        //console.log(row.find('td:eq(2)').text());
	});
	$('#table-1 > tbody > tr').on('click', function(){
		$(this).parent().children().removeClass('on');
		$(this).addClass('on');
	});

	function getMaster(){
		$('#table-1 tbody tr').remove();
		$('#totCnt').text('0');
		var params = {
			'fromDt':$('#fromDt').val()
			,'toDt':$('#toDt').val()
			,'deviceId':$('#deviceId').val()
		};
		//console.log(params);

		if(validSearch(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/getStatisPeriodList.do',
				success : function (resp) {
					//console.log(resp);
					var json = JSON.parse(resp);
					var result = json.result;
					var appendRow = "";
					result.forEach (function (el, index) {
						appendRow += '<tr>'
							+'<td>'+el.getDt+'</td>'

							<c:forEach var="io" items="${ioList}" varStatus="status">
								+'<td>'+(el.deviceValue${status.count}==0?'0':el.deviceValue${status.count})+'</td>'
							</c:forEach>
							/*
							+'<td>'+(el.deviceValue1==0?'0':el.deviceValue1)+'</td>'
							+'<td>'+(el.deviceValue2==0?'0':el.deviceValue2)+'</td>'
							+'<td>'+(el.deviceValue3==0?'0':el.deviceValue3)+'</td>'
							+'<td>'+(el.deviceValue4==0?'0':el.deviceValue4)+'</td>'
							+'<td>'+(el.deviceValue5==0?'0':el.deviceValue5)+'</td>'
							+'<td>'+(el.deviceValue6==0?'0':el.deviceValue6)+'</td>'
							+'<td>'+(el.deviceValue7==0?'0':el.deviceValue7)+'</td>'
							+'<td>'+(el.deviceValue8==0?'0':el.deviceValue8)+'</td>'
							+'<td>'+(el.deviceValue9==0?'0':el.deviceValue9)+'</td>'
							+'<td>'+(el.deviceValue10==0?'0':el.deviceValue10)+'</td>'
							+'<td>'+(el.deviceValue11==0?'0':el.deviceValue11)+'</td>'
							+'<td>'+(el.deviceValue12==0?'0':el.deviceValue12)+'</td>'
							+'<td>'+(el.deviceValue13==0?'0':el.deviceValue13)+'</td>'
							+'<td>'+(el.deviceValue14==0?'0':el.deviceValue14)+'</td>'
							+'<td>'+(el.deviceValue15==0?'0':el.deviceValue15)+'</td>'
							+'<td>'+(el.deviceValue16==0?'0':el.deviceValue16)+'</td>'
							+'<td>'+(el.deviceValue17==0?'0':el.deviceValue17)+'</td>'
							+'<td>'+(el.deviceValue18==0?'0':el.deviceValue18)+'</td>'
							+'<td>'+(el.deviceValue19==0?'0':el.deviceValue19)+'</td>'
							+'<td>'+(el.deviceValue20==0?'0':el.deviceValue20)+'</td>'
							+'<td>'+(el.deviceValue21==0?'0':el.deviceValue21)+'</td>'
							*/
							+'</tr>';
					});

					$('#table-1 > tbody').append(appendRow);
					$('#totCnt').text(result.length);

					$('#table-1 > tbody > tr').on('click', function(){
						$(this).parent().children().removeClass('on');
						$(this).addClass('on');
					});
				},
				error : function(err){
					console.log(err);
				}
			});
		}

	};

	function getMasterPopSearch(){
		$('#table-ps tbody tr').remove();
		var params = {
			'fcltsNm':$('#ps_deviceNm').val()
		};
		//console.log(params);

		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getDeviceCodeList.do',
			success : function (resp) {
				//console.log(resp);
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";
				result.forEach (function (el, index) {
					appendRow += '<tr>'
						+'<td>'+el.rowno+'</td>'
						+'<td>'+el.fcltsItlpcNmDs+'</td>'
						+'<td>'+el.fcltsUuid+'</td>'
						+'<td>'+el.fcltsNm+'</td>'
						+'<td>'+el.fcltsItlpcAddr+'</td>'
						+'</tr>';
				});
				$('#table-ps > tbody').append(appendRow);

				$('#ps_totCnt').text(result.length);

				$('#table-ps > tbody > tr').on('click', function(){
					$(this).parent().children().removeClass('on');
					$(this).addClass('on');
				});
			},
			error : function(err){
				console.log(err);
			}
		});
	};
	function validSearch(params){
		var cnt = 0;
		var msg = "";
		var bool = true;

		if(!params.fromDt||!params.toDt){
			cnt += 1;
			msg += "측정기간은 필수입력 입니다.<br>";
		}

		if(!params.deviceId){
			cnt += 1;
			msg += "측정소명은 필수입력 입니다.<br>";
		}

		if(cnt>0){
			$("#alert_msg").html(msg);
			$('#pop_alert').stop().fadeIn(300);
	        $('#pop_alert').stop().fadeIn(300);
	        bool = false;
		}

		return bool;

	}
</script>
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
		<span class="stl">측정일시<span class="remark2"></span></span>
		<span class="date">
			<input type="text" value="${getDt}" name="date" id="getDt" class="input2 wd150" readonly>
			<button class="search_calender" id="search_calender"></button>
		</span>

		<span class="selectBox bottom select2 time wd100" id="fromTime_span">
		  <button class="label" id="fromTime" data-code="00:00">00:00</button>
		  <ul class="optionList">
			<li class="optionItem" data-code="00:00">00:00</li>
			<li class="optionItem" data-code="01:00">01:00</li>
			<li class="optionItem" data-code="02:00">02:00</li>
			<li class="optionItem" data-code="03:00">03:00</li>
			<li class="optionItem" data-code="04:00">04:00</li>
			<li class="optionItem" data-code="05:00">05:00</li>
			<li class="optionItem" data-code="06:00">06:00</li>
			<li class="optionItem" data-code="07:00">07:00</li>
			<li class="optionItem" data-code="08:00">08:00</li>
			<li class="optionItem" data-code="09:00">09:00</li>
			<li class="optionItem" data-code="10:00">10:00</li>
			<li class="optionItem" data-code="11:00">11:00</li>
			<li class="optionItem" data-code="12:00">12:00</li>
			<li class="optionItem" data-code="13:00">13:00</li>
			<li class="optionItem" data-code="14:00">14:00</li>
			<li class="optionItem" data-code="15:00">15:00</li>
			<li class="optionItem" data-code="16:00">16:00</li>
			<li class="optionItem" data-code="17:00">17:00</li>
			<li class="optionItem" data-code="18:00">18:00</li>
			<li class="optionItem" data-code="19:00">19:00</li>
			<li class="optionItem" data-code="20:00">20:00</li>
			<li class="optionItem" data-code="21:00">21:00</li>
			<li class="optionItem" data-code="22:00">22:00</li>
			<li class="optionItem" data-code="23:00">23:00</li>
			<li class="optionItem" data-code="24:00">24:00</li>
		  </ul>
		</span>
		<span class="stl2">~</span>
		<span class="selectBox bottom select2 time wd100" id="toTime_span">
		  <button class="label" id="toTime" data-code="23:00">23:00</button>
		  <ul class="optionList">
			<li class="optionItem" data-code="00:00">00:00</li>
			<li class="optionItem" data-code="01:00">01:00</li>
			<li class="optionItem" data-code="02:00">02:00</li>
			<li class="optionItem" data-code="03:00">03:00</li>
			<li class="optionItem" data-code="04:00">04:00</li>
			<li class="optionItem" data-code="05:00">05:00</li>
			<li class="optionItem" data-code="06:00">06:00</li>
			<li class="optionItem" data-code="07:00">07:00</li>
			<li class="optionItem" data-code="08:00">08:00</li>
			<li class="optionItem" data-code="09:00">09:00</li>
			<li class="optionItem" data-code="10:00">10:00</li>
			<li class="optionItem" data-code="11:00">11:00</li>
			<li class="optionItem" data-code="12:00">12:00</li>
			<li class="optionItem" data-code="13:00">13:00</li>
			<li class="optionItem" data-code="14:00">14:00</li>
			<li class="optionItem" data-code="15:00">15:00</li>
			<li class="optionItem" data-code="16:00">16:00</li>
			<li class="optionItem" data-code="17:00">17:00</li>
			<li class="optionItem" data-code="18:00">18:00</li>
			<li class="optionItem" data-code="19:00">19:00</li>
			<li class="optionItem" data-code="20:00">20:00</li>
			<li class="optionItem" data-code="21:00">21:00</li>
			<li class="optionItem" data-code="22:00">22:00</li>
			<li class="optionItem" data-code="23:00">23:00</li>
			<li class="optionItem" data-code="24:00">24:00</li>
		  </ul>
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

			</colgroup>
			<thead>
				<tr>
				<th>측정<br>일시</th>

				<c:forEach var="io" items="${ioList}" varStatus="status">
					<th><c:out value="${io.cdNm}"/></th>
				</c:forEach>
				</tr>
			</thead>
		</table>
		<div class="tbody">
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
				<td style="display:none;"><c:out value="${result.deviceNm}"/></td>
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
		'getDt':$('#getDt').val()
		,'fromTime':$('#fromTime').data('code')
		,'toTime':$('#toTime').data('code')
		,'deviceId':$('#deviceId').val()
	};
	//console.log(params);
	if(validSearch(params)){
		location.href='/excelStatusAirList.do'
					+'?getDt='+params.getDt
					+'&fromTime='+params.fromTime
					+'&toTime='+params.toTime
					+'&deviceId='+params.deviceId;
	}
});
	//날짜선택
	$('#search_calender').daterangepicker({
	   singleDatePicker: true,
		autoApply: true,
		autoUpdateInput: false,
		singleClasses: "date",
		locale: {
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
			$("#getDt").val(start.format('YYYY-MM-DD'));
	});

	$("#fromTime_span").find(".label").on("click", function(){
		let tmpSelectBox = $("#fromTime_span");
		if(tmpSelectBox.hasClass("active")){
			tmpSelectBox.removeClass("active");
			$(this).removeClass("on");
			$(this).siblings(".optionList").css("display", "none");
		}else{
			tmpSelectBox.addClass("active");
			$(this).addClass("on");
			$(this).siblings(".optionList").css("display", "inline-block");
		}
	});

	$("#fromTime_span").find(".optionItem").on("click", function(){
		let tmpSelectBox = $("#fromTime_span");
		let tmpSelectValue = $(this).text();
		tmpSelectBox.find(".label").text(tmpSelectValue);
		var value = $(this).data('code');
		//console.log(value);
		if(!value)value='';
		tmpSelectBox.find(".label").data('code',value);
		//console.log(tmpSelectBox.find(".label").data('code'));
		tmpSelectBox.removeClass("active");
		$(this).parent(".optionList").css("display", "none");

	});
	$("#toTime_span").find(".label").on("click", function(){
		let tmpSelectBox = $("#toTime_span");
		if(tmpSelectBox.hasClass("active")){
			tmpSelectBox.removeClass("active");
			$(this).removeClass("on");
			$(this).siblings(".optionList").css("display", "none");
		}else{
			tmpSelectBox.addClass("active");
			$(this).addClass("on");
			$(this).siblings(".optionList").css("display", "inline-block");
		}
	});

	$("#toTime_span").find(".optionItem").on("click", function(){
		let tmpSelectBox = $("#toTime_span");
		let tmpSelectValue = $(this).text();
		tmpSelectBox.find(".label").text(tmpSelectValue);
		var value = $(this).data('code');
		//console.log(value);
		if(!value)value='';
		tmpSelectBox.find(".label").data('code',value);
		//console.log(tmpSelectBox.find(".label").data('code'));
		tmpSelectBox.removeClass("active");
		$(this).parent(".optionList").css("display", "none");
	});
	//실렉트 외 클릭시 실렉트 닫기
	$(document).on("mouseup", function(e){
		if($("#fromTime_span").has(e.target).length === 0){
			$("#fromTime_span").removeClass("active");
			$("#fromTime_span").find(".optionList").css("display", "none");
		}
		if($("#toTime_span").has(e.target).length === 0){
			$("#toTime_span").removeClass("active");
			$("#toTime_span").find(".optionList").css("display", "none");
		}
	});
	$('#btn_search').on('click', function () {
		getMaster();
		//console.log('test');
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
	function getMaster(){
		$('#table-1 tbody tr').remove();
		var params = {
			'getDt':$('#getDt').val()
			,'fromTime':$('#fromTime').data('code')
			,'toTime':$('#toTime').data('code')
			,'deviceId':$('#deviceId').val()
		};
		console.log(params);
		if(validSearch(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/getStatusAirList.do',
				success : function (resp) {
					//console.log(resp);
					var json = JSON.parse(resp);
					var result = json.result;
					var appendRow = "";
					result.forEach (function (el, index) {
						appendRow += '<tr>'
							+'<td>'+el.getDt+'</td>'
							+'<td style="display:none;">'+el.deviceNm+'</td>'

							<c:forEach var="io" items="${ioList}" varStatus="status">
								+'<td>'+(el.deviceValue${status.count}==0?'0':el.deviceValue${status.count})+'</td>'
							</c:forEach>

							+'</tr>';
					});

					$('#table-1 > tbody').append(appendRow);

					$('#table-1 > tbody > tr').on('click', function(){
						$(this).parent().children().removeClass('on');
						$(this).addClass('on');
					});
					$('#totCnt').text(result.length);
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

		if(!params.getDt||!params.fromTime||!params.toTime){
			cnt += 1;
			msg += "측정일시은 필수입력 입니다.<br>";
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
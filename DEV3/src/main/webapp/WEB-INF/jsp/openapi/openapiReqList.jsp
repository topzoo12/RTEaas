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
		<span class="stl">조회기간<span class="remark2"></span></span>
		<span class="date">
			<input type="text" value="${fromDt}" name="start" id="fromDt" class="input2" readonly> ~ <input type="text" value="${toDt}" name="end" id="toDt" class="input2" readonly>
			<button class="search_calender" id="search_calender"></button>
		</span>

		<span class="stl">인증키 상태</span>
		<span class="selectBox bottom">
		  <button class="label" data-code="" id="openKeyYn">전체</button>
		  <ul class="optionList">
			<li class="optionItem" data-code="0">미생성</li>
			<li class="optionItem" data-code="1">생성완료</li>
		  </ul>
		</span>

		<span class="stl">요청기관명</span>
		<span class="id search">
			<input type="text" value="" name="reqCoNm" id="reqCoNm" class="input1" placeholder="">
		<span>
	</li>
	<li>
		<button class="btn_search">Search</button>
	</li>
</ul>

<ul class="contents">
	<li class="view">
		<div class="stitle">
			<p class="tl">총 <strong id="totCnt">${totCnt}</strong> 건</p>

			<p class="bbs_btn">
              	<!-- <a href="#" class="btn_bbs btn_write pop_open" data-pop="write"></a> -->
				<a href="#" class="btn_bbs btn_edit pop_mod" data-pop="write"></a>
                <!-- <a href="#" class="btn_bbs btn_delete pop_open" data-pop="alert"></a> -->
			</p>
		</div>
		<table class="table">
			<colgroup>
				<col style="width: 48px">
				<col style="width: 150px">
				<col style="width: 120px">
				<col style="width: 120px">
				<col style="width: 250px">
				<col style="width: 120px">
				<col style="width: ">
				<col style="width: 150px">
				<col style="width: 150px">
			</colgroup>
			<thead>
				<tr>
				<th>No</th>
				<th>Open API 서비스</th>
				<th>요청기관명</th>
				<th>요청자</th>
				<th>이메일</th>
				<th>인증키 상태</th>
				<th>인증키</th>
				<th>생성일</th>
				<th>신청일</th>
				</tr>
			</thead>
		</table>
		<div class="tbody" style="overflow-y:scroll">
			<table class="table" id="table-1">
				<colgroup>
					<col style="width: 48px">
					<col style="width: 150px">
					<col style="width: 120px">
					<col style="width: 120px">
					<col style="width: 250px">
					<col style="width: 120px">
					<col style="width: ">
					<col style="width: 150px">
					<col style="width: calc(150px - 17px)">
				</colgroup>
	        	<tbody>
	        	<c:forEach var="result" items="${resultList}" varStatus="status">
	        		<tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
						<td>${result.rowno}</td>
						<td>${result.coNm}</td>
						<td>${result.reqCoNm}</td>
						<td>${result.reqNm}</td>
						<td>${result.emailAddr}</td>
						<td><c:if test="${result.openKey eq ''}">미생성</c:if><c:if test="${result.openKey ne ''}">생성완료</c:if></td>
						<td>${result.openKey}</td>
						<td>${result.openKeyDt}</td>
						<td>${result.reqDtm}</td>
						<td style="display:none;">${result.reqNo}</td>
						<td style="display:none;">${result.useSite}</td>
					</tr>
	        	</c:forEach>
	        	</tbody>
			</table>
		</div>


	</li>
</ul>

<div class="pop_wrap" id="pop_write">
    <div class="pop_box">
		<div class="pop_content">
			<h3 class="pop_tit">
			   Open API 신청정보
			</h3>

			<ul class="user_write">
				<li>
					<table class="table_write">
						<tbody>
							<tr>
							<th>소속 및 기관명<span class="remark"></span></th>
							<td>
								<input type="text" value="" name="name" id="p1_reqCoNm" class="input3 p1_reqCoNm" placeholder="" readonly>
								<input type="hidden" value="" name="reqNo" id="p1_reqNo" class="input3" placeholder=""></td>
							</tr>
							<tr>
							<th>요청자<span class="remark"></span></th>
							<td>
								<input type="text" value="" name="mb" id="p1_reqNm" class="input3" placeholder="" readonly></td>
							</tr>
							<tr>
							<th>이메일<span class="remark"></span></th>
							<td>
								<input type="text" value="" name="email" id="p1_emailAddr" class="input3 wd200" placeholder="" readonly>
							</td>
							</tr>
							<tr>
							<th>활용사이트</th>
							<td>
								<input type="text" value="" name="site" id="p1_useSite" class="input3 wdp100" placeholder="https://" readonly></td>
							</tr>
							<tr>
							<th>Open API 서비스<span class="remark"></span></th>
							<td>
								<span class="selectBox bottom border">
							  <button class="label" id="p1_coNm" disabled>선택</button>
							  <ul class="optionList">
								<li class="optionItem">도봉구</li>
								<li class="optionItem">도봉구</li>
								<li class="optionItem">도봉구</li>
							  </ul>
							</span></td>
							</tr>
							<tr>
							<th>인증키</th>
							<td>
								<input type="text" value="" name="key" id="p1_openKey" class="input3" placeholder="" readonly disabled="disabled"> <button class="btn_check2 id approve">생성</button></td>
							</tr>
							<tr>
							<th>생성일</th>
							<td>
								<input type="text" value="" name="date" id="p1_openKeyDt" class="input3" placeholder="" readonly></td>
							</tr>
							<tr>
							<th>신청일</th>
							<td>
								<input type="text" value="" name="date" id="p1_reqDtm" class="input3" placeholder="" readonly></td>
							</tr>
						</tbody>
					</table>
					<!--<p class="mark"><span>*</span> 표시는 필수입력항목입니다.</p>-->

					<div class="pop_btn">
						<span class="btn_close pop_close">취소</span>
						<!-- <button class="btn_select">저장</button> -->

						<span class="btn_email_send">요청자 이메일 발송</span>
					</div>
				</li>
			</ul>
		</div>
    </div>
</div>
<script language="javascript">

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

$('.pop_mod').on('click', function(){
    let target_pop = $(this).data('pop');

    var row = $('#table-1 > tbody > .on');
    if(!row.length){
    	return
    }

    $('#pop_'+target_pop).stop().fadeIn(300);
    if($('.pop_wrap').length){
        $('#pop_'+target_pop).stop().fadeIn(300);
    }
    console.log('test');
    popupData(row);
});

$('.btn_email_send').on('click', function(){
	var params = {
		'openKey' : $('#p1_openKey').val()
   		,'emailAddr' : $('#p1_emailAddr').val()
    	};
	$.ajax({
		type : 'POST',
		data : params,
		dataType : 'text',
		url : '/sendMailOpenapi.do',
		success : function (resp) {
			var json = JSON.parse(resp);
			var result = json.result;
			$('#pop_write').hide();
			//$('#p1_openKey').val(json.openKey);
			//$('.btn_search').click();
		},
		error : function(err){
			console.log(err);
		}
	});
});
$('.approve').on('click', function(){
	var params = {
   		'reqNo' : $('#p1_reqNo').val()
    	};
	$.ajax({
		type : 'POST',
		data : params,
		dataType : 'text',
		url : '/approveOpenapi.do',
		success : function (resp) {
			var json = JSON.parse(resp);
			var result = json.result;
			$('#p1_openKey').val(json.openKey);
			$('.btn_search').click();
		},
		error : function(err){
			console.log(err);
		}
	});
});

	$('.btn_search').on('click', function () {
		getMaster();
	});


	$('#table-1 > tbody > tr').on('click', function(){
		$(this).parent().children().removeClass('on');
		$(this).addClass('on');
	});

	function validSearch(params){
		var cnt = 0;
		var msg = "";
		var bool = true;

		if(!params.fromDt || !params.toDt){
			cnt += 1;
			msg += "기간은 필수입력 입니다.<br>";
		}

		if(cnt>0){
			$("#alert_msg").html(msg);
			$('#pop_alert').stop().fadeIn(300);
	        $('#pop_alert').stop().fadeIn(300);
	        bool = false;
		}

		return bool;

	}

	function getMaster(){
		$('#table-1 tbody tr').remove();
		var params = {
			'fromDt':$('#fromDt').val()
			,'toDt':$('#toDt').val()
			,'openKeyYn':$('#openKeyYn').data('code')
			,'reqCoNm':$('#reqCoNm').val()
		};
		if(validSearch(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/getOpenapiReqList.do',
				success : function (resp) {
					//console.log(resp);
					var json = JSON.parse(resp);
					var result = json.result;
					var appendRow = "";

					result.forEach (function (el, index) {
						appendRow += '<tr>'
							+'<td>'+el.rowno+'</td>'
							+'<td>'+el.coNm+'</td>'
							+'<td>'+el.reqCoNm+'</td>'
							+'<td>'+el.reqNm+'</td>'
							+'<td>'+el.emailAddr+'</td>'
							+'<td>'+(el.openKey==''?'미생성':'')+(el.openKey!=''?'생성완료':'')+'</td>'
							+'<td>'+el.openKey+'</td>'
							+'<td>'+el.openKeyDt+'</td>'
							+'<td>'+el.reqDtm+'</td>'
							+'<td style="display:none;">'+el.reqNo+'</td>'
							+'<td style="display:none;">'+el.useSite+'</td>'
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

	function popupData(row){
		if(row.length) {
			$('#p1_reqCoNm').val(row.find('td:eq(2)').text());
			$('#p1_reqNm').val(row.find('td:eq(3)').text());
			$('#p1_emailAddr').val(row.find('td:eq(4)').text());
			$('#p1_useSite').val(row.find('td:eq(10)').text());
			$('#p1_coNm').text(row.find('td:eq(1)').text());
			$('#p1_openKey').val(row.find('td:eq(6)').text());
			$('#p1_openKeyDt').val(row.find('td:eq(7)').text());
			$('#p1_reqDtm').val(row.find('td:eq(8)').text());
			$('#p1_reqNo').val(row.find('td:eq(9)').text());
		} else {
			$('#p1_reqCoNm').val('');
			$('#p1_reqNm').val('');
			$('#p1_emailAddr').val('');
			$('#p1_useSite').val('');
			$('#p1_coNm').text('');
			$('#p1_openKey').val('');
			$('#p1_openKeyDt').val('');
			$('#p1_reqDtm').val('');
			$('#p1_reqNo').val('');
		}
	};

</script>
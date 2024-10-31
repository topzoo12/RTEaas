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
		<span class="selectBox bottom mr5" id="getYear_span">
		  <button class="label" id="getYear" data-code="2022">2022년</button>
		  <ul class="optionList">
			<c:forEach var="yearCode" items="${year}" varStatus="status">
				<li class="optionItem" data-code="${yearCode}">${yearCode}년</li>
			</c:forEach>
		  </ul>
		</span>

		<span class="selectBox bottom" id="getMonth_span">
		  <button class="label" id="getMonth" data-code="12">12월</button>
		  <ul class="optionList">
			<li class="optionItem" data-code="1">1월</li>
			<li class="optionItem" data-code="2">2월</li>
			<li class="optionItem" data-code="3">3월</li>
			<li class="optionItem" data-code="4">4월</li>
			<li class="optionItem" data-code="5">5월</li>
			<li class="optionItem" data-code="6">6월</li>
			<li class="optionItem" data-code="7">7월</li>
			<li class="optionItem" data-code="8">8월</li>
			<li class="optionItem" data-code="9">9월</li>
			<li class="optionItem" data-code="10">10월</li>
			<li class="optionItem" data-code="11">11월</li>
			<li class="optionItem" data-code="12">12월</li>
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
			<p class="tl" >총 <strong id="totCnt">${totCnt}</strong> 건</p>
			<p class="bbs_btn">
				<a href="#" class="btn_bbs btn_excel">엑셀 다운로드</a>
			</p>
		</div>

		<!-- <div style="width:100%;overflow-x:scroll">
		<table class="table" id="table-header" style="width:2647px;">-->
		<div id="thead" style="width:1600px;overflow-x:scroll">
		<table class="table" id="table-1">
			<colgroup>
				<col style="width: 220px">
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
			</colgroup>
			<thead>
				<tr>
				<th>구분</th>
				<th>1일</th>
				<th>2일</th>
				<th>3일</th>
				<th>4일</th>
				<th>5일</th>
				<th>6일</th>
				<th>7일</th>
				<th>8일</th>
				<th>9일</th>
				<th>10일</th>
				<th>11일</th>
				<th>12일</th>
				<th>13일</th>
				<th>14일</th>
				<th>15일</th>
				<th>16일</th>
				<th>17일</th>
				<th>18일</th>
				<th>19일</th>
				<th>20일</th>
				<th>21일</th>
				<th>22일</th>
				<th>23일</th>
				<th>24일</th>
				<th>25일</th>
				<th>26일</th>
				<th>27일</th>
				<th>28일</th>
				<th>29일</th>
				<th>30일</th>
				<th>31일</th>
				</tr>
			</thead>
        	<tbody>
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
					<td><c:out value="${result.cdNm}"/></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
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
		'getYear':$('#getYear').data('code')
		,'getMonth':$('#getMonth').data('code')
		,'deviceId':$('#deviceId').val()
	};
	if(validSearch(params)){
		location.href='/excelStatisDayList.do'
					+'?getYear='+params.getYear
					+'&getMonth='+params.getMonth
					+'&deviceId='+params.deviceId;
	}
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
	});
	$('#table-1 > tbody > tr').on('click', function(){
		$(this).parent().children().removeClass('on');
		$(this).addClass('on');
	});

	function getMaster(){
		var params = {
			'getYear':$('#getYear').data('code')
			,'getMonth':$('#getMonth').data('code')
			,'deviceId':$('#deviceId').val()
		};

		if(validSearch(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/getStatisDayList.do',
				success : function (resp) {
					$('#table-1 tbody tr').remove();
					var json = JSON.parse(resp);
					var result = json.result;
					var appendRow = "";
					result.forEach (function (el, index) {
						appendRow += '<tr>'
							+'<td>'+el.deviceIo+'</td>'
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
							+'<td>'+(el.deviceValue22==0?'0':el.deviceValue22)+'</td>'
							+'<td>'+(el.deviceValue23==0?'0':el.deviceValue23)+'</td>'
							+'<td>'+(el.deviceValue24==0?'0':el.deviceValue24)+'</td>'
							+'<td>'+(el.deviceValue25==0?'0':el.deviceValue25)+'</td>'
							+'<td>'+(el.deviceValue26==0?'0':el.deviceValue26)+'</td>'
							+'<td>'+(el.deviceValue27==0?'0':el.deviceValue27)+'</td>'
							+'<td>'+(el.deviceValue28==0?'0':el.deviceValue28)+'</td>'
							+'<td>'+(el.deviceValue29==0?'0':el.deviceValue29)+'</td>'
							+'<td>'+(el.deviceValue30==0?'0':el.deviceValue30)+'</td>'
							+'<td>'+(el.deviceValue31==0?'0':el.deviceValue31)+'</td>'
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

		if(!params.getYear||!params.getMonth){
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
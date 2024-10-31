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
		<span class="stl">측정일자<span class="remark2"></span></span>
		<span class="date">
			<input type="text" name="getDt" value="${getDt}" id="getDt" class="input2 getDt" readonly>
			<button class="search_calender" id="search_calender"></button>
		</span>

		<span class="stl">측정소명<span class="remark2"></span></span>
		<span class="id search">
			<input type="text" value="" name="deviceNm" id="deviceNm" class="input1" placeholder="선택" readonly>
			<button class="search_btn pop_open" data-pop="search"></button>
			<input type="hidden" id="deviceId">
		</span>
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
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 55px">
				<col style="width: 72px">
			</colgroup>
			<thead>
				<tr>
				<th>구분</th>
				<th>01시</th>
				<th>02시</th>
				<th>03시</th>
				<th>04시</th>
				<th>05시</th>
				<th>06시</th>
				<th>07시</th>
				<th>08시</th>
				<th>09시</th>
				<th>10시</th>
				<th>11시</th>
				<th>12시</th>
				<th>13시</th>
				<th>14시</th>
				<th>15시</th>
				<th>16시</th>
				<th>17시</th>
				<th>18시</th>
				<th>19시</th>
				<th>20시</th>
				<th>21시</th>
				<th>22시</th>
				<th>23시</th>
				<th>24시</th>
				</tr>
			</thead>
		</table>
		<div class="tbody" style="overflow-y:scroll">
			<table class="table" id="table-1">
				<colgroup>
					<col style="width: ">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: 55px">
					<col style="width: calc(72px - 17px)">
				</colgroup>
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
		'getDt':$('#getDt').val()
		,'deviceId':$('#deviceId').val()
	};
	if(validSearch(params)){
		location.href='/excelStatisTimeList.do'
					+'?getDt='+params.getDt
					+'&deviceId='+params.deviceId;
	}
});
$(function() {

	//날짜선택
   $('.search_box #search_calender').daterangepicker({
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
		var params = {
			'getDt':$('#getDt').val()
			,'deviceId':$('#deviceId').val()
		};

		if(validSearch(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/getStatisTimeList.do',
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

		if(!params.getDt){
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
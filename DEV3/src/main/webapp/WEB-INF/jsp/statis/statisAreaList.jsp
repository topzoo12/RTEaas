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

	</li>
	<li>
		<button class="btn_search" id="btn_search">Search</button>
	</li>
	<dl  class="area">
		<dt><br>구역(동)<span class="remark2"></span></dt>
		<c:forEach var="area" items="${areaList}" varStatus="status">
			<dd><label class="checkbox"><input type="checkbox" name="chkArea" id="chk1" value="${area.comCd}"><span class="icon"></span></label> ${area.cdNm}</dd>
		</c:forEach>

		<!-- <dd><label class="checkbox"><input type="checkbox" name="chkArea" id="chkAll" value=""><span class="icon"></span></label> 전체</dd>
		<dd><label class="checkbox"><input type="checkbox" name="chkArea" id="chk1" value="AA001"><span class="icon"></span></label> 쌍문1동</dd>
		<dd><label class="checkbox"><input type="checkbox" name="chkArea" id="chk2" value="AA002"><span class="icon"></span></label> 쌍문2동</dd>
		<dd><label class="checkbox"><input type="checkbox" name="chkArea" id="chk3" value="AA003"><span class="icon"></span></label> 쌍문3동</dd>
		<dd><label class="checkbox"><input type="checkbox" name="chkArea" id="chk4" value="AA004"><span class="icon"></span></label> 쌍문4동</dd>
		<dd><label class="checkbox"><input type="checkbox" name="chkArea" id="chk5" value="AA005"><span class="icon"></span></label> 방학1동</dd>
		<dd><label class="checkbox"><input type="checkbox" name="chkArea" id="chk6" value="AA006"><span class="icon"></span></label> 방학2동</dd>
		<dd><label class="checkbox"><input type="checkbox" name="chkArea" id="chk7" value="AA007"><span class="icon"></span></label> 방학3동</dd>
		<dd><label class="checkbox"><input type="checkbox" name="chkArea" id="chk8" value="AA008"><span class="icon"></span></label> 창1동</dd>
		<dd><label class="checkbox"><input type="checkbox" name="chkArea" id="chk9" value="AA009"><span class="icon"></span></label> 창2동</dd>
		<dd><label class="checkbox"><input type="checkbox" name="chkArea" id="chk10" value="AA010"><span class="icon"></span></label> 창3동</dd>
		<dd><label class="checkbox"><input type="checkbox" name="chkArea" id="chk11" value="AA011"><span class="icon"></span></label> 창동4동</dd>
		<dd><label class="checkbox"><input type="checkbox" name="chkArea" id="chk12" value="AA012"><span class="icon"></span></label> 창동5동</dd>
		<dd><label class="checkbox"><input type="checkbox" name="chkArea" id="chk13" value="AA013"><span class="icon"></span></label> 도봉1동</dd>
		<dd><label class="checkbox"><input type="checkbox" name="chkArea" id="chk14" value="AA014"><span class="icon"></span></label> 도봉2동</dd>-->
	</dl>
</ul>

<ul class="contents">
	<li class="view">
		<div class="stitle">
			<p class="tl">총 <strong id="totCnt">0</strong> 건</p>
			<p class="bbs_btn">
				<a href="#" class="btn_bbs btn_excel">엑셀 다운로드</a>
			</p>
		</div>
		<table class="table">
			<colgroup>
				<col style="width: 150px">
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
				<th>측정<br>일</th>
				<th>측정<br>소명</th>

				<c:forEach var="io" items="${ioList}" varStatus="status">
					<th><c:out value="${io.cdNm}"/></th>
				</c:forEach>

				</tr>
			</thead>
		</table>
		<div class="tbody" style="overflow-y:scroll">
			<table class="table" id="table-1">
				<colgroup>
					<col style="width: 150px">
					<col style="width: ">

					<c:forEach var="io" items="${ioList}" varStatus="status">
						<col style="width: 60px">
					</c:forEach>
				</colgroup>
	        	<tbody>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
						<td><c:out value="${result.getDt}"/></td>
						<td><c:out value="${result.deviceNm}"/></td>

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
								<col style="width: 90px">
								<col style="width: calc(100% - 378px)">
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
								<col style="width: 90px">
								<col style="width: calc(100% - 395px)">
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
$('.btn_excel').on('click', function () {
	var arrArea = $('input:checkbox[name=chkArea]:checked');
	var areaData = [];
	for(var i=0;i<arrArea.length;i++){
		areaData[i] = arrArea[i].value;
	}
	var params = {
		'fromDt':$('#fromDt').val()
		,'toDt':$('#toDt').val()
		,'areaData':areaData
	};
		if(validSearch(params)){
			location.href='/excelStatisAreaList.do'
						+'?fromDt='+params.fromDt
						+'&toDt='+params.toDt
						+'&areaData='+params.areaData;
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

	});

});
$("#chkAll").click(function() {
	if($("#chkAll").is(":checked")) $("input[name=chkArea]").prop("checked", true);
	else $("input[name=chkArea]").prop("checked", false);
});

$("input[name=chkArea]").click(function() {
	var total = $("input[name=chkArea]").length;
	var checked = $("input[name=chkArea]:checked").length;

	if(total != checked) $("#chkAll").prop("checked", false);
	else $("#chkAll").prop("checked", true);
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

		var arrArea = $('input:checkbox[name=chkArea]:checked');
		var areaData = [];
		for(var i=0;i<arrArea.length;i++){
			areaData[i] = arrArea[i].value;
		}
		var params = {
			'fromDt':$('#fromDt').val()
			,'toDt':$('#toDt').val()
			,'areaData':areaData
		};
		if(validSearch(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/getStatisAreaList.do',
				success : function (resp) {
					console.log(resp);
					var json = JSON.parse(resp);
					var result = json.result;
					var appendRow = "";
					result.forEach (function (el, index) {
						appendRow += '<tr>'
							+'<td>'+el.getDt+'</td>'
							+'<td>'+el.deviceNm+'</td>'

							<c:forEach var="io" items="${ioList}" varStatus="status">
								+'<td>'+(el.deviceValue${status.count}==0?'0':el.deviceValue${status.count})+'</td>'
							</c:forEach>

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

		if(!params.areaData.length){
			cnt += 1;
			msg += "구역을 선택해주세요.<br>";
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
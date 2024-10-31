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
				<col style="width: 100px">
				<col style="width: 100px">
				<col style="width: 100px">
				<col style="width: 100px">
				<col style="width: 100px">
				<col style="width: 100px">
				<col style="width: 100px">
				<col style="width: 100px">
				<col style="width: 100px">
				<col style="width: 100px">
				<col style="width: 100px">
				<col style="width: 117px">
			</colgroup>
			<thead>
				<tr>
				<th>구분</th>
				<th>1월</th>
				<th>2월</th>
				<th>3월</th>
				<th>4월</th>
				<th>5월</th>
				<th>6월</th>
				<th>7월</th>
				<th>8월</th>
				<th>9월</th>
				<th>10월</th>
				<th>11월</th>
				<th>12월</th>
				</tr>
			</thead>
		</table>
		<div class="tbody" style="overflow-y:scroll">
			<table class="table" id="table-1">
				<colgroup>
					<col style="width: ">
					<col style="width: 100px">
					<col style="width: 100px">
					<col style="width: 100px">
					<col style="width: 100px">
					<col style="width: 100px">
					<col style="width: 100px">
					<col style="width: 100px">
					<col style="width: 100px">
					<col style="width: 100px">
					<col style="width: 100px">
					<col style="width: 100px">
					<col style="width: calc(117px - 17px)">
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
		location.href='/excelStatisMonthList.do'
					+'?getYear='+params.getYear
					+'&getMonth='+params.getMonth
					+'&deviceId='+params.deviceId;
	}
});
	$("#getYear_span").find(".label").on("click", function(){
		let tmpSelectBox = $("#getYear_span");
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

	$("#getYear_span").find(".optionItem").on("click", function(){
		let tmpSelectBox = $("#getYear_span");
		let tmpSelectValue = $(this).text();
		//console.log(tmpSelectValue);
		tmpSelectBox.find(".label").text(tmpSelectValue);
		var value = $(this).data('code');
		//console.log(value);
		if(!value)value='';
		tmpSelectBox.find(".label").data('code',value);
		//console.log(tmpSelectBox.find(".label").data('code'));
		tmpSelectBox.removeClass("active");
		$(this).parent(".optionList").css("display", "none");
	});
	$(document).on("mouseup", function(e){
		if($("#getYear_span").has(e.target).length === 0){
			$("#getYear_span").removeClass("active");
			$("#getYear_span").find(".optionList").css("display", "none");
		}

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
	$('#btn_search').on('click', function () {
		getMaster();
	});
	$('#ps_search').on('click', function () {
		getMasterPopSearch();
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
		//console.log(params);

		if(validSearch(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/getStatisMonthList.do',
				success : function (resp) {
					$('#table-1 tbody tr').remove();
					//console.log(resp);
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

				//console.log(result);
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

		if(!params.getYear){
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
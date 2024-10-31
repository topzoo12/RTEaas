<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!--달력-->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<p class="title ${fav}">${pageName.srnNm}</p>

<ul class="search_box">
	<li>
		<span class="stl">서비스그룹명</span>
		<span class="selectBox bottom" id="coId_span">
		  <button class="label" id="coId" data-code="${authInfo.sessionCoId}">${authInfo.sessionCoNm}</button>
		  <ul class="optionList">
		<c:forEach var="selectco" items="${selectListCo}" varStatus="status">
			<li class="optionItem" data-code="${selectco.coId}">${selectco.coNm}</li>
		</c:forEach>
		  </ul>
		</span>

		<span class="stl">조회기간<span class="remark2"></span></span>
		<span class="date">
			<input type="text" value="${fromDt}" name="start" id="fromDt" class="input2" readonly> ~ <input type="text" value="${toDt}" name="end" id="toDt" class="input2" readonly>
			<button class="search_calender" id="search_calender"></button>
		</span>
	</li>
	<li>
		<button class="btn_search">Search</button>
	</li>
</ul>

<ul class="contents">
	<li class="view">
		<div class="stitle" >
			<p class="tl">총 <strong id="totCnt">${totCnt1}</strong> 건 </p>
		</div>

		<div style="position:absolute;right:0px;top:10px">
			<span style="text-align:right;">단위 : 건수</span>
		</div>
		<table class="table">
			<colgroup>
				<col style="width: 80px">
				<col style="width: 120px">
				<col style="width: 150px">
				<col style="width: 150px">
				<col style="width: ">
				<col style="width: 120px">
				<col style="width: 120px">
				<col style="width: 150px">
			</colgroup>
			<thead>
				<tr>
				<th>No.</th>
				<th>측정장치 ID</th>
				<th>측정소명</th>
				<th>구역(동)</th>
				<th>위치정보</th>
				<th>X좌표</th>
				<th>Y좌표</th>
				<th>생성량</th>
				</tr>
			</thead>
		</table>
		<div class="tbody" style="overflow-y:scroll">
			<table class="table" id="table-1">
				<colgroup>
					<col style="width: 80px">
					<col style="width: 120px">
					<col style="width: 150px">
					<col style="width: 150px">
					<col style="width: ">
					<col style="width: 120px">
					<col style="width: 120px">
					<col style="width: calc(150px - 17px)">
				</colgroup>
				<tbody>
				<c:forEach var="result" items="${resultList1}" varStatus="status">
					<tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
					<td><c:out value="${result.rowno}"/></td>
					<td><c:out value="${result.fcltsUuid}"/></td>
					<td><c:out value="${result.fcltsNm}"/></td>
					<td><c:out value="${result.fcltsItlpcNmDs}"/></td>
					<td align="left"><c:out value="${result.fcltsItlpcAddr}"/></td>
					<td><c:out value="${result.fcltsItlpcLo}"/></td>
					<td><c:out value="${result.fcltsItlpcLa}"/></td>
					<td><c:out value="${result.usageCnt}"/></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>

	</li>
</ul>

<script language="javascript">
$(function() {

	   //날짜선택
	   $('#search_calender').daterangepicker({
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

	$('.btn_search').on('click', function () {
		getMaster();
	});

	$('#table-1 > tbody > tr').on('click', function(){
		//console.log('click');
		$(this).parent().children().removeClass('on');
		$(this).addClass('on');
	});

	function validSearch(params){
		var cnt = 0;
		var msg = "";
		var bool = true;

		if(!params.fromDt || !params.toDt){
			cnt += 1;
			msg += "조회기간은 필수입력 입니다.<br>";
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
			'coId':$('#coId').data('code')
			,'fromDt':$('#fromDt').val()
			,'toDt':$('#toDt').val()
		};
		//console.log(params);
		if(validSearch(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/getUsageDataList.do',
				success : function (resp) {
					//console.log(resp);
					var json = JSON.parse(resp);
					var result = json.result;
					var appendRow = "";

					result.forEach (function (el, index) {
						appendRow += '<tr>'
							+'<td align="center" class="listtd">'+el.rowno+'</td>'
							+'<td align="center" class="listtd">'+el.fcltsUuid+'</td>'
							+'<td align="center" class="listtd">'+el.fcltsNm+'</td>'
							+'<td align="center" class="listtd">'+el.fcltsItlpcNmDs+'</td>'
							+'<td align="left" class="listtd">'+el.fcltsItlpcAddr+'</td>'
							+'<td align="center" class="listtd">'+el.fcltsItlpcLo+'</td>'
							+'<td align="center" class="listtd">'+el.fcltsItlpcLa+'</td>'
							+'<td align="center" class="listtd">'+el.usageCnt+'</td>'
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
</script>
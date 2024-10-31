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
		<span class="stl">운행기간</span>
		<span class="date">
			<input type="text" value="${fromDt}" name="start" id="fromDt" class="input2" readonly> ~ <input type="text" value="${toDt}" name="end" id="toDt" class="input2" readonly>
			<button class="search_calender" id="search_calender"></button>
		</span>

		<span class="stl">차량번호</span>
		<span class="id search">
			<input type="text" value="" name="group_id" id="carNo" class="input1" placeholder="선택">
		<span>
	</li>
	<li>
		<button class="btn_search" id="btn_search">Search</button>
	</li>
</ul>
<ul class="contents">
	<li class="code4">
		<div class="stitle">
			<p class="tl">운행현황  <span class="cnt">총 <strong id="totCnt1">${totCnt1}</strong> 건</span></p>
		</div>

		<table class="table">
			<colgroup>
				<col style="width: 120px">
				<col style="width: ">
				<col style="width: 120px">
				<col style="width: 120px">
				<col style="width: 120px">
				<col style="width: 120px">
				<col style="width: 120px">
			</colgroup>
			<thead>
				<tr>
				<th rowspan="2">운행일</th>
				<th rowspan="2">차량번호</th>
				<th rowspan="2">운행자</th>
				<th colspan="2" class="lineb">운행시간</th>
				<th rowspan="2">운행거리</th>
				<th rowspan="2">운행상태</th>
				</tr>
				<tr>
				<th>시작시간</th>
				<th class="liner">종료시각</th>
				</tr>
			</thead>
		</table>
		<div class="tbody">
		<table class="table" id="table-1">
			<colgroup>
				<col style="width: 120px">
				<col style="width: ">
				<col style="width: 120px">
				<col style="width: 120px">
				<col style="width: 120px">
				<col style="width: 120px">
				<col style="width: calc(120px - 17px)">
			</colgroup>
			<tbody>
			<c:forEach var="result1" items="${resultList1}" varStatus="status">
				<tr class="<c:if test="${status.first}">on</c:if>">
				<td><c:out value="${result1.runDate}"/></td>
				<td><c:out value="${result1.carNo}"/></td>
				<td style="display:none;"><c:out value="${result1.runTp}"/></td>
				<td><c:out value="${result1.driverName}"/></td>
				<td><c:out value="${result1.runStart}"/></td>
				<td><c:out value="${result1.runFinish}"/></td>
				<td><c:out value="${result1.runKm}"/></td>
				<td><c:out value="${result1.runState}"/></td>
				<td style="display:none;"><c:out value="${result1.clPartTaskId}"/></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
	</li>
	<li class="view">
		<div class="stitle">
			<p class="tl"> 운행별 미세먼지 현황  <span class="cnt">총 <strong id="totCnt2">${totCnt2}</strong> 건</span></p>
		</div>

		<table class="table">
			<colgroup>
				<col style="width: ">
				<col style="width: 150px">
				<col style="width: 150px">
			</colgroup>
			<thead>
				<tr>
				<th colspan="3" class="lineb">청소 전/후 미세먼지 비교</th>
				</tr>
				<tr>
				<th>측정소명</th>
				<th>청소 전</th>
				<th>청소 후</th>
				</tr>
			</thead>
		</table>
		<div class="tbody">
		<table class="table" id="table-2">
			<colgroup>
				<col style="width: ">
				<col style="width: 150px">
				<col style="width: calc(150px - 17px)">
			</colgroup>
			<tbody>
			<c:forEach var="result2" items="${resultList2}" varStatus="status">
				<tr class="<c:if test="${result2.rowno eq '1'}">on</c:if>">
				<td><c:out value="${result2.deviceNm}"/></td>
				<td><c:out value="${result2.beforeValue}"/></td>
				<td><c:out value="${result2.afterValue}"/></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
	</li>
</ul>

<script language="javascript">

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

	$('#btn_search').on('click', function () {
		getMaster();
		//console.log('test');
	});

	$('#table-1 > tbody > tr').on('click', function(){
		//console.log('click');
		$(this).parent().children().removeClass('on');
		$(this).addClass('on');
		getDetail(this);
	});

	function getMaster(){
		$('#table-1 tbody tr').remove();
		var params = {
			'fromDt':$('#fromDt').val()
			,'toDt':$('#toDt').val()
			,'carNo':$('#carNo').val()
		};
		console.log(params);
		if(validSearch(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/getStatusRunningList.do',
				success : function (resp) {
					//console.log(resp);
					var json = JSON.parse(resp);
					var result = json.result;
					var appendRow = "";
					result.forEach (function (el, index) {
						//console.log(index);
						appendRow += '<tr class="'+(index==0?'on':'')+'">'
							+'<td>'+el.runDate+'</td>'
							+'<td>'+el.carNo+'</td>'
							+'<td style="display:none;">'+el.runTp+'</td>'
							+'<td>'+el.driverName+'</td>'
							+'<td>'+el.runStart+'</td>'
							+'<td>'+el.runFinish+'</td>'
							+'<td>'+el.runKm+'</td>'
							+'<td>'+el.runState+'</td>'
							+'<td style="display:none;">'+el.clPartTaskId+'</td>'
							+'</tr>';
					});

					$('#table-1 > tbody').append(appendRow);
					$('#totCnt1').text(result.length);

					$('#table-1 > tbody > tr').on('click', function(){
						$(this).parent().children().removeClass('on');
						$(this).addClass('on');
						getDetail(this);
					});
					getDetail($('#table-1 > tbody .on'));
				},
				error : function(err){
					console.log(err);
				}
			});
		}


	};

	function getDetail(obj){
		var params = {
			'clPartTaskId':$(obj).find('td:eq(8)').text()
			,'runDate':$(obj).find('td:eq(0)').text()
			,'runStart':$(obj).find('td:eq(4)').text()
			,'runFinish':$(obj).find('td:eq(5)').text()
		};
		console.log(params);
		$('#table-2 tbody tr').remove();
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getStatusRunningDetailList.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";

				result.forEach (function (el, index) {
					appendRow += '<tr>'
						+'<td align="center" class="listtd">'+el.deviceNm+'</td>'
						+'<td align="center" class="listtd">'+el.beforeValue+'</td>'
						+'<td align="center" class="listtd">'+el.afterValue+'</td>'
						+'</tr>';
				});

				$('#table-2 > tbody').append(appendRow);
				$('#totCnt2').text(result.length);

				$('#table-2 > tbody > tr').on('click', function(){
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
</script>
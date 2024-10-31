<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="contents_bg"></div>
<p class="title ${fav}">${pageName.srnNm}</p>

<ul class="search_box">
	<li>
		<span class="stl">구역(동)</span>
		<span class="selectBox bottom" id="areaDiv_span">
		  <button class="label" id="areaDiv" data-code="">전체</button>
		  <ul class="optionList">
		  	<li class="optionItem" data-code="">전체</li>
			<c:forEach var="select1" items="${selectList1}" varStatus="status">
				<li class="optionItem" data-code="${select1.comCd}">${select1.cdNm}</li>
			</c:forEach>
		  </ul>
		</span>
	</li>
	<li>
		<button class="btn_search">Search</button>
	</li>
</ul>

<ul class="contents">
	<li class="view">
		<div class="stitle">
			<p class="tl">총 <strong id="totCnt">${totCnt}</strong> 건</p>
		</div>
		<table class="table">
			<colgroup>
				<col style="width: ">
				<col style="width: 250px">
				<col style="width: 250px">
				<col style="width: 250px">
				<col style="width: 300px">
			</colgroup>
			<thead>
				<tr>
				<th>구역(동)</th>
				<th>측정소ID</th>
				<th>측정소명</th>
				<th>측정소구분</th>
				<th>외부 공개 여부</th>
				</tr>
			</thead>
		</table>
		<div class="tbody" style="overflow-y:scroll">
			<table class="table" id="table-1">
				<colgroup>
					<col style="width:">
					<col style="width: 250px">
					<col style="width: 250px">
					<col style="width: 250px">
					<col style="width: calc(300px - 17px)">
				</colgroup>
	        	<tbody>
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
					<td><c:out value="${result.areaDivNm}"/></td>
					<td><c:out value="${result.deviceId}"/></td>
					<td><c:out value="${result.deviceNm}"/></td>
					<td><c:out value="${result.deviceType}"/></td>
					<td>
						<span class="radiobox mr15">
						<label class="checkbox"><input type="radio" name="open_${result.rowno}" id="${result.deviceId}_openY" value="1" onclick="updateCheck('${result.deviceId}')" <c:if test="${result.openYn eq '1'}">checked</c:if>><span class="icon"></span></label> 공개
						</span>

						<span class="radiobox">
						<label class="checkbox"><input type="radio" name="open_${result.rowno}" id="${result.deviceId}_openN" value="0" onclick="updateCheck('${result.deviceId}')" <c:if test="${result.openYn ne '1'}">checked</c:if>><span class="icon"></span></label> 비공개
						</span>
					</td>
					</tr>
				</c:forEach>
	        	</tbody>
			</table>
		</div>


	</li>
</ul>

<script language="javascript">

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
/*
		if(!params.areaDiv){
			cnt += 1;
			msg += "구역(동)은 필수입력 입니다.<br>";
		}
*/
		if(cnt>0){
			$("#alert_msg").html(msg);
			$('#pop_alert').stop().fadeIn(300);
	        $('#pop_alert').stop().fadeIn(300);
	        bool = false;
		}

		return bool;

	}

	function updateCheck(deviceId){
		var params = {
	    		'deviceId' : deviceId
	    		,'openYn' : $('#'+deviceId+'_openY').is(':checked')?'1':$('#'+deviceId+'_openY').is(':checked')?'0':''
	     	};
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/updateDataTarget.do',
				success : function (resp) {
					var json = JSON.parse(resp);
					var result = json.result;
				},
				error : function(err){
					console.log(err);
				}
			});
	}

	function getMaster(){
		$('#table-1 tbody tr').remove();
		var params = {
			'areaDiv':$('#areaDiv').data('code')
		};
		//console.log(params);
		if(validSearch(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/getDataTargetList.do',
				success : function (resp) {
					//console.log(resp);
					var json = JSON.parse(resp);
					var result = json.result;
					var appendRow = "";

					result.forEach (function (el, index) {
						appendRow += '<tr>'
							+'<td align="center" class="listtd">'+el.areaDivNm+'</td>'
							+'<td align="center" class="listtd">'+el.deviceId+'</td>'
							+'<td align="center" class="listtd">'+el.deviceNm+'</td>'
							+'<td align="center" class="listtd">'+el.deviceType+'</td>'
							+'<td>'
							+'<span class="radiobox mr15">'
							+'<label class="checkbox">'
							+'<input type="radio" name="open_'+el.rowno+'" id="'+el.deviceId+'_openY" value="1" onclick="updateCheck(\''+el.deviceId+'\')" '+(el.openYn==1?'checked':'')+'>'
							+'<span class="icon"></span></label> 공개</span>'
							+'<span class="radiobox mr15">'
							+'<label class="checkbox">'
							+'<input type="radio" name="open_'+el.rowno+'" id="'+el.deviceId+'_openN" value="1" onclick="updateCheck(\''+el.deviceId+'\')" '+(el.openYn!=1?'checked':'')+'>'
							+'<span class="icon"></span></label> 비공개</span></td>'
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
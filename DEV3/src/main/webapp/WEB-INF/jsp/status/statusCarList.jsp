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
		<span class="stl">차량구분</span>
		<span class="selectBox bottom mr5" id="carDiv_span">
		  <button class="label" id="carDiv" data-code="">전체</button>
		  <ul class="optionList">
		  	<c:forEach var="select1" items="${selectList1}" varStatus="status">
				<li class="optionItem" data-code="${select1.comCd}">${select1.cdNm}</li>
			</c:forEach>
		  </ul>
		</span>

		<span class="stl">차량번호</span>
		<span class="id search">
			<input type="text" value="" name="group_id" id="carNo" class="input1" placeholder="선택">
		<span>
	</li>
	<li>
		<button class="btn_search">Search</button>
	</li>
</ul>
<ul class="contents">
	<li class="code3">
		<div class="stitle">
			<p class="tl">청소차량 현황</p>

			<p class="bbs_btn">
				<a href="#" class="btn_bbs btn_write pop_reg" data-pop="write-1"></a>
				<a href="#" class="btn_bbs btn_edit pop_mod" data-pop="write-1"></a>
				<a href="#" class="btn_bbs btn_delete" id="pop_del-1" data-pop="alert"></a>
			</p>
		</div>

		<table class="table">
			<colgroup>
				<col style="width: 60px">
				<col style="width: ">
				<col style="width: 180px">
				<col style="width: 120px">
				<col style="width: 180px">
				<col style="width: 120px">
			</colgroup>
			<thead>
				<tr>
				<th>No.</th>
				<th>구분</th>
				<th>차량번호</th>
				<th>종류</th>
				<th>총중량/용량</th>
				<th>정비이력</th>
				</tr>
			</thead>
		</table>
		<div class="tbody">
		<table class="table" id="table-1">
			<colgroup>
				<col style="width: 60px">
				<col style="width: ">
				<col style="width: 180px">
				<col style="width: 120px">
				<col style="width: 180px">
				<col style="width: calc(120px - 17px)">
			</colgroup>
			<tbody>
			<c:forEach var="result1" items="${resultList1}" varStatus="status">
				<tr class="<c:if test="${result1.rowno eq '1'}">on</c:if>">
				<td><c:out value="${result1.rowno}"/></td>
				<td><c:out value="${result1.carDivNm}"/></td>
				<td><c:out value="${result1.carNo}"/></td>
				<td><c:out value="${result1.carSizeNm}"/></td>
				<td><c:out value="${result1.carSpec}"/></td>
				<td><c:out value="${result1.itemCnt}"/></td>
				<td style="display:none;"><c:out value="${result1.carDiv}"/></td>
				<td style="display:none;"><c:out value="${result1.carSize}"/></td>
				<td style="display:none;"><c:out value="${result1.carId}"/></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
	</li>
	<li class="view">
		<div class="stitle">
			<p class="tl"> 소모품 관리 이력</p>
		</div>

		<table class="table">
			<colgroup>
				<col style="width: 60px">
				<col style="width: ">
				<col style="width: 120px">
				<col style="width: 120px">
				<col style="width: 120px">
				<col style="width: 120px">
				<col style="width: 137px">
			</colgroup>
			<thead>
				<tr>
				<th>No.</th>
				<th>차량번호</th>
				<th>관리일자</th>
				<th>엔진오일</th>
				<th>청소용액</th>
				<th>와이퍼교체</th>
				<th>타이어교체</th>
				</tr>
			</thead>
		</table>
		<div class="tbody">
		<table class="table" id="table-2">
			<colgroup>
				<col style="width: 60px">
				<col style="width: ">
				<col style="width: 120px">
				<col style="width: 120px">
				<col style="width: 120px">
				<col style="width: 120px">
				<col style="width: calc(137px - 17px)">
			</colgroup>
			<tbody>
			<c:forEach var="result2" items="${resultList2}" varStatus="status">
				<tr class="<c:if test="${result2.rowno eq '1'}">on</c:if>">
				<td><c:out value="${result2.rowno}"/></td>
				<td><c:out value="${result2.carNo}"/></td>
				<td><c:out value="${result2.manageDate}"/></td>
				<td><c:out value="${result2.oilAmount}"/> (L)</td>
				<td><c:out value="${result2.cleanerAmount}"/> (L)</td>
				<td><c:out value="${result2.wiperChange}"/></td>
				<td><c:out value="${result2.tireChange}"/></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
	</li>
</ul>

<div class="pop_wrap" id="pop_write-1">
    <div class="pop_box2">
		<div class="pop_content">
			<h3 class="pop_tit">
			   청소차량 정보
			</h3>
			<ul class="user_write">
				<li>
					<table class="table_write">
						<tbody>
							<tr>
							<th>차량구분<span class="remark"></th>
							<td colspan="3">
								<span class="selectBox bottom border" id="p1_carDiv_span">
								  <button class="label" id="p1_carDiv" data-code="">선택</button>
								  <ul class="optionList">
								  	<c:forEach var="select1" items="${selectList1}" varStatus="status">
										<li class="optionItem" data-code="${select1.comCd}">${select1.cdNm}</li>
									</c:forEach>
								  </ul>
								</span>
							</tr>
							<tr>
							<th>차량번호<span class="remark"></th>
							<td colspan="3">
								<input type="text" value="" name="id" id="p1_carNo" class="input3" placeholder="(띄어쓰기 없이 입력해주세요)">
								<input type="hidden" value="" name="id" id="p1_carId" class="input3">
							</tr>
							<tr>
							<th>총중량/용량</th>
							<td colspan="3">
								<input type="text" value="" name="id" id="p1_carSpec" class="input3" placeholder="">
							</tr>
							<tr>
							<th>종류</th>
							<td colspan="3">
								<span class="selectBox bottom border" id="p1_carSize_span">
								  <button class="label" id="p1_carSize">종류</button>
								  <ul class="optionList">
									<c:forEach var="select2" items="${selectList2}" varStatus="status">
										<li class="optionItem" data-code="${select2.comCd}">${select2.cdNm}</li>
									</c:forEach>
								  </ul>
								</span>
							</tr>
						</tbody>
					</table>

					<div class="pop_btn">
						<span class="btn_close pop_close">취소</span>
						<button class="btn_select" id="pop_save-1">저장</button>
					</div>
				</li>
			</ul>
		</div>
    </div>
</div>
<script language="javascript">
	var g_isInsert = true;

	$('.btn_search').on('click', function () {
		getMaster();
		//console.log('test');
	});

	$("#carNo").keydown(function(keyNum){
		if(keyNum.keyCode == 13){
			$(".btn_search").click();
		}
	});

	$('#table-1 > tbody > tr').on('click', function(){
		//console.log('click');
		$(this).parent().children().removeClass('on');
		$(this).addClass('on');
		getDetail(this);
	});

	$('.pop_reg').on('click', function(){
		let target_pop = $(this).data('pop');
        $('#pop_'+target_pop).stop().fadeIn(300);
        if($('.pop_wrap').length){
            $('#pop_'+target_pop).stop().fadeIn(300);
        }
        popupData(target_pop,'');
	});

	$('.pop_mod').on('click', function(){
        let target_pop = $(this).data('pop');

        var params,target_table;

		if(target_pop=='write-1'){
			target_table = 'table-1';

        }

        var row = $('#'+target_table+' > tbody > .on');
        if(!row.length){
        	return
        }

        $('#pop_'+target_pop).stop().fadeIn(300);
        if($('.pop_wrap').length){
            $('#pop_'+target_pop).stop().fadeIn(300);
        }
        popupData(target_pop,row);
    });

	$('#pop_del-1').on('click', function(){

        var row = $('#table-1 > tbody > .on');

        if(!row.length){
        	return
        };

		$("#confirm_msg").html("삭제하시겠습니까?");
		$('#pop_confirm').stop().fadeIn(300);
        $('#pop_confirm').stop().fadeIn(300);

        $('.btn_select.pop_confirm_select').off('click');
        $('.btn_select.pop_confirm_select').on('click', function(){

           	var params = {
       			'carId' : $('#table-1 > tbody > .on').find('td:eq(8)').text()
       		};

        	$.ajax({
    			type : 'POST',
    			data : params,
    			dataType : 'text',
    			url : '/deleteCar.do',
    			success : function (resp) {
    				var json = JSON.parse(resp);
    				var result = json.result;
					$('#pop_confirm').hide();
   					$('.btn_search').click();
    			},
    			error : function(err){
    				console.log(err);
    			}
    		});
    	});
	});

	$('#pop_save-1').on('click', function(){
		var params = {
			'carId':$('#p1_carId').val()
			,'carDiv':$('#p1_carDiv').data('code')
			,'carNo':$('#p1_carNo').val().replace(/ /g,'')
			,'carSpec':$('#p1_carSpec').val()
			,'carSize':$('#p1_carSize').data('code')
		};
		//console.log(params);
		if(valid(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : (g_isInsert?'/insertCar.do':'/updateCar.do'),
				success : function (resp) {
					var json = JSON.parse(resp);
					var result = json.result;
					$('#pop_write-1').hide();
					$('.btn_search').click();
				},
				error : function(err){
					console.log(err);
				}
			});
		} else {
			return false;
		}

	});

	function getMaster(){
		$('#table-1 tbody tr').remove();
		var params = {
			'carDiv':$('#carDiv').data('code')
			,'carNo':$('#carNo').val()
		};
		console.log(params);
		if(validSearch(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/getStatusCarList.do',
				success : function (resp) {
					//console.log(resp);
					var json = JSON.parse(resp);
					var result = json.result;
					var appendRow = "";
					result.forEach (function (el, index) {
						appendRow += '<tr class="'+(el.rowno==1?'on':'')+'">'
							+'<td>'+el.rowno+'</td>'
							+'<td>'+el.carDivNm+'</td>'
							+'<td>'+el.carNo+'</td>'
							+'<td>'+el.carSizeNm+'</td>'
							+'<td>'+el.carSpec+'</td>'
							+'<td>'+el.itemCnt+'</td>'
							+'<td style="display:none;">'+el.carDiv+'</td>'
							+'<td style="display:none;">'+el.carSize+'</td>'
							+'<td style="display:none;">'+el.carId+'</td>'
							+'</tr>';
					});

					$('#table-1 > tbody').append(appendRow);

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
			'carNo':$(obj).find('td:eq(2)').text()
		};

		$('#table-2 tbody tr').remove();
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getStatusCarDetailList.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";

				result.forEach (function (el, index) {
					appendRow += '<tr>'
						+'<td align="center" class="listtd">'+el.rowno+'</td>'
						+'<td align="center" class="listtd">'+el.carNo+'</td>'
						+'<td align="center" class="listtd">'+el.manageDate+'</td>'
						+'<td align="center" class="listtd">'+el.oilAmount+'</td>'
						+'<td align="center" class="listtd">'+el.cleanerAmount+'</td>'
						+'<td align="center" class="listtd">'+el.wiperChange+'</td>'
						+'<td align="center" class="listtd">'+el.tireChange+'</td>'
						+'</tr>';
				});

				$('#table-2 > tbody').append(appendRow);
				//$('#totCnt2').text(result.length);

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

	function valid(params){
		var cnt = 0;
		var msg = "";
		var bool = true;

		if(!params.carDiv){
			cnt += 1;
			msg += "차량구분은 필수입력 입니다.<br>";
		}
		if(!params.carNo){
			cnt += 1;
			msg += "차량번호는 필수입력 입니다.<br>";
		}
		/*
		if(!params.carSize){
			cnt += 1;
			msg += "차량종류는 필수입력 입니다.";
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
	function validSearch(params){
		var cnt = 0;
		var msg = "";
		var bool = true;

		//if(!params.fromDt||!params.toDt){
		//	cnt += 1;
		//	msg += "기간은 필수입력 입니다.<br>";
		//}

		if(cnt>0){
			$("#alert_msg").html(msg);
			$('#pop_alert').stop().fadeIn(300);
	        $('#pop_alert').stop().fadeIn(300);
	        bool = false;
		}

		return bool;

	}
	function popupData(target_pop,row){
		if(target_pop=='write-1'){
			if(row.length) {
				$('#p1_carDiv').text(row.find('td:eq(1)').text());
				$('#p1_carDiv').data('code',row.find('td:eq(6)').text());
				$('#p1_carDiv').addClass('on');

				$('#p1_carId').val(row.find('td:eq(8)').text());
				$('#p1_carNo').val(row.find('td:eq(2)').text());

				$('#p1_carSpec').val(row.find('td:eq(4)').text());
				$('#p1_carSize').text(row.find('td:eq(3)').text());
				$('#p1_carSize').data('code',row.find('td:eq(7)').text());

				g_isInsert = false;
			} else {
				$('#p1_carDiv').text('');
				$('#p1_carDiv').data('code','');
				$('#p1_carDiv').removeClass('on');

				$('#p1_carId').val('');
				$('#p1_carNo').val('');

				$('#p1_carSpec').val('');
				$('#p1_carSize').text('');
				$('#p1_carSize').data('code','');

				g_isInsert = true;
			}
		}
	};
</script>
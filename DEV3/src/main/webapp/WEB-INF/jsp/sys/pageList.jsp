<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<div class="contentsWrap">
	<div class="contents_bg"></div>
	<p class="title ${fav}">${pageName.srnNm}</p>

	<ul class="search_box">
		<li>
			<input type="text" name="srnNm" id="srnNm" placeholder="<fmt:message key="SCREEN_NAME" bundle="${bundle}"/>" class="input1" />
		</li>
		<li>
			<button class="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>
		</li>
	</ul>

	<ul class="contents">
		<li class="view">
			<div class="stitle">
                <p class="tl"><span class="cnt"><fmt:message key="TOTAL" bundle="${bundle}"/> <strong id="totCnt">${totCnt}</strong> <fmt:message key="COUNT2" bundle="${bundle}"/></span></p>
				<p class="bbs_btn">
					<a href="#" class="btn_bbs btn_write pop_reg" data-pop="write-1"><fmt:message key="NEW" bundle="${bundle}"/></a>
					<a href="#" class="btn_bbs btn_edit pop_mod" data-pop="write-1"><fmt:message key="MOD" bundle="${bundle}"/></a>
					<!-- <a href="#" class="btn_bbs btn_delete pop_del" id="pop_del-1" data-pop="write-1">삭제</a> -->
				</p>
			</div>

			<table class="table">
				<colgroup>
					<col style="width: 48px">
					<col style="width: 220px">
					<col style="width: 150px">
					<col style="width: 180px">
					<col style="width: 150px">
					<col style="width: 100px">
				</colgroup>
				<thead>
					<tr>
                        <th>No.</th>
                        <th><fmt:message key="SCREEN_ID" bundle="${bundle}"/></th>
                        <th><fmt:message key="SCREEN_NAME" bundle="${bundle}"/></th>
                        <th>URL</th>
                        <th><fmt:message key="SCREEN_DESCRIPTION" bundle="${bundle}"/></th>
                        <th><fmt:message key="USE_YN" bundle="${bundle}"/></th>
					</tr>
				</thead>
			</table>

			<div class="tbody" style="overflow-y:scroll">
				<table class="table" id="table-1">
					<colgroup>
						<col style="width: 48px">
                        <col style="width: 220px">
                        <col style="width: 150px">
                        <col style="width: 180px">
                        <col style="width: 150px">
						<col style="width: calc(100px - 17px)">
					</colgroup>
		        	<tbody>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
							<td align="center" class="listtd"><c:out value="${result.rowno}"/></td>
							<td align="center" class="listtd"><c:out value="${result.srnId}"/></td>
							<td align="left" class="listtd"><c:out value="${result.srnNm}"/></td>
							<td align="left" class="listtd"><c:out value="${result.srnUrl}"/></td>
							<td align="left" class="listtd"><c:out value="${result.rmksCts}"/></td>
							<td align="center" class="listtd"><c:out value="${result.useYn}"/></td>
							<td style="display:none;" align="center" class="listtd"><c:out value="${result.regId}"/></td>
							<td style="display:none;" align="center" class="listtd"><c:out value="${result.regDt}"/></td>
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
				   <fmt:message key="SCREEN_INFO" bundle="${bundle}"/>
				</h3>

				<ul class="user_write">
					<li>
						<table class="table_write">
							<tbody>
								<tr style="display:none;">
									<th><fmt:message key="SCREEN_ID" bundle="${bundle}"/><span class="remark"></span></th>
									<td colspan="3"><input type="text" value="" name="srnId" id="p1_srnId" class="input3" placeholder=""></td>
								</tr>
								<tr>
									<th><fmt:message key="SCREEN_NAME" bundle="${bundle}"/><span class="remark"></span></th>
									<td><input type="text" value="" name="srnNm" id="p1_srnNm" class="input3" placeholder=""></td>
								</tr>
								<tr>
									<th>URL</th>
									<td><input type="text" value="" name="srnUrl" id="p1_srnUrl" class="input3" placeholder=""></td>
								</tr>
								<tr>
									<th><fmt:message key="DESCRIPTION" bundle="${bundle}"/></th>
									<td><input type="text" value="" name="rmksCts" id="p1_rmksCts" class="input3" placeholder=""></td>
								</tr>
								<tr>
									<th><fmt:message key="USE_YN" bundle="${bundle}"/></th>
									<td><label class="checkbox"><input type="checkbox" name="useYn" id="p1_useYn" value="1"><span class="icon"></span></label></td>
								</tr>
								<tr style="display:none;">
									<th>등록자</th>
									<td><input type="text" value="" name="regId" id="p1_regId" class="input3" placeholder="" disabled="disabled"></td>
								</tr>
								<tr style="display:none;">
									<th>등록일</th>
									<td><input type="text" value="" name="regDt" id="p1_regDt" class="input3" placeholder="" disabled="disabled"></td>
								</tr>
							</tbody>
						</table>

						<div class="pop_btn">
							<span class="btn_m btn_darkline btn_r pop_close" id="pop_close-1"><fmt:message key="CANCEL" bundle="${bundle}"/></span>
							<button class="btn_m btn_primary" id="pop_save-1"><fmt:message key="SAVE" bundle="${bundle}"/></button>
						</div>
					</li>
				</ul>
			</div>
	    </div>
	</div>
</div>
<script language="javascript">

var g_isInsert = true;

	$('.btn_search').on('click', function () {
		getMaster();
	});

	$("#srnNm").keydown(function(keyNum){
		if(keyNum.keyCode == 13){
			$(".btn_search").click();
		}
	});

	$('#table-1 > tbody > tr').on('click', function(){
		$(this).parent().children().removeClass('on');
		$(this).addClass('on');
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

        var row = $('#table-1 > tbody > .on');
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
		let target_pop = $(this).data('pop');

        var row = $('#table-1 > tbody > .on');

        if(!row.length){
        	return
        };

		$("#confirm_msg").html("삭제하시겠습니까?");
		$('#pop_confirm').stop().fadeIn(300);
        $('#pop_confirm').stop().fadeIn(300);


        $('.pop_confirm_select').off('click');
        $('.pop_confirm_select').on('click', function(){

        	$("#pop_confirm").hide();

           	var params = {
          			'srnId' : $('#table-1 > tbody > .on').find('td:eq(1)').text()
           		};

           	$.ajax({
    			type : 'POST',
    			data : params,
    			dataType : 'text',
    			url : '/deletePage.do',
    			success : function (resp) {
    				//console.log(resp);
    				var json = JSON.parse(resp);
    				var result = json.result;

    				$("#alert_msg").html(result.msg);
					$('#pop_alert').stop().fadeIn(300);
		        	$('#pop_alert').stop().fadeIn(300);

					if(result.code == 0000){
						// 성공시 창닫기
						$('#pop_write-1').hide();
	    				$('.btn_search').click();

					}
    			},
    			error : function(err){
    				console.log(err);
    			}
    		});
    	});
	});

	$('#pop_save-1').on('click', function(){

		var params = {
			'srnId':$('#p1_srnId').val()
			,'srnNm':$('#p1_srnNm').val()
			,'srnUrl':$('#p1_srnUrl').val()
			,'rmksCts':$('#p1_rmksCts').val()
			,'useYn':$('#p1_useYn').is(':checked')?$('#p1_useYn').val():''
		};
		//console.log(params);
		if(valid(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : (g_isInsert?'/insertPage.do':'/updatePage.do'),
				success : function (resp) {
					var json = JSON.parse(resp);
					var result = json.result;

 					$("#alert_msg").html(result.msg);
					$('#pop_alert').stop().fadeIn(300);
		        	$('#pop_alert').stop().fadeIn(300);

					if(result.code == 0000){
						// 성공시 창닫기
						$('#pop_write-1').hide();
	    				$('.btn_search').click();
					}
				},

				error : function(err){
					console.log(err);
				}
			});
		} else {
			return false;
		}

	});

	function valid(params){
		var cnt = 0;
		var msg = "";
		var bool = true;
/*
		if(!params.srnId){
			cnt += 1;
			msg += "화면ID는 필수입력 입니다.<br>";
		}
*/
		if(!params.srnNm){
			cnt += 1;
			msg += "<fmt:message key="SCREEN_NM_REQUIRED" bundle="${bundle}"/>";
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
			'srnNm':$('#srnNm').val()
		};

		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getPageList.do',
			success : function (resp) {
				//console.log(resp);
				var json = JSON.parse(resp);
				var result = json.result;
				var resultCode = json.resultCode;
				var appendRow = "";
				result.forEach (function (el, index) {
					appendRow += '<tr class="'+(el.rowno==1?'on':'')+'">'
						+'<td align="center" class="listtd">'+el.rowno+'</td>'
						+'<td align="center" class="listtd">'+el.srnId+'</td>'
						+'<td align="left" class="listtd">'+el.srnNm+'</td>'
						+'<td align="left" class="listtd">'+el.srnUrl+'</td>'
						+'<td align="left" class="listtd">'+el.rmksCts+'</td>'
						+'<td align="center" class="listtd">'+el.useYn+'</td>'
						+'<td align="center" style="display:none;" class="listtd">'+el.regId+'</td>'
						+'<td align="center" style="display:none;" class="listtd">'+el.regDt+'</td>'
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
	};

	function popupData(target_pop,row){
		if(target_pop=='write-1'){
			if(row.length) {
				$('#p1_srnId').val(row.find('td:eq(1)').text());
				$('#p1_srnId').prop("disabled",true);

				$('#p1_srnNm').val(row.find('td:eq(2)').text());
				$('#p1_srnUrl').val(row.find('td:eq(3)').text());

				$('#p1_useYn').prop('checked',row.find('td:eq(5)').text()=='사용'?true:false);

				$('#p1_rmksCts').val(row.find('td:eq(4)').text());

				$('#p1_regId').val(row.find('td:eq(6)').text());
				$('#p1_regDt').val(row.find('td:eq(7)').text());

				g_isInsert = false;
			} else {
				$('#p1_srnId').val('');
				$('#p1_srnId').prop("disabled",false);

				$('#p1_srnNm').val('');
				$('#p1_srnUrl').val('');

				$('#p1_useYn').prop('checked',false);

				$('#p1_rmksCts').val('');

				$('#p1_regId').val('');
				$('#p1_regDt').val('');

				g_isInsert = true;
			}
		}
	};

</script>
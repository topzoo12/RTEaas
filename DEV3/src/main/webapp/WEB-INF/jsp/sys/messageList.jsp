<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<c:set var="nowCdNa" value="${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}"/>

<div class="contentsWrap">
    <div class="contents_bg"></div>
    <p class="title ${fav}">${pageName.srnNm}</p>

    <ul class="search_box">
        <li>
            <span class="selectBox bottom" id="msgdivCd_span">
                <button class="label" id="msgdivCd" data-code=""><fmt:message key="MESSAGE_DIV" bundle="${bundle}"/></button>
                <ul class="optionList">
                    <li class="optionItem" ><fmt:message key="ALL" bundle="${bundle}"/></li>
                    <c:forEach var="select1" items="${selectList1}" varStatus="status">
                        <li class="optionItem" data-code="${select1.comCd}">
                        <%-- ${select1.cdNm} --%>
                        <c:choose>
							<c:when test="${nowCdNa eq 'KR'}">${select1.cdNm}</c:when>
							<c:when test="${nowCdNa eq 'US'}">${select1.cdNmEng}</c:when>
							<c:when test="${nowCdNa eq 'JP'}">${select1.cdNmJp}</c:when>
						</c:choose>
                        </li>
                    </c:forEach>
                </ul>
            </span>
<%--             <span class="selectBox bottom" id="taskdivCd_span">
                <button class="label" id="taskdivCd" data-code="">업무구분</button>
                <ul class="optionList">
                    <li class="optionItem" >전체</li>
                    <c:forEach var="select2" items="${selectList2}" varStatus="status">
                        <li class="optionItem" data-code="${select2.comCd}">${select2.cdNm}</li>
                    </c:forEach>
                </ul>
            </span>
--%>
            <input type="text" value="" name="msgId" id="msgId" class="input1" placeholder="<fmt:message key="MESSAGE_ID_DETAIL" bundle="${bundle}"/>">
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
                    <col style="width: 150px">
                    <col style="width: 100px">
                    <%-- <col style="width: 100px"> --%>
                    <col style="width: 100px">
                    <col style="width: calc(* - 16px)">
                </colgroup>
                <thead>
                    <tr>
                    <th>No.</th>
                    <th><fmt:message key="MESSAGE_ID" bundle="${bundle}"/></th>
                    <th><fmt:message key="MESSAGE_DIV" bundle="${bundle}"/></th>
                    <!-- <th>업무구분</th> -->
                    <th><fmt:message key="USE_YN" bundle="${bundle}"/></th>
                    <th><fmt:message key="MESSAGE_DETAIL" bundle="${bundle}"/></th>
                    </tr>
                </thead>
            </table>
            <div class="tbody" style="overflow-y:scroll">
                <table class="table" id="table-1">
                    <colgroup>
                        <col style="width: 48px">
                        <col style="width: 150px">
                        <col style="width: 100px">
                        <%-- <col style="width: 100px"> --%>
                        <col style="width: 100px">
                        <col style="width: calc(* - 16px)">
                    </colgroup>
                    <tbody>
                    <c:forEach var="result" items="${resultList}" varStatus="status">
                        <tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
                        <td align="center" class="listtd"><c:out value="${result.rowno}"/></td>
                        <td align="center" class="listtd"><c:out value="${result.msgId}"/></td>

                        <td align="center" class="listtd">
                		  <%-- <c:out value="${result.msgdivCd}"/> --%>
	                       	<c:forEach var="select1" items="${selectList1}" varStatus="status">
	                        	<c:if test="${result.msgdivCd eq select1.comCd}">
			                        <c:choose>
										<c:when test="${nowCdNa eq 'KR'}">${select1.cdNm}</c:when>
										<c:when test="${nowCdNa eq 'US'}">${select1.cdNmEng}</c:when>
										<c:when test="${nowCdNa eq 'JP'}">${select1.cdNmJp}</c:when>
									</c:choose>
			                     </c:if>
		                    </c:forEach>
                        </td>

                        <td align="center" class="listtd" style="display:none"><c:out value="${result.taskdivNm}"/></td>
                        <td align="center" class="listtd">
                        	<c:choose>
								<c:when test="${result.useYn eq 'Y'}"><fmt:message key="USE" bundle="${bundle}"/></c:when>
								<c:when test="${result.useYn eq 'N'}"><fmt:message key="UNUSE" bundle="${bundle}"/></c:when>
							</c:choose>
                        </td>
                        <td align="center" class="listtd"><c:out value="${result.msgCts}"/></td>
                        <td align="center" class="listtd" style="display:none"><c:out value="${result.msgengCts}"/></td>
                        <td align="center" class="listtd" style="display:none"><c:out value="${result.msgjpCts}"/></td>
                        <td align="center" class="listtd" style="display:none"><c:out value="${result.regId}"/></td>
                        <td align="center" class="listtd" style="display:none"><c:out value="${result.regDt}"/></td>
                        <td align="center" class="listtd" style="display:none"><c:out value="${result.msgdivCd}"/></td>
                        <td align="center" class="listtd" style="display:none"><c:out value="${result.taskdivCd}"/></td>
                        <td align="center" class="listtd" style="display:none"><c:out value="${result.useYn}"/></td>
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
                <fmt:message key="MESSAGE_INFO" bundle="${bundle}"/>
                </h3>

                <ul class="user_write">
                    <li>
                        <table class="table_write">
                            <tbody>
                                <tr>
                                    <th><fmt:message key="MESSAGE_ID" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td colspan="3"><input type="text" value="" name="msgId" id="p1_msgId" class="input3" placeholder="" disabled="disabled"></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="MESSAGE_DIV" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td colspan="3">
                                    <span class="selectBox bottom border" id="p1_msgdivCd_span">
                                        <button class="label" id="p1_msgdivCd" data-code=""><fmt:message key="MESSAGE_DIV" bundle="${bundle}"/></button>
                                        <ul class="optionList">
                                            <c:forEach var="select1" items="${selectList1}" varStatus="status">
                                                <li class="optionItem" data-code="${select1.comCd}">
												<%-- ${select1.cdNm} --%>
												 <c:choose>
													<c:when test="${nowCdNa eq 'KR'}">${select1.cdNm}</c:when>
													<c:when test="${nowCdNa eq 'US'}">${select1.cdNmEng}</c:when>
													<c:when test="${nowCdNa eq 'JP'}">${select1.cdNmJp}</c:when>
												 </c:choose>
												</li>
                                            </c:forEach>
                                        </ul>
                                    </span>
                                    </td>
                                </tr>
<%--                                 <tr>
                                    <th>업무구분<span class="remark"></span></th>
                                    <td colspan="3">
                                    <span class="selectBox bottom border" id="p1_taskdivCd_span">
                                        <button class="label" id="p1_taskdivCd" data-code="">업무구분</button>
                                        <ul class="optionList">
                                            <c:forEach var="select2" items="${selectList2}" varStatus="status">
                                                <li class="optionItem" data-code="${select2.comCd}">${select2.cdNm}</li>
                                            </c:forEach>
                                        </ul>
                                    </span>
                                    </td>
                                </tr> --%>
                                <tr>
                                    <th><fmt:message key="MESSAGE_DETAIL" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td><input type="text" value="" name="msgCts" id="p1_msgCts" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="MESSAGE_DETAIL_US" bundle="${bundle}"/></th>
                                    <td><input type="text" value="" name="msgengCts" id="p1_msgengCts" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="MESSAGE_DETAIL_JP" bundle="${bundle}"/></th>
                                    <td><input type="text" value="" name="msgjpCts" id="p1_msgjpCts" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="USE_YN" bundle="${bundle}"/></th>
                                    <td><label class="checkbox"><input type="checkbox" name="useYn" id="p1_useYn" value="1"><span class="icon"></span></label></td>
                                </tr>
                                <tr style="display:none">
                                    <th>등록자</th>
                                    <td><input type="text" value="" name="regId" id="p1_regId" class="input3" placeholder="" disabled="disabled"></td>
                                </tr>
                                <tr style="display:none">
                                    <th>등록일</th>
                                    <td><input type="text" value="" name="regDt" id="p1_regDt" class="input3" placeholder="" disabled="disabled"></td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="pop_btn">
                            <span class="btn_m btn_darkline btn_r pop_close" id="pop_close-1"><fmt:message key="CANCEL" bundle="${bundle}"/></span>
                            <button class="btn_m btn_primary btn_r" id="pop_save-1"><fmt:message key="SAVE" bundle="${bundle}"/></button>
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

	$("#msgId").keydown(function(keyNum){
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


        	$('.pop_wrap').hide();
           	var params = {
          			'msgId' : $('#table-1 > tbody > .on').find('td:eq(1)').text()
           		};

           	$.ajax({
    			type : 'POST',
    			data : params,
    			dataType : 'text',
    			url : '/deleteMessage.do',
    			success : function (resp) {
    				//console.log(resp);
    				var json = JSON.parse(resp);
    				var result = json.result;

    				$("#alert_msg").html(result.msg);
					$('#pop_alert').stop().fadeIn(300);
		        	$('#pop_alert').stop().fadeIn(300);

					if(result.code == 0000){

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
			'msgId':$('#p1_msgId').val()
			,'msgdivCd':$('#p1_msgdivCd').data('code')
			,'taskdivCd': ''
			,'msgCts':$('#p1_msgCts').val()
			,'msgengCts':$('#p1_msgengCts').val()
			,'msgjpCts':$('#p1_msgjpCts').val()
			,'useYn':$('#p1_useYn').is(':checked')?$('#p1_useYn').val():''
		};
		//console.log(params);
		if(valid(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : (g_isInsert?'/insertMessage.do':'/updateMessage.do'),
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

		if(!params.msgId){
			cnt += 1;
			msg += "<fmt:message key="MESSAGE_ID_REQUIRED" bundle="${bundle}"/><br>";
		}

		if(!params.msgdivCd){
			cnt += 1;
			msg += "<fmt:message key="MESSAGE_DIV_REQUIRED" bundle="${bundle}"/><br>";
		}

/* 		if(!params.taskdivCd){
			cnt += 1;
			msg += "업무구분은 필수입력 입니다.<br>";
		} */

		if(!params.msgCts){
			cnt += 1;
			msg += "<fmt:message key="MESSAGE_DETAIL_REQUIRED" bundle="${bundle}"/>";
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
		$('#table-1 tbody tr').remove(); // 기존 데이터 리셋
		var params = {
			'msgdivCd':$('#msgdivCd').data('code')
			/* ,'taskdivCd':$('#taskdivCd').data('code') */
			,'msgId':$('#msgId').val()
		};
		//console.log(params);

		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getMessageList.do',
			success : function (resp) {
				//console.log(resp);
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";

				result.forEach (function (el, index) {

					var useYn = getUseYn(el.useYn);

					appendRow += '<tr class="'+(el.rowno==1?'on':'')+'">'
						+'<td align="center" class="listtd">'+el.rowno+'</td>'
						+'<td align="center" class="listtd">'+el.msgId+'</td>'
						+'<td align="center" class="listtd">'+getMsgDivByCdNa(el.msgdivCd)+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.taskdivNm+'</td>'
						+'<td align="center" class="listtd">'+useYn+'</td>'
						+'<td align="center" class="listtd">'+el.msgCts+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.msgengCts+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.msgjpCts+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.regId+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.regDt+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.msgdivCd+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.taskdivCd+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.useYn+'</td>'
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

	function getUseYn(useYn){

		if (useYn =='Y'){
			return '<fmt:message key="USE" bundle="${bundle}"/>';
		} else {
			return '<fmt:message key="UNUSE" bundle="${bundle}"/>';
		}
	}

	var selectKeyValue = [];

 	<c:forEach var="select1" items="${selectList1}" varStatus="status">
 		selectKeyValue.push({ 'comCd':'${select1.comCd}' ,'codeName':'${select1.cdNm}', 'codeNameEng':'${select1.cdNmEng}', 'codeNameJP':'${select1.cdNmJp}' })
	</c:forEach>


 	function getMsgDivByCdNa(msgDiv){

 	var result = selectKeyValue.find(item => item.comCd === msgDiv);

 		//console.log('셀렉 확인 ${selectList1}');
	 	switch ('${nowCdNa}') {
	        case 'KR':
	            return result.codeName;
	        case 'US':
	            return result.codeNameEng;
	        case 'JP':
	        	return result.codeNameJP;
		}
 	}

	function popupData(target_pop,row){

		console.log('셀렉 리스트 : ${selectList1}');
		if(target_pop=='write-1'){
			if(row.length) {
				$('#p1_msgId').val(row.find('td:eq(1)').text());
				$('#p1_msgId').prop("disabled",true);

				var msgDiv = row.find('td:eq(10)').text();

				console.log('텍스트 확인', msgDiv);
				$('#p1_msgdivCd').text(getMsgDivByCdNa(msgDiv));
				$('#p1_msgdivCd').addClass('on');
				$('#p1_taskdivCd').text(row.find('td:eq(3)').text());
				$('#p1_taskdivCd').addClass('on');

				$('#p1_msgCts').val(row.find('td:eq(5)').text());
				$('#p1_msgengCts').val(row.find('td:eq(6)').text());
			 	$('#p1_msgjpCts').val(row.find('td:eq(7)').text());

				$('#p1_useYn').prop('checked',row.find('td:eq(12)').text()=='Y'?true:false);

				$('#p1_regId').val(row.find('td:eq(8)').text());
				$('#p1_regDt').val(row.find('td:eq(9)').text());

				g_isInsert = false;

			} else {
				$('#p1_msgId').val('');
				$('#p1_msgId').prop("disabled",false);

				$('#p1_msgdivCd').text('<fmt:message key="MESSAGE_DIV" bundle="${bundle}"/>');
				$('#p1_msgdivCd').removeClass('on');
				 $('#p1_taskdivCd').text('업무구분');
				$('#p1_taskdivCd').removeClass('on');

				$('#p1_msgCts').val('');
				$('#p1_msgengCts').val('');
				$('#p1_msgjpCts').val('');

				$('#p1_useYn').prop('checked',true);

				$('#p1_regId').val('');
				$('#p1_regDt').val('');

				g_isInsert = true;
			}
		}
	};

</script>
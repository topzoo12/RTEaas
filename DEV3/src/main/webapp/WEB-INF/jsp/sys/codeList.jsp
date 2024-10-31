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
<%--             <span class="stl">서비스그룹명</span>
            <span class="selectBox bottom" id="coId_span">
            <button class="label" id="coId" data-code="${authInfo.sessionCoId}">${authInfo.sessionCoNm}</button>
            <ul class="optionList">
            <c:forEach var="selectco" items="${selectListCo}" varStatus="status">
                <li class="optionItem" data-code="${selectco.coId}">${selectco.coNm}</li>
            </c:forEach>
            </ul>
            </span>
 --%>
<%--             <span class="selectBox bottom" id="taskDiv_span">
                <button class="label" id="taskDiv" data-code="">업무구분</button>
                <ul class="optionList">
                    <li class="optionItem" >전체</li>
                    <c:forEach var="select1" items="${selectList1}" varStatus="status">
                        <li class="optionItem" data-code="${select1.comCd}">${select1.cdNm}</li>
                    </c:forEach>
                </ul>
            </span> --%>

            <input type="text" value="" name="cdgrpId" id="cdgrpId" class="input1" placeholder="<fmt:message key="CODE_GRP_ID_NM" bundle="${bundle}"/>">
        </li>
        <li>
            <button class="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>
        </li>
    </ul>

    <ul class="contents" style="min-width: 1260px;">
        <li class="code">
            <div class="stitle">
                <p class="tl"><fmt:message key="CODE_GRP" bundle="${bundle}"/> <span class="cnt"><fmt:message key="TOTAL" bundle="${bundle}"/> <strong id="totCnt1">${totCnt1}</strong> <fmt:message key="COUNT2" bundle="${bundle}"/></span></p>
                <p class="bbs_btn">
                    <a href="#" class="btn_bbs btn_write pop_reg" data-pop="write-1"><fmt:message key="NEW" bundle="${bundle}"/></a>
                    <a href="#" class="btn_bbs btn_edit pop_mod" data-pop="write-1"><fmt:message key="MOD" bundle="${bundle}"/></a>
                    <!-- <a href="#" class="btn_bbs btn_delete pop_del" id="pop_del-1" data-pop="write-1">삭제</a> -->
                </p>
            </div>
            <table class="table">
                <colgroup>
                    <col style="width: 48px">
                    <%-- <col style="width: 80px"> --%>
                    <col style="width: 80px">
                    <col style="width: ">
                    <col style="width: 80px">
                </colgroup>
                <thead>
                    <tr>
                    <th>No.</th>
                    <!-- <th>업무구분</th> -->
                    <th><fmt:message key="CODE_GRP_ID" bundle="${bundle}"/></th>
                    <th><fmt:message key="CODE_GRP_NM" bundle="${bundle}"/></th>
                    <th><fmt:message key="USE_YN" bundle="${bundle}"/></th>
                    </tr>
                </thead>
            </table>
            <div class="tbody" style="overflow-y:scroll">
                <table class="table" id="table-1">
                    <colgroup>
                        <col style="width: 48px">
                        <%-- <col style="width: 80px"> --%>
                        <col style="width: 80px">
                        <col style="width: ">
                        <col style="width: calc(80px - 17px)">
                    </colgroup>
                    <tbody>
                    <c:forEach var="result1" items="${resultList1}" varStatus="status">
                        <tr class="<c:if test="${result1.rowno eq '1'}">on</c:if>">
                        <td align="center" class="listtd"><c:out value="${result1.rowno}"/></td>
                        <%-- <td align="center" class="listtd"><c:out value="${result1.taskDivNm}"/></td> --%>
                        <td align="center" class="listtd"><c:out value="${result1.cdgrpId}"/></td>
                        <td align="center" class="listtd"><c:out value="${result1.cdgrpNm}"/></td>
                        <td align="center" class="listtd"><c:out value="${result1.useYn}"/></td>
                        <td align="center" class="listtd" style="display:none"><c:out value="${result1.cdgrpDesc}"/></td>
                        <td align="center" class="listtd" style="display:none"><c:out value="${result1.regId}"/></td>
                        <td align="center" class="listtd" style="display:none"><c:out value="${result1.regDt}"/></td>
                        <td align="center" class="listtd" style="display:none"><c:out value="${result1.taskDiv}"/></td>
                        <td align="center" class="listtd" style="display:none;"><c:out value="${result1.coId}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </li>
        <li class="view">
            <div class="stitle">
                <p class="tl"><fmt:message key="CODE_DETAIL" bundle="${bundle}"/> <span class="cnt"><fmt:message key="TOTAL" bundle="${bundle}"/> <strong id="totCnt2">${totCnt2}</strong> <fmt:message key="COUNT2" bundle="${bundle}"/></span></p>
                <p class="bbs_btn">
                    <a href="#" class="btn_bbs btn_write pop_reg" data-pop="write-2"><fmt:message key="NEW" bundle="${bundle}"/></a>
                    <a href="#" class="btn_bbs btn_edit pop_mod" data-pop="write-2"><fmt:message key="MOD" bundle="${bundle}"/></a>
                    <!-- <a href="#" class="btn_bbs btn_delete pop_del" id="pop_del-2" data-pop="write-2">삭제</a> -->
                </p>
            </div>

            <table class="table" >
                <colgroup>
                    <col style="width: 48px">
                    <col style="width: 80px">
                    <col style="width: 80px">
                    <col style="width: 100px">
                    <col style="width: 80px">
                    <col style="width: 80px">
                    <col style="width: 80px">
                    <col style="width: 80px">
                    <col style="width: 80px">
                    <col style="width: 80px">
                    <col style="width: 80px">
                </colgroup>
                <thead>
                    <tr>
                    <th>No.</th>
                    <th><fmt:message key="CODE_GRP_ID" bundle="${bundle}"/></th>
                    <th><fmt:message key="CODE_ID" bundle="${bundle}"/></th>
                    <th><fmt:message key="COMMON_CODE" bundle="${bundle}"/></th>
                    <th><fmt:message key="CODE_NM" bundle="${bundle}"/></th>
                    <th><fmt:message key="ORDER" bundle="${bundle}"/></th>
                    <th><fmt:message key="USE" bundle="${bundle}"/></th>
                    <th><fmt:message key="PARENT_COMMON_CODE" bundle="${bundle}"/></th>
                    <th><fmt:message key="ETC1" bundle="${bundle}"/></th>
                    <th><fmt:message key="ETC2" bundle="${bundle}"/></th>
                    <th><fmt:message key="ETC3" bundle="${bundle}"/></th>
                    </tr>
                </thead>
            </table>
            <div class="tbody" style="overflow-y:scroll">
                <table class="table" id="table-2" >
                    <colgroup>
                        <col style="width: 48px">
                        <col style="width: 80px">
                        <col style="width: 80px">
                        <col style="width: 100px">
						<col style="width: 80px">
						<col style="width: 80px">
						<col style="width: 80px">
						<col style="width: 80px">
						<col style="width: 80px">
						<col style="width: 80px">
                        <col style="width: calc(80px - 16px)">
                    </colgroup>
                    <tbody>
                    <c:forEach var="result2" items="${resultList2}" varStatus="status2">
                        <tr class="<c:if test="${result2.rowno eq '1'}">on</c:if>">
	                        <td align="center" class="listtd"><c:out value="${result2.rowno}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result2.cdgrpId}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result2.cdId}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result2.comCd}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result2.cdNm}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result2.srtSeq}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result2.useYn}"/></td>
	                        <td align="center" class="listtd" style="display:none"><c:out value="${result2.cdDesc}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result2.hrnkcomCd}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result2.etc1}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result2.etc2}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result2.etc3}"/></td>
	                        <td align="center" class="listtd" style="display:none;"><c:out value="${result2.regId}"/></td>
	                        <td align="center" class="listtd" style="display:none;"><c:out value="${result2.regDt}"/></td>
	                        <td align="center" class="listtd" style="display:none;"><c:out value="${result2.coId}"/></td>
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
                <fmt:message key="CODE_GRP_INFO" bundle="${bundle}"/>
                </h3>

                <ul class="user_write">
                    <li>
                        <table class="table_write">
                            <tbody>
<%--                                 <tr>
                                    <th>업무구분<span class="remark"></span></th>
                                    <td colspan="3">
                                    <span class="selectBox bottom border" id="p1_taskDiv_span">
                                        <button class="label" id="p1_taskDiv" data-code="">업무구분</button>
                                        <ul class="optionList">
                                            <c:forEach var="select1" items="${selectList1}" varStatus="status">
                                                <li class="optionItem" data-code="${select1.comCd}">${select1.cdNm}</li>
                                            </c:forEach>
                                        </ul>
                                    </span>
                                    </td>
                                </tr> --%>
                                <tr>
                                    <th><fmt:message key="CODE_GRP_ID" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td colspan="3">
                                    <input type="text" value="" name="cdgrpId" id="p1_cdgrpId" class="input3" placeholder="">
                                    <input type="hidden" value="" name="coId" id="p1_coId" class="input3" placeholder="">

                                    </td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="CODE_GRP_NM" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td><input type="text" value="" name="cdgrpNm" id="p1_cdgrpNm" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="DESCRIPTION" bundle="${bundle}"/></th>
                                    <td><input type="text" value="" name="cdgrpDesc" id="p1_cdgrpDesc" class="input3" placeholder=""></td>
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
                            <button class="btn_m btn_primary btn_r" id="pop_save-1"><fmt:message key="SAVE" bundle="${bundle}"/></button>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="pop_wrap" id="pop_write-2">
        <div class="pop_box2">
            <div class="pop_content">
                <h3 class="pop_tit">
                <fmt:message key="CODE_DETAIL_INFO" bundle="${bundle}"/>
                </h3>

                <ul class="user_write">
                    <li>
                        <table class="table_write">
                            <tbody>
                                <tr>
                                    <th><fmt:message key="CODE_GRP_ID" bundle="${bundle}"/></th>
                                    <td colspan="3">
                                    <input type="text" value="" name="p2_cdgrpId" id="p2_cdgrpId" class="input3" placeholder="" disabled="disabled">
                                    <input type="hidden" value="" name="p2_coId" id="p2_coId" class="input3" placeholder="" disabled="disabled">
                                    </td>

                                </tr>
                                <tr>
                                    <th><fmt:message key="CODE_ID" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td><input type="text" value="" name="p2_cdId" id="p2_cdId" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="COMMON_CODE" bundle="${bundle}"/></th>
                                    <td><input type="text" value="" name="p2_comCd" id="p2_comCd" class="input3" placeholder="" disabled="disabled"></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="CODE_NM" bundle="${bundle}"/></th>
                                    <td><input type="text" value="" name="p2_cdNm" id="p2_cdNm" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="US_CODE_NM" bundle="${bundle}"/></th>
                                    <td><input type="text" value="" name="p2_cdNmEng" id="p2_cdNmEng" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="JP_CODE_NM" bundle="${bundle}"/></th>
                                    <td><input type="text" value="" name="p2_cdNmJp" id="p2_cdNmJp" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="ORDER" bundle="${bundle}"/></th>
                                    <td><input type="text" value="" name="p2_srtSeq" id="p2_srtSeq" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="DESCRIPTION" bundle="${bundle}"/></th>
                                    <td><input type="text" value="" name="p2_cdDesc" id="p2_cdDesc" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="PARENT_COMMON_CODE" bundle="${bundle}"/></th>
                                    <td><input type="text" value="" name="p2_hrnkcomCd" id="p2_hrnkcomCd" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="ETC1" bundle="${bundle}"/></th>
                                    <td><input type="text" value="" name="p2_etc1" id="p2_etc1" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="ETC2" bundle="${bundle}"/></th>
                                    <td><input type="text" value="" name="p2_etc2" id="p2_etc2" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="ETC3" bundle="${bundle}"/></th>
                                    <td><input type="text" value="" name="p2_etc3" id="p2_etc3" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="USE_YN" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td><label class="checkbox"><input type="checkbox" name="p2_useYn" id="p2_useYn" class="input3" value="1"><span class="icon"></span></label></td>
                                </tr>
                                <tr style="display:none;">
                                    <th>등록자</th>
                                    <td><input type="text" value="" name="p2_regId" id="p2_regId" class="input3" placeholder="" disabled="disabled"></td>
                                </tr>
                                <tr style="display:none;">
                                    <th>등록일</th>
                                    <td><input type="text" value="" name="p2_regDt" id="p2_regDt" class="input3" placeholder="" disabled="disabled"></td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="pop_btn">
                            <span class="btn_m btn_darkline btn_r pop_close"><fmt:message key="CANCEL" bundle="${bundle}"/></span>
                            <button class="btn_m btn_primary btn_r" id="pop_save-2"><fmt:message key="SAVE" bundle="${bundle}"/></button>
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

	$("#cdgrpId").keydown(function(keyNum){
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

	$('#table-2 > tbody > tr').on('click', function(){
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

        var params,target_table;

		if(target_pop=='write-1'){
			target_table = 'table-1';

        } else if (target_pop=='write-2'){
        	target_table = 'table-2';
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

		$("#confirm_msg").html("<fmt:message key="Q_DELETE" bundle="${bundle}"/>");
		$('#pop_confirm').stop().fadeIn(300);
        $('#pop_confirm').stop().fadeIn(300);

        $('.btn_select.pop_confirm_select').off('click');
        $('.btn_select.pop_confirm_select').on('click', function(){

           	var params = {
           		'coId' : $('#table-1 > tbody > .on').find('td:eq(9)').text()
       			,'cdgrpId' : $('#table-1 > tbody > .on').find('td:eq(2)').text()
       		};

        	$.ajax({
    			type : 'POST',
    			data : params,
    			dataType : 'text',
    			url : '/deleteCodeGroup.do',
    			success : function (resp) {
    				var json = JSON.parse(resp);
    				var result = json.result;

		   				$("#alert_msg").html(result.msg);
						$('#pop_alert').stop().fadeIn(300);
			        	$('#pop_alert').stop().fadeIn(300);

					if(result.code == 0000){
						// 성공시 창닫기
						// $('#pop_write-1').hide();
	    				$('.btn_search').click();

					}
    			},
    			error : function(err){
    				console.log(err);
    			}
    		});
    	});
	});

	$('#pop_del-2').on('click', function(){

        var row = $('#table-2 > tbody > .on');

        if(!row.length){
        	return
        };

		$("#confirm_msg").html("<fmt:message key="Q_DELETE" bundle="${bundle}"/>");
		$('#pop_confirm').stop().fadeIn(300);
        $('#pop_confirm').stop().fadeIn(300);

        $('.btn_select.pop_confirm_select').off('click');
        $('.btn_select.pop_confirm_select').on('click', function(){

           	var params = {
          		'coId' : $('#table-2 > tbody > .on').find('td:eq(14)').text()
      			,'comCd' : $('#table-2 > tbody > .on').find('td:eq(3)').text()
      		};

        	$.ajax({
    			type : 'POST',
    			data : params,
    			dataType : 'text',
    			url : '/deleteCode.do',
    			success : function (resp) {
    				var json = JSON.parse(resp);
    				var result = json.result;
					$('#pop_confirm').hide();

   					getDetail($('#table-1 > tbody .on'));

    			},
    			error : function(err){
    				console.log(err);
    			}
    		});
    	});
	});



	$('#pop_save-1').on('click', function(){
		var params = {
			'cdgrpId':$('#p1_cdgrpId').val()
			,'cdgrpNm':$('#p1_cdgrpNm').val()
			/* ,'taskDiv':$('#p1_taskDiv').data('code') */
			,'cdgrpDesc':$('#p1_cdgrpDesc').val()
			,'useYn':$('#p1_useYn').is(':checked')?$('#p1_useYn').val():''
			,'rmksCts':$('#p1_rmksCts').val()
		};

		if(valid1(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : (g_isInsert?'/insertCodeGroup.do':'/updateCodeGroup.do'),
				success : function (resp) {
					var json = JSON.parse(resp);
					var result = json.result;
/* 					if(result == -1000){
						$("#alert_msg").html("중복 ID입니다.");
						$('#pop_alert').stop().fadeIn(300);
				        $('#pop_alert').stop().fadeIn(300);
					} else if(result >= 0){
						$('#pop_write-1').hide();
						$('.btn_search').click();
					}
					 */

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

	$('#pop_save-2').on('click', function(){
		var params = {
			'cdgrpId':$('#p2_cdgrpId').val()
			,'cdId':$('#p2_cdId').val()
			,'comCd':$('#p2_comCd').val()
			,'cdNm':$('#p2_cdNm').val()
			,'cdNmEng':$('#p2_cdNmEng').val()
			,'cdNmJp':$('#p2_cdNmJp').val()
			,'srtSeq':$('#p2_srtSeq').val()
			,'cdDesc':$('#p2_cdDesc').val()
			,'hrnkcomCd':$('#p2_hrnkcomCd').val()
			,'etc1':$('#p2_etc1').val()
			,'etc2':$('#p2_etc2').val()
			,'etc3':$('#p2_etc3').val()
			,'useYn':$('#p2_useYn').is(':checked')?$('#p2_useYn').val():''
		};
		//console.log($('#table-1 > tbody .on'));
		//console.log(params);
		if(valid2(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : (g_isInsert?'/insertCode.do':'/updateCode.do'),
				success : function (resp) {
					var json = JSON.parse(resp);
					var result = json.result;
					if(result == -1000){
						$("#alert_msg").html("<fmt:message key="DUPLICATE_ID" bundle="${bundle}"/>");
						$('#pop_alert').stop().fadeIn(300);
				        $('#pop_alert').stop().fadeIn(300);
					} else {
						$('#pop_write-2').hide();

						getDetail($('#table-1 > tbody .on'));
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


	function valid1(params){
		var cnt = 0;
		var msg = "";
		var bool = true;
		/*
		if(!params.taskDiv){
			cnt += 1;
			msg += "업무구분은 필수입력 입니다.<br>";
		} */
		if(!params.cdgrpId){
			cnt += 1;
			msg += "<fmt:message key="CODE_GRP_ID_REQUIRED" bundle="${bundle}"/><br>";
		}
		if(!params.cdgrpNm){
			cnt += 1;
			msg += "<fmt:message key="CODE_GRP_NM_REQUIRED" bundle="${bundle}"/>";
		}

		if(cnt>0){
			$("#alert_msg").html(msg);
			$('#pop_alert').stop().fadeIn(300);
	        $('#pop_alert').stop().fadeIn(300);
	        bool = false;
		}

		return bool;

	}

	function valid2(params){
		var cnt = 0;
		var msg = "";
		var bool = true;

		if(!$("#p2_cdId").val()){
			cnt += 1;
			msg += "<fmt:message key="CODE_ID_REQUIRED" bundle="${bundle}"/>";
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
			// 'coId':$('#coId').data('code')
			/* ,'taskDiv':$('#taskDiv').data('code') */
			'cdgrpId':$('#cdgrpId').val()
		};

		console.log($('#cdgrpId').val());
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getCodeGroupList.do',
			success : function (resp) {
				//console.log(resp);
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";

				result.forEach (function (el, index) {
					appendRow += '<tr class="'+(el.rowno==1?'on':'')+'">'
						+'<td align="center" class="listtd">'+el.rowno+'</td>'
						/* +'<td align="center" class="listtd">'+el.taskDivNm+'</td>' */
						+'<td align="center" class="listtd">'+el.cdgrpId+'</td>'
						+'<td align="center" class="listtd">'+el.cdgrpNm+'</td>'
						+'<td align="center" class="listtd">'+el.useYn+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.cdgrpDesc+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.regId+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.regDt+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.taskDiv+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.coId+'</td>'
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
	};

	function getDetail(obj){
		var params = {
			'coId':$(obj).find('td:eq(8)').text()
			,'cdgrpId':$(obj).find('td:eq(1)').text()
		};

		$('#table-2 tbody tr').remove();
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getCodeList.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";

				result.forEach (function (el, index) {
					//appendRow += '<tr>'
					appendRow += '<tr class="'+(el.rowno==1?'on':'')+'">'
						+'<td align="center" class="listtd">'+el.rowno+'</td>'
						+'<td align="center" class="listtd">'+el.cdgrpId+'</td>'
						+'<td align="center" class="listtd">'+el.cdId+'</td>'
						+'<td align="center" class="listtd">'+el.comCd+'</td>'
						+'<td align="center" class="listtd">'+el.cdNm+'</td>'
						+'<td align="center" class="listtd">'+el.srtSeq+'</td>'
						+'<td align="center" class="listtd">'+el.useYn+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.cdDesc+'</td>'
						+'<td align="center" class="listtd">'+el.hrnkcomCd+'</td>'
						+'<td align="center" class="listtd">'+el.etc1+'</td>'
						+'<td align="center" class="listtd">'+el.etc2+'</td>'
						+'<td align="center" class="listtd">'+el.etc3+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.regId+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.regDt+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.coId+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.cdNmEng+'</td>'   //eq td row 매핑데이터
						+'<td align="center" class="listtd" style="display:none">'+el.cdNmJp+'</td>'
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

	function popupData(target_pop,row){
		if(target_pop=='write-1'){

			if(row.length) {
/* 				$('#p1_taskDiv').text(row.find('td:eq(1)').text());
				$('#p1_taskDiv').data('code',row.find('td:eq(8)').text()); */

				$('#p1_cdgrpId').val(row.find('td:eq(1)').text());
				$('#p1_cdgrpId').prop("disabled",true);

				$('#p1_cdgrpNm').val(row.find('td:eq(2)').text());
				$('#p1_cdgrpDesc').val(row.find('td:eq(4)').text());

				$('#p1_useYn').prop('checked',row.find('td:eq(3)').text()=='사용'?true:false);

				//if(row.find('td:eq(4)').children().children().eq(0).val()=='1'){
				//	$('#p1_useYn').prop('checked',true);
				//}
				$('#p1_regId').val(row.find('td:eq(5)').text());
				$('#p1_regDt').val(row.find('td:eq(6)').text());
				$('#p1_coId').val(row.find('td:eq(8)').text());

				g_isInsert = false;
			} else {
/* 				$('#p1_taskDiv').text('업무구분');
				$('#p1_taskDiv').data('code',''); */

				$('#p1_cdgrpId').val('');
				$('#p1_cdgrpId').prop("disabled",false);

				$('#p1_cdgrpNm').val('');
				$('#p1_cdgrpDesc').val('');
				$('#p1_useYn').prop('checked',false);
				$('#p1_regId').val('');
				$('#p1_regDt').val('');
				$('#p1_coId').val($('#coId').data('code'));

				g_isInsert = true;
			}
		} else if(target_pop=='write-2'){

			if(row.length) {

				$('#p2_cdgrpId').val(row.find('td:eq(1)').text());

				$('#p2_cdId').val(row.find('td:eq(2)').text());
				$('#p2_cdId').prop("disabled",true);

				$('#p2_comCd').val(row.find('td:eq(3)').text());
				$('#p2_cdNm').val(row.find('td:eq(4)').text());

				$('#p2_srtSeq').val(row.find('td:eq(5)').text());
				$('#p2_cdDesc').val(row.find('td:eq(7)').text());
				$('#p2_hrnkcomCd').val(row.find('td:eq(8)').text());
				$('#p2_etc1').val(row.find('td:eq(9)').text());
				$('#p2_etc2').val(row.find('td:eq(10)').text());
				$('#p2_etc3').val(row.find('td:eq(11)').text());

				$('#p2_useYn').prop('checked',row.find('td:eq(6)').text()=='사용'?true:false);

				$('#p2_regId').val(row.find('td:eq(12)').text());
				$('#p2_regDt').val(row.find('td:eq(13)').text());
				$('#p2_coId').val(row.find('td:eq(14)').text());

				$('#p2_cdNmEng').val(row.find('td:eq(15)').text());
				$('#p2_cdNmJp').val(row.find('td:eq(16)').text());

				/* $('#p2_cdgrpId').val(row.find('td:eq(1)').text());

				$('#p2_cdId').val(row.find('td:eq(2)').text());
				$('#p2_cdId').prop("disabled",true);

				$('#p2_comCd').val(row.find('td:eq(3)').text());
				$('#p2_cdNm').val(row.find('td:eq(4)').text());
				$('#p2_srtSeq').val(row.find('td:eq(5)').text());
				$('#p2_cdDesc').val(row.find('td:eq(7)').text());
				$('#p2_hrnkcomCd').val(row.find('td:eq(8)').text());
				$('#p2_etc1').val(row.find('td:eq(9)').text());
				$('#p2_etc2').val(row.find('td:eq(10)').text());
				$('#p2_etc3').val(row.find('td:eq(11)').text());

				$('#p2_useYn').prop('checked',row.find('td:eq(6)').text()=='사용'?true:false);

				$('#p2_regId').val(row.find('td:eq(12)').text());
				$('#p2_regDt').val(row.find('td:eq(13)').text());
				$('#p2_coId').val(row.find('td:eq(14)').text());
 */
				g_isInsert = false;
			} else {
				$('#p2_cdgrpId').val($('#table-1 > tbody .on').find('td:eq(1)').text());

				$('#p2_cdId').val('');
				$('#p2_cdId').prop("disabled",false);

				$('#p2_comCd').val('');
				$('#p2_cdNm').val('');

				$('#p2_cdNmEng').val('');
				$('#p2_cdNmJp').val('');

				$('#p2_srtSeq').val('');
				$('#p2_cdDesc').val('');
				$('#p2_hrnkcomCd').val('');
				$('#p2_etc1').val('');
				$('#p2_etc2').val('');
				$('#p2_etc3').val('');

				$('#p2_useYn').prop('checked',false);

				$('#p2_regId').val('');
				$('#p2_regDt').val('');
				$('#p2_coId').val($('#table-1 > tbody .on').find('td:eq(9)').text());

				g_isInsert = true;
			}
		}
	};

</script>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>

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
            <input type="text" value="" name="authgrpNm" id="authgrpNm" class="input1" placeholder="<fmt:message key="AUTH_GRP_NAME" bundle="${bundle}"/>">
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
                    <a href="#" class="btn_bbs btn_delete pop_del" id="pop_del-1" data-pop="write-1"><fmt:message key="DELETE" bundle="${bundle}"/></a>
                </p>
            </div>

            <table class="table" >
                <colgroup>
                        <col style="width: 70px">
                        <col style="width: 150px">
                        <col style="width: *">
                        <col style="width: 210px">
                </colgroup>
                <thead>
                    <tr>
                    <th>No.</th>
                    <th><fmt:message key="AUTH_GRP_NAME" bundle="${bundle}"/></th>
                    <th><fmt:message key="GRP_DETAIL" bundle="${bundle}"/></th>
                    <th><fmt:message key="USE_YN" bundle="${bundle}"/></th>
                    </tr>
                </thead>
            </table>
            <div class="tbody" style="overflow-y:scroll">
                <table class="table" id="table-1">
                    <colgroup>
                        <col style="width: 70px">
                        <col style="width: 150px">
                        <col style="width: *">
                        <col style="width: calc(200px - 16px)">
                    </colgroup>
                    <tbody>
                    <c:forEach var="result" items="${resultList}" varStatus="status">
                        <tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
	                        <td align="center" class="listtd"><c:out value="${result.rowno}"/></td>
	                        <td align="center" class="listtd" style="display:none;"><c:out value="${result.coNm}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result.authgrpNm}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result.rmksCts}"/></td>
	                        <td align="center" class="listtd"><c:out value="${result.useYn}"/></td>
	                        <td align="center" class="listtd" style="display:none;"><c:out value="${result.regId}"/></td>
	                        <td align="center" class="listtd" style="display:none;"><c:out value="${result.regDt}"/></td>
	                        <td align="center" class="listtd" style="display:none;"><c:out value="${result.authgrpId}"/></td>
	                        <td align="center" class="listtd" style="display:none;"><c:out value="${result.coId}"/></td>
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
                <fmt:message key="AUTH_GRP_INFO" bundle="${bundle}"/>
                </h3>

                <ul class="user_write">
                    <li>
                        <table class="table_write">
                            <tbody>
                                <!-- <tr>
                                    <th>서비스그룹명</th>
                                    <td colspan="3"><input type="text" value="" name="coNm" id="p1_coNm" class="input3" placeholder="" disabled="disabled"></td>
                                    <td colspan="3"><input type="hidden" value="" name="coId" id="p1_coId" class="input3" placeholder="" disabled="disabled"></td>
                                </tr> -->
                                <tr>
                                    <th><fmt:message key="GRP_NAME" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td colspan="3"><input type="text" value="" name="authgrpNm" id="p1_authgrpNm" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="GRP_DETAIL" bundle="${bundle}"/></th>
                                    <td colspan="3"><input type="text" value="" name="rmksCts" id="p1_rmksCts" class="input3" placeholder=""></td>
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
                                <tr style="display:none;">
                                    <td colspan="3"><input type="text" value="" name="authgrpId" id="p1_authgrpId" class="input3" placeholder="" disabled="disabled"></td>
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

	$("#authgrpNm").keydown(function(keyNum){
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
        var row = $('#table-1 > tbody > .on');

        if(!row.length){
        	return
        };

		$('#confirm_msg').html("<fmt:message key="Q_DELETE" bundle="${bundle}"/>");
		$('#pop_confirm').stop().fadeIn(300);
        $('#pop_confirm').stop().fadeIn(300);

        $('.pop_confirm_select').off('click');
        $('.pop_confirm_select').on('click', function(){
            var row = $('#table-1 > tbody > .on');

         	var params = {
           		'coId' : row.find('td:eq(8)').text()
       			,'authgrpId' : row.find('td:eq(7)').text()
       		};

        	$('.pop_wrap').hide();
        	$.ajax({
    			type : 'POST',
    			data : params,
    			dataType : 'text',
    			url : '/deleteAuthgrp.do',
    			success : function (resp) {
    				var json = JSON.parse(resp);
    				var result = json.result;

    				$("#alert_msg").html(result.msg);
					$('#pop_alert').stop().fadeIn(300);
		        	$('#pop_alert').stop().fadeIn(300);

					if(result.code == 0000){
						// 성공시 창닫기
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
           	/* 'coId' : $('#p1_coId').val()
			, */'authgrpId':$('#p1_authgrpId').val()
			,'authgrpNm':$('#p1_authgrpNm').val()
			,'rmksCts':$('#p1_rmksCts').val()
			,'useYn':$('#p1_useYn').is(':checked')?$('#p1_useYn').val():''
		};


		if(valid(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : (g_isInsert?'/insertAuthgrp.do':'/updateAuthgrp.do'),
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

		if(!params.authgrpNm){
			cnt += 1;
			msg += "<fmt:message key="GRP_NAME_REQUIRED" bundle="${bundle}"/>";
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
			/* 'coId':$('#coId').data('code')
			, */'authgrpNm':$('#authgrpNm').val()
		};

		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getAuthgrpList.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";

				result.forEach (function (el, index) {
					appendRow += '<tr>'
						+'<td align="center" class="listtd">'+el.rowno+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.coNm+'</td>'
						+'<td align="center" class="listtd">'+el.authgrpNm+'</td>'
						+'<td align="center" class="listtd">'+el.rmksCts+'</td>'
						+'<td align="center" class="listtd">'+el.useYn+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.regId+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.regDt+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.authgrpId+'</td>'
						+'<td align="center" class="listtd" style="display:none">'+el.coId+'</td>'
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
				$('#p1_coNm').val(row.find('td:eq(1)').text());
				$('#p1_authgrpNm').val(row.find('td:eq(2)').text());

				$('#p1_rmksCts').val(row.find('td:eq(3)').text());

				$('#p1_useYn').prop('checked',row.find('td:eq(4)').text()=='사용'?true:false);

				$('#p1_regId').val(row.find('td:eq(5)').text());
				$('#p1_regDt').val(row.find('td:eq(6)').text());

				$('#p1_authgrpId').val(row.find('td:eq(7)').text());

				$('#p1_coId').val(row.find('td:eq(8)').text());

				g_isInsert = false;
			} else {
				$('#p1_coNm').val($('#coId').text());
				$('#p1_authgrpNm').val('');

				$('#p1_rmksCts').val('');

				$('#p1_useYn').prop('checked',true);

				$('#p1_regId').val('');
				$('#p1_regDt').val('');

				$('#p1_authgrpId').val('');

				$('#p1_coId').val($('#coId').data('code'));

				g_isInsert = true;
			}
		}
	};

</script>
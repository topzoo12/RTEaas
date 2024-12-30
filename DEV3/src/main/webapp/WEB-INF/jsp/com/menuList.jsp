<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<c:set var="nowCdNa" value="${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}"/>

<div class="contentsWrap">
    <div class="contents_bg"></div>
    <p class="title ${fav}">${pageName.srnNm}</p>
<%--     <ul class="search_box">
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
        </li>
        <li>
            <button class="btn_search" id="btn_search">검색</button>
        </li>
    </ul> --%>

    <ul class="contents" style="min-width: 1260px;">
        <li class="view">
            <div class="stitle">
                <p class="tl"><span class="cnt"><fmt:message key="TOTAL" bundle="${bundle}"/> <strong id="totCnt">${totCnt}</strong> <fmt:message key="COUNT2" bundle="${bundle}"/></span></p>
                <p class="bbs_btn">
                    <a href="#" class="btn_bbs btn_write pop_reg" data-pop="write-1"><fmt:message key="NEW" bundle="${bundle}"/></a>
                    <a href="#" class="btn_bbs btn_edit pop_mod" data-pop="write-1"><fmt:message key="MOD" bundle="${bundle}"/></a>
                  <!--   <a href="#" class="btn_bbs btn_delete pop_del" id="pop_del-1" data-pop="write-1">삭제</a> -->
                </p>
            </div>

            <table class="table">
                <colgroup>
                    <col style="width: 48px">
                    <col style="width: *">
                    <col style="width: 15%">
                    <col style="width: 15%">
                    <col style="width: 15%">
                    <col style="width: 10%">
                    <col style="width: 5%">
                    <col style="width: 15%">
                    <col style="width: 100px">
                </colgroup>
                <thead>
                    <tr>
                    <th>No.</th>
                    <th><fmt:message key="MENU_TREE" bundle="${bundle}"/></th>
                    <th><fmt:message key="PARENT_MENU_ID" bundle="${bundle}"/></th>
                    <th><fmt:message key="MENU_ID" bundle="${bundle}"/></th>
                    <th><fmt:message key="SCREEN_ID" bundle="${bundle}"/></th>
                    <th><fmt:message key="SCREEN_NAME" bundle="${bundle}"/></th>
                    <th><fmt:message key="SORT_ORDER" bundle="${bundle}"/></th>
                    <th>URL</th>
                    <th><fmt:message key="USE_YN" bundle="${bundle}"/></th>
                    </tr>
                </thead>
            </table>
            <div class="tbody" style="overflow-y:scroll;height: 676px;">
                <table class="table depth" id="table-1">
                    <colgroup>
                        <col style="width: 48px">
                        <col style="width: *">
                        <col style="width: 15%">
                        <col style="width: 15%">
                        <col style="width: 15%">
                        <col style="width: 10%">
                        <col style="width: 5%">
                        <col style="width: 15%">
                        <col style="width: calc(100px - 16px)">
                    </colgroup>
                    <tbody>
                    <c:forEach var="result" items="${resultList}" varStatus="status">
                        <tr class="<c:if test="${result.mnuLvl eq '1'}">depth1</c:if><c:if test="${result.mnuLvl eq '2'}">depth2</c:if> <c:if test="${result.rowno eq '1'}">on</c:if>">
                        <td align="center" class="listtd"><c:out value="${result.rowno}"/></td>
                        <td align="center" class="subj"><%-- <c:out value="${result.mnuNm}"/></td> --%>
							<c:choose>
								<c:when test="${nowCdNa eq 'KR'}">${result.mnuNm}</c:when>
								<c:when test="${nowCdNa eq 'US'}">${result.mnuNmUs}</c:when>
								<c:when test="${nowCdNa eq 'JP'}">${result.mnuNmJp}</c:when>
							</c:choose>
                        </td>
                        <td align="center" class="listtd"><c:out value="${result.hrnkmnuId}"/></td>
                        <td align="center" class="listtd"><c:out value="${result.mnuId}"/></td>
                        <td align="center" class="listtd"><c:out value="${result.srnId}"/></td>
                        <td align="center" class="listtd"><c:out value="${result.srnNm}"/></td>
                        <td align="center" class="listtd"><c:out value="${result.srtSeq}"/></td>
                        <td align="center" class="listtd"><c:out value="${result.srnUrl}"/></td>
                        <td align="center" class="listtd" style="display:none;"><c:out value="${result.markYn}"/></td>
                        <td align="center" class="listtd"><c:out value="${result.useYn}"/></td>
                        <td align="center" class="listtd" style="display:none;"><c:out value="${result.regId}"/></td>
                        <td align="center" class="listtd" style="display:none;"><c:out value="${result.regDt}"/></td>
                        <td align="center" class="listtd" style="display:none;"><c:out value="${result.mnuLvl}"/></td>
                        <td align="center" class="listtd" style="display:none;"><c:out value="${result.coId}"/></td>
                    	<td align="center" class="subj" style="display:none;"><c:out value="${result.mnuNmUs}"/></td>
                        <td align="center" class="subj" style="display:none;"><c:out value="${result.mnuNmJp}"/></td>
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
                <fmt:message key="MENU_INFO" bundle="${bundle}"/>
                </h3>
                <ul class="user_write">
                    <li>
                        <table class="table_write">
                            <tbody>
                                <tr>
                                    <th><fmt:message key="PARENT_MENU_ID" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td colspan="3"><input type="text" value="" name="hrnkmnuId" id="p1_hrnkmnuId" class="input3" placeholder=""></td>
                                    <td colspan="3"><input type="hidden" value="" name="coId" id="p1_coId" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="MENU_ID" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td colspan="3"><input type="text" value="" name="mnuId" id="p1_mnuId" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="MENU_NAME" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td colspan="3"><input type="text" value="" name="mnuNm" id="p1_mnuNm" class="input3" placeholder=""></td>
                                </tr>
                                 <tr>
                                    <th><fmt:message key="US_MENU_NAME" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td colspan="3"><input type="text" value="" name="mnuNmUs" id="p1_mnuNmUs" class="input3" placeholder=""></td>
                                </tr>
                                 <tr>
                                    <th><fmt:message key="JP_MENU_NAME" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td colspan="3"><input type="text" value="" name="mnuNmJp" id="p1_mnuNmJp" class="input3" placeholder=""></td>
                                </tr>
                                <tr style="display:none;">
                                    <th><fmt:message key="SCREEN_ID" bundle="${bundle}"/><span class="remark"></span></th>
                                    <td colspan="3"><input type="text" value="" name="srnId" id="p1_srnId2" class="input3" placeholder=""></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="SCREEN_NAME" bundle="${bundle}"/></th>
                                    <td>
                                        <span class="addr_box">
                                            <input type="hidden" id="p1_srnId" placeholder="">
                                            <input type="text" value="" name="srnNm" id="p1_srnNm" class="input9" placeholder="" readonly>
                                            <button class="search_btn" data-pop="search"></button>
                                        </span>
                                    </td>

                                </tr>
                                <tr>
                                    <th>URL</th>
                                    <td><input type="text" value="" name="srnUrl" id="p1_srnUrl" class="input3" placeholder="" readonly></td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="MENU_LEVEL" bundle="${bundle}"/></th>
                                    <td>
                                        <!-- <input type="number" min="1" max="2" value="" name="mnuLvl" id="p1_mnuLvl" class="input3" placeholder=""> -->
                                        <span class="selectBox bottom" id="menu_lv_span">
                                            <button class="label" id="menuLv" data-code="1">TEST</button>
                                            <ul class="optionList" style="display: none;">
                                                <li class="optionItem" data-code="1" >1</li>
                                                <li class="optionItem" data-code="2" >2</li>
                                            </ul>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <th><fmt:message key="SORT_ORDER" bundle="${bundle}"/></th>
                                    <td><input type="number" min="1" max="100" value="" name="srtSeq" id="p1_srtSeq" class="input3" placeholder=""></td>
                                </tr>
                                <tr style="display:none;">
                                    <th>표시여부</th>
                                    <td><label class="checkbox"><input type="checkbox" name="markYn" id="p1_markYn" value="1"><span class="icon"></span></label></td>
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
                            <button class="btn_m btn_darkline btn_r pop_close" id="pop_close-1"><fmt:message key="CANCEL" bundle="${bundle}"/></button>
                            <button class="btn_m btn_primary btn_r" id="pop_save-1"><fmt:message key="SAVE" bundle="${bundle}"/></button>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="pop_wrap" id="pop_search">
        <div class="pop_box2">
            <div class="pop_content">
                <h3 class="pop_tit">
                <fmt:message key="SCREEN_INFO" bundle="${bundle}"/>
                </h3>
                <div class="search_box">
                    <input type="text" value="" name="srnNm" id="ps_srnNm" class="input1 flex1" placeholder="<fmt:message key="SCREEN_NAME" bundle="${bundle}"/>">
                    <button class="btn_search" id="ps_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>
                </div>

                <ul class="contents">
                    <li class="view">
                        <div class="stitle">
                            <p class="tl"><fmt:message key="TOTAL" bundle="${bundle}"/> <strong id="ps_totCnt">0</strong> <fmt:message key="COUNT2" bundle="${bundle}"/></p>
                        </div>

                        <table class="table">
                            <colgroup>
                                <col style="width: 48px">
                                <col style="width: 190px">
                                <col style="width: 90px">
                                <col style="width: calc(100% - 328px)">
                            </colgroup>
                            <thead>
                                <tr>
                                <th>No.</th>
                                <th><fmt:message key="SCREEN_ID" bundle="${bundle}"/></th>
                                <th><fmt:message key="SCREEN_NAME" bundle="${bundle}"/></th>
                                <th>URL</th>
                                </tr>
                            </thead>
                        </table>
                        <div class="tbody2">
                        <table class="table" id="table-ps">
                            <colgroup>
                                <col style="width: 48px">
                                <col style="width: 190px">
                                <col style="width: 90px">
                                <col style="width: calc(100% - 345px)">
                            </colgroup>
                            <tbody>
                            </tbody>
                        </table>
                        </div>

                        <div class="pop_btn">
                            <button class="btn_m btn_darkline btn_r pop_close"><fmt:message key="CLOSE" bundle="${bundle}"/></button>
                            <button class="btn_m btn_primary btn_r ps_select"><fmt:message key="SELECTION" bundle="${bundle}"/></button>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<script language="javascript">

getMasterPopSearch();
var g_isInsert = true;
$('.ps_select').on('click', function () {

    var row = $('#table-ps > tbody > .on');
    if(!row.length){
    	return
    }
    $('#p1_srnId').val(row.find('td:eq(1)').text());
    $('#p1_srnNm').val(row.find('td:eq(2)').text());
    $('#p1_srnUrl').val(row.find('td:eq(3)').text());
    $('#pop_search').hide();
    //console.log(row.find('td:eq(2)').text());
});

	$('#btn_search').on('click', function () {
		getMaster();
	});
	$('.search_btn').on('click', function () {
		let target_pop = $(this).data('pop');

        var row = $('#table-1 > tbody > .on');
        if(!row.length){
        	return
        }

        $('#pop_'+target_pop).stop().fadeIn(300);
        if($('.pop_wrap').length){
            $('#pop_'+target_pop).stop().fadeIn(300);
        }
	});
	$('#ps_search').on('click', function () {
		getMasterPopSearch();
	});

	$('#table-1 > tbody > tr').on('click', function(){
		$(this).parent().children().removeClass('on');
		$(this).addClass('on');
	});

	$('.pop_reg').on('click', function(){
		g_isInsert = true;

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

        console.log('row 확인',row );
        $('#pop_'+target_pop).stop().fadeIn(300);
        if($('.pop_wrap').length){
            $('#pop_'+target_pop).stop().fadeIn(300);
        }
        popupData(target_pop,row);

    });

/* 	$('#pop_del-1').on('click', function(){
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

           	var params = {
          			'coId' : $('#table-1 > tbody > .on').find('td:eq(13)').text()
          			,'mnuId' : $('#table-1 > tbody > .on').find('td:eq(3)').text()
           		};
           	$('.pop_wrap').hide();
           	$.ajax({
    			type : 'POST',
    			data : params,
    			dataType : 'text',
    			url : '/deleteMenu.do',
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
 */
	$('#pop_save-1').on('click', function(){

		var params = {
			'coId':$('#p1_coId').val()
			,'srnId':$('#p1_srnId').val()
			,'srnNm':$('#p1_srnNm').val()
			,'hrnkmnuId':$('#p1_hrnkmnuId').val()
			,'mnuId':$('#p1_mnuId').val()
			,'mnuNm':$('#p1_mnuNm').val()
			,'mnuLvl':$('#menuLv').text()
			,'srtSeq':$('#p1_srtSeq').val()
			,'rmksCts':$('#p1_rmksCts').val()
			,'useYn':$('#p1_useYn').is(':checked')?$('#p1_useYn').val():''
			,'mnuNmUs':$('#p1_mnuNmUs').val()
			,'mnuNmJp':$('#p1_mnuNmJp').val()
		};
		if(valid(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : (g_isInsert?'/insertMenu.do':'/updateMenu.do'),
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

					getMaster();

				},
				error : function(err){
					console.log(err);
				}
			});
		} else {
			return false;
		}

	});

	function valid(param){
		var cnt = 0;
		var msg = "";
		var bool = true;

		if(!param.hrnkmnuId){
			cnt += 1;
			msg += "<fmt:message key="PARENT_MENU_ID_REQUIRED" bundle="${bundle}"/><br>";
		}
		if(!param.mnuId){
			cnt += 1;
			msg += "<fmt:message key="MENU_ID_REQUIRED" bundle="${bundle}"/><br>";
		}

		if(!param.mnuNm){
			cnt += 1;
			msg += "<fmt:message key="MENU_NM_REQUIRED" bundle="${bundle}"/><br>";
		}

		if(!param.mnuNmUs){
			cnt += 1;
			msg += "<fmt:message key="US_MENU_NAME_REQUIRED" bundle="${bundle}"/><br>";
		}

		if(!param.mnuNmJp){
			cnt += 1;
			msg += "<fmt:message key="JP_MENU_NAME_REQUIRED" bundle="${bundle}"/>";
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
		$('#coId').data('code')

		$('#table-1 tbody tr').remove();

		var params = {
			'coId':$('#coId').data('code')
		};

		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getMenuList.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";

				result.forEach (function (el, index) {
					appendRow += '<tr class='+(el.mnuLvl==1?'depth1':(el.mnuLvl==2?'depth2':''))+'>'
						+'<td align="center" class="listtd">'+el.rowno+'</td>'
						+'<td align="center" class="subj">'+el.mnuNm+'</td>'
						+'<td align="center" class="listtd">'+el.hrnkmnuId+'</td>'
						+'<td align="center" class="listtd">'+el.mnuId+'</td>'
						+'<td align="center" class="listtd">'+el.srnId+'</td>'
						+'<td align="center" class="listtd">'+el.srnNm+'</td>'
						+'<td align="center" class="listtd">'+el.srtSeq+'</td>'
						+'<td align="center" class="listtd">'+el.srnUrl+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.markYn+'</td>'
						+'<td align="center" class="listtd">'+el.useYn+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.regId+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.regDt+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.mnuLvl+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.coId+'</td>'
						+'<td align="center" class="subj" style="display:none;">'+el.mnuNmUs+'</td>'
						+'<td align="center" class="subj" style="display:none;">'+el.mnuNmJp+'</td>'
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
	function getMasterPopSearch(){
		$('#table-ps tbody tr').remove();
		var params = {
				'srnNm':$('#ps_srnNm').val()
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
				var appendRow = "";

				//console.log(result);
				result.forEach (function (el, index) {
					appendRow += '<tr>'
						+'<td>'+el.rowno+'</td>'
						+'<td>'+el.srnId+'</td>'
						+'<td>'+el.srnNm+'</td>'
						+'<td align="left">'+el.srnUrl+'</td>'
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

	var menuKeyValue = [];

	function getMenuNameKR(menuName) {

		switch ('${nowCdNa}') {
        case 'KR':
            return menuName;
        case 'US':
        	var nowMenuData = menuKeyValue.find(item => item.menuNameEng === menuName);
        	return nowMenuData.menuName;
        case 'JP':
        	var nowMenuData = menuKeyValue.find(item => item.menuNameJP === menuName);
        	return nowMenuData.menuName;
		}

	}

	function popupData(target_pop,row){

		if(target_pop=='write-1'){
			if(row.length) {
				const div = document.getElementById('menuLv')
				div.setAttribute('data-code', row.find('td:eq(12)').text())
				div.innerText = row.find('td:eq(12)').text()

				var menuName = $.trim(row.find('td:eq(1)').text());
				$('#p1_hrnkmnuId').val(row.find('td:eq(2)').text());
				$('#p1_mnuId').val(row.find('td:eq(3)').text());
				$('#p1_mnuId').prop("disabled",true);

				$('#p1_mnuNm').val(getMenuNameKR(menuName));
				$('#p1_mnuNmUs').val(row.find('td:eq(14)').text());
				$('#p1_mnuNmJp').val(row.find('td:eq(15)').text());

				$('#p1_srnId').val(row.find('td:eq(4)').text());
				$('#p1_srnNm').val(row.find('td:eq(5)').text());
				$('#p1_srnUrl').val(row.find('td:eq(7)').text());
				$('#p1_mnuLvl').val(row.find('td:eq(12)').text());
				//$('#menuLv').val(row.find('td:eq(12)').text());

				$('#p1_srtSeq').val(row.find('td:eq(6)').text());

				$('#p1_markYn').prop('checked',row.find('td:eq(8)').text()=='사용'?true:false);
				$('#p1_useYn').prop('checked',row.find('td:eq(9)').text()=='사용'?true:false);

				$('#p1_regId').val(row.find('td:eq(10)').text());
				$('#p1_regDt').val(row.find('td:eq(11)').text());
				$('#p1_coId').val(row.find('td:eq(13)').text());

				g_isInsert = false;

			} else {
				const div = document.getElementById('menuLv')
				div.setAttribute('data-code', 1)
				div.innerText = 1

				$('#p1_hrnkmnuId').val('');
				$('#p1_mnuId').val('');
				$('#p1_mnuId').prop("disabled",false);

				$('#p1_mnuNm').val('');
				$('#p1_mnuNmUs').val('');
				$('#p1_mnuNmJp').val('');

				$('#p1_srnId').val('');
				$('#p1_srnNm').val('');
				$('#p1_srnUrl').val('');
				$('#p1_mnuLvl').val(0);
				$('#p1_srtSeq').val(0);

				$('#p1_markYn').prop('checked',false);
				$('#p1_useYn').prop('checked',false);

				$('#p1_regId').val('');
				$('#p1_regDt').val('');
				$('#p1_coId').val($('#coId').data('code'));

				g_isInsert = true;
			}
		}
	};

	$(document).ready(function () {

		<c:forEach var="menu" items="${resultList}" varStatus="status">
			menuKeyValue.push({'menuName':'${menu.mnuNm}', 'menuNameEng':'${menu.mnuNmUs}', 'menuNameJP':'${menu.mnuNmJp}' })
		</c:forEach>

	})
</script>
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
        <li style="display:none;">
            <span style="display:none;" class="stl"><fmt:message key="SERVICE_GRP_NAME" bundle="${bundle}"/></span>
            <span style="display:none;" class="selectBox bottom" id="coId_span">
            <button style="display:none;" class="label" id="coId" data-code="${authInfo.sessionCoId}">${authInfo.sessionCoNm}</button>
            <ul style="display:none;"  class="optionList">
            <c:forEach var="selectco" items="${selectListCo}" varStatus="status">
                <li class="optionItem" data-code="${selectco.coId}">${selectco.coNm}</li>
            </c:forEach>
            </ul>
            </span>
        </li>
        <li>
            <input type="text" value="" name="authgrpNm" id="authgrpNm" class="input1" placeholder="<fmt:message key="GRP_NAME" bundle="${bundle}"/>">
            <button class="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>
        </li>
    </ul>

    <ul class="contents">
        <li class="code">
            <div class="stitle">
                <p class="tl"><fmt:message key="AUTH_GRP" bundle="${bundle}"/> <span class="cnt"><fmt:message key="TOTAL" bundle="${bundle}"/> <strong id="totCnt1">${totCnt1}</strong> <fmt:message key="COUNT2" bundle="${bundle}"/></span></p>
            </div>
            <table class="table" >
                <colgroup>
                    <col style="width: 48px">
                    <col style="width: ">
                    <col style="width: 60px">
                </colgroup>
                <thead>
                    <tr>
                    <th name="rowno">No.</th>
                    <th name="authgrpNm"><fmt:message key="AUTH_GRP_NAME" bundle="${bundle}"/></th>
                    <th name="useYn"><fmt:message key="USE" bundle="${bundle}"/></th>
                    </tr>
                </thead>
            </table>
            <div class="tbody" style="overflow-y:scroll">
                <table class="table" id="table-1">
                <colgroup>
                    <col style="width: 48px">
                    <col style="width: ">
                    <col style="width: calc(60px - 17px)">
                </colgroup>
                <tbody>
                <c:forEach var="result1" items="${resultList1}" varStatus="status">
                    <tr class="<c:if test="${result1.rowno eq '1'}">on</c:if>">
	                    <td align="center" class="listtd"><c:out value="${result1.rowno}"/></td>
	                    <td align="center" class="listtd"><c:out value="${result1.authgrpNm}"/></td>
	                    <td align="center" class="listtd"><c:out value="${result1.useYn}"/></td>
	                    <td align="center" class="listtd" style="display:none;"><c:out value="${result1.rmksCts}"/></td>
	                    <td align="center" class="listtd" style="display:none;"><c:out value="${result1.authgrpId}"/></td>
	                    <td align="center" class="listtd" style="display:none;"><c:out value="${result1.coId}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
                </table>
            </div>

        </li>
        <li class="view">
            <div class="stitle">
                <p class="tl"><fmt:message key="MENU_AUTH" bundle="${bundle}"/> <span class="cnt"><fmt:message key="TOTAL" bundle="${bundle}"/> <strong id="totCnt2">${totCnt2}</strong> <fmt:message key="COUNT2" bundle="${bundle}"/></span></p>
                <p class="bbs_btn">
                    <!-- <a href="#" class="btn_bbs btn_file"></a> -->
                </p>
            </div>

            <table class="table">
                <colgroup>
                    <col style="width: ">
                    <col style="width: 167px">
                </colgroup>
                <thead>
                    <tr>
                    <th name="mnuNm"><fmt:message key="MENU_NAME" bundle="${bundle}"/></th>
                    <th name="rauthYn"><fmt:message key="USE" bundle="${bundle}"/></th>
                    </tr>
                </thead>
            </table>
            <div class="tbody" style="overflow-y:scroll">
                <table class="table" id="table-2">
                    <colgroup>
                        <col style="width: ">
                        <col style="width: calc(167px - 17px)">
                    </colgroup>
                    <tbody>
                    <c:forEach var="result2" items="${resultList2}" varStatus="status">
                        <tr class="<c:if test="${result2.mnuLvl eq '1'}">depth1</c:if><c:if test="${result2.mnuLvl eq '2'}">depth2</c:if> <c:if test="${result2.rowno eq '1'}">on</c:if>">
                        <td align="center" class="subj">
                       		 <%--  ${result2.mnuNm} --%>
                   			 <c:choose>
								<c:when test="${nowCdNa eq 'KR'}">${result2.mnuNm}</c:when>
								<c:when test="${nowCdNa eq 'US'}">${result2.mnuNmEng}</c:when>
								<c:when test="${nowCdNa eq 'JP'}">${result2.mnuNmJp}</c:when>
							</c:choose>
                        </td> <!-- JJ 리스트 -->

                        <td align="center" class="listtd">
                            <label class="checkbox">
                                <input type="checkbox" id="${result2.mnuId}_rauthYn" value="1" onclick="updateCheck('${result2.coId}','${result2.authgrpId}','${result2.mnuId}')" <c:if test="${result2.rauthYn eq '1'}">checked</c:if>>
                                <span class="icon"></span>
                            </label>
                        </td>
                        <td align="center" class="listtd" style="display:none;"><c:out value="${result2.authgrpId}"/></td>
                        <td align="center" class="listtd" style="display:none;"><c:out value="${result2.mnuId}"/></td>
                        <td align="center" class="listtd" style="display:none;"><c:out value="${result2.coId}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </li>
    </ul>
</div>

<script language="javascript">


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
		getDetail(this);
	});

	function updateCheck(coId,authgrpId,mnuId){
		var params = {
	    		'coId' : coId
	    		,'authgrpId' : authgrpId
	    		,'mnuId' : mnuId
	    		,'rauthYn' : $('#'+mnuId+'_rauthYn').is(':checked')?'1':'0'
	    		//,'sauthYn' : $('#'+mnuId+'_sauthYn').is(':checked')?'1':'0'
	    		//,'pauthYn' : $('#'+mnuId+'_pauthYn').is(':checked')?'1':'0'
	     	};
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/updateAuthgrpMenu.do',
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
			'coId':$('#coId').data('code')
			,'authgrpNm':$('#authgrpNm').val()
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
					appendRow += '<tr class="'+(el.rowno==1?'on':'')+'">'
						+'<td align="center" class="listtd">'+el.rowno+'</td>'
						+'<td align="center" class="listtd">'+el.authgrpNm+'</td>'
						+'<td align="center" class="listtd">'+el.useYn+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.rmksCts+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.authgrpId+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.coId+'</td>'
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
			'coId':$(obj).find('td:eq(5)').text()
			,'authgrpId':$(obj).find('td:eq(4)').text()
		};
		//console.log(params);
		$('#table-2 tbody tr').remove();
		if(!params.authgrpId){
			return false;
		}
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getAuthgrpMenuList.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";

				result.forEach (function (el, index) {

					var menuName = '';
					switch ('${nowCdNa}') {
			        case 'KR':
			        	menuName = el.mnuNm;
			        	break;
			        case 'US':
			        	menuName = el.mnuNmEng;
			        	break;
			        case 'JP':
			        	menuName = el.mnuNmJp;
			        	break;
					}
					appendRow += '<tr class='+(el.mnuLvl==1?'depth1':'depth2')+' >'
						+'<td align="center" class="subj">'+ menuName +'</td>'
						//+'<td align="center" class="subj">'+  el.mnuNm +'</td>'
						+'<td align="center" class="listtd"><label class="checkbox"><input type="checkbox" id="'+el.mnuId+'_rauthYn" onclick="updateCheck(\''+el.coId+'\',\''+el.authgrpId+'\',\''+el.mnuId+'\')" '+(el.rauthYn==1?' checked':'')+'><span class="icon"></span></label></td>'
						//+'<td align="center" class="listtd"><label class="checkbox"><input type="checkbox" id="'+el.mnuId+'_sauthYn" onclick="updateCheck(\''+el.authgrpId+'\',\''+el.mnuId+'\')" '+(el.sauthYn==1?' checked':'')+'><span class="icon"></span></label></td>'
						//+'<td align="center" class="listtd"><label class="checkbox"><input type="checkbox" id="'+el.mnuId+'_pauthYn" onclick="updateCheck(\''+el.authgrpId+'\',\''+el.mnuId+'\')" '+(el.pauthYn==1?' checked':'')+'><span class="icon"></span></label></td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.authgrpId+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.mnuId+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.cod+'</td>'
						+'</tr>';

				});


				$('#table-2 > tbody').append(appendRow);
				$('#totCnt2').text(result.length);

				/* $('#table-2 > tbody > tr').on('click', function(){
					$(this).parent().children().removeClass('on');
					$(this).addClass('on');
				}); */
			},
			error : function(err){
				console.log(err);
			}
		});
	};

</script>
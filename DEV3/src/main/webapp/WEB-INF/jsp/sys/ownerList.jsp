<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div class="contentsWrap">
    <div class="contents_bg"></div>
    <p class="title ${fav}">${pageName.srnNm}</p>

    <ul class="search_box">
        <li>
            <button class="btn_search">검색</button>
        </li>
    </ul>

    <ul class="contents">
        <li class="view">
            <div class="stitle">
                <p class="tl"><span class="cnt">총 <strong id="totCnt">${totCnt}</strong> 건</span></p>
            </div>
            <table class="table">
                <colgroup>
                    <col style="width: 150px">
                    <col style="width: ">
                    <col style="width: 150px">
                    <col style="width: 250px">
                </colgroup>
                <thead>
                    <tr>
                    <th>서비스</th>
                    <th>서비스설명</th>
                    <th>소유기관명</th>
                    <th>공개여부</th>
                    </tr>
                </thead>
            </table>
            <div class="tbody" style="overflow-y:scroll">
                <table class="table" id="table-1">
                    <colgroup>
                        <col style="width: 150px">
                        <col style="width: ">
                        <col style="width: 150px">
                        <col style="width: calc(250px - 17px)">
                    </colgroup>
                    <tbody>
                    <c:forEach var="result" items="${resultList}" varStatus="status">
                        <tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
                        <td align="center" class="listtd"><c:out value="${result.mnuNm}"/></td>
                        <td align="center" class="listtd"><c:out value="${result.mnuDesc}"/></td>
                        <td align="center" class="listtd"><c:out value="${result.ownCoNm}"/></td>
                        <td>
                            <span class="radiobox mr15">
                            <label class="checkbox"><input type="radio" name="open_${result.rowno}" id="${result.mnuId}_openY" value="1" onclick="updateCheck('${result.mnuId}')" <c:if test="${result.openYn eq '1'}">checked</c:if>><span class="icon"></span></label> 공개
                            </span>

                            <span class="radiobox">
                            <label class="checkbox"><input type="radio" name="open_${result.rowno}" id="${result.mnuId}_openN" value="0" onclick="updateCheck('${result.mnuId}')" <c:if test="${result.openYn ne '1'}">checked</c:if>><span class="icon"></span></label> 비공개
                            </span>
                        </td>

                        <td align="center" class="listtd" style="display:none"><c:out value="${result.ownCoId}"/></td>
                        <td align="center" class="listtd" style="display:none"><c:out value="${result.mnuId}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>


        </li>
    </ul>
</div>

<script language="javascript">

	var g_isInsert = true;

	$('.btn_search').on('click', function () {
		getMaster();
	});

	$('#table-1 > tbody > tr').on('click', function(){
		$(this).parent().children().removeClass('on');
		$(this).addClass('on');
	});

	function updateCheck(mnuId){
		var params = {
	    		'mnuId' : mnuId
	    		,'openYn' : $('#'+mnuId+'_openY').is(':checked')?'1':$('#'+mnuId+'_openY').is(':checked')?'0':''
	     	};
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/updateOwner.do',
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
		};
		//console.log(params);

		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getOwnerList.do',
			success : function (resp) {
				//console.log(resp);
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";

				result.forEach (function (el, index) {
					appendRow += '<tr>'
						+'<td align="center" class="listtd">'+el.mnuNm+'</td>'
						+'<td align="center" class="listtd">'+el.mnuDesc+'</td>'
						+'<td align="center" class="listtd">'+el.ownCoNm+'</td>'

						+'<td>'
						+'<span class="radiobox mr15">'
						+'<label class="checkbox">'
						+'<input type="radio" name="open_'+el.rowno+'" id="'+el.mnuId+'_openY" value="1" onclick="updateCheck(\''+el.mnuId+'\')" '+(el.openYn==1?'checked':'')+'>'
						+'<span class="icon"></span></label> 공개</span>'
						+'<span class="radiobox mr15">'
						+'<label class="checkbox">'
						+'<input type="radio" name="open_'+el.rowno+'" id="'+el.mnuId+'_openN" value="1" onclick="updateCheck(\''+el.mnuId+'\')" '+(el.openYn!=1?'checked':'')+'>'
						+'<span class="icon"></span></label> 비공개</span></td>'

						+'<td align="center" class="listtd" style="display:none">'+el.ownCoId+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.mnuId+'</td>'
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

</script>
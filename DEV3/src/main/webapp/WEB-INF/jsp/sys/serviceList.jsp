<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=j5co10chpb"></script>
<div class="contentsWrap">
	<div class="contents_bg"></div>
	<p class="title ${fav}">${pageName.srnNm}</p>
	<ul class="search_box">
		<li>
			<input type="text" value="" name="coNm" id="coNm" class="input1" placeholder="<fmt:message key="SERVICE_GRP_NAME" bundle="${bundle}"/>">
		</li>
		<li>
			<button class="btn_search" id="btn_search"><fmt:message key="SEARCH" bundle="${bundle}"/></button>
		</li>
	</ul>

	<ul class="contents">
		<li class="view">
			<div class="stitle">
                <p class="tl"><span class="cnt"><fmt:message key="TOTAL" bundle="${bundle}"/> <strong id="totCnt">${totCnt}</strong> <fmt:message key="COUNT2" bundle="${bundle}"/></span></p>
				<p class="bbs_btn">
					<a href="#" class="btn_bbs btn_write pop_reg" data-pop="write-1"><fmt:message key="NEW" bundle="${bundle}"/></a>
					<a href="#" class="btn_bbs btn_edit pop_mod" data-pop="write-1"><fmt:message key="MOD" bundle="${bundle}"/></a>
					<!-- <a href="#" class="btn_bbs btn_file pop_mod" data-pop="write-1">저장</a>
					<a href="#" class="btn_bbs btn_init pop_mod" data-pop="write-1">초기화</a>
					<a href="#" class="btn_bbs btn_cali pop_mod" data-pop="write-1">컬리브레이션</a>
					<a href="#" class="btn_bbs btn_approve pop_mod" data-pop="write-1">승인</a>
					<a href="#" class="btn_bbs btn_delete pop_del" id="pop_del-1" data-pop="write-1">삭제</a> -->
				</p>
			</div>

			<table class="table">
				<colgroup>
					<col style="width: 48px">
                    <col style="width: 120px">
                    <col style="width: 120px">
                    <col style="width: 120px">
                    <col style="width: 200px">
                    <col style="width: *">
					<col style="width: calc(150px - 0px)">
				</colgroup>
				<thead>
					<tr>
					<th>No.</th>
					<th><fmt:message key="SERVICE_GRP_ID" bundle="${bundle}"/></th>
					<th><fmt:message key="SERVICE_GRP_NAME" bundle="${bundle}"/></th>
					<th><fmt:message key="MANAGER_NAME" bundle="${bundle}"/></th>
					<th><fmt:message key="MANAGER_EMAIL" bundle="${bundle}"/></th>
					<th><fmt:message key="ADDRESS" bundle="${bundle}"/></th>
					<th><fmt:message key="USE_YN" bundle="${bundle}"/></th>
					</tr>
				</thead>
			</table>

			<div class="tbody" style="overflow-y:scroll">
				<table class="table" id="table-1">
					<colgroup>
						<col style="width: 48px">
						<col style="width: 120px">
						<col style="width: 120px">
						<col style="width: 120px">
						<col style="width: 200px">
						<col style="width: *">
						<col style="width: calc(150px - 17px)">
					</colgroup>
		        	<tbody>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
							<td align="center" class="listtd"><c:out value="${result.rowno}"/></td>
							<td align="center" class="listtd"><c:out value="${result.coId}"/></td>
							<td align="center" class="listtd"><c:out value="${result.coNm}"/></td>
							<td align="center" class="listtd"><c:out value="${result.rdrtrNm}"/></td>
							<td align="center" class="listtd"><c:out value="${result.emailAddr}"/></td>
							<td align="center" class="listtd"><c:out value="${result.roadnmAddr}"/> <c:out value="${result.roadnmdtlAddr}"/></td>
							<td align="center" class="listtd">
							<%-- <c:out value="${result.useYn}"/> --%>
								<c:choose>
									<c:when test="${result.useYn eq 'Y'}"><fmt:message key="USE" bundle="${bundle}"/></c:when>
									<c:when test="${result.useYn eq 'N'}"><fmt:message key="UNUSE" bundle="${bundle}"/></c:when>
								</c:choose>
							</td>
							<td align="center" class="listtd" style="display:none;"><c:out value="${result.hpNo}"/></td>
							<td align="center" class="listtd" style="display:none;"><c:out value="${result.telNo}"/></td>
							<td align="center" class="listtd" style="display:none;"><c:out value="${result.roadzpNo}"/></td>
							<td align="center" class="listtd" style="display:none;"><c:out value="${result.roadnmAddr}"/></td>
							<td align="center" class="listtd" style="display:none;"><c:out value="${result.roadnmdtlAddr}"/></td>
							<td align="center" class="listtd" style="display:none;"><c:out value="${result.cdNa}"/></td>
							<td align="center" class="listtd" style="display:none;"><c:out value="${result.wtX}"/></td>
							<td align="center" class="listtd" style="display:none;"><c:out value="${result.wtY}"/></td>
							<td align="center" class="listtd" style="display:none;"><c:out value="${result.nmNa}"/></td>
							<td align="center" class="listtd" style="display:none;"><c:out value="${result.mapMinSize}"/></td>
							<td align="center" class="listtd" style="display:none;"><c:out value="${result.mapMaxSize}"/></td>
							<td align="center" class="listtd" style="display:none;"><c:out value="${result.areaCodeLv2}"/></td>
							<td align="center" class="listtd" style="display:none;"><c:out value="${result.areaCodeLv1}"/></td>
							<td align="center" class="listtd" style="display:none;" ><c:out value="${result.useYn}"/></td>
						</tr>
					</c:forEach>
		        	</tbody>
				</table>
			</div>

		</li>
	</ul>

	<div class="pop_wrap" id="pop_write-1" >
	    <div class="pop_box">
			<div class="pop_content">
				<h3 class="pop_tit">
				   <fmt:message key="SERVICE_INFO" bundle="${bundle}"/>
				</h3>

				<ul class="user_write">
					<li>
						<table class="table_write">
							<tbody>
								<tr>
									<th><fmt:message key="SERVICE_GRP_ID" bundle="${bundle}"/><span class="remark"></span></th>
									<td><input type="text" value="" name="coId" id="p1_coId" class="input3" placeholder="" disabled="true" oninput="this.value = this.value.replace(/[^a-zA-Z0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength=5></td>
									<th><fmt:message key="SERVICE_GRP_NAME" bundle="${bundle}"/><span class="remark"></span></th>
									<td><input type="text" value="" name="coNm" id="p1_coNm" class="input3" placeholder=""></td>
								</tr>
								<tr>
									<th><fmt:message key="MANAGER_NAME" bundle="${bundle}"/><span class="remark"></span></th>
									<td><input type="text" value="" name="rdrtrNm" id="p1_rdrtrNm" class="input3" placeholder=""></td>
									<th><fmt:message key="MANAGER_EMAIL" bundle="${bundle}"/><span class="remark"></span></th>
									<td><input type="text" value="" name="emailAddr" id="p1_emailAddr" class="input3" placeholder=""></td>
								</tr>
								<tr>
									<th><fmt:message key="TEL" bundle="${bundle}"/></th>
									<td><input type="text" value="" name="telNo" id="p1_telNo" class="input3" placeholder=""></td>
									<th><fmt:message key="PHONE_NUM" bundle="${bundle}"/></th>
									<td><input type="text" value="" name="hpNo" id="p1_hpNo" class="input3" placeholder=""></td>
								</tr>
								<tr>
									<th><fmt:message key="ADDRESS" bundle="${bundle}"/></th>
									<td colspan="3">
										<div class="addr_wrap">
                                            <span class="addr_box">
                                                <input type="hidden" id="p1_roadzpNo" placeholder="우편번호">
                                                <input type="text" id="p1_roadnmAddr" class="input9" placeholder="<fmt:message key="ADDRESS" bundle="${bundle}"/>">
                                                <button class="search_btn" onclick="execDaumPostcode()"></button>
                                            </span>
                                            <input type="text" name="roadnmdtlAddr" id="p1_roadnmdtlAddr" class="input3" placeholder="<fmt:message key="DETAIL_ADDRESS" bundle="${bundle}"/>" style="flex: 1;">
                                        </div>
									</td>
									<!-- <th>홈페이지</th>
									<td><input type="text" value="" name="hpgAddr" id="p1_hpgAddr" class="input3" placeholder=""></td> -->
								</tr>
								<%-- <tr>
									<th><fmt:message key="X_POINT" bundle="${bundle}"/></th>
									<td><input type="text" value="" name="wtX" id="p1_wtX" class="input3" placeholder=""></td>
									<th><fmt:message key="Y_POINT" bundle="${bundle}"/></th>
									<td><input type="text" value="" name="wtY" id="p1_wtY" class="input3" placeholder=""></td>
								</tr> --%>
								<tr>
									<th><fmt:message key="MAP_CENTER_SELECT" bundle="${bundle}"/><span class="remark"></span></th>
 									<!--<td><input type="text" value="" name="wtX" id="p1_wtX" class="input3" placeholder=""></td> -->
 									<!--<td><input type="text" value="" name="wtY" id="p1_wtY" class="input3" placeholder=""></td> -->
 									<td colspan="3">
										<!-- ul class="search_box level_list" style="min-width: 1170px; margin-top:0px; width: calc(100% - 400px);">
										<ul class="search_box level_list"> -->
										<ul>
											<li>
												<span class="selectBox resp bottom" id="msgdivCd_span">
													<button class="label" id="level1" data-code="" data-lat="" data-lng="">Level1</button>
													<ul class="optionList" id="level1_ul" style="max-height: 200px;">
														<li class="optionItem" >전체</li>
														<li class="optionItem" >Kedah, Malaysia</li>
														<li class="optionItem" data-code="dd" >Level1</li>
													</ul>
												</span>
												<span class="selectBox resp bottom" id="msgdivCd_span">
													<button class="label" id="level2" data-code="" data-lat="" data-lng="">Level2</button>
													<ul class="optionList" id="level2_ul" style="max-height: 200px;">
														<li class="optionItem" >전체</li>
														<li class="optionItem" >07100 Langkawi</li>
														<li class="optionItem" >Level2</li>
													</ul>
												</span>
											</li>
										</ul>
										<!-- </ul> -->
									</td>
								</tr>
                                <tr>
									<th><fmt:message key="MAP_SIZE" bundle="${bundle}"/> (<fmt:message key="MIN_VALUE" bundle="${bundle}"/>)<span class="remark"></span></th>
									<td><input type="text" value="" name="wtY" id="map_MinSize" class="input3" placeholder="<fmt:message key="MIN_VALUE" bundle="${bundle}"/>"></td>
									<th><fmt:message key="MAP_SIZE" bundle="${bundle}"/> (<fmt:message key="MAX_VALUE" bundle="${bundle}"/>)<span class="remark"></span></th>
									<td><input type="text" value="" name="wtX" id="map_MaxSize" class="input3" placeholder="19" disabled></td>
								</tr>

								<tr>
									<th><fmt:message key="NATION" bundle="${bundle}"/></th>
								<!-- 	<td><input type="text" value="" name="wtX" id="p1_wtX" class="input3" placeholder=""></td> -->

								    <td>
                                    <span class="selectBox top border" id="p1_cdNa_span">
                                        <button class="label" id="p1_cdNa" data-code="">국가</button>
                                        <ul class="optionList" id="selectCdna">
                                            <c:forEach var="select1" items="${naList}" varStatus="status">
                                                <li class="optionItem" data-code="${select1.cdId}">${select1.cdNm}</li>
                                            </c:forEach>
                                        </ul>
                                    </span>
                                    </td>

									<th><fmt:message key="USE_YN" bundle="${bundle}"/></th>
									<td><label class="checkbox"><input type="checkbox" name="useYn" id="p1_useYn" value="1"><span class="icon"></span></label></td>
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


<div id="layer" class="pop_wrap" style="display:none;position:fixed;overflow:hidden;-webkit-overflow-scrolling:touch;">`
<div class="pop_box" style="width:360px;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	<div class="pop_content" id="pop_zip">
	</div>

</div>

</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('pop_zip');

    let searchLv;

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        $('#layer').stop().fadeOut(300);
        //element_layer.style.display = 'none';
    }

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample2_extraAddress").value = extraAddr;

                } else {
                    //document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('p1_roadzpNo').value = data.zonecode;
                document.getElementById("p1_roadnmAddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("p1_roadnmdtlAddr").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                //element_layer.style.display = 'none';
                $('#layer').stop().fadeOut(300);
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);
        $('#layer').stop().fadeIn(300);


        // iframe을 넣은 element를 보이게 한다.
        //element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 360; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께
        var element_layer_pop = document.getElementById('pop_zip');
        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer_pop.style.width = width + 'px';
        element_layer_pop.style.height = height + 'px';
        //element_layer_pop.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer_pop.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer_pop.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>

<script language="javascript">


//getMasterPopSearch();
//getMasterPopSearch2();

var g_isInsert = true;


$('.pop_close1').on('click', function () {
	$('#pop_search1').stop().fadeOut(300);
});


$('#btn_search').on('click', function () {
		getMaster();
	});

	$('.search_btn').on('click', function () {
		let target_pop = $(this).data('pop');

        var row = $('#table-1 > tbody > .on');

        $('#pop_'+target_pop).stop().fadeIn(300);
        if($('.pop_wrap').length){
            $('#pop_'+target_pop).stop().fadeIn(300);
        }
	});

	$("#coNm").keydown(function(keyNum){
		if(keyNum.keyCode == 13){
			$("#btn_search").click();
		}
	});

	$('#ps_search').on('click', function () {
		getMasterPopSearch();
	});

	$('#ps_search2').on('click', function () {
		getMasterPopSearch2();
	});

	$('#table-1 > tbody > tr').on('click', function(){
		$(this).parent().children().removeClass('on');
		$(this).addClass('on');
	});

	$('.confirm').on('click', function(){
		var params = {
  			'coId' : $('#table-1 > tbody > .on').find('td:eq(3)').text()
  			,'emailAddr' : $('#table-1 > tbody > .on').find('td:eq(6)').text()
  			,'rdrtrNm' : $('#table-1 > tbody > .on').find('td:eq(5)').text()
  			,'reqServiceList' : $('#table-1 > tbody > .on').find('td:eq(18)').text()
   		};
		if($('#table-1 > tbody > .on').find('td:eq(1)').text()=='미승인'){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/confirmService.do',
				success : function (resp) {
					//console.log(resp);
					var json = JSON.parse(resp);
					var result = json.result;
					$('#btn_search').click();
				},
				error : function(err){
					console.log(err);
				}
			});
		}

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

		$("#confirm_msg").html("<fmt:message key="Q_DELETE" bundle="${bundle}"/>"); //삭제하시겠습니까?
		$('#pop_confirm').stop().fadeIn(300);
        $('#pop_confirm').stop().fadeIn(300);


        $('.btn_select.pop_confirm_select').off('click');
        $('.btn_select.pop_confirm_select').on('click', function(){

           	var params = {
          			'coId' : $('#table-1 > tbody > .on').find('td:eq(3)').text()
           		};

           	$.ajax({
    			type : 'POST',
    			data : params,
    			dataType : 'text',
    			url : '/deleteService.do',
    			success : function (resp) {
    				//console.log(resp);
    				var json = JSON.parse(resp);
    				var result = json.result;
					$('#pop_confirm').hide();
    				$('#btn_search').click();
    			},
    			error : function(err){
    				console.log(err);
    			}
    		});
    	});
	});

	$('#pop_save-1').on('click', function(){
		var params = {
			'coId':$('#p1_coId').val()
			,'coNm':$('#p1_coNm').val()
			,'rdrtrNm':$('#p1_rdrtrNm').val()
			,'emailAddr':$('#p1_emailAddr').val()
			,'roadzpNo':$('#p1_roadzpNo').val()
			,'roadnmAddr':$('#p1_roadnmAddr').val()
			,'roadnmdtlAddr':$('#p1_roadnmdtlAddr').val()
			,'telNo':$('#p1_telNo').val()
			,'hpNo' :$('#p1_hpNo').val()
			,'useYn':$('#p1_useYn').is(':checked')?$('#p1_useYn').val():''
			,'hpgAddr' : $('#p1_hpgAddr').val()
			//,'wtX'  : $('#p1_wtX').val()
			//,'wtY'  : $('#p1_wtY').val()
			,'mapMinSize'  : $('#map_MinSize').val()
			//,'mapMaxSize'  : $('#map_MaxSize').val()
			,'mapMaxSize'  : '19'
			,'cdNa' : $('#p1_cdNa').data('code')
			, 'areaCodeLv1' : $('#level1').data('code')
			, 'areaCodeLv2' : $('#level2').data('code')
			, 'wtX' : $("#level2").data('lat')
			, 'wtY' : $("#level2").data('lng')
		};

		//console.log(params)

  	 if(valid(params)){
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : (g_isInsert?'/insertService.do':'/updateService.do'),
				success : function (resp) {
					console.log(resp);
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

		if(!params.coId){
			cnt += 1;
			msg += "<fmt:message key="INPUT_SERVICE_ID" bundle="${bundle}"/><br>";
		}

		if(!params.coNm){
			cnt += 1;
			msg += "<fmt:message key="SERVICE_GRP_REQUIRED" bundle="${bundle}"/><br>";
		}

		if(!params.rdrtrNm){
			cnt += 1;
			msg += "<fmt:message key="MANAGER_REQUIRED" bundle="${bundle}"/><br>";
		}

		if(!params.emailAddr){
			cnt += 1;
			msg += "<fmt:message key="EMAIL_REQUIRED" bundle="${bundle}"/><br>";
		}

		if(!CheckEmail(params.emailAddr)){
			cnt += 1;
			msg += "<fmt:message key="INVALID_ADMIN_EMAIL" bundle="${bundle}"/><br>";
		}

		if(!params.mapMinSize){
			cnt += 1;
			msg += "<fmt:message key="INPUT_MIN_SIZE" bundle="${bundle}"/><br>";
		}

		//, 'centerCode' : $('#level2').data('code')
		//, 'wtX' : $("#level2").data('lat')
		//, 'wtY' : $("#level2").data('lng')

		if(!params.areaCodeLv2){
			cnt += 1;
			msg += "<fmt:message key="MAP_CENTER_REQUIRED" bundle="${bundle}"/>";
		}


		if(cnt>0){
			$("#alert_msg").html(msg);
			$('#pop_alert').stop().fadeIn(300);
	        $('#pop_alert').stop().fadeIn(300);
	        bool = false;
		}

		return bool;

	}

	function CheckEmail(str){
	    var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	    if(!reg_email.test(str)) {
	         return false;
	    }
	    else {
	         return true;
	    }
	}

	function getMaster(){
		$('#table-1 tbody tr').remove();

		var params = {
			'coNm':$('#coNm').val()
		};

		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getServiceList.do',
			success : function (resp) {
				//console.log(resp);
				var json = JSON.parse(resp);
				var result = json.result;
				var resultCode = json.resultCode;
				var appendRow = "";

				result.forEach (function (el, index) {

					var useYn = getUseYn(el.useYn);

					appendRow += '<tr class="'+(el.rowno==1?'on':'')+'">'
						+'<td align="center" class="listtd">'+el.rowno+'</td>'
						+'<td align="center" class="listtd">'+el.coId+'</td>'
						+'<td align="center" class="listtd">'+el.coNm+'</td>'
						+'<td align="center" class="listtd">'+el.rdrtrNm+'</td>'
						+'<td align="center" class="listtd">'+el.emailAddr+'</td>'
						+'<td align="center" class="listtd">'+el.roadnmAddr+ ' ' + el.roadnmdtlAddr + '</td>'
						+'<td align="center" class="listtd">'+useYn+'</td>'
						/* +'<td align="center" class="listtd">'+el.useYn+'</td>' */
						+'<td align="center" class="listtd" style="display:none;">'+el.hpNo+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.telNo+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.roadzpNo+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.roadnmAddr+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.roadnmdtlAddr+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.cdNa+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.wtX+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.wtY+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.nmNa+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.mapMinSize+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.mapMaxSize+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.areaCodeLv2+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.areaCodeLv1+'</td>'
						+'<td align="center" class="listtd" style="display:none;">'+el.useYn+'</td>'

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

	function getMasterPopSearch(){
		$('#table-ps tbody tr').remove();
		var params = {
			'wtNm':$('#ps_wtNm').val()
		};

		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getDistrictList.do',
			success : function (resp) {
				//console.log(resp);
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";

				//console.log(result);
				result.forEach (function (el, index) {
					appendRow += '<tr>'
						+'<td>'+el.rowno+'</td>'
						+'<td>'+el.districtNm1+'</td>'
						+'<td>'+el.districtNm2+'</td>'
						+'<td>'+el.districtNm3+'</td>'
						+'<td>'+el.districtX+'</td>'
						+'<td>'+el.districtY+'</td>'
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
	function getMasterPopSearch2(){
		$('#table-ps2 tbody tr').remove();
		var params = {
			'wtNm':$('#ps_wtNm2').val()
		};

		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getStationList.do',
			success : function (resp) {
				//console.log(resp);
				var json = JSON.parse(resp);
				var result = json.result;
				var appendRow = "";

				//console.log(result);
				result.forEach (function (el, index) {
					appendRow += '<tr>'
						+'<td>'+el.rowno+'</td>'
						+'<td>'+el.stationRegion+'</td>'
						+'<td>'+el.stationNm+'</td>'
						+'<td>'+el.stationAddr+'</td>'
						+'</tr>';
				});
				$('#table-ps2 > tbody').append(appendRow);

				$('#ps_totCnt2').text(result.length);

				$('#table-ps2 > tbody > tr').on('click', function(){
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

		//const cdNa = document.getElementById('p1_cdNa');

		if(target_pop=='write-1'){
			if(row.length) {

				$('#p1_coId').val(row.find('td:eq(1)').text());
				//$('#p1_coId').prop("disabled",true);

				$('#p1_coNm').val(row.find('td:eq(2)').text());

				$('#p1_rdrtrNm').val(row.find('td:eq(3)').text());
				$('#p1_emailAddr').val(row.find('td:eq(4)').text());
				$('#p1_emailAddr').prop("disabled", true);


				$('#p1_roadzpNo').val(row.find('td:eq(9)').text());
				$('#p1_roadnmAddr').val(row.find('td:eq(10)').text());
				$('#p1_roadnmdtlAddr').val(row.find('td:eq(11)').text());


				$('#p1_telNo').val(row.find('td:eq(8)').text());
				$('#p1_hpNo').val(row.find('td:eq(7)').text());
				$('#p1_hpgAddr').val(row.find('td:eq(5)').text()); //

				$('#p1_useYn').prop('checked',row.find('td:eq(20)').text()=='Y'?true:false);

				$('#p1_wtX').val(row.find('td:eq(13)').text());
				$('#p1_wtY').val(row.find('td:eq(14)').text());
				$('#p1_cdNa').text(row.find('td:eq(15)').text());
				//cdNa.setAttribute('data-code', row.find('td:eq(12)').text());
				$('#p1_cdNa').data('code',row.find('td:eq(12)').text());
				$('#map_MinSize').val(row.find('td:eq(16)').text());
				$('#map_MaxSize').val(row.find('td:eq(17)').text());

				//console.log($('#p1_cdNa').data('code'));

				setLevelList(1, '');

				$('#level1').text("");
				$('#level2').text("");

				if (document.querySelector('.optionItem[data-code="' + row.find('td:eq(19)').text() + '"]') != null) {
				//if (row.find('td:eq(19)').text().length > 0 ) {

					const selectedItemLv1 = document.querySelector('.optionItem[data-code="' + row.find('td:eq(19)').text() + '"]');
					//const lat1 = selectedItemLv1.dataset.lat;
				    //const lng1 = selectedItemLv1.dataset.lng;
					const area1 = selectedItemLv1.textContent;

					$('#level1').text(area1);
					$('#level1').data('code', row.find('td:eq(19)').text());

					setLevelList(2, row.find('td:eq(19)').text());

					const selectedItemLv2 = document.querySelector('.optionItem[data-code="' + row.find('td:eq(18)').text() + '"]');
					const area2 = selectedItemLv2.textContent;
					$('#level2').text(area2);
					$('#level2').data('code', row.find('td:eq(18)').text());
					$('#level2').data('lat', row.find('td:eq(13)').text());
					$('#level2').data('lng', row.find('td:eq(14)').text());

				    //console.log('area : ', area1, ' / Latitude:', lat1, ' / Longitude:', lng1);

				} else {

					setLevelList(1, '');
					//setLevelList(2, row.find('td:eq(19)').text());

				}

				//console.log(cdNa.getAttribute('data-code'));
/*
				arrChkService = row.find('td:eq(18)').text().split(',');
				for(var i=0;i<arrChkService.length;i++){
					$('#popchk_'+arrChkService[i]).prop('checked',true);
				}
 */
				g_isInsert = false;
			} else {

				$('#p1_coId').val('');
				$('#p1_coId').prop("disabled",false);

				$('#p1_coNm').val('');

				$('#p1_rdrtrNm').val('');
				$('#p1_emailAddr').val('');
				$('#p1_emailAddr').prop("disabled", false);


				$('#p1_roadzpNo').val('');
				$('#p1_roadnmAddr').val('');
				$('#p1_roadnmdtlAddr').val('');

				$('#p1_telNo').val('');
				$('#p1_hpgAddr').val('');
				$('#p1_hpNo').val('');

				$('#p1_useYn').prop('checked', true);

				$('#p1_wtX').val('');
				$('#p1_wtY').val('');

				$('#p1_cdNa').text('대한민국');
				$('#p1_cdNa').data('code','KR');

				setLevelList(1, '');

				$('#level1').text('');
				$('#level2').text('');

				//cdNa.setAttribute('data-code', 'KR');
/*


				$('input:checkbox[name="chkService"]').prop('checked',false);

				/*
				arrChkService = $('input:checkbox[name="chkService"]').prop('checked',false);
				console.log(arrChkService);
				for (var i=0;i<arrChkService.length;i++){
					arrChkService[i].prop('checked',false);
				}
				*/
				g_isInsert = true;
			}
		}
	};


function setLevelList(level, id){

		//region = "${authInfo.cdNa}";
		//$("#p1_cdNa").data('code');

		var region = $("#p1_cdNa").data('code');

		//document.getElementById('p1_cdNa').dataset.code;
		//console.log(document.getElementById('p1_cdNa').dataset.code);

		// 레벨1인 경우
		if(level == 1){

		 	var node = document.getElementById('level2_ul')
		 	node.innerHTML = '';

		 	$('#level1').data('code','');
		 	$('#level2').data('code','');
		 	$('#level1').text('');
		 	$('#level2').text('');
		 	//var node = document.getElementById('level3_ul')
		 	//node.innerHTML = '';
		 	/* var node = document.getElementById('level4_ul')
		 	node.innerHTML = ''; */
			$.ajax({
				type: "GET",
				url: "${authInfo.restApiUrl}/administrative?region=" + region,
				async:false,
				data: {

				},
				headers: {
			    	'Authorization': 'Bearer ' + localStorage.getItem("accessToken"),
			    	'Refresh-Token': localStorage.getItem("Refresh-Token")
			    },
			    beforeSend:function(){
			         $('#circularG').css('display','block');
			    },
			    complete:function(){
				      $('#circularG').css('display','none');
			    
			    },
				success: function(resp) {

					datas = resp.data;

				 	var node = document.getElementById('level1_ul');
				 	node.innerHTML = '';

	            	var html = '';

		            for(var i = 0; i <datas.length; i++){
		            	data = datas[i];
		            	//html += '<li class="optionItem" data-code="' + data.id + '">' + data.name + '</li>'
		            	html += '<li class="optionItem" data-code="' + data.id + '" data-lat="' + data.center.latitude + '" data-lng="' + data.center.longitude + '">' + data.name + '</li>'
					}

		            node.innerHTML = html;


				}

			})



		} else if(level == 2) {

		 	//var node = document.getElementById('level3_ul')
		 	//node.innerHTML = '';

		 	/* var node = document.getElementById('level4_ul')
		 	node.innerHTML = ''; */

			$.ajax({
				type: "GET",
				url: "${authInfo.restApiUrl}" + "/administrative/" + id + "?region=" + region,
				async:false,
				data: {

				},
				headers: {
			    	'Authorization': 'Bearer ' + localStorage.getItem("accessToken"),
			    	'Refresh-Token': localStorage.getItem("Refresh-Token")
			    },
			    beforeSend:function(){
			         $('#circularG').css('display','block')
			    },
			    complete:function(){
				      $('#circularG').css('display','none')
			    
			    },
				success: function(resp) {

					datas = resp.data

				 	var node = document.getElementById('level2_ul')
				 	node.innerHTML = '';

	            	var html = '';

		            for(var i = 0; i <datas.length; i++){
		            	data = datas[i]
		            	//html += '<li class="optionItem" data-code="' + data.id + '">' + data.name + '</li>'
		            	html += '<li class="optionItem" data-code="' + data.id + '" data-lat="' + data.center.latitude + '" data-lng="' + data.center.longitude + '">' + data.name + '</li>'

					}

		            node.innerHTML = html;
				}

			})


		} else if(level == 3) {

			/* var node = document.getElementById('level4_ul')
		 	node.innerHTML = ''; */

		 	$("#level3").data('code', '');

			$.ajax({
				type: "GET",
				//url: "${authInfo.restApiUrl}/administrative/" + id + "?region=" + region,
				url: "${authInfo.restApiUrl}/administrative/" + id,
				async:false,
				data: {
					region:region
				},
				headers: {
			    	'Authorization': 'Bearer ' + localStorage.getItem("accessToken"),
			    	'Refresh-Token': localStorage.getItem("Refresh-Token")
			    },
			    beforeSend:function(){
			         $('#circularG').css('display','block')
			    },
			    complete:function(){
				      $('#circularG').css('display','none')
			    
			    },
				success: function(resp) {

					datas = resp.data

				 	var node = document.getElementById('level3_ul')
				 	node.innerHTML = '';

	            	//var html = '';
	            	var html = '<li class="optionItem" data-code="" data-lat="" data-lng="">전체</li>';

		            for(var i = 0; i <datas.length; i++){
		            	data = datas[i];
		            	html += '<li class="optionItem" data-code="' + data.id + '" data-lat="' + data.center.latitude + '" data-lng="' + data.center.longitude + '">' + data.name + '</li>'

					}

		            node.innerHTML = html;

				}

			})

		}

		$(".optionItem").off("click").on("click", function(){

			let tmpSelectValue = $(this).text();

			$(this).parents(".selectBox").find(".label").text(tmpSelectValue);
			var value = $(this).data('code');
			var lat = $(this).data('lat');
			var lng = $(this).data('lng');

			if(!value)value='';
			//tmpSelectBox.find(".label").data('code',value);
			$(this).parent().parent().find(".label").data('code',value);
			$(this).parent().parent().find(".label").data('lat',lat);
			$(this).parent().parent().find(".label").data('lng',lng);

			$(this).parents(".selectBox").removeClass("active");
			$(this).parent(".optionList").css("display", "none");


			var levelChk = $(this).parent(".optionList")[0].id;

			if(levelChk == 'level1_ul'){

				// 하위 레벨 초기화
			 	//$('#level4').text('Level4');
			 	//$('#level3').text('Level3');
			 	$("#level2").text('Level2');
			 	$('#level2').data('code', '');
			 	//$('#level4').removeClass("on");
			 	//$('#level3').removeClass("on");
			 	$("#level2").removeClass("on");

				searchLv = 1

				setLevelList(2 ,  $('#level1').data('code'))

			} else if (levelChk == 'selectCdna'){
				$('#p1_cdNa').data('code',value);
				$('#p1_cdNa').text(tmpSelectValue);
				//const temp = document.getElementById('p1_cdNa');

			 	//temp.setAttribute('data-code', temp.dataset.code);
			 	//$('#p1_cdNa').data('code', temp.dataset.code)
			 	//temp.setAttribute('data-lat', '37.4201556');
			 	//temp.setAttribute('data-lng', '127.1262092');

				setLevelList(1, '')
			}
			/* else if (levelChk == 'level2_ul'){


				searchLv = 2

				// 하위 레벨 초기화
			 	$('#level4').text('Level4');
			 	$('#level3').text('Level3');
			 	$('#level4').removeClass("on");
			 	$("#level3").removeClass("on");

				setLevelList(3 ,  $('#level2').data('code'))
			} else if (levelChk == 'level3_ul'){


			 	$('#level4').text('Level4');
			 	$('#level4').removeClass("on");
				searchLv = 3

				//추후처리할수도 있어서 만들어둠
			} */
		});

	}


	//setLevelList(1, '');

</script>
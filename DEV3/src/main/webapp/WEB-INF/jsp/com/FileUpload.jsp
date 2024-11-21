<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=j5co10chpb"></script>

<div class="contentsWrap">
	<div class="contents_bg"></div>
	<p class="title ${fav}">${pageName.srnNm}</p>

	<ul class="contents">
        <%-- <form id="fileUploadForm" name="frmName" method="post" enctype="multipart/form-data" action="/upload.do"> --%>
        <%-- <form id="fileUploadForm" name="frmName" method="post" enctype="multipart/form-data">
		    <input type="file" name="file" id="file"><br/><br/>
		    <!-- <button class="btn_m btn_primary btn_r" id="save_faq">파일 업로드</button> -->
		    <!-- <input type="submit" value="UPLOAD" class="btn_m btn_primary btn_r" id="save_faq"><br/> -->
		</form> --%>

		<li class="view">
				<form id="fileUploadForm" name="frmName" method="post" enctype="multipart/form-data">
				    <input type="file" name="file" id="file" style="display:none">
				    <!-- <button class="btn_m btn_primary btn_r" id="save_faq">파일 업로드</button> -->
				    <!-- <input type="submit" value="UPLOAD" class="btn_m btn_primary btn_r" id="save_faq"><br/> -->
				</form>
			<div class="stitle">
                <p class="tl"><span class="cnt"><fmt:message key="TOTAL" bundle="${bundle}"/> <strong id="totCnt">${totCnt}</strong> <fmt:message key="COUNT2" bundle="${bundle}"/></span></p>
				<!-- <label for="file">
					<div class="btn_m btn_primary btn_r">파일 업로드하기</div>
				</label> -->

				<p class="bbs_btn">
					<%-- <a href="#" class="btn_bbs btn_write pop_reg" data-pop="write-1"><fmt:message key="NEW" bundle="${bundle}"/></a>
					<a href="#" class="btn_bbs btn_edit pop_mod" data-pop="write-1"><fmt:message key="MOD" bundle="${bundle}"/></a> --%>
					<!-- <a href="#" class="btn_bbs btn_delete pop_del" id="pop_del-1" data-pop="write-1">삭제</a> -->
					<!-- <label for="file">
						<div class="btn_m btn_primary btn_r">파일 업로드하기</div>
					</label> -->
					<label class="btn_m btn_primary btn_r" for="file">파일 선택하기</label>
					<!-- <button class="btn_m btn_primary btn_r" id="file">파일 선택</button> -->
					<button class="btn_m btn_primary btn_r" id="save_faq">파일 업로드</button>
				</p>
			</div>

			<table class="table">
				<colgroup>
					<col style="width: 48px">
					<col style="width: 520px">
					<col style="width: 350px">
					<col style="width: 250px">
					<col style="width: 250px">
					<col style="width: 250px">
				</colgroup>
				<thead>
					<tr>
                        <th>No.</th>
                        <th>파일명</th>
                        <th>파일경로</th>
                        <th>파일타입</th>
                        <th>저장자</th>
                        <th>저장날짜</th>
					</tr>
				</thead>
			</table>

			<div class="tbody" style="overflow-y:scroll">
				<table class="table" id="table-1">
					<colgroup>
						<col style="width: 48px">
						<col style="width: 520px">
						<col style="width: 350px">
						<col style="width: 250px">
						<col style="width: 250px">
						<col style="width: calc(250px - 17px)">
					</colgroup>
		        	<tbody>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
							<td align="center" class="listtd"><c:out value="${result.rowno}"/></td>
							<td align="center" class="listtd"><c:out value="${result.fileNm}"/></td>
							<td align="left" class="listtd"><c:out value="${result.filePath}"/></td>
							<td align="left" class="listtd"><c:out value="${result.fileType}"/></td>
							<td align="left" class="listtd"><c:out value="${result.userId}"/></td>
							<td align="center" class="listtd"><c:out value="${result.insertDate}"/></td>
							<%-- <td style="display:none;" align="center" class="listtd"><c:out value="${result.regId}"/></td>
							<td style="display:none;" align="center" class="listtd"><c:out value="${result.regDt}"/></td> --%>
						</tr>
					</c:forEach>
		        	</tbody>
				</table>
			</div>

		</li>



            <!-- table class="table_write">
                <tbody>
                    <tr>
                        <th><fmt:message key="AUTHOR" bundle="${bundle}"/></th>
                        <td>
                        <input type="text" value="${authInfo.usrNm}" name="author" id="author" class="input3" placeholder="" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th><fmt:message key="ID" bundle="${bundle}"/></span></th>
                        <td>
                        <input type="text" value="${authInfo.usrId}" name="userId" id="userId" class="input3" placeholder="" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th><fmt:message key="Q_TITLE" bundle="${bundle}"/></th>
                        <td>
                        <input type="text" value="" name="faqTitle" id="faqTitle" class="input3" placeholder="">
                        </td>
                    </tr>
                    <tr>
                        <th><fmt:message key="Q_CONTENS" bundle="${bundle}"/></th>
                        <td>
                        <textarea name="faqContents" id ="faqContents" cols="30" rows="5"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table-->


            <%-- <div class="btnwrap">
                <!-- <span class="btn_m btn_darkline btn_r" id=""><fmt:message key="CANCEL" bundle="${bundle}"/></span> -->
                <button class="btn_m btn_primary btn_r" id="save_faq"><fmt:message key="SEND_EMAIL" bundle="${bundle}"/></button>
            </div> --%>

	</ul>

</div>

<script language="javascript">

$('#table-1 > tbody > tr').on('click', function(){
	$(this).parent().children().removeClass('on');
	$(this).addClass('on');
});

/* $(document).on('click', '.pop_alert_close', function() {

    location.reload();
});
 */

$('#save_faq').on('click', function(){

	var form = $('#fileUploadForm')[0];
	var formData = new FormData(form);

	var fileValue = $('#file').val().split("\\");
	var fileName = fileValue[fileValue.length-1]; // 파일명

 	//if(valid(fileName)){
 	if(fileName.length > 0){

 		$.ajax({
 			type : 'POST',
 			data : formData,
 			//dataType : 'text',
 			url : '/upload.do',
 			contentType : false,
 			processData : false,
 			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;

				$("#alert_msg").html(result.msg);
				$('#pop_alert').stop().fadeIn(300);
				/* $('#pop_alert').stop().fadeOut(300, function() {
			        // 팝업이 완전히 사라진 후 브라우저 리로드
			        location.reload();
			    }); */
			    /* $('#pop_alert').stop().fadeIn(300, function() {
		            // 팝업이 표시된 후 일정 시간 대기 후 닫음
		            setTimeout(function() {
		                $('#pop_alert').stop().fadeOut(300, function() {
		                    // 팝업 닫기 애니메이션 완료 후 페이지 새로고침
		                    location.reload();
		                });
		            }, 400); // 2초 대기
		        }); */

				/* if(result.code == 0000){
					// 성공시 창닫기
					//$('#pop_write-1').hide();
    				//$('.btn_search').click();
					window.location.reload();
				} */
					//location.reload();
				getFileList();


 			},
 			error : function(err){
 				console.log(err);
 				}
 			});
 		} else {
 			//alert("선택된 파일이 없습니다.");
 			$("#alert_msg").html("선택된 파일이 없습니다.");
 			$("#pop_alert").stop().fadeIn(300);
 	    	$("#pop_alert").stop().fadeIn(300);
 		}



	});

function valid(params){

	/* console.log('authinfo 확인: ${authInfo.usrId}, usrNm');
	var cnt = 0;
	var msg = ""; */
	var bool = true;


/*
	if (!params.senderName){
		cnt += 1;
		msg += "<fmt:message key="AUTHOR_REQUIRED" bundle="${bundle}"/><br>";
	}

	if (!params.senderMail){
		cnt += 1;
		msg += "<fmt:message key="ID_REQUIRED" bundle="${bundle}"/><br>";
	}

	if (!params.subject){
		cnt += 1;
		msg += "<fmt:message key="FAQ_TITLE_REQUIRED" bundle="${bundle}"/><br>";
	}

	if (!params.message){
		cnt += 1;
		msg += "<fmt:message key="FAQ_CONTENTS_REQUIRED" bundle="${bundle}"/>";
	}

	if (cnt > 0) {
		$("#alert_msg").html(msg);
		$('#pop_alert').stop().fadeIn(300);
        $('#pop_alert').stop().fadeIn(300);
        bool = false;
	} */

	return bool;

}

function getFileList(){
	$('#table-1 tbody tr').remove();

	var params = {
		'coId': '${authInfo.coId}'
	};

	$.ajax({
		type : 'POST',
		dataType : 'text',
		data : params,
		url : '/getFileList.do',
		success : function (resp) {
			//console.log(resp);
			var json = JSON.parse(resp);
			var result = json.result;
			var resultCode = json.resultCode;
			var appendRow = "";
			result.forEach (function (el, index) {
				appendRow += '<tr class="'+(el.rowno==1?'on':'')+'">'
					+'<td align="center" class="listtd">' + el.rowno + '</td>'
					+'<td align="center" class="listtd">' + el.fileNm + '</td>'
					+'<td align="left" class="listtd">' + el.filePath + '</td>'
					+'<td align="left" class="listtd">' + el.fileType + '</td>'
					+'<td align="left" class="listtd">' + el.userId + '</td>'
					+'<td align="center" class="listtd">' + el.insertDate + '</td>'
					//+'<td align="center" style="display:none;" class="listtd">'+el.regId+'</td>'
					//+'<td align="center" style="display:none;" class="listtd">'+el.regDt+'</td>'
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
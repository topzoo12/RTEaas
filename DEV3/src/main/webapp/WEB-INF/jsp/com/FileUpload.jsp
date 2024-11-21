<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />
<style>
     form input::file-selector-button {
       display: none;
     }
</style>
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

			<div class="stitle">
                <p class="tl" style="width:100px;"><span class="cnt"><fmt:message key="TOTAL" bundle="${bundle}"/> <strong id="totCnt">${totCnt}</strong> <fmt:message key="COUNT2" bundle="${bundle}"/></span></p>
				<!-- <label for="file">
					<div class="btn_m btn_primary btn_r">파일 업로드하기</div>
				</label> -->

					<!-- <button class="btn_m btn_primary btn_r" id="save_faq">파일 업로드</button> -->
					<!-- <input type="submit" value="UPLOAD" class="btn_m btn_primary btn_r" id="save_faq"><br/> -->

				<form id="fileUploadForm" name="frmName" method="post" enctype="multipart/form-data" style="width:75%; direction: rtl;">
					<input type="file" name="file" id="file" style="width:100%">
				</form>

				<p class="bbs_btn" style="width:224px;">
					<label class="btn_m btn_primary btn_r" for="file" style="cursor: pointer">파일 선택하기</label>
					<!-- <button class="btn_m btn_primary btn_r" id="file">파일 선택</button> -->
					<button class="btn_m btn_primary btn_r" id="save_faq">파일 업로드</button>
				</p>
			</div>

			<table class="table">
				<colgroup>
					<col style="width: 48px">
					<col style="width: 500px">
					<col style="width: 200px">
					<col style="width: 200px">
					<col style="width: 100px">
					<col style="width: 120px">
					<col style="width: 250px">
				</colgroup>
				<thead>
					<tr>
                        <th>No.</th>
                        <th>파일명</th>
                        <th>파일경로</th>
                        <th>파일타입</th>
                        <th>파일사이즈</th>
                        <th>저장자</th>
                        <th>저장날짜</th>
					</tr>
				</thead>
			</table>

			<div class="tbody" style="overflow-y:scroll">
				<table class="table" id="table-1">
					<colgroup>
						<col style="width: 48px">
						<col style="width: 500px">
						<col style="width: 200px">
						<col style="width: 200px">
						<col style="width: 100px">
						<col style="width: 120px">
						<col style="width: calc(250px - 17px)">
					</colgroup>
		        	<tbody>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
							<td align="center" class="listtd"><c:out value="${result.rowno}"/></td>
							<td align="center" class="listtd"><c:out value="${result.fileNm}"/></td>
							<td align="left" class="listtd"><c:out value="${result.filePath}"/></td>
							<td align="left" class="listtd"><c:out value="${result.fileType}"/></td>
							<td align="center" class="listtd"><c:out value="${result.fileSize}"/></td>
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

            <%-- <div class="btnwrap">
                <!-- <span class="btn_m btn_darkline btn_r" id=""><fmt:message key="CANCEL" bundle="${bundle}"/></span> -->
                <button class="btn_m btn_primary btn_r" id="save_faq"><fmt:message key="SEND_EMAIL" bundle="${bundle}"/></button>
            </div> --%>

	</ul>

</div>
<!-- 로딩중 맵용 -->
<div id="circularG" style="display:none">
   <div id="circularG_1" class="circularG map"></div>
   <div id="circularG_2" class="circularG map"></div>
   <div id="circularG_3" class="circularG map"></div>
   <div id="circularG_4" class="circularG map"></div>
   <div id="circularG_5" class="circularG map"></div>
   <div id="circularG_6" class="circularG map"></div>
   <div id="circularG_7" class="circularG map"></div>
   <div id="circularG_8" class="circularG map"></div>
</div>

<script language="javascript">

$('#table-1 > tbody > tr').on('click', function(){
	$(this).parent().children().removeClass('on');
	$(this).addClass('on');
});

var fileNameChk = $('#file').val();


/* var fileInput = document.querySelector('.file');
var nameInput = document.querySelector('.upload-name'); */

$('#file').on('change', function() {
    var fileName = $(this).val().split('\\').pop(); // 파일 경로에서 이름만 추출
    $('#fileName').text(fileName || "선택된 파일 없음");
});

/* fileInput.addEventListener('change', function(e){
  const input = e.target.closest('.file');

  if (!input) return;
  var fileName = input.value.split('/').pop().split('\\').pop();
  nameInput.value = fileName;

}); */

/* $(document).on('click', '.pop_alert_close', function() {

    location.reload();
});
 */

$('#save_faq').on('click', function(){

	var form = $('#fileUploadForm')[0];
	var formData = new FormData(form);


	//console.log("fileValue : ", fileValue, " fileName : ", fileName );
	//var fileSize = $('#file')[0].files[0].size;

 	//if(valid(fileName)){
 	if(valid()){

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

				getFileList();

	 			},
	 			error : function(err){
	 				console.log(err);
	 			},
	 			beforeSend:function(){
	 				$('#circularG').css('display','block')
	 			},
	 			complete : function(data) {
	 				//  실패했어도 완료가 되었을 때 처리
	 				$('#circularG').css('display','none');
	 			}

 			});



 		} /* else {
 			//alert("선택된 파일이 없습니다.");
 			$("#alert_msg").html("선택된 파일이 없습니다.");
 			$("#pop_alert").stop().fadeIn(300);
 	    	$("#pop_alert").stop().fadeIn(300);
 		} */



	});

function valid(){

	/* console.log('authinfo 확인: ${authInfo.usrId}, usrNm');*/
	var cnt = 0;
	var msg = "";
	var bool = true;
/*
	var fileValue = $('#file').val().split("\\");
	var fileName = fileValue[fileValue.length-1]; // 파일명
	*/
	console.log($('#file')[0].files);
	if(!$('#file').val()){
		cnt += 1;
		msg += "선택된 파일이 없습니다."
	} else 	if ($('#file')[0].files[0].size > 524288000) {
		cnt += 1;
		msg += "저장할 수 있는 최대 파일 크기는 500MB 입니다.\n"
	}
/*
	if (fileName.length < 1) {
		cnt += 1;
		msg += "선택된 파일이 없습니다."
	}
*/
	if (cnt > 0) {
		$("#alert_msg").html(msg);
		$('#pop_alert').stop().fadeIn(300);
        $('#pop_alert').stop().fadeIn(300);
        bool = false;
	}

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
					+'<td align="left" class="listtd">' + el.fileSize + '</td>'
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
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

.btn {
	height: 32px;
	border: 1px solid var(--border);
	border-radius: 3px;
	font-size: 14px;
	line-height: 30px;
	padding: 0 8px;
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

				<div class="fileUploadwrap">
					<form id="fileUploadForm" name="frmName" method="post" enctype="multipart/form-data">
						<input type="file" name="file" id="file" readonly>
						<label for="file"><fmt:message key="FILE_SELECT" bundle="${bundle}"/></label>
						<%-- <button class="btn_bgPrimary btn_uploadFile" id="uploadFile"><fmt:message key="FILE_UPLOAD" bundle="${bundle}"/></button> --%>
						<fileBtn class="btn_bgPrimary btn_uploadFile" id="uploadFile"><fmt:message key="FILE_UPLOAD" bundle="${bundle}"/></fileBtn>
					</form>
				</div>
			</div>

			<table class="table">
				<colgroup>
					<col style="width: 48px">
					<col style="width: 500px">
					<%-- <col style="width: 200px"> --%>
					<col style="width: 150px">
					<col style="width: 250px">
					<col style="width: 250px">
					<%-- <col style="width: 200px"> --%>
				</colgroup>
				<thead>
					<tr>
                        <th>No.</th>
                        <th><fmt:message key="FILE_NAME" bundle="${bundle}"/></th>
                        <!-- <th>파일타입</th> -->
                        <th><fmt:message key="FILE_SIZE" bundle="${bundle}"/></th>
                        <th><fmt:message key="REG_USER" bundle="${bundle}"/></th>
                        <th><fmt:message key="REG_DT" bundle="${bundle}"/></th>
                        <!-- <th>파일경로</th> -->
					</tr>
				</thead>
			</table>

			<div class="tbody" style="overflow-y:scroll; height: 660px;">
				<table class="table" id="table-1">
					<colgroup>
						<col style="width: 48px">
						<col style="width: 500px">
						<%-- <col style="width: 200px"> --%>
						<col style="width: 150px">
						<col style="width: 250px">
						<col style="width: calc(250px - 17px)">
						<%-- <col style="width: 200px"> --%>
					</colgroup>
		        	<tbody>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
							<td align="center" class="listtd"><c:out value="${result.rowno}"/></td>
							<td align="left" class="listtd"><c:out value="${result.fileNm}"/></td>
							<%-- <td align="left" class="listtd"><c:out value="${result.fileType}"/></td> --%>
							<%-- <td align="right" class="listtd"><c:out value="${result.fileSize}"/></td> --%>
							<td align="right" class="listtd"><fmt:formatNumber value="${result.fileSize}" pattern="#,###" />&nbsp;&nbsp;&nbsp; byte</td>
							<td align="center" class="listtd"><c:out value="${result.userId}"/></td>
							<td align="center" class="listtd"><c:out value="${result.insertDate}"/></td>
							<td style="display:none;" align="left" class="listtd"><c:out value="${result.filePath}"/></td>
							<td style="display:none;" align="center" class="listtd"><c:out value="${result.seqNo}"/></td>
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
//console.log("${resultList}");

$('#table-1 > tbody > tr').on('click', function(){
	$(this).parent().children().removeClass('on');
	$(this).addClass('on');
});

$('#table-1 > tbody > tr').on('dblclick', function(){
//	$(this).parent().children().removeClass('on');
//	$(this).addClass('on');
	//alert("1111111111111111111");
	 //let target_pop = $(this).data('pop');
	 //console.log(target_pop)

	var row = $('#table-1 > tbody > .on');
	//console.log(row.find('td:eq(6)').text());
	//console.log(Math.floor(row.find('td:eq(6)').text()));

     if(!row.length){
     	return
     }

	 var params = {
				'seqNo':Math.floor(row.find('td:eq(6)').text())
			};
	 //.lastIndexOf("5")

	//console.log("----------------------------------------------------------")
	//console.log(row.find('td:eq(1)').text().substr(row.find('td:eq(1)').text().lastIndexOf(".")));
	//console.log(row.find('td:eq(1)').text().substr(0, row.find('td:eq(1)').text().lastIndexOf(".")));
	//console.log("----------------------------------------------------------")

	var form = document.createElement("form");

	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post");  //Post 방식
	form.setAttribute("action", "/fileDownload.do"); //요청 보낼 주소

	var hiddenFieldFileNm = document.createElement("input");

	hiddenFieldFileNm.setAttribute("type", "hidden");
	hiddenFieldFileNm.setAttribute("name", "fileNm");
	hiddenFieldFileNm.setAttribute("value", row.find('td:eq(1)').text().substr(0, row.find('td:eq(1)').text().lastIndexOf(".")));
	form.appendChild(hiddenFieldFileNm);

	var hiddenFieldFileExt = document.createElement("input");

	hiddenFieldFileExt.setAttribute("type", "hidden");
	hiddenFieldFileExt.setAttribute("name", "fileExt");
	hiddenFieldFileExt.setAttribute("value", row.find('td:eq(1)').text().substr(row.find('td:eq(1)').text().lastIndexOf(".")+1));
	form.appendChild(hiddenFieldFileExt);

	var hiddenFieldSeqNo = document.createElement("input");

	hiddenFieldSeqNo.setAttribute("type", "hidden");
	hiddenFieldSeqNo.setAttribute("name", "seqNo");
	hiddenFieldSeqNo.setAttribute("value", Math.floor(row.find('td:eq(6)').text()));
	form.appendChild(hiddenFieldSeqNo);

	document.body.appendChild(form);
    form.submit();

});

var fileNameChk = $('#file').val();

$('#file').on('change', function() {
    var fileName = $(this).val().split('\\').pop(); // 파일 경로에서 이름만 추출
    $('#fileName').text(fileName || "No Selected File");

});

$('#uploadFile').on('click', function(){

	var form = $('#fileUploadForm')[0];
	var formData = new FormData(form);

	//console.log("fileValue : ", fileValue, " fileName : ", fileName );
	//var fileSize = $('#file')[0].files[0].size;

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

				$('#file').val('');

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

	var cnt = 0;
	var msg = "";
	var bool = true;

	if(!$('#file').val()){
		cnt += 1;
		msg += "<fmt:message key="NO_SELECTED_FILE" bundle="${bundle}"/>"
	} else if ($('#file')[0].files[0].size > 10485760) {
		//10485760		/ 10메가
		//524288000		/ 500메가
		cnt += 1;
		msg += "<fmt:message key="SAVE_MAX_FILE_SIZE" bundle="${bundle}"/>\n"
	}

	if (cnt > 0) {
		$("#alert_msg").html(msg);
		console.log("Fade in triggered");
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
					+'<td align="left" class="listtd">' + el.fileNm + '</td>'
					//+'<td align="left" class="listtd">' + el.filePath + '</td>'
					//+'<td align="left" class="listtd">' + el.fileType + '</td>'
					+'<td align="right" class="listtd">' + el.fileSize.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '&nbsp;&nbsp;&nbsp; byte </td>'
					+'<td align="center" class="listtd">' + el.userId + '</td>'
					+'<td align="center" class="listtd">' + el.insertDate + '</td>'
					//+'<td align="center" style="display:none;" class="listtd">'+el.regId+'</td>'
					//+'<td align="center" style="display:none;" class="listtd">'+el.regDt+'</td>'
					//<fmt:formatNumber value="${result.fileSize}" pattern="#,###" />&nbsp;&nbsp;&nbsp; byte
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
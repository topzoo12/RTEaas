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
        <div class="faqwrap">
            <table class="table_write">
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
            </table>

            <div class="btnwrap">
                <!-- <span class="btn_m btn_darkline btn_r" id=""><fmt:message key="CANCEL" bundle="${bundle}"/></span> -->
                <button class="btn_m btn_primary btn_r" id="save_faq"><fmt:message key="SEND_EMAIL" bundle="${bundle}"/></button>
            </div>
        </div>
	</ul>

</div>

<script language="javascript">

	$('#save_faq').on('click', function(){
	var params = {
		'senderName':$('#author').val(),
		'senderMail':$('#userId').val(),
		'subject':$('#faqTitle').val(),
		'message':$('#faqContents').val()
	};

	if(valid(params)){
		$.ajax({
			type : 'POST',
			data : params,
			//dataType : 'text',
			url : '/sendFaq.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;

				$("#alert_msg").html(result.msg);
				$('#pop_alert').stop().fadeIn(300);

			    // 입력값 초기화
			    $('#faqTitle').val('');
			    $('#faqContents').val('');

			},
			error : function(err){
				console.log(err);
				}
			});
		}
	});

function valid(params){

	var cnt = 0;
	var msg = "";
	var bool = true;

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
	}

	return bool;

}

</script>
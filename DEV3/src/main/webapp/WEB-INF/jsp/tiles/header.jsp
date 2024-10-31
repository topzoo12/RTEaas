<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<form name="frmLogout" action="/logout.do" method="POST">
</form>
<form name="frmSessionChange" action="/sessionChange.do" method="POST">
	<input type="hidden" value="" name="coId" id="sessionChangeCoId">
	<input type="hidden" value="" name="coNm" id="sessionChangeCoNm">
</form>
<div class="container">
	<div class="logo">
		<a href="/main.do">
			<!-- <strong class="header-title">RTEaaS</strong> <span class="header-content hidden">Road & Traffic Experience as a Service</span>
			<strong class="header-title" style="margin-left:30px; font-size: 2.6rem;"> AI Service Platform</strong> -->
		</a>
	</div>
	<div class="member">
        <c:if test="${authInfo.sessionUserId eq 'blee@zieumtn.com'}">
            <span class="selectBox bottom" id="sessionCoId_span">
            <button class="label" id="sessionCoId" data-code="${authInfo.sessionCoId}">${authInfo.sessionCoNm}</button>
            <ul class="optionList">
            <c:forEach var="selectsessionco" items="${selectListSessionCo}" varStatus="status">
                <li class="optionItem" data-code="${selectsessionco.coId}">${selectsessionco.coNm}</li>
            </c:forEach>
            </ul>
            </span>
        </c:if>
        <c:if test="${authInfo.sessionUserId eq 'blee@zieumtn.com'}">
            <span class="selectBox bottom" id="sessionCoId_span">
            <button class="label" id="sessionCoId" data-code="${authInfo.sessionCoId}">${authInfo.sessionCoNm}</button>
            <ul class="optionList">
            <c:forEach var="selectsessionco" items="${selectListSessionCo}" varStatus="status">
                <li class="optionItem" data-code="${selectsessionco.coId}">${selectsessionco.coNm}</li>
            </c:forEach>
            </ul>
            </span>
        </c:if>

        <span class="name pop_pwd" data-pop="userPwd"><span class="companyName">${authInfo.sessionCoNm} </span>${authInfo.sessionUserNm} 님</span>

        <span class="opt">
            <div class="language-container">
                <!-- <span class="language-text">Language</span> -->
                <span class="selectBox bottom cdNa" id="select_cdNa_span">
                <button class="label" id="language" data-code=""></button>
                    <ul class="optionList" id="language_ul">

                        <c:forEach var="cdnalist" items="${codeListNa}" varStatus="status">
							<li class="optionItem" data-value="${cdnalist.cdId}">${cdnalist.etc1}</li>
						</c:forEach>
 						<!-- <li class="optionItem" data-value="KR">한국어</li>
                        <li class="optionItem" data-value="US">English</li>
                        <li class="optionItem" data-value="JP">日本語</li> -->

                    </ul>
                </span>
            </div>

            <div class="theme-switch-wrapper">
                <label class="theme-switch" for="checkbox">
                    <input type="checkbox" id="checkbox" />
                    <div class="slider round"></div>
                </label>
            </div>
        </span>

	    <span class="logout" onClick="localstorageDel()"><a href="javascript:document.frmLogout.submit();"></a></span>

	</div>
</div>
<div class="pop_wrap" id="pop_userPwd">
    <div class="pop_box">
		<div class="pop_content">
			<h3 class="pop_tit">
			   <fmt:message key="SET_USER_INFO" bundle="${bundle}"/> <!-- 개인정보 설정 -->
			</h3>

			<ul class="user_write">
				<li>
					<table class="table_write">
						<tbody>
							<tr>
								<th><fmt:message key="USER_ID" bundle="${bundle}"/><span class="remark"></span></th>  <!-- 사용자 ID -->
								<td colspan="3">
								<input type="text" value="${authInfo.sessionUserId}" name="usrId" id="pwd_usrId" class="input3" placeholder="" readonly>
								<button class="btn_s btn_gray btn_r btn_check pwd_reset">
								<fmt:message key="CHANGE_PW" bundle="${bundle}"/>
								</button>
								</td>
							</tr>
							<tr>
								<th><fmt:message key="USER_NM" bundle="${bundle}"/><span class="remark"></span></th>  <!-- 사용자명 -->
								<td colspan="3">
								<input type="text" value="${authInfo.sessionUserNm}" name="usrNm" id="pwd_usrNm" class="input3" placeholder="">
								</td>
							</tr>
							<tr>
								<th><fmt:message key="DEPT_NM" bundle="${bundle}"/></th>      <!-- 부서명 -->
								<td colspan="3">
								<input type="text" value="${authInfo.sessionDeptNm}" name="deptNm" id="pwd_deptNm" class="input3" placeholder="">
								</td>
							</tr>
							<tr>
								<th><fmt:message key="TEL" bundle="${bundle}"/></th>   <!-- 전화번호 -->
								<td colspan="3">
								<input type="text" value="${authInfo.sessionCotelNo}" name="cotelNo" id="pwd_cotelNo" class="input3" placeholder="">
								</td>
							</tr>
						</tbody>
					</table>

					<div class="pop_btn">
						<span class="btn_m btn_darkline btn_r pop_close" id="pwd_close-1"><fmt:message key="CANCEL" bundle="${bundle}"/></span>  <!--취소  -->
						<button class="btn_m btn_primary btn_r" id="pwd_save-1"><fmt:message key="SAVE" bundle="${bundle}"/></button>          <!-- 저장 -->
					</div>
				</li>
			</ul>
		</div>
    </div>
</div>

<div class="pop_wrap" id="pop_userPwdChange">
    <div class="pop_box">
		<div class="pop_content">
			<h3 class="pop_tit">
			  <fmt:message key="CHANGE_PW" bundle="${bundle}"/>    <!--  비밀번호 변경  -->
			</h3>

			<ul class="user_write">
				<li>
					<table class="table_write">
						<tbody>
							<tr>
								<th><fmt:message key="NOW_PW" bundle="${bundle}"/><span class="remark"></span></th>   <!-- 현재 비밀번호 -->
								<td colspan="3">
								<input type="password" name="usrId" id="pch_pwd" class="input3" placeholder="">
								</td>
							</tr>
							<tr>
								<th><fmt:message key="WANT_CHG_PW1" bundle="${bundle}"/><span class="remark"></span></th>  <!-- 변경 비밀번호  -->
								<td colspan="3">
								<input type="password" name="usrNm" id="pch_pwdch" class="input3" placeholder="">
								</td>
							</tr>
							<tr>
								<th><fmt:message key="WANT_CHG_PW2" bundle="${bundle}"/></th>   <!--  변경 비밀번호 확인 -->
								<td colspan="3">
								<input type="password" name="deptNm" id="pch_pwdchr" class="input3" placeholder="">
								</td>
							</tr>
						</tbody>
					</table>

					<div class="pop_btn">
						<span class="btn_m btn_darkline btn_r pop_pop_close" id="pch_close-1"><fmt:message key="CANCEL" bundle="${bundle}"/></span>    <!-- 취소 -->
						<button class="btn_m btn_primary btn_r" id="pch_save-1"><fmt:message key="SAVE" bundle="${bundle}"/></button>                 <!--저장  -->
					</div>
				</li>
			</ul>
		</div>
    </div>
</div>

<script language="javascript">

var cdnaKeyValue = [];

<c:forEach var="cdnalist" items="${codeListNa}" varStatus="status">
	cdnaKeyValue.push({'code':'${cdnalist.cdId}', 'codeName':'${cdnalist.cdNm}', 'codeClass':'${cdnalist.etc1}'})
</c:forEach>

const toggleSwitch = document.querySelector('.theme-switch input[type="checkbox"]');
const currentTheme = localStorage.getItem('theme');

if (currentTheme) {
    document.documentElement.setAttribute('data-theme', currentTheme);

    if (currentTheme === 'dark') {
        toggleSwitch.checked = true;
    }
}

function switchTheme(e) {
    if (e.target.checked) {
        document.documentElement.setAttribute('data-theme', 'dark');
        localStorage.setItem('theme', 'dark');
    }
    else {        document.documentElement.setAttribute('data-theme', 'light');
          localStorage.setItem('theme', 'light');
    }
}

toggleSwitch.addEventListener('change', switchTheme, false);


function localstorageDel() {
	localStorage.removeItem("accessToken")
	localStorage.removeItem("Refresh-Token")
	localStorage.removeItem("selectedLanguage")
}

$("#sessionCoId_span").find(".optionItem").on("click", function(){
	console.log($(this).data('code'));
	console.log($(this).text());
	$('#sessionChangeCoId').val($(this).data('code'));
	$('#sessionChangeCoNm').val($(this).text());
	document.frmSessionChange.submit();


	//sessionStorage.setItem('authInfo','asad0');
	//console.log(sessionStorage.getItem('authInfo'));

	//console.log(sessionStorage.getItem('authInfo'));
	//sessionStorage.setItem('', value);
	//printSessionStorage();
	/*
	let tmpSelectValue = $(this).text();
	$(this).parents(".selectBox").find(".label").text(tmpSelectValue);
	var value = $(this).data('code');
	if(!value)value='';
	//tmpSelectBox.find(".label").data('code',value);
	$(this).parent().parent().find(".label").data('code',value);
	$(this).parents(".selectBox").removeClass("active");
	$(this).parent(".optionList").css("display", "none");
	*/
});


$('.pop_pop_close').on({click : pop_pop_close});
function pop_pop_close(){
	$('#pop_userPwdChange').stop().fadeOut(300);
}

$('.pop_pwd').on('click', function(){
    $('#pop_userPwd').stop().fadeIn(300);
    if($('.pop_wrap').length){
        $('#pop_userPwd').stop().fadeIn(300);
    }
});

$('.pwd_reset').on('click', function(){

	$("#pch_pwd").val("");
	$("#pch_pwdch").val("");
	$("#pch_pwdchr").val("");

    $('#pop_userPwdChange').stop().fadeIn(300);
    if($('.pop_wrap').length){
        $('#pop_userPwdChange').stop().fadeIn(300);
    }
});

$('#pwd_save-1').on('click', function(){
	var params = {
		'usrId':$('#pwd_usrId').val(),
		'usrNm':$('#pwd_usrNm').val(),
		'deptNm':$('#pwd_deptNm').val(),
		'cotelNo':$('#pwd_cotelNo').val()
	};
	if(validUserStat(params)){
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/updateUserStat.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				$('#pop_userPwd').hide();
			},
			error : function(err){
				console.log(err);
			}
		});
	}

});
$('#pch_save-1').on('click', function(){
	var params = {
		'sectNoOrg':$('#pch_pwd').val(),
		'sectNo':$('#pch_pwdch').val()
	};
	if(validPwdChg(params)){
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/updateUserPwd.do',
			success : function (resp) {
				var json = JSON.parse(resp);
				var result = json.result;
				if(result>0){
					$('#pop_userPwdChange').hide();
				} else {
					$("#alert_msg").html("<fmt:message key="CHK_PW" bundle="${bundle}"/>");
					$('#pop_alert').stop().fadeIn(300);
			        $('#pop_alert').stop().fadeIn(300);
				}
			},
			error : function(err){
				console.log(err);
			}
		});
	}

});

function validUserStat(params){
	var cnt = 0;
	var msg = "";
	var bool = true;

	if(!params.usrNm){
		cnt += 1;
		msg += "<fmt:message key="REQ_USER_NM" bundle="${bundle}"/><br>";
	}

	if(cnt>0){
		$("#alert_msg").html(msg);
		$('#pop_alert').stop().fadeIn(300);
        $('#pop_alert').stop().fadeIn(300);
        bool = false;
	}

	return bool;

}
function validPwdChg(params){
	var cnt = 0;
	var msg = "";
	var bool = true;


	var reg = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,16}$/;

	var pwdChk = params.sectNo;

	console.log(pwdChk)

	if( !reg.test(pwdChk) ) {
	    msg += "<fmt:message key="REQ_PW_RULE" bundle="${bundle}"/><br>";

	    $("#alert_msg").html(msg);
		$('#pop_alert').stop().fadeIn(300);
        $('#pop_alert').stop().fadeIn(300);
        bool = false;
        return false;
	}

	if(!params.sectNoOrg){
		cnt += 1;
		msg += "<fmt:message key="REQ_NOW_PW" bundle="${bundle}"/><br>";
	}

	if(!params.sectNo){
		cnt += 1;
		msg += "<fmt:message key="REQ_CHG_PW" bundle="${bundle}"/><br>";
	}
	if(params.sectNo != $('#pch_pwdchr').val()){
		cnt += 1;
		msg += "<fmt:message key="CHK_CHG_PW" bundle="${bundle}"/><br>";
	}
	if(cnt>0){
		$("#alert_msg").html(msg);
		$('#pop_alert').stop().fadeIn(300);
        $('#pop_alert').stop().fadeIn(300);
        bool = false;
	}

	return bool;

}

// 선택한 언어 코드로 언어 이름 가져오기
function getLanguageName(selectedLanguage) {
	const result = cdnaKeyValue.find(item => item.code === selectedLanguage);

	if (result.codeClass.length > 0){

		return result.codeClass;

	} else { //만약 db에 등록 안되어 있는 경우 디폴트
		switch (selectedLanguage) {
        case 'KR':
            return '한국어';
        case 'US':
            return 'English';
        case 'JP':
            return '日本語';
        default:
            return 'Language';
   	 }
   }
}

$(document).ready(function() {

	const result = cdnaKeyValue.find(item => item.code === '${authInfo.cdNa}');

	var userLanguage = getLanguageName('${authInfo.cdNa}');
	 $('#language').text(userLanguage);

    // 언어선택 후 페이지 로드 시 localStorage에서 선택된 언어 설정을 가져와서 버튼에 반영
    var selectedLanguage = localStorage.getItem('selectedLanguage');
    if (selectedLanguage) {
        $('#language').text(getLanguageName(selectedLanguage));
        $('#language').data('code', selectedLanguage);
    }

    // 언어 선택 시 처리
    $('#language_ul').on('click', '.optionItem', function () {
        var selectedText = $(this).text();
        var region = $(this).data('value');

        $.ajax({
            type: 'POST',
            data: {
                "cdNa": '${authInfo.cdNa}',
                "changedCdNa": region,
                "coId": '${authInfo.coId}',
                "usrId": '${authInfo.usrId}',
            },
            dataType: 'text',
            url: '/languageChange.do',
            success: function () {

                window.location.reload();
            },
            error: function (err) {
                console.error(err);
            }
        });

        // 선택한 언어 값을 localStorage에 저장
        localStorage.setItem('selectedLanguage', region);

        // 버튼에 선택한 언어 값 반영
        $('#language').text(selectedText);
        $('#language').data('code', region);
    });


});

</script>




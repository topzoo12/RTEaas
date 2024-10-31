<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    if(session.getAttribute("authInfo") != null){
        response.sendRedirect("main.do");
    }
%>

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<html>
<head>
    <title>RTEaaS : Road & Traffic Experience as a Service</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1">
    <meta property="og:title" content="" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="" />
    <meta property="og:image" content="" />
    <meta property="og:description" content="" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link rel="stylesheet" href="/css/reset.css?<%=new java.util.Date()%>">
	<link rel="stylesheet" href="/css/style.css?<%=new java.util.Date()%>">
	<script  src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="/js/script.js?<%=new java.util.Date()%>"></script>

</head>
<body>

    <div class="login_wrap">
		<section class="container">
			<div class="login_box">
				<h1 class="logo">
                    <strong>RTEaaS</strong>
                    <span>Road & Traffic Experience as a Service</span>
                </h1>
				<form id="frm" action="/loginProc.do" method="post">
					<p class="id">
                        <label for="usrId" class="usrId_label">ID</label>
                        <input type="text" value="" name="usrId" id="usrId" class="icon_id" placeholder="">
                    </p>
					<p class="password">
                        <label for="usrPw" class="usrPw_label">PASSWORD</label>
                        <input type="password" value="" name="usrPw" id="usrPw" class="icon_password" placeholder="">
                    </p>
					 <input type="hidden" id="regionData" name ="sessionCdNa" value="" />
					<button class="login_button" onclick="loginProc();">LOGIN</button>
				</form>

				<!-- <p class="copy">Copyright 2023. zieumTechNet all rights reserved.</p> -->
			</div>
		</section>
	</div>

</body>

<div class="pop_wrap" id="pop_login_alert" >
    <div class="pop_box2">
    <div class="pop_content">
      <ul class="contents">
        <p class="box center" id="login_msg">로그인 실패</p>
        <li>
          <div class="pop_btn">
            <button class="btn_select pop_close">확인</button>   <!-- 확인 -->
          </div>
        </li>
      </ul>
    </div>
   </div>
</div>
<div class="pop_wrap" id="pop_alert" >
    <div class="pop_box2">
    <div class="pop_content">
      <ul class="contents">
        <p class="box center" id="alert_msg"></p>
        <li>
          <div class="pop_btn">
            <button class="btn_select pop_alert_close">확인</button>
          </div>
        </li>
      </ul>
    </div>
   </div>
</div>
</html>

<script language="javascript">
var g_idCheck = false;

function loginProc(){

	localStorage.removeItem("accessToken")
    localStorage.removeItem("Refresh-Token")
    localStorage.removeItem("selectedLanguage")

    document.getElementById('frm').submit();
}


if(${not empty error}){
    $("#login_msg").html('${error}');

	$('#pop_login_alert').stop().fadeIn(300);
    //$('#pop_login_alert').stop().fadeIn(300);

}

function checkUserCdNaByIp(){

 	 $.getJSON("http://www.geoplugin.net/json.gp?jsoncallback=?", function(data){
	/*   console.log('지역코드 확인',data.geoplugin_countryCode); */
		  var regionData = data.geoplugin_countryCode;

		  $('#regionData').val(regionData);

	  		/* if(regionData =='KR'){
	  		   $('.usrId_label').text("아이디");
	 	       $('.usrPw_label').text("비밀번호");
	 	       $('.icon_id').attr("placeholder", "아이디를 입력하세요");
	 	       $('.icon_password').attr("placeholder","8~16자 비밀번호를 입력해주세요.");
	 	       $('.login_button').text("로그인");

	  		} else if (regionData =='JP'){
	  			$('.usrId_label').text("ID");
		 	    $('.usrPw_label').text("PASSWORD");
		 	    $('.icon_id').attr("placeholder", "(jp)아이디를 입력하세요");
		 	    $('.icon_password').attr("placeholder","(jp)8~16자 비밀번호를 입력해주세요.");
		 	    $('.login_button').text("Login");

	  		} else {
	  			$('.usrId_label').text("ID");
		 	    $('.usrPw_label').text("PASSWORD");
		 	    $('.icon_id').attr("placeholder", "Please enter your ID");
		 	    $('.icon_password').attr("placeholder","Please enter a password of 8 to 16 characters.");
		 	    $('.login_button').text("Login");
	  		} */

		  /*  $.ajax({
			    type: 'POST',
			    url: '/checkUserCdna.do',
			    data: { "region": regionData },
			   //  data: { "region": countryCode },
			     success: function(resp) {
			    	var json = JSON.parse(resp);
					var result = json.region;

			        console.log('서버에서 받은 데이터:', result);
			        loading = false;
			    },
			    error: function(err) {
			        console.error('오류 발생:', err);
			    }

			}); */


	 });

 	/* if (!$('#name').val()) {
        alert('Enter your name!');
    } */

	/* var lang = navigator.userLanguage;

	if(navigator.appName == "Netscape"){
	  lang = navigator.language;
	}

	var countryCode = (lang.substr(3, 4)).toUpperCase();
	console.log('국가: ', countryCode); */

}



$(document).ready(function() {

	checkUserCdNaByIp();


})
</script>
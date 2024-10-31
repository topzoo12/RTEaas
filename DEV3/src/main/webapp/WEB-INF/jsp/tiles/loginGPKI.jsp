<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page import="java.sql.*, java.io.*, java.net.*, java.util.*" %>
<%@ include file="/gpkisecureweb/jsp/gpkisecureweb.jsp" %>
<%@ page import="com.gpki.servlet.GPKIHttpServletResponse" %>
<%
	String challenge = gpkiresponse.getChallenge();
	String sessionid = gpkirequest.getSession().getId();
	//String challenge = "1";
	//String sessionid = "2";
	String url = javax.servlet.http.HttpUtils.getRequestURL(request).toString();
	session.setAttribute("currentpage",url);
%>
<html lang="ko">
<head>
    <title>RTEaaS</title>
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

	<script type="text/javascript" src="./gpkisecureweb/client/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="./gpkisecureweb/client/jquery-ui.min.js"></script>
	<script type="text/javascript" src="./gpkisecureweb/client/var.js"></script>
	<script type="text/javascript" src="./gpkisecureweb/client/json2.js"></script>
	<script type="text/javascript" src="./gpkisecureweb/client/ui/Issuer.js" ></script>
	<script type="text/javascript" src="./gpkisecureweb/client/ui/CertSelector_ko-KR.js"></script>
	<script type="text/javascript" src="./gpkisecureweb/client/ui/CertSearchWindow_ko-KR.js" ></script>
	<script type="text/javascript" src="./gpkisecureweb/client/ui/CertSearchWindow_ko-KR.js" ></script>
	<script type="text/javascript" src="./gpkisecureweb/client/ui/certviewR_ko-KR.js" ></script>
	<script type="text/javascript" src="./gpkisecureweb/client/ui/pinWindowR_ko-KR.js" ></script>
	<script type="text/javascript" src="./gpkisecureweb/client/ui/SecureTokenWindow_ko-KR.js" ></script>
	<script type="text/javascript" src="./gpkisecureweb/client/GPKIErrorText.js" ></script>
	<script type="text/javascript" src="./gpkisecureweb/client/GPKISecureWebNP.js" ></script>

</head>
<body>
<!-- <button onclick="test()">test</button> -->
    <div class="login_wrap">
		<section class="container">
			<div class="login_box">
				<h1 class="logo"><strong>RTEaaS</strong> <span>Road & Traffic Experience as a Service</span></h1>
				<form id="frm" action="/loginProc.do" method="post">
					<p class="id"><input type="text" value="" name="usrId" id="usrId" class="input3 icon_id" placeholder="이메일을 입력해주세요"></p>
					<p class="password"><input type="password" value="" name="usrPw" id="usrPw" class="input3 icon_password" placeholder="8~16자 비밀번호를 입력해주세요."></p>

					<button class="login_button" onclick="loginProc();">로그인</button>
				</form>
				<form action="./gpkisecureweb/jsp/createSecureSession_1_1_response.jsp" method="post" name="popForm">
					<input type="hidden" name="param01" />
					<input type="hidden" name="param02" />
					<input type="hidden" name="param03" />
					<input type="hidden" name="ssn" />
					<input disabled type="hidden" name="challenge" value="<%=challenge%>" />
					<input type="hidden" name="sessionid" id="sessionid" value="<%=sessionid%>" />
					<p class="info" style="margin-top:15px;">
						<button onclick="return Login(this,popForm);" style="color: inherit;padding-right:15px">인증서로그인</button>
						<a style="padding-left:0px;padding-right:0px;">&nbsp;</a>
						<a href="#" class="pop_install">수동설치</a>
					</p>
				</form>
				<!-- <button class="login_button">로그인</button> -->
				<p class="info">
					<a href="#" class="pop_req" data-pop="account">계정 신청</a>
					<a href="#" class="pop_open" data-pop="pwdreset">비밀번호 초기화</a>
					<a href="#" class="pop_reqapi" data-pop="api">Open API 신청</a>
					<a href="#" class="pop_reqservice" data-pop="service">서비스 신청</a>
				</p>
				<p class="copy">Powered by NFLUX.</p>
			</div>
		</section>
	</div>



</body>
<div class="pop_wrap" id="pop_account">
    <div class="pop_box">
		<div class="pop_content">
			<h3 class="pop_tit">
			   계정신청
			</h3>

			<ul class="user_write">
				<li>
					<table class="table_write">
						<tbody>
							<tr>
								<th>사용자 ID<span class="remark"></span></th>
								<td colspan="3">
								<input type="text" value="" name="usrId" id="p1_usrId" class="input3 p1_usrId" placeholder="">
								<button class="btn_check check">중복체크</button>
								<span id="checkMsg"></span>
								</td>
							</tr>
							<tr>
								<th>비밀번호<span class="remark"></span></th>
								<td colspan="3">
								<input type="text" value="" name="pwd" id="p1_pwd" class="input3 p1_pwd" placeholder="">
								</td>
							</tr>
							<tr>
							<tr>
								<th>비밀번호 확인<span class="remark"></span></th>
								<td colspan="3">
								<input type="text" value="" name="pwdr" id="p1_pwdr" class="input3 p1_pwdr" placeholder="">
								</td>
							</tr>
							<tr>
								<th>사용자명<span class="remark"></span></th>
								<td  colspan="3"><input type="text" value="" name="usrNm" id="p1_usrNm" class="input3 p1_usrNm" placeholder=""></td>
							</tr>
							<tr>
								<th>부서명</th>
								<td colspan="3"><input type="text" value="" name="deptNm" id="p1_deptNm" class="input3 p1_deptNm" placeholder=""></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td colspan="3"><input type="text" value="" name="cotelNo" id="p1_cotelNo" class="input3 p1_cotelNo" placeholder=""></td>
							</tr>

						</tbody>
					</table>
					<!--<p class="mark"><span>*</span> 표시는 필수입력항목입니다.</p>-->

					<div class="pop_btn">
						<span class="btn_close pop_close" id="pop_close-1">취소</span>
						<button class="btn_select" id="pop_save-1">신청</button>
					</div>
				</li>
			</ul>
		</div>
    </div>
</div>

<div class="pop_wrap" id="pop_api">
    <div class="pop_box">
		<div class="pop_content">
			<h3 class="pop_tit">
			   Open API 신청
			</h3>

			<ul class="user_write">
				<li>
					<table class="table_write">
						<tbody>
							<tr>
							<th>소속 및 기관명<span class="remark"></span></th>
							<td>
								<input type="text" value="" name="p3_reqCoNm" id="p3_reqCoNm" class="input3" placeholder=""></td>
							</tr>
							<tr>
							<th>요청자<span class="remark"></span></th>
							<td>
								<input type="text" value="" name="mb" id="p3_reqNm" class="input3" placeholder=""></td>
							</tr>
							<tr>
							<th>이메일<span class="remark"></span></th>
							<td>
								<ul>
									<li class="flleft wdp50 pr3">
										<input type="text" value="" name="email" id="p3_emailAddr" class="input3 wd200" placeholder="">
									</li>
								</ul>
							</td>
							</tr>
							<tr>
							<th>활용사이트</th>
							<td>
								<input type="text" value="" name="site" id="p3_useSite" class="input3 wdp100" placeholder="https://"></td>
							</tr>
							<tr>
							<th>Open API 서비스<span class="remark"></span></th>
							<td>
								<span class="selectBox bottom border">
							  <button class="label" id="p3_coId">선택</button>
							  <ul class="optionList">
								<li class="optionItem" data-code="A0001">도봉구</li>
							  </ul>
							</span></td>
							</tr>
						</tbody>
					</table>
					<!--<p class="mark"><span>*</span> 표시는 필수입력항목입니다.</p>-->

					<div class="pop_btn">
						<span class="btn_close pop_close">취소</span>
						<button class="btn_select" id="pop_save-3">신청</button>
					</div>
				</li>
			</ul>
		</div>
    </div>
</div>
<div class="pop_wrap" id="pop_pwdreset">
    <div class="pop_box">
		<div class="pop_content">
			<h3 class="pop_tit">
			   비밀번호 초기화 신청
			</h3>

			<ul class="user_write">
				<li>
					<table class="table_write">
						<tbody>
							<tr>
								<th>사용자 ID<span class="remark"></span></th>
								<td>
								<input type="text" value="" name="usrId" id="p2_usrId" class="input3 p2_usrId" placeholder="">
								</td>
							</tr>

							<tr>
								<th>사용자명<span class="remark"></span></th>
								<td>
								<input type="text" value="" name="usrNm" id="p2_usrNm" class="input3 p2_usrNm" placeholder="">
								</td>
							</tr>
						</tbody>
					</table>

					<div class="pop_btn">
						<span class="btn_close pop_close" id="pop_close-2">취소</span>
						<button class="btn_select" id="pop_save-2">신청</button>
					</div>
				</li>
			</ul>
		</div>
    </div>
</div>

<div class="pop_wrap" id="pop_service">
    <div class="pop_box">
		<div class="pop_content">
			<h3 class="pop_tit">
			   서비스정보
			</h3>

			<ul class="user_write">
				<li>
					<table class="table_write">
						<tbody>
							<tr>
								<th>기관 ID</th>
								<td><input type="text" value="" name="coId" id="p4_coId" class="input3" placeholder="" disabled="true"></td>
								<th>기관명<span class="remark"></span></th>
								<td><input type="text" value="" name="coNm" id="p4_coNm" class="input3" placeholder=""></td>
							</tr>
							<tr>
								<th>관리자명<span class="remark"></span></th>
								<td><input type="text" value="" name="rdrtrNm" id="p4_rdrtrNm" class="input3" placeholder=""></td>
								<th>관리자 이메일<span class="remark"></span></th>
								<td><input type="text" value="" name="emailAddr" id="p4_emailAddr" class="input3" placeholder=""></td>
							</tr>
							<tr>
								<th>홈페이지</th>
								<td colspan="3"><input type="text" value="" name="hpgAddr" id="p4_hpgAddr" class="input3" placeholder=""></td>
							</tr>
							<tr>
								<th>주소</th>
								<td colspan="3">
									<span class="addr_box">
										<input type="hidden" id="p4_roadzpNo" placeholder="우편번호">
										<input type="text" id="p4_roadnmAddr" class="input9" placeholder="주소">
										<button class="search_btn" onclick="execDaumPostcode()"></button>
									</span>
									<input type="text" name="roadnmdtlAddr" id="p4_roadnmdtlAddr" class="input3" placeholder="상세주소">
								</td>

							</tr>
							<tr>
								<th>전화번호</th>
								<td colspan="3"><input type="text" value="" name="telNo" id="p4_telNo" class="input3" placeholder=""></td>
							</tr>
							<tr>
								<th>서비스신청</th>
								<td colspan="3" style="font-weight:normal;font-size: 1.4rem">
								<c:forEach var="service" items="${serviceList}" varStatus="status">
									<label class="checkbox"><input type="checkbox" name="chkService" value="${service.mnuId}"><span class="icon"></span></label> ${service.mnuNm}
								</c:forEach>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="pop_btn">
						<span class="btn_close pop_close" id="pop_close-4">취소</span>
						<button class="btn_select" id="pop_save-4">신청</button>
					</div>
				</li>
			</ul>
		</div>
    </div>
</div>
<div class="pop_wrap" id="pop_login_alert" >
    <div class="pop_box2">
    <div class="pop_content">
      <ul class="contents">
        <p class="box center" id="login_msg">로그인 실패</p>
        <li>
          <div class="pop_btn">
            <button class="btn_select pop_close">확인</button>
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
    document.getElementById('frm').submit();
}

if(${not empty error}){
    $("#login_msg").html('${error}');

	$('#pop_login_alert').fadeIn(300);
}

$('.pop_reqservice').on('click', function(){
	let target_pop = $(this).data('pop');
    $('#pop_'+target_pop).fadeIn(300);
    if($('.pop_wrap').length){
        $('#pop_'+target_pop).fadeIn(300);
    }

});
$('.pop_reqapi').on('click', function(){
	console.log('test');
	let target_pop = $(this).data('pop');
    $('#pop_'+target_pop).fadeIn(300);
    if($('.pop_wrap').length){
        $('#pop_'+target_pop).fadeIn(300);
    }

    $('#p3_reqCoNm').val('');
    $('#p3_reqNm').val('');
    $('#p3_emailAddr').val('');
    $('#p3_useSite').val('');
    $('#p3_coId').text('선택');
    $('#p3_coId').data('code','');

});

$('.pop_req').on('click', function(){
	let target_pop = $(this).data('pop');
    $('#pop_'+target_pop).fadeIn(300);
    if($('.pop_wrap').length){
        $('#pop_'+target_pop).fadeIn(300);
    }

    $('.p1_usrId').val('');
	$('.p1_usrId').prop('disabled',false);
	$('.btn_check.check').prop('disabled',false);
	$('#checkMsg').text('');

	$('.p1_pwd').val('');
	$('.p1_pwdr').val('');

	$('.p1_usrNm').val('');
	$('.p1_deptNm').val('');
	$('.p1_cotelNo').val('');
	g_idCheck = false;

});

$('.pop_install').on('click', function(){
	location.href="/gpkisecureweb/install.html";
});



$('.btn_check.check').on('click', function () {
	var params = {
		'usrId':$('#p1_usrId').val()
	};
	if(validIdCheck(params)){
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/getUserIdCheck.do',
			success : function (resp) {
				//console.log(resp);
				var json = JSON.parse(resp);
				var result = json.result;
				if(result==0){
					$('#checkMsg').text('사용가능');
					g_idCheck = true;
					$('#p1_usrId').prop('disabled',true);
				} else if(result==1){
					$('#checkMsg').text('중복사용불가');
					g_idCheck = false;
					$('#p1_usrId').prop('disabled',false);
				} else if(result==-1){
					$('#checkMsg').text('도메인사용불가');
					g_idCheck = false;
					$('#p1_usrId').prop('disabled',false);
				}
			},
			error : function(err) {
				console.log(err);
			}
		});
	}

});

$('#pop_save-1').on('click', function(){
	var params = {
		'usrId':$('.p1_usrId').val()
		,'sectNo':$('.p1_pwd').val()
		,'usrNm':$('.p1_usrNm').val()
		,'deptNm':$('.p1_deptNm').val()
		,'cotelNo':$('.p1_cotelNo').val()
	};
	//console.log(params);
	if(valid(params)){
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/reqUser.do',
			success : function (resp) {
				console.log(resp);
				var json = JSON.parse(resp);
				var result = json.result;
				$('#pop_account').hide();
			},
			error : function(err){
				console.log(err);
			}
		});
	} else {
		return false;
	}
});

$('#pop_save-2').on('click', function(){
	//console.log('test');
	var params = {
		'usrId':$('#p2_usrId').val()
		,'usrNm':$('#p2_usrNm').val()
	};
	console.log(params);
	if(validReset(params)){
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/resetPwd.do',
			success : function (resp) {
				//console.log(resp);
				var json = JSON.parse(resp);
				var result = json.result;
				$('#pop_pwdreset').hide();
			},
			error : function(err){
				console.log(err);
			}
		});
	} else {
		return false;
	}
});

$('#pop_save-3').on('click', function(){
	//console.log('test');
	var params = {
		'reqCoNm':$('#p3_reqCoNm').val()
		,'reqNm':$('#p3_reqNm').val()
		,'emailAddr':$('#p3_emailAddr').val()
		,'useSite':$('#p3_useSite').val()
		,'coId':$('#p3_coId').data('code')
	};

	console.log(params);
	if(validApi(params)){
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/reqOpenapi.do',
			success : function (resp) {
				//console.log(resp);
				var json = JSON.parse(resp);
				var result = json.result;
				$('#pop_api').hide();
			},
			error : function(err){
				console.log(err);
			}
		});
	} else {
		return false;
	}
});

$('#pop_save-4').on('click', function(){
	//console.log('test');
	var arrService = $('input:checkbox[name=chkService]:checked');
	var serviceData = [];
	for(var i=0;i<arrService.length;i++){
		serviceData[i] = arrService[i].value;
	}

	var params = {
		'coId':''
		,'coNm':$('#p4_coNm').val()
		,'rdrtrNm':$('#p4_rdrtrNm').val()
		,'emailAddr':$('#p4_emailAddr').val()
		,'hpgAddr':$('#p4_hpgAddr').val()
		,'roadzpNo':$('#p4_roadzpNo').val()
		,'roadnmAddr':$('#p4_roadnmAddr').val()
		,'roadnmdtlAddr':$('#p4_roadnmdtlAddr').val()
		,'telNo':$('#p4_telNo').val()
		,'reqServiceList':serviceData.join(',')
	};

	console.log(params);
	if(validService(params)){
		$.ajax({
			type : 'POST',
			data : params,
			dataType : 'text',
			url : '/reqService.do',
			success : function (resp) {
				//console.log(resp);
				var json = JSON.parse(resp);
				var result = json.result;
				$('#pop_service').hide();
			},
			error : function(err){
				console.log(err);
			}
		});
	} else {
		return false;
	}
});
function test(){
	var params = {
		'sensorIoValue':[ { "ioId": "C3H8_R", "readValue": "41.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "PM10_I", "readValue": "48.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "PM10_K", "readValue": "70.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "C3H8_S", "readValue": "19.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "PM2.5_S", "readValue": "3.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "PM10_F", "readValue": "92.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "SHO_S", "readValue": "22.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "PM2.5_R", "readValue": "25.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "SHO_R", "readValue": "44.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "C3H8_I", "readValue": "63.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "C3H8_K", "readValue": "85.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "PM2.5_K", "readValue": "69.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "SHO_K", "readValue": "88.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "PM2.5_I", "readValue": "47.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "C3H8_F", "readValue": "107.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "PM10_R", "readValue": "26.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "PM10_S", "readValue": "4.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "deviceId", "readValue": "116.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "wifiPwd", "readValue": "120.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "APR_R", "readValue": "29.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "APR_S", "readValue": "7.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "APR_F", "readValue": "95.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "APR_I", "readValue": "51.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "O2_R", "readValue": "30.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "O2_S", "readValue": "8.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "O2_F", "readValue": "96.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "O2_I", "readValue": "52.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "APR_K", "readValue": "73.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "O2_K", "readValue": "74.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "C4H10_S", "readValue": "20.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "wifiId", "readValue": "119.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "tel", "readValue": "112.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "C4H10_R", "readValue": "42.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "wifiStt", "readValue": "114.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "MOT_S", "readValue": "1.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "C2H5OH_F", "readValue": "105.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "MOT_R", "readValue": "23.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "MOT_K", "readValue": "67.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "C2H5OH_K", "readValue": "83.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "C2H5OH_I", "readValue": "61.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "MOT_I", "readValue": "45.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "C2H5OH_R", "readValue": "39.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "C2H5OH_S", "readValue": "17.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "lteStt", "readValue": "113.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "MOT_F", "readValue": "89.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "SHO_I", "readValue": "66.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "C4H10_K", "readValue": "86.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "TEMP_R", "readValue": "27.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "TEMP_S", "readValue": "5.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "NO2_R", "readValue": "43.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "NO2_S", "readValue": "21.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "SHO_F", "readValue": "110.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "C4H10_I", "readValue": "64.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "TEMP_I", "readValue": "49.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "NO2_F", "readValue": "109.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "TEMP_K", "readValue": "71.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "C4H10_F", "readValue": "108.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "NO2_K", "readValue": "87.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "TEMP_F", "readValue": "93.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "NO2_I", "readValue": "65.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CO2_K", "readValue": "81.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "BEN_S", "readValue": "16.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CO2_I", "readValue": "59.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "BEN_R", "readValue": "38.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "LEL_S", "readValue": "9.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CO2_F", "readValue": "103.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "LEL_R", "readValue": "31.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "srvPort", "readValue": "118.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "BEN_K", "readValue": "82.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "BEN_F", "readValue": "104.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "BEN_I", "readValue": "60.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "H2_F", "readValue": "101.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "mac", "readValue": "115.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "NH3_K", "readValue": "84.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "H2_K", "readValue": "79.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "NH3_I", "readValue": "62.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CO_F", "readValue": "100.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CO2_S", "readValue": "15.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CO2_R", "readValue": "37.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CO_K", "readValue": "78.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "NH3_F", "readValue": "106.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CO_I", "readValue": "56.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "H2_I", "readValue": "57.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "NH3_S", "readValue": "18.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "H2_S", "readValue": "13.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "NH3_R", "readValue": "40.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CH2O_K", "readValue": "76.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CO_S", "readValue": "12.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CH2O_I", "readValue": "54.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CO_R", "readValue": "34.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "H2_R", "readValue": "35.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CH2O_S", "readValue": "10.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CH2O_R", "readValue": "32.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "LEL_K", "readValue": "75.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CH4_R", "readValue": "36.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CH4_S", "readValue": "14.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "HUM_R", "readValue": "28.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "HUM_S", "readValue": "6.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "PM1.0_F", "readValue": "90.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CH2O_F", "readValue": "98.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CH4_K", "readValue": "80.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "HUM_F", "readValue": "94.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "PM1.0_I", "readValue": "46.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "HUM_I", "readValue": "50.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CH4_F", "readValue": "102.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "PM1.0_K", "readValue": "68.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "LEL_F", "readValue": "97.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "LEL_I", "readValue": "53.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "HUM_K", "readValue": "72.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "CH4_I", "readValue": "58.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "PM1.0_R", "readValue": "24.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "ver", "readValue": "111.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "PM1.0_S", "readValue": "2.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "trnCyc", "readValue": "121.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "PM2.5_F", "readValue": "91.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "O3_R", "readValue": "33.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "O3_S", "readValue": "11.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "O3_F", "readValue": "99.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "O3_I", "readValue": "55.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "srvIp", "readValue": "117.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" },  { "ioId": "O3_K", "readValue": "77.0", "readDtm": "20221121162354105", "fcltsId": "NFZ001" } ]
		,'sensorIoValueCount':121
	};
	//console.log(params);
	$.ajax({
		type : 'POST',
		data : JSON.stringify(params),
		contentType: 'application/json',
		dataType : 'json',
		url : '/interfaceDeviceData.do',
		success : function (resp) {
			//console.log(resp);
			//var json = JSON.parse(resp);
			//var result = json.result;
		},
		error : function(err){
			console.log(err);
		}
	});
}
function valid(params){
	var cnt = 0;
	var msg = "";
	var bool = true;

	//console.log('valid');
	if(!params.usrId){
		cnt += 1;
		msg += "사용자ID는 필수입력 입니다.<br>";
	}

	if(!g_idCheck){
		cnt += 1;
		msg += "중복체크를 해주세요.<br>";
	}

	if(!params.sectNo){
		cnt += 1;
		msg += "비밀번호는 필수입력 입니다.<br>";
	}

	if(params.sectNo != $('.p1_pwdr').val()){
		cnt += 1;
		msg += "비밀번호를 확인해주세요.<br>";
	}

	if(!params.usrNm){
		cnt += 1;
		msg += "사용자명은 필수입력 입니다.<br>";
	}


	if(cnt>0){
		$("#alert_msg").html(msg);
		$('#pop_alert').fadeIn(300);
        $('#pop_alert').fadeIn(300);
        bool = false;
	}

	return bool;
}

function validReset(params){
	var cnt = 0;
	var msg = "";
	var bool = true;

	if(!params.usrId){
		cnt += 1;
		msg += "사용자ID는 필수입력 입니다.<br>";
	}

	if(!params.usrNm){
		cnt += 1;
		msg += "사용자명은 필수입력 입니다.<br>";
	}

	if(cnt>0){
		$("#alert_msg").html(msg);
		$('#pop_alert').fadeIn(300);
        $('#pop_alert').fadeIn(300);
        bool = false;
	}

	return bool;
}
function validApi(params){
	var cnt = 0;
	var msg = "";
	var bool = true;

	if(!params.reqCoNm){
		cnt += 1;
		msg += "소속 및 기관명은 필수입력 입니다.<br>";
	}

	if(!params.reqNm){
		cnt += 1;
		msg += "요청자는 필수입력 입니다.<br>";
	}
	if(!params.emailAddr){
		cnt += 1;
		msg += "이메일은 필수입력 입니다.<br>";
	}
	if(!params.coId){
		cnt += 1;
		msg += "서비스는 필수입력 입니다.<br>";
	}

	if(cnt>0){
		$("#alert_msg").html(msg);
		$('#pop_alert').fadeIn(300);
        $('#pop_alert').fadeIn(300);
        bool = false;
	}

	return bool;
}
function validService(params){
	var cnt = 0;
	var msg = "";
	var bool = true;

	if(!params.coNm){
		cnt += 1;
		msg += "기관명은 필수입력 입니다.<br>";
	}

	if(!params.rdrtrNm){
		cnt += 1;
		msg += "관리자명은 필수입력 입니다.<br>";
	}

	if(!params.emailAddr){
		cnt += 1;
		msg += "관리자이메일은 필수입력 입니다.";
	}

	if(cnt>0){
		$("#alert_msg").html(msg);
		$('#pop_alert').stop().fadeIn(300);
        $('#pop_alert').stop().fadeIn(300);
        bool = false;
	}

	return bool;

}
function validIdCheck(params){
	var cnt = 0;
	var msg = "";
	var bool = true;

	if(!params.usrId){
		cnt += 1;
		msg += "사용자ID는 필수입력 입니다.<br>";
	}
	if(!CheckEmail(params.usrId)){
		cnt += 1;
		msg += "사용자ID 형식이 메일주소가 아닙니다.<br>";
	}
	if(cnt>0){
		$("#alert_msg").html(msg);
		$('#pop_alert').fadeIn(300);
        $('#pop_alert').fadeIn(300);
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
</script>
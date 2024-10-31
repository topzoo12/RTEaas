<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="bundleName" value="bundles.lang_${not empty authInfo.changedCdNa ? authInfo.changedCdNa : authInfo.cdNa}" />
<fmt:setBundle basename="${bundleName}" var="bundle" />

<html>
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

	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">

	<script  src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="/js/script.js?<%=new java.util.Date()%>"></script>

</head>

<body>

	<header class="header">
		<tiles:insertAttribute name="header" />
	</header>

	<main class="main">
		<section class="container">
			<div class="left item on">
				<tiles:insertAttribute name="left" />
			</div>
			<div class="contents_box contents_layout item on" style="width: calc(100% - 240px);margin:0px;">
	      		    <tiles:insertAttribute name="content" />
			</div>

		</section>
	</main>
	<!-- <footer class="footer">
		<div class="container">
		Copyright(C) 2023 지음테크넷. All Rights Reserved.
		</div>
	</footer> -->

<div class="pop_wrap" id="pop_alert" >
    <div class="pop_box2">
    <div class="pop_content">
      <ul class="contents">
        <p class="box center" id="alert_msg"></p>
        <li>
          <div class="pop_btn">
            <button class="btn_m btn_secondary btn_r pop_alert_close"><fmt:message key="CONFIRM" bundle="${bundle}"/></button>    <!-- 확인 -->
          </div>
        </li>
      </ul>
    </div>
   </div>
</div>
<div class="pop_wrap" id="pop_confirm" >
    <div class="pop_box2">
    <div class="pop_content">
      <ul class="contents">
        <p class="box center" id="confirm_msg"></p>
        <li>
          <div class="pop_btn">
            <span class="btn_m btn_darkline btn_r pop_confirm_close"><fmt:message key="CANCEL" bundle="${bundle}"/></span>             <!-- 취소 -->
            <button class="btn_m btn_secondary btn_r pop_confirm_select"><fmt:message key="CONFIRM" bundle="${bundle}"/></button>       <!-- 확인 -->
          </div>
        </li>
      </ul>
    </div>
   </div>
</div>

</body>
</html>


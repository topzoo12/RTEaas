<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link rel="stylesheet" type="text/css" href="WEB-APP/webponent/grid2.0/css/webponent.grid.css">
<link rel="stylesheet" type="text/css" href="WEB-APP/webponent/grid2.0/css/webponent.grid.flat.css">
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">

<head></head>
<body>

<script src="WEB-APP/webponent/jquery-1.11.1.min.js"></script>
<script src="WEB-APP/webponent/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>
<script src="WEB-APP/webponent/jquery-mousewheel-3.1.13/jquery.mousewheel.min.js"></script>
<script src="WEB-APP/webponent/underscore-umd-min.js"></script>
<script src="WEB-APP/webponent/grid2.0/webponent.grid.js"></script>
<script src="WEB-APP/webponent/grid2.0/webponent.grid.UIplugin.js"></script>
testpage
	<table id="ci-grid">
		<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td align="left" class="listtd"><c:out value="${result.coId}"/>&nbsp;</td>
				<td align="center" class="listtd"><c:out value="${result.comCd}"/>&nbsp;</td>
				<td align="center" class="listtd"><c:out value="${result.sysId}"/>&nbsp;</td>
				<td align="center" class="listtd"><c:out value="${result.cdNm}"/>&nbsp;</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<script id="ci-grid-template" type="text/template">
    <table>
        <thead>
            <tr>
                <th name="coId" >coId</th>
                <th name="comCd">comCd</th>
                <th name="sysId">sysId</th>
                <th name="cdNm">cdNm</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td name="coId" bind="coId" ></td>
                <td name="comCd" bind="comCd" ></td>
                <td name="sysId" bind="sysId" ></td>
                <td name="cdNm" bind="cdNm" ></td>
            </tr>
        </tbody>
    </table>
	</script>
	<script language="javascript">
		var table = $('#ci-grid');

	    var template = $('#ci-grid-template');

	    // 그리드 초기화
	    var grid = webponent.grid.init(table, template);
	</script>
</body>
</html>

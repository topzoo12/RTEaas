<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
testpage
	<table>
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td align="left" class="listtd"><c:out value="${result.coId}"/>&nbsp;</td>
				<td align="center" class="listtd"><c:out value="${result.comCd}"/>&nbsp;</td>
				<td align="center" class="listtd"><c:out value="${result.sysId}"/>&nbsp;</td>
				<td align="center" class="listtd"><c:out value="${result.cdNm}"/>&nbsp;</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>

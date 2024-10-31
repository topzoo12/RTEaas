<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="sub menu on">
    <div class="sub_box" id="menu">
        <ul class="subtitle">
            <div><span class="material-icons"> menu </span> Menu</div>
            <div>
                <a href="#" class="btn_favorites favorites"></a>
                <button class="menu_bar" style="display:none;"></button>
                <button class="menu_bar_close" style="display:block;"></button>
            </div>
        </ul>
        <ul class="submenu" style="display: block;">
            <c:forEach var="menu" items="${authInfo.menuList}" varStatus="status">
                <c:if test="${menu.mnuLvl eq 1}" >
                    <li id="${menu.mnuId}" class="menu1depth">
                        <a href="#">${menu.mnuNm}</a>
                        <ul id="${menu.mnuId}_ul">
                            <c:forEach var="submenu" items="${authInfo.menuList}" varStatus="status">
                                <c:if test="${submenu.mnuLvl eq 2}" >
                                    <c:if test="${submenu.hrnkmnuId eq menu.mnuId}" >
                                        <c:choose>
                                            <c:when test="${empty submenu.srnUrl}">
                                                <li><span style="color:red;">${submenu.mnuNm}</span></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li id="${fn:split(submenu.srnUrl, '/')[1]}" class="menu2depth"><a href="${submenu.srnUrl}.do">${submenu.mnuNm}</a></li>
                                            </c:otherwise>
                                        </c:choose>

                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </li>
                </c:if>

            </c:forEach>
            <!--
            <li id="sys">
                <a href="#">시스템관리</a>
                <ul id="sys_ul">
                    <li id="serviceList" ><a href="/sys/serviceList.do">서비스관리</a></li>
                    <li id="codeList" ><a href="/sys/codeList.do">코드관리</a></li>
                    <li id="pageList" class=""><a href="/sys/pageList.do">화면관리</a></li>
                    <li id="messageList" ><a href="/sys/messageList.do">메시지관리</a></li>
                </ul>
            </li>
            <li id="com">
                <a href="#">메뉴 및 사용자 관리</a>
                <ul id="com_ul">
                    <li id="authgrpList" ><a href="/com/authgrpList.do">권한그룹관리</a></li>
                    <li id="menuList" ><a href="/com/menuList.do">메뉴관리</a></li>
                    <li id="authgrpMenuList" ><a href="/com/authgrpMenuList.do">그룹별메뉴관리</a></li>
                    <li id="userList" ><a href="/com/userList.do">사용자관리</a></li>
                </ul>
            </li>
            <li id="device">
                <a href="#">측정장치 관리</a>
                <ul id="device_ul">
                    <li><a href="#">측정장치 등록</a></li>
                    <li><a href="#">측정장치 모니터링</a></li>
                    <li><a href="#">측정장치 유지보수 현황</a></li>
                    <li><a href="#">측정장치 데이터 활용관리</a></li>
                </ul>
            </li>
            <li id="status">
                <a href="#">대기질 현황</a>
                <ul id="status_ul">
                    <li><a href="#">대기환경 종합현황</a></li>
                    <li><a href="#">실시간 대기현황</a></li>
                    <li><a href="#">대기현황</a></li>
                    <li><a href="#">도로청소 차량현황</a></li>
                    <li><a href="#">도로청소 운행현황</a></li>
                </ul>
            </li>
            <li id="statis">
                <a href="#">대기환경 통계</a>
                <ul id="device">
                    <li><a href="#">시간별</a></li>
                    <li><a href="#">일별</a></li>
                    <li><a href="#">월별</a></li>
                    <li><a href="#">기간별</a></li>
                    <li><a href="#">관측지별</a></li>
                </ul>
            </li>
                -->
        </ul>
    </div>

    <div class="sub_box" id="favorites">
        <ul class="subtitle">
            <div><span class="material-icons"> star </span> Favorites</div>
            <div>
            <a href="#" class="btn_menu menu"></a>
            <button class="menu_bar"></button>
            <button class="menu_bar_close"></button>
            </div>
        </ul>
        <ul class="submenu favorites">
            <c:forEach var="favmenu" items="${authInfo.favList}" varStatus="status">
                <li id="${fn:split(favmenu.srnUrl, '/')[1]}" ><a href="${favmenu.srnUrl}.do">${favmenu.mnuNm}</a></li>
            </c:forEach>
        </ul>
    </div>
</div>

<script language="javascript">
    var pageUrl = window.location.href; //창의 url을 가져온다.
    var pageSplit = pageUrl.replace('#','').split('/');

    $('.submenu > li').siblings('li').removeClass('on'); //다른 active가 있으면 지워준다.
    //$('#'+pageSplit[3]).addClass('on');
    //$('#'+pageSplit[3]+'_ul').prop('style','display:block');

    //console.log(pageSplit.length);

    if(pageSplit.length>4){
        $('#'+pageSplit[4].split('.')[0]).addClass('on');
        $('#'+pageSplit[4].split('.')[0]).parent().parent().addClass('on');
        $('#'+pageSplit[4].split('.')[0]).parent().prop('style','display:block');
    }

</script>
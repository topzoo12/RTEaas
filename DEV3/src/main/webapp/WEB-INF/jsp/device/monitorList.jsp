<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=j5co10chpb"></script>

<div class="contentsWrap" style="min-width: 1260px;">
    <div class="contents_bg"></div>
    <p class="title ${fav}">${pageName.srnNm}</p>
    <ul class="contents monitoring">
        <li class="code2">
            <div class="map" id="map">
            </div>
        </li>
        <li class="view2">
            <p id="p_status" class="alarm_result ok">
                <span>${nowDt}</span>
                <strong id="msg_status">측정 장치가 정상적으로 작동합니다.</strong>
            </p>
            <p class="stl state_ex">
                <span class="state_icon error">비정상</span>
                <span class="state_icon ok">정상</span>
            </p>
            <table class="table">
                <colgroup>
                    <col style="width: 48px">
                    <col style="width: 96px">
                    <col style="width: ">
                    <col style="width: 96px">
                    <col style="width: 60px">
                    <col style="width: 80px">
                </colgroup>
                <thead>
                    <tr>
                    <th>No.</th>
                    <th>측정소ID</th>
                    <th>측정소명</th>
                    <th>구역(동)</th>
                    <th>상태</th>
                    <th>비고</th>
                    </tr>
                </thead>
            </table>
            <div class="tbody">
            <table class="table" id="table-1">
                <colgroup>
                    <col style="width: 48px">
                    <col style="width: 96px">
                    <col style="width: ">
                    <col style="width: 96px">
                    <col style="width: 60px">
                    <col style="width: calc(80px - 17px)">
                </colgroup>
                <tbody>
                    <c:forEach var="result" items="${resultList}" varStatus="status">
                        <tr>
                        <td><c:out value="${result.rowno}"/></td>
                        <td><c:out value="${result.fcltsUuid}"/></td>
                        <td><c:out value="${result.fcltsNm}"/></td>
                        <td><c:out value="${result.fcltsItlpcNmDs}"/></td>
                        <td>
                            <c:choose>
                                <c:when test="${result.deviceStatus eq '비정상'}">
                                    <script type="text/javascript">
                                        $('#p_status').addClass('error');
                                        $('#p_status').removeClass('ok');
                                        $('#msg_status').text('비정상적으로 작동하는 측정장치가 있습니다.');
                                    </script>
                                    <img src="/img/icon_state_error.png">
                                </c:when>
                                <c:when test="${result.deviceStatus eq '정상'}">
                                    <img src="/img/icon_state_ok.png">
                                </c:when>
                            </c:choose>
                        </td>
                        <td></td>
                        <td style="display:none"><c:out value="${result.fcltsItlpcLa}"/></td>
                        <td style="display:none"><c:out value="${result.fcltsItlpcLo}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            </div>


        </li>
    </ul>
    <p class="state_ex">
        <span class="btn_view">유지보수 이력보기</span>
    </p>
</div>

<script language="javascript">

//측정장치 모니터링
let $pop_monitoring = $("#monitoring_popup"),
	$map_icon = $("#map .map_icon");
$pop_monitoring.find(".pop_cancel").on({
	click: function(){
		$(this).parent("div").fadeOut(300);
	}
})
$('#table-1 > tbody > tr').on('click', function(){
	$(this).parent().children().removeClass('on');
	$(this).addClass('on');
	getDetail(this);
});
function getDetail(obj){
	fxText = 'var marker = marker_'+$(obj).find('td:eq(1)').text()+',infoWindow = infoWindow_'+$(obj).find('td:eq(1)').text()+';'
	+'infoWindow.open(map, marker);'
	Function(fxText)();

	var lalo = new naver.maps.LatLng($(obj).find('td:eq(6)').text(), $(obj).find('td:eq(7)').text());
	console.log(lalo);
	map.setCenter(lalo); // 중심 좌표 이동
}
$map_icon.on({
	click: function(){
		let x = $(this).position().left - 177;
		let	y = $(this).position().top - 328;
		let result = $(this).data("id");
		let resultDiv = $("#map .alarm_result2");

		if(result=="ok"){
			resultDiv.removeClass("error").addClass("ok");
			resultDiv.find("strong").text("정상(데이터 수신)");
		}else{
			resultDiv.removeClass("ok").addClass("error");
			resultDiv.find("strong").text("비정상(데이터 미수신)");
		}

		$pop_monitoring.css("top", y).css("left", x)
		$pop_monitoring.fadeIn(300);
	}
})

	$('#table-1 > tbody > tr').on('click', function(){
		$(this).parent().children().removeClass('on');
		$(this).addClass('on');
	});


var mapOptions = {
    center: new naver.maps.LatLng(${x}, ${y}),
    //center: new naver.maps.LatLng(${authInfo.mapX}, ${authInfo.mapY}),
    zoom: 14
};
var map = new naver.maps.Map('map', mapOptions);

<c:forEach var="device" items="${deviceList}" varStatus="status">

var marker_${device.fcltsUuid} = new naver.maps.Marker({
	icon: {
        url: '/img/map_icon_'+<c:if test="${device.stat eq '정상'}">'ok'</c:if><c:if test="${device.stat ne '정상'}">'error'</c:if>+'.png',
        //size: new naver.maps.Size(50, 52),
        //origin: new naver.maps.Point(0, 0),
        //anchor: new naver.maps.Point(25, 26)
    },
    position: new naver.maps.LatLng(${device.fcltsItlpcLa}, ${device.fcltsItlpcLo}),
    map: map
});

var infoWindow_${device.fcltsUuid} = new naver.maps.InfoWindow({
    content:
    	'<div class="monitoring_popup" style="display:block">'
    	+'<button class="pop_cancel" onClick="infoWindow_${device.fcltsUuid}.close()">'
		+'	<span></span>'
		+'	<span></span>'
		+'</button>'
		+'<h3>${device.fcltsNm}</h3>'
		+'<h1>${device.fcltsItlpcAddr}</h1>'
		+'<p class="box_border box_border2 alarm_result2 '+<c:if test="${device.stat eq '정상'}">'ok'</c:if><c:if test="${device.stat ne '정상'}">'error'</c:if>+'">'
		+'	<span>번호 ${device.fcltsUuid}</span>'
		+'	<strong>${device.stat}</strong>'
		+'</p>'
		+'<p class="stl border-bottom">측정 항목 총 21 종<a href="/status/statusRealTimeList.do">실시간 대기현황</a></p>'
		+'<p class="stl">최종 점검일 ${device.checkDt}<a href="/device/maintList.do">유지보수현황</a></p></div>'

	,maxWidth: 380,
	//anchorColor: "#e0e0e0",
    backgroundColor: "",
    anchorSize: new naver.maps.Size(0, 0),
    //borderColor: "#e0e0e0",
    borderWidth: 0

//padding: 25px 25px;
//border-radius: 10px;
//box-shadow: 3px 3px 10px rgb(0 0 0 / 8%);
});

naver.maps.Event.addListener(marker_${device.fcltsUuid}, 'click', getClickHandler_${device.fcltsUuid}());

function getClickHandler_${device.fcltsUuid}() {
    return function(e) {
        var marker = marker_${device.fcltsUuid},
            infoWindow = infoWindow_${device.fcltsUuid};

        if (infoWindow.getMap()) {
            infoWindow.close();
        } else {
            infoWindow.open(map, marker);
        }
    }
}

</c:forEach>

</script>
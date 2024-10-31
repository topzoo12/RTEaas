<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=j5co10chpb"></script>

<div class="board">
<p class="title ${fav}">${pageName.srnNm}</p>
<span class="tl_dong selectBox bottom border wd180">
  <button class="label"><c:if test="${areaDivNm eq ''}">전체</c:if>${areaDivNm}</button>
  <ul class="optionList">
<c:forEach var="select1" items="${selectList1}" varStatus="status">
	<li class="optionItem" data-code="${select1.comCd}">${select1.cdNm}</li>
</c:forEach>
  </ul>
</span>
<ul class="contents">
	<li class="code">
		<table class="table">
			<colgroup>
				<col style="width: 48px">
				<col style="width: 70px">
				<col style="width: ">
				<col style="width: 180px">
			</colgroup>
			<thead>
				<tr>
				<th>No.</th>
				<th>측정소ID</th>
				<th>측정소명</th>
				<th>위치정보</th>
				</tr>
			</thead>
		</table>
		<div class="tbody mapOn" style="height:705px">
		<table class="table" id="table-1">
			<colgroup>
				<col style="width: 48px">
				<col style="width: 70px">
				<col style="width: ">
				<col style="width: calc(180px - 17px)">
			</colgroup>
			<tbody>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr class="<c:if test="${result.rowno eq '1'}">on</c:if>">
				<td><c:out value="${result.rowno}"/></td>
				<td onclick="getClickHandler_${result.deviceId}()"><c:out value="${result.deviceId}"/></td>
				<td><c:out value="${result.deviceNm}"/></td>
				<td align="left"><c:out value="${result.deviceAddr}"/></td>
				<td style="display:none;"><c:out value="${result.x}"/></td>
				<td style="display:none;"><c:out value="${result.y}"/></td>
				<td style="display:none;"><c:out value="${result.deviceType}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue1}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue2}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue3}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue4}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue5}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue6}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue7}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue8}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue9}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue10}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue11}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue12}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue13}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue14}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue15}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue16}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue17}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue18}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue19}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue20}"/></td>
				<td style="display:none;"><c:out value="${result.deviceValue21}"/></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
	</li>
	<li class="item map_box">

		<div id="map" ></div>
	</li>

	<li class="view board_data">
		<p class="tl"></p>
		<p class="stl">번호 <span class="id"></span></p>
		<p class="stl">위치 <span class="addr"></span></p>
		<p class="stl">좌표 <span class="coor">X :  / Y : </span></p>
		<p class="stl">종류 <span class="position"></span></p>

		<ul class="state">
			<c:forEach var="io" items="${ioList}" varStatus="status">
				<li>${io.cdNm} <span></span></li>
			</c:forEach>
			<!--
			<li>일산화탄소 <span></span></li>
			<li>이산화질소 <span></span></li>
			<li>오존 <span></span></li>
			<li>미세먼지 <span></span></li>
			<li>초미세먼지 <span></span></li>
			<li>탄화수소 <span></span></li>
			<li>교통량(유동인구) <span></span></li>
			<li>이산화탄소 <span></span></li>
			<li>가연성가스 <span></span></li>
			<li>온도 <span></span></li>
			<li>습도 <span></span></li>
			<li>대기압 <span></span></li>
			<li>암모니아 <span></span></li>
			<li>에탄올 <span></span></li>
			<li>프로판 <span></span></li>
			<li>벤젠 <span></span></li>
			<li>부탄 <span></span></li>
			<li>수소 <span></span></li>
			<li>진동 <span></span></li>
			<li>포름알데히드 <span></span></li>
			 -->
		</ul>
	</li>
</ul>
</div>
<form name="frm" id="frm" method="POST">
    <input type="hidden" id="frm_areaDiv" name="areaDiv"/>
</form>
<script language="javascript">

$(".tl_dong.selectBox").find(".optionItem").on("click", function(){
	$("#frm_areaDiv").val($(this).data('code'));
	$("#frm").attr("action","/status/statusSynthList.do").submit();
});

var mapDiv = document.getElementById('map');
//console.log(mapDiv.offsetWidth+"/"+ mapDiv.offsetHeight);
var mapOptions = {
    center: new naver.maps.LatLng(${authInfo.mapX}, ${authInfo.mapY}),
    size : new naver.maps. Size(mapDiv.offsetWidth, 740),
    zoom: 14
};
var map = new naver.maps.Map(mapDiv,mapOptions);

<c:forEach var="result" items="${resultList}" varStatus="status">

var marker_${result.deviceId} = new naver.maps.Marker({
	icon: {
		url: '/img/map_icon_01.png',
        //size: new naver.maps.Size(50, 52),
        //origin: new naver.maps.Point(0, 0),
        //anchor: new naver.maps.Point(25, 26)
    },
    position: new naver.maps.LatLng(${result.x}, ${result.y}),
    map: map
});

var infoWindow_${result.deviceId} = new naver.maps.InfoWindow({
    content:
    	'<div class="monitoring_popup address" style="display:block">'
		+'<h3>${result.deviceNm}</h3>'
		+'<h1>${result.deviceAddr}</h1>'
		+'</div>'

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

naver.maps.Event.addListener(marker_${result.deviceId}, 'click', getClickHandler_${result.deviceId}());

function getClickHandler_${result.deviceId}() {
    return function(e) {
    	//console.log("getClickHandler_${result.deviceId}");
        var marker = marker_${result.deviceId},
            infoWindow = infoWindow_${result.deviceId};

        if (infoWindow.getMap()) {
            infoWindow.close();
        } else {
            infoWindow.open(map, marker);
        }
    }
}


</c:forEach>
window.onload = function(){
	//var opInfoWindow = infoWindow_${resultList[0].deviceId};
	//var opMarker = marker_${resultList[0].deviceId};
	//opInfoWindow.open(map, opMarker);

	getDetail($('#table-1 > tbody > .on'));
}


function trOnclick(deviceId){

};

$('#table-1 > tbody > tr').on('click', function(){
	$(this).parent().children().removeClass('on');
	$(this).addClass('on');
	getDetail(this);
});

function getDetail(obj){
	fxText = 'var marker = marker_'+$(obj).find('td:eq(1)').text()+',infoWindow = infoWindow_'+$(obj).find('td:eq(1)').text()+';'
			+'infoWindow.open(map, marker);'
	Function(fxText)();
	//console.log('marker_'+$(obj).find('td:eq(1)').text()+'.click');
	//console.log(Function('marker_'+$(obj).find('td:eq(1)').text()+'.click')());
	$('.view.board_data').html("");
	var detailHtml = '<p class="tl">'+$(obj).find('td:eq(2)').text()+'</p>'
					+'<p class="stl">번호 <span class="id">'+$(obj).find('td:eq(1)').text()+'</span></p>'
					+'<p class="stl">위치 <span class="addr">'+$(obj).find('td:eq(3)').text()+'</span></p>'
					+'<p class="stl">좌표 <span class="coor">X : '+$(obj).find('td:eq(4)').text()+' <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspY : '+$(obj).find('td:eq(5)').text()+'</span></p>'
					+'<p class="stl">종류 <span class="position">'+$(obj).find('td:eq(6)').text()+'</span></p>'

					+'<ul class="state">'

					+'<li>산소 <span>'+$(obj).find('td:eq(7)').text()+'</span></li>'
					+'<li>일산화탄소 <span>'+$(obj).find('td:eq(8)').text()+'</span></li>'
					+'<li>이산화질소 <span>'+$(obj).find('td:eq(9)').text()+'</span></li>'
					+'<li>오존 <span>'+$(obj).find('td:eq(10)').text()+'</span></li>'
					+'<li>미세먼지 <span>'+$(obj).find('td:eq(11)').text()+'</span></li>'
					+'<li>초미세먼지 <span>'+$(obj).find('td:eq(12)').text()+'</span></li>'
					+'<li>탄화수소 <span>'+$(obj).find('td:eq(13)').text()+'</span></li>'
					+'<li>교통량(유동인구) <span>'+$(obj).find('td:eq(14)').text()+'</span></li>'
					+'<li>이산화탄소 <span>'+$(obj).find('td:eq(15)').text()+'</span></li>'
					+'<li>가연성가스 <span>'+$(obj).find('td:eq(16)').text()+'</span></li>'
					+'<li>온도 <span>'+$(obj).find('td:eq(17)').text()+'</span></li>'
					+'<li>습도 <span>'+$(obj).find('td:eq(18)').text()+'</span></li>'
					+'<li>대기압 <span>'+$(obj).find('td:eq(19)').text()+'</span></li>'
					+'<li>암모니아 <span>'+$(obj).find('td:eq(20)').text()+'</span></li>'
					+'<li>에탄올 <span>'+$(obj).find('td:eq(21)').text()+'</span></li>'
					+'<li>프로판 <span>'+$(obj).find('td:eq(22)').text()+'</span></li>'
					+'<li>벤젠 <span>'+$(obj).find('td:eq(23)').text()+'</span></li>'
					+'<li>부탄 <span>'+$(obj).find('td:eq(24)').text()+'</span></li>'
					+'<li>수소 <span>'+$(obj).find('td:eq(25)').text()+'</span></li>'
					+'<li>진동 <span>'+$(obj).find('td:eq(26)').text()+'</span></li>'
					+'<li>포름알데히드 <span>'+$(obj).find('td:eq(27)').text()+'</span></li>'
					+'</ul>';
	$('.view.board_data').html(detailHtml);

	var lalo = new naver.maps.LatLng($(obj).find('td:eq(4)').text(), $(obj).find('td:eq(5)').text());

	map.setCenter(lalo); // 중심 좌표 이동
};

</script>
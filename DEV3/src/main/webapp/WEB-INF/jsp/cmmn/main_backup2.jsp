<%@ page language="java"	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"		uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>




<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDLlGOOgY5Y88zXjRQq_gIHJabQI5eXG1U&callback=initMap"></script>
<script>



	var deviceIdList = "";


	let searchLv;

	if (searchLv == undefined) {
		searchLv = 2
		const temp = document.getElementById('level2');
	 	temp.setAttribute('data-code', '2409180');
	 	temp.setAttribute('data-lat', '37.4201556');
	 	temp.setAttribute('data-lng', '127.1262092');
	}


	markerList1 = [];







// **************************************************************************************************************************************************************


	var potholeCnt;
	var potholeListData;
	var markerId = [];
	var img_id;

	markerList = [];
	markerList1 = [];
	markersTemp = [];

	redIconList = [];
	redIconId = "";

	window.initMap = function () {

	};











</script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/lozad/dist/lozad.min.js"></script>
<script>


$(document).ready(function() {


// -------------------------------------------------------------------------------------------------------------------------------------------------------------



	function drawMarkers(response) {

		$("#info").hide();
		$('.infoDetailWrap').css('display', 'none')
		map.closePopup();
		lorem.scrollTop = 0;

        $('#sort').data('code','desc');
        $('#sort').text('<fmt:message key="DATE_DESC" bundle="${bundle}"/>');

		allData = response.data;

		markerList = []

		markerId = []

		if (!(response.data.length >= 1) ) {
		    if ($(".infoListWrap").css("display") == "none") {
	        	// 접음
	        	$('.infoListWrapNoData').css('display', 'none')

	        } else{
	        	// 펼침
	            if ($(".infoWrap").hasClass("on")) {
	        		$('.infoListWrapNoData').css('display', 'block')
				    $('.infoListWrap').css('display', 'none')
	        	}
	        }

		} else {
			$('.infoListWrapNoData').css('display', 'none')
		}

	// MarkerCluster 그룹 생성
	markerCluster = L.markerClusterGroup({
        disableClusteringAtZoom: 19, // 설정한 줌 레벨  이상에서 클러스터 해제
        maxClusterRadius: 30,        // 클러스터링 반경 50px로 설정
        iconCreateFunction: function(cluster) {
            var count = cluster.getChildCount();
			return L.divIcon({
				html: '<div>' + count + '</div>',
                className: 'mycluster',
                iconSize: L.point(40, 40)
            });
        },
        spiderfyOnMaxZoom: false,
        zoomToBoundsOnClick: false,
		showCoverageOnHover: false // 마우스 오버 시 폴리곤 비활성화
    });

 			sumMarker = [];
 			sumMarkerTest = [];

			var cnt = 0;

			ss = new Date($("#fromDt").val());
			ee = new Date($("#toDt").val());


 		 for (var i = 0; i < response.data.length; i++) {

 			 var markerdate = new Date(response.data[i].timestamp);

 			 if (!(ss < markerdate && ee > markerdate)) {
				continue;
 			 }

			var item = response.data[i];

			var deviceId = fn_device_id(item['device-id']);
			var deviceNm = fn_device_name(item['device-id']);

			var date = new Date(fn_create_time(item['timestamp']));

			var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 );
			var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate();
			var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours();
			var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes();
			var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds();

			c_time  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec;

			var addr_po_locality = (item.way.name == null || item.way.name == '') ? "<fmt:message key="ROAD_INFO_NOT_EXISTS" bundle="${bundle}"/>" : item.way.name;

			var t = L.marker([item.point.latitude, item.point.longitude], {
				id : item['id'],
				lat : item.point['latitude'],
				lng : item.point['longitude'],
				ctime : c_time,
				deviceId : deviceId,
				deviceName : deviceNm,
				addrName : addr_po_locality,
				icon : blueIcon,
				//icon:redIcon
			})//.addTo(map)
				//.on('mouseover', onClick1)
				.on('click', onClick);
			markerCluster.addLayer(t);
			markers.push(t);
			markerId.push(item['id']);

		}

		// 마커 클러스터 그룹에 클릭 이벤트 추가
		markerCluster.on('clusterclick', function(event) {
			var cluster = event.layer;
			var childMarkers = cluster.getAllChildMarkers();

			// 팝업 내용 생성
			var popupContent = '<b>Cluster contains ' + childMarkers.length + ' markers:</b><br>';
			childMarkers.forEach(function(marker, index) {

				console.log(marker.options.id + "\n"
							+ marker.options.deviceName + "\n"
							+ marker.options.deviceId + "\n"
							+ marker.options.addrName + "\n"
							+ marker.options.ctime + "\n"
				);

				var item = marker.options;

				const currentTheme = document.documentElement.getAttribute('data-theme');

				var mouseoverTxt, mouseoutTxt;

				if (currentTheme == "light") {
					mouseoverTxt = "onmouseover=\"this.style.color='blue'; this.style.cursor='pointer'\""
					mouseoutTxt = "onmouseout=\"this.style.color='black'\" "
				} else if (currentTheme == "dark") {
					mouseoverTxt = "onmouseover=\"this.style.color='orange'; this.style.cursor='pointer'\""
					mouseoutTxt = "onmouseout=\"this.style.color='white'\" "
				}


				popupContent += "Marker " + (index + 1) + " : <b id='" + marker.options.id + "'"
														//+ "onmouseover=\"this.style.color='blue'; this.style.cursor='pointer'\""
														//+ "onmouseout=\"this.style.color='black'\" "
														+ mouseoverTxt
														+ mouseoutTxt
														+ "onClick=\"detail('" + item.id + "', '" + item.deviceName + "', '" + item.deviceId + "', '" +  item.addrName + "', '" + item.ctime + "', '" + item.lat + "', '" + item.lng + "', 'Y')\">" + marker.getLatLng().toString() + "</b><br>";
			});

			var popupLatLng = cluster.getLatLng();

			var popup = L.popup()
						.setLatLng(popupLatLng)  // 팝업 위치 설정
						.setContent(popupContent)
						.openOn(map);
		});

		map.addLayer(markerCluster);

		potholeCnt = response.data.length;
		potholeListData = response.data;

		var numItems = $('.infoListItem').length;

		$('.infoList li').remove();

			$.each(response.data, function(index) {

				var markerdate2 = new Date(response.data[index].timestamp);

				if (!(ss < markerdate2 && ee > markerdate2)) {
					return;
				}

					var date = new Date(response.data[index]['timestamp']);

					var dateFormat = date.getFullYear() + '.' + (date.getMonth()+1) + '.'
									+ date.getDate() + ' '
									+ date.getHours() + ':' + date.getMinutes() ;

					var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 );
					var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate();
					var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours();
					var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes();
					var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds();

					dateFormat  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec;

					var addr_po_locality = (response.data[index].way.name == null || response.data[index].way.name == '') ? "<fmt:message key="ROAD_INFO_NOT_EXISTS" bundle="${bundle}"/>" : response.data[index].way.name
					var macAddr = response.data[index]['device-id'];
					var id = response.data[index].id;

					var name = statusName(response.data[index].status);
					var className = statusClassName(response.data[index].status);

					var device_name = "";
					var device_id = "";

					for (var i=0; i< deviceKeyValue.length;i++) {
						if (deviceKeyValue[i].macAddr == macAddr){
							device_name = deviceKeyValue[i].deviceNm;
							device_id = deviceKeyValue[i].deviceId;
						}
					}

					let reg = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/ ]/gim;
					let resultData = id.replace(reg, "");

					markerList.push("<li><a class='infoListItem'>"
						+ "<div class='info'><div class='tit'>"
						+ "<span class='badge sm " + className + "'>" + name + "</span>"
							+ "<h3 class='infoTitle' onClick=\"detail('" + id + "', ' " + device_name + "', '" + device_id + "', '" + addr_po_locality + "', '" + dateFormat + "', '" + response.data[index].point['latitude'] + "', '" + response.data[index].point['longitude'] + "', 'N')\"'>" + device_name + " ( " + device_id + " )</h3></div>"
						+ "<ul class='infoContents'>"
						+ "<li> <fmt:message key="ROAD_NAME" bundle="${bundle}"/> : " + addr_po_locality + "</li>"
						+ "<li> <fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/> : " + dateFormat + "</li>"
						+ "</ul>"
						+ "</div>"
						+ "<div class='infoThumnail'>"
						+ "<img src='${authInfo.restApiUrl}/pothole/" + id + "/thumbnail' alt='대표이미지' onclick=\"originalimg('" + id + "')\">"
						+ "</div>"
						+ "</li>"
					);

			})

		for ( var i = 0; i < markerList.length; i++ ) {
			if(i<10) {
				$(".infoList").append(markerList[i])
			}
		}

		$(".infoListWrap p").text("<fmt:message key="TOTAL" bundle="${bundle}"/> "+ markerList.length + " <fmt:message key="COUNT2" bundle="${bundle}"/>");

		if ( $('.menu_bar_close').css('display') == 'block' ) {
				$('.level_list').css('width', 'calc(100% - 400px)');
            	$('.re-search-container').css('width', 'calc(100% - 400px)');
			} else if ( $('.menu_bar_close').css('display') == 'none' ) {
				$('.level_list').css('width', 'calc(100% - 180px)');
            	$('.re-search-container').css('width', 'calc(100% - 180px)');
			}

            $('.btn_infoWrap').removeClass("off");

            // 펼침
            $('.infoWrap').addClass('on');
            $('.infoListWrap').css('display', 'block');
        	//$(".infoListWrap p").text("총  건")
        	if($('.infoListItem').length < 1) {
        		$('.infoListWrapNoData').css('display', 'block')
        	}

        	lorem.scrollTop = 0;

		if($('#searchSort').data('code') == "asc"){
			$('#asc').click();
		} else if ($('#searchSort').data('code') == "desc") {
			$('#desc').click();
		}

	}

	old_id = "";
	console.log("authInfo - ${authInfo.wtX} / ${authInfo.wtY}")

	map = L.map('map').setView({lat:"${authInfo.wtX}", lng:"${authInfo.wtY}"}, 12);

	L.control.scale({
		imperial: true, metric: true
	}).addTo(map);

	L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
		//minZoom: 14,
		//maxZoom: 19,
		minZoom: '${authInfo.mapMinSize}',
		maxZoom: '${authInfo.mapMaxSize}',
		attribution: '© OpenStreetMap',
		stylers:[{visibility:'off'}]
	    //stylers:[{visibility:'off'}]
	}).addTo(map);

	//mapInfo(map);
	$('.btn_search').click();

	map.on('click', onMapClick);

	map.on('zoomend', function() {
	    var zoomLevel = map.getZoom();
	    console.log('Zoom level changed to:', zoomLevel);

	    if (zoomLevel > 10) {
	        console.log("High zoom level, change cluster behavior...");
	    } else {
	        console.log("Low zoom level, reset cluster behavior...");
	    }
	  //markerCluster.off();
	});


	function nodata(map) {
		//$("div").show(); //display :none 일떄
		$('.infoListWrapNoData').css('display', 'block')
		$('.infoListWrap').css('display', 'none')
	}

	function mapInfo(map) {
		var lat = map.getCenter().lat;
		var lng = map.getCenter().lng;

		map.eachLayer(function(layer) {
			if (layer instanceof L.Marker) {
				map.removeLayer(layer);
			}
		});

		redIconId = "";
		markers = [];
		//console.log($("#level1").data('code'))
		console.log($("#level2").data('code'))
		console.log($("#level3").data('code'))

		var areaCode;

		if(searchLv == 2 || searchLv == 3){

			if ($("#level3").data('code') > 0) {
				areaCode = $("#level3").data('code');
			} else if ($("#level2").data('code') > 0) {
				areaCode = $("#level2").data('code');
			}

		} else {
			$("#alert_msg").html("Level1과 Level2는 필수선택사항입니다.");
			$("#pop_alert").stop().fadeIn(300);
	    	$("#pop_alert").stop().fadeIn(300);
		}


	}

    lorem = document.querySelector(".infoList");

    var scrollT = $(this).scrollTop(); //스크롤바의 상단위치
    var scrollH = $(this).height(); //스크롤바를 갖는 div의 높이

	$('.infoList').on('scroll', function(){
		var scrol_position = document.querySelector('.infoList').scrollTop;
		var scrol_height = document.querySelector('.infoList').scrollHeight;
		var scrol_h = document.querySelector('.infoList').clientHeight;

		if (scrol_position + scrol_h > scrol_height - 10) {

			var startNum = $('.infoListItem').length

			for (var i=startNum;i<markerList.length;i++) {
				if (i == (startNum + 10)) {
					//console.log("멈추기")
					break;
				}else {
					//console.log("더하기")
					$(".infoList").append(markerList[i])
				}
			}
		}
	});


})



$('#sortchk .sorting').on('click', function() {
    // 클릭된 'optionItem'의 data-value 값을 가져옵니다.
    var selectedValue = $(this).data('code');

    var risklistLength = $('input:checkbox[name="risklist"]').length;
    var crackLength = $('input:checkbox[name="crack"]').length;
    var statusstatLength = $('input:checkbox[name="statusstat"]').length;

    var risklistcheckeds = $('input[name="risklist"]:checked').length;
    var crackcheckeds = $('input[name="crack"]:checked').length;
    var statusstatcheckeds = $('input[name="statusstat"]:checked').length;

    var riskBoolean = false;
    var crackBoolean = false;
    var statusstatBoolean = false;

    if (risklistLength == risklistcheckeds) {
    	riskBoolean = true;
    }

    if (crackLength == crackcheckeds) {
    	crackBoolean = true;
    }

    if (statusstatLength == statusstatcheckeds) {
    	statusstatBoolean = true;
    }


    var data = allData;

    if (riskBoolean && crackBoolean && statusstatBoolean) {
		data = allData;
    } else {
    	data = sortDataList;
    }

	var markerListSort = [];

	if (selectedValue == "asc") {
		console.log(">>>>>>>  asc  <<<<<<<")
		data.sort((a, b) => new Date(a.timestamp) - new Date(b.timestamp));
	} else {
		//return dateA - dateB;
		console.log(">>>>>>>  desc  <<<<<<<")
		data.sort((a, b) => new Date(b.timestamp) - new Date(a.timestamp));
	}


	$('.infoList li').remove()

		var cnt = 0;
		$.each(data, function(index) {
			var markerdate2 = new Date(data[index].timestamp);

			if (!(ss < markerdate2 && ee > markerdate2)) {
				return;
			}
			cnt++;

			var date = new Date(data[index]['timestamp'])

			var dateFormat = date.getFullYear() + '.' + (date.getMonth()+1) + '.'
							+ date.getDate() + ' '
							+ date.getHours() + ':' + date.getMinutes();

			var month = (date.getMonth()+1 ) < 10 ?  "0" + "" +  (date.getMonth()+1 ): (date.getMonth()+1 );
			var day = date.getDate() < 10 ?  "0" + "" +  date.getDate() : date.getDate();
			var hour = date.getHours() < 10 ?  "0" + "" +  date.getHours() : date.getHours();
			var min = date.getMinutes() < 10 ?  "0" + "" +  date.getMinutes() : date.getMinutes();
			var sec = date.getSeconds() < 10 ?  "0" + "" +  date.getSeconds() : date.getSeconds();

			dateFormat  = date.getFullYear() + '.' + month + '.' + day + " " + hour + ":" + min + ":" + sec;
			var addr_po_locality = (data[index].way.name == null || data[index].way.name == '') ? "<fmt:message key="ROAD_INFO_NOT_EXISTS" bundle="${bundle}"/>" : data[index].way.name;
			var macAddr = data[index]['device-id'];
			var id = data[index].id;

			var name = statusName(data[index].status);
			var className = statusClassName(data[index].status);

			var device_name = "";
			var device_id = "";

			for (var i=0; i< deviceKeyValue.length;i++) {
				if (deviceKeyValue[i].macAddr == macAddr){
					device_name = deviceKeyValue[i].deviceNm;
					device_id = deviceKeyValue[i].deviceId;
				}
			}

			let reg = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/ ]/gim;
			let resultData = id.replace(reg, "");

			markerListSort.push("<li><a class='infoListItem'>" //jj 다국어 리스트
							+ "<div class='info'><div class='tit'>"
							+ "<span class='badge sm " + className + "'>" + name + "</span>"
								+ "<h3 class='infoTitle' onClick=\"detail('" + id + "', ' " + device_name + "', '" + device_id + "', '" + addr_po_locality + "', '" + dateFormat + "', '" + data[index].point['latitude'] + "', '" + data[index].point['longitude'] + "', 'Y')\"'>" + device_name + " ( " + device_id + " )</h3></div>"
							+ "<ul class='infoContents'>"
							+ "<li> <fmt:message key="ROAD_NAME" bundle="${bundle}"/> : " + addr_po_locality + "</li>"
							+ "<li> <fmt:message key="PHOTO_DATETIME" bundle="${bundle}"/> : " + dateFormat + "</li>"
							+ "</ul>"
							+ "</div>"
							+ "<div class='infoThumnail'>"
							+ "<img src='${authInfo.restApiUrl}/pothole/" + id + "/thumbnail' alt='대표이미지' onclick=\"originalimg('" + id + "')\">"
							+ "</div>"
							+ "</li>"
			);

		})

		for ( var i = 0; i < markerListSort.length; i++ ) {
            if(i<10) {
                $(".infoList").append(markerListSort[i])
            }
        }

	$(".infoListWrap p").text("<fmt:message key="TOTAL" bundle="${bundle}"/> " + cnt + " <fmt:message key="COUNT2" bundle="${bundle}"/>")



});

</script>



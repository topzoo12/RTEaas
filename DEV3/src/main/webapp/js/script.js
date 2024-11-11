$(function() {
	let leftBar = true;
	let winWidth = $(window).width();
	if(leftBar){
	    $("#thead").width($(window).width()-320+"px");
	} else {
	    $("#thead").width($(window).width()-100+"px");
	}
	// if(winWidth > 1401){
	// 	$("body").css("overflow", "hidden");
	// }else{
	// 	$("body").css("overflow-x", "scroll");
	// }

	//익스플로러인지 체크
	let agent = navigator.userAgent.toLowerCase();
	let ie = false;

	if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
		ie = true;
	}

	/*좌측메뉴 높이 조절*/
	//let tmpMainHeight = $(".main .contents_box").height();
	//$(".main").height(tmpMainHeight);

	$(window).resize(function(){
		let wWidth = $(window).width();
		console.log(wWidth);
		if(leftBar){
		    $("#thead").width($(window).width()-320+"px");
		} else {
		    $("#thead").width($(window).width()-100+"px");
		}
		// if(wWidth > 1401){
		// 	$("body").css("overflow-x", "hidden");
		// }else{
		// 	$("body").css("overflow-x", "scroll");
		// }

		/*좌측메뉴 높이 조절*/
		//let tmpMainHeight = $(".main .contents_box").height();
		//$(".main").height(tmpMainHeight);
	});

	function scrollAuto(wWidth) {
		if(wWidth > 1495){
			$(".main").css("overflow-x", "none");
		}else{
			$(".main").css("overflow-x", "scroll");
		}
	}

	var lastActiveMenu = null;

	$(".menu_bar").on({
	    click: function() {
	        $(".sub, .left").addClass("on");
	        $(".menu_bar").css("display", "none");
	        $(".menu_bar_close").css("display", "block");
	        $(".sub .submenu").css("display", "block");
	        $(".main .container .contents_box.contents_layout").addClass("on").css("width", "calc(100% - 240px)");

	        if (lastActiveMenu) {
	            $(lastActiveMenu).addClass("on");
	            $(lastActiveMenu).find("ul").css("display", "block");
	        }

	        leftBar = true;
	        $("#thead").width($(window).width() - 320 + "px");
	    }
	});

	$(".menu_bar_close").on({
	    click: function() {
	        $(".sub, .left").removeClass("on");
	        $(".menu_bar_close").css("display", "none");
	        $(".menu_bar").css("display", "block");
	        $(".sub .submenu").css("display", "none");
	        $(".main .container .contents_box.contents_layout").removeClass("on").css("width", "calc(100% - 45px)");

	        // 마지막으로 열린 메뉴 항목을 저장
	        lastActiveMenu = $(".submenu > li.on").get(0);
	        leftBar = false;
	        $("#thead").width($(window).width() - 100 + "px");
	    }
	});

	$(".submenu > li").on({
	    click: function() {
	        $(".submenu > li").removeClass("on");
	        $(".submenu > li > ul").stop().slideUp();
	        $(this).addClass("on");
	        $(this).find("ul").stop().slideDown();

	        // 메뉴 항목을 클릭할 때마다 해당 항목을 lastActiveMenu에 저장
	        lastActiveMenu = this;
	    }
	});

	/*대기질 best worst*/
	$(".result .tab dt span").on({
		click : function(){
			let tmpId = $(this).data("id");
			$(".result .result_data").css("display", "none");
			$("#"+tmpId).css("display", "block");
			$(".result .tab dt span").removeClass("on");
			$(this).addClass("on");

			$(".result_data .con").css("display", "none");
			$(".result_data > div:first-child .con").css("display", "block");
		}
	});

	$(".result_data h1").on({
		click : function(){
			$(this).parents(".result_data").find(".con").stop().slideUp();
			$(this).siblings(".con").stop().slideDown();
		}
	});
	//메뉴선택
	$(".btn_favorites").on({
		click:function(){
			$(".menu_bar").css("display","none");
		    $(".menu_bar_close").css("display","block");
			$("#favorites").css("display", "block");
			$(".sub .submenu").css("display","block");
			$("#menu").css("display", "none");
		}
	});

	$(".btn_menu").on({
		click:function(){
			$(".menu_bar").css("display","none");
		   $(".menu_bar_close").css("display","block");
			$("#menu").css("display", "block");
			$(".sub_box .submenu").css("display","block");
			$("#favorites").css("display", "none");
		}
	});

	/*팝업*/
	let $pop_open = $('.pop_open'),
        $pop_close = $('.pop_close'),
        $pop_alert_close = $('.pop_alert_close'),
        $pop_confirm_close = $('.pop_confirm_close'),
        $pop_wrap = $('.pop_wrap'),
        $pop_cancel = $('.pop_cancel');

	// 팝업창 켜기
	$pop_open.on({click : pop_open})
	function pop_open(){
        let target_pop = $(this).data('pop')
        $('#pop_'+target_pop).fadeIn(300)
        if($pop_wrap.length){
            $('#pop_'+target_pop).fadeIn(300)
        }
    }

	// 팝업창 끄기
    $pop_close.on({click : pop_close})
    $pop_alert_close.on({click : pop_alert_close})
    $pop_confirm_close.on({click : pop_confirm_close})
    $pop_cancel.on({click : pop_close})
    function pop_close(){
        $pop_wrap.stop().fadeOut(300);
    }

    function pop_alert_close(){
    	$('#pop_alert').stop().fadeOut(300);
    }

    function pop_confirm_close(){
    	$('#pop_confirm').stop().fadeOut(300);
    }

	// let tmpWindowHeight = window.innerHeight-500;
	// let tmpLeftHeight = $("body").height-500();

    let tmpWindowHeight = window.innerHeight;
	let tmpLeftHeight = $(".contents_box").height();

	if(tmpLeftHeight <= tmpWindowHeight){
		tmpLeftHeight = tmpWindowHeight;
	}

	// $(".main .container .left").height(tmpLeftHeight);

	$('.title').on('click',function(){
		var pageUrl = window.location.href; //창의 url을 가져온다.
    	var pageSplit = pageUrl.replace('#','').split('/');
		var params = {
				"srnUrl":"/"+pageSplit[3]+"/"+pageSplit[4].split('.')[0],
				"mnuNm":$('.title').text()
		}
		console.log(params);
		if($('.title').hasClass("message") === true) {
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/deleteFav.do',
				success : function (resp) {
					var json = JSON.parse(resp);
					var result = json.result;
					$('.title').removeClass("message");
					$('.submenu.favorites #'+pageSplit[4].split('.')[0]).remove();
				},
				error : function(err) {
					console.log(err);
				}
			});
		} else {
			var li = pageSplit[4];
			$.ajax({
				type : 'POST',
				data : params,
				dataType : 'text',
				url : '/insertFav.do',
				success : function (resp) {
					var json = JSON.parse(resp);
					var result = json.result;
					$('.title').addClass("message");

					$('.submenu.favorites').append('<li id="'+pageSplit[4].split(".")[0]+'"><a href="/'+pageSplit[3]+'/'+pageSplit[4]+'">'+$('.title').text()+'</a></li>');
				},
				error : function(err) {
					console.log(err);
				}
			});
		}

	});

	//주소찾기
	let $zip_search_go = $('.zip_search_go');
	$zip_search_go.on({click : zip_search_result});
	function zip_search_result(){
        $("#pop_zip .zip_ex").stop().css("display", "none");
		$("#pop_zip .zip_search_result, #pop_zip .zip_btn").stop().css("display", "block");
    }

	//주소찾기 팝업창 끝기
	let $pop_close_zip = $('.pop_close_zip'),
        $pop_cancel_zip = $('.pop_cancel_zip');
	$pop_close_zip.on({click : pop_close_zip})
    $pop_cancel_zip.on({click : pop_close_zip})
    function pop_close_zip(){
        $("#pop_zip").stop().fadeOut(0);
		$("#pop_zip #zip_txt").val("");
		$("#pop_zip .zip_ex").stop().css("display", "block");
		$("#pop_zip .zip_search_result, #pop_zip .zip_btn").stop().css("display", "none");
    }
	//실렉트박스 커스텀
	let tmpSelectBox = $(".selectBox");
	tmpSelectBox.find(".label").on("click", function(e){
		//열려있는 실렉트 박스 전체닫기
		$(".selectBox").removeClass("active");
		$(".selectBox .optionList").css("display", "none");
		if($(this).parent(".selectBox").hasClass("active")){
			$(this).parent(".selectBox").removeClass("active");
			$(this).removeClass("on");
			$(this).siblings(".optionList").css("display", "none");
		}else{
			$(this).parent(".selectBox").addClass("active");
			$(this).addClass("on");
			$(this).siblings(".optionList").css("display", "inline-block");
		}
	});

	tmpSelectBox.find(".optionItem").on("click", function(){
		let tmpSelectValue = $(this).text();
		$(this).parents(".selectBox").find(".label").text(tmpSelectValue);
		var value = $(this).data('code');
		if(!value)value='';
		//tmpSelectBox.find(".label").data('code',value);
		$(this).parent().parent().find(".label").data('code',value);
		$(this).parents(".selectBox").removeClass("active");
		$(this).parent(".optionList").css("display", "none");
	});

	//실렉트 외 클릭시 실렉트 닫기
	$(document).on("mouseup", function(e){
		if(tmpSelectBox.has(e.target).length === 0){
			tmpSelectBox.removeClass("active");
			tmpSelectBox.find(".optionList").css("display", "none");
		}
	});
});
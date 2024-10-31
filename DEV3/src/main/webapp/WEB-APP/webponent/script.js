$(function() {
	let tmpLeftHeight = $(".main .container .contents_box").height()+35;
	$(".main .container .left").height(tmpLeftHeight);

   $("#menu_bar").on({
	   click: function(){
		   $(".sub, .left").addClass("on");
		   $("#menu_bar").css("display", "none");
		   $(".main .contents_bg").css("display", "block").css("height", tmpLeftHeight-20).css("margin", "10px 20px 20px 260px");
		   $(".main .container .left").css("width", "calc(250px)");
		   $(".main .container .contents_box").css("width", "calc(100% - 330px)");
		   $(".submenu > li").removeClass("on");
		   $(".submenu > li > ul").slideUp();
		   $(".submenu > li:first-child").addClass("on");
		   $(".submenu > li:first-child ul").css("display", "block");
	   }
   });

   $(".menu_bar_close").on({
	   click: function(){
		   $(".sub").removeClass("on");
		   $("#menu_bar").css("display", "block");
		   $(".main .contents_bg").css("display", "none");
		   $(".main .container .left").css("width", "calc(30px)");
		   $(".main .container .contents_box").css("width", "calc(100% - 80px)");
		   $(".submenu > li:first-child").removeClass("on");
		   $(".submenu > li:first-child ul").css("display", "none");
	   }
   });

   $(".submenu > li").on({
	   click: function(){
		   $(".submenu > li").removeClass("on");
		   $(".submenu > li > ul").stop().slideUp();
		   $(this).addClass("on");
		   $(this).find("ul").stop().slideDown();
	   }
   });


	//메뉴선택
	$(".btn_favorites").on({
		click:function(){
			$("#favorites").css("display", "block");
			$("#menu").css("display", "none");
		}
	});

	$(".btn_menu").on({
		click:function(){
			$("#menu").css("display", "block");
			$("#favorites").css("display", "none");
		}
	});

	/*팝업*/
	let $pop_open = $('.pop_open'),
        $pop_close = $('.pop_close'),
        $pop_wrap = $('.pop_wrap'),
        $pop_cancel = $('.pop_cancel');

	// 팝업창 켜기
	$pop_open.on({click : pop_open})
	function pop_open(){
        let target_pop = $(this).data('pop')
        console.log('안녕')
        $('#pop_'+target_pop).stop().fadeIn(300)
        if($pop_wrap.length){
            $('#pop_'+target_pop).stop().fadeIn(300)
        }
    }

	// 팝업창 끄기
    $pop_close.on({click : pop_close})
    $pop_cancel.on({click : pop_close})
    function pop_close(){
        $pop_wrap.stop().fadeOut(300);
    }

});
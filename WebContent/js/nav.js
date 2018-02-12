$(function(){
	var li = $(".nav ul li");
	var _div = $(".mune");
	$(".top").hover(function(){
	},function(){
		//$(".subnav").hide();
		$(".subnav").stop(true,true).slideUp(700,'easeInBack');
		//$(".menu_bj").stop(true,false).slideUp(500);
	}).trigger("mouseleave");
	li.hover(function(){
		index = li.index(this);
		ShowMenu(index);
	});
	function ShowMenu(index){
		if(index > 0){
			$(".subnav").stop(true,true).slideDown(1000,'easeOutElastic');
			_div.eq(index).show().siblings().hide();
		}else{
			$(".subnav").stop(true,true).slideUp(700,'easeInBack');
			//$(".menu_bj").stop(true,false).slideUp(500);
		};
		
	}
});





$(function(){
	var h = $(window).height();
	$("body").css("float","left");
});





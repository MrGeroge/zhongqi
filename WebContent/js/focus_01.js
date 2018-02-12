//首面大图效果start============================================================================================
$(function () {

    var sWidth = $("#focus").width(); //获取焦点图的宽度（显示面积）
    var home_len = $("#focus ul li").length; //获取焦点图个数
    var home_index = 0;
    var picTimerindex;

    for (i = 0; i < home_len; i++) {
        $("#focus ul li").eq(i).css("z-index", home_len - i);
    }


    var ddHtml = "";
    for (var i = 0; i < home_len; i++) {
        ddHtml += "<a></a>";
    }
    $(".span ul dl").html(ddHtml);
    //$(".span ul dl").css("width", 17 * (home_len));

    homw_showPics(home_index);
    //为小按钮添加鼠标滑入事件，以显示相应的内容
    $(".span ul dl a").click(function () {
        home_index = $(".span ul dl a").index(this);
        homw_showPics(home_index);
        clearInterval(picTimerindex);
        indextime();
    });

    //上一页按钮
    $(".span ul li#pav").click(function () {
        home_index -= 1;
        if (home_index == -1) { home_index = home_len - 1; }
        homw_showPics(home_index);
    });

    //下一页按钮
    $(".span ul li#next").click(function () {
        home_index += 1;
        if (home_index == home_len) { home_index = 0; }
        homw_showPics(home_index);
    });


    // 鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
    $("#focus").hover(function () {
        clearInterval(picTimerindex);
    }, function () {
        indextime()
    }).trigger("mouseleave");


    function indextime() {
        picTimerindex = setInterval(function () {
            home_index++;
            if (home_index == home_len) { home_index = 0; }
            homw_showPics(home_index);
        }, 4000); //此4000代表自动播放的间隔，单位：毫秒
    }



    //显示图片函数，根据接收的index值显示相应的内容
    function homw_showPics(home_index) { //普通切换
        $("#focus ul li").eq(home_index).fadeIn(1500).siblings().fadeOut();
        $(".span ul dl a").eq(home_index).addClass("hover").siblings().removeClass("hover");; //为当前的按钮切换到选中的效果
        //$("#focus ul li").eq(home_index).show().siblings().hide();
    }
});
//首面大图效果 end==========================================================================================
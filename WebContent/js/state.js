//设置当前状态=======================================================
function nav(n) {
    $("#nav_" + n + " a").addClass("hover");
    $("#nav_" + n).siblings().find("a").removeClass("hover");
}
//设置当前状态=======================================================end








//设置当前左边状态============================================================================
$("#li" + request("typeid")).addClass("hover");

//取得当前地址参数对应的值
function request(paras) {
    var url = location.href;
    var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
    var paraObj = {}
    for (i = 0; j = paraString[i]; i++) {
        paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
    }
    var returnValue = paraObj[paras.toLowerCase()];
    if (typeof (returnValue) == "undefined") {
        return "";
    } else {
        return returnValue;
    }
}
//设置当前左边状态============================================================================end
var url = window.location.href;
    if (url.indexOf(".aspx") >= 0) {
        url = url.replace(".aspx", ".htm");
        window.location.href = url;
        Response.End();
}

$(document).ready(function () {
    //设置伪静态
    $("a").each(function () {
        var _href = $(this).attr("href");
        if (_href != undefined || _href != null) {
            _href = _href.replace(".aspx", ".htm");
            $(this).attr("href", _href);
        }
    });
});
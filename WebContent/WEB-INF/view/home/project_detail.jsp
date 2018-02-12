<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>
    众启
</title>
<link rel="Shortcut Icon" href="img/favicon.ico">
<link rel="Bookmark" href="img/favicon.ico">
<!--公用-->
<script src="./js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="./js/jquery.easing.js" type="text/javascript"></script>
<link href="./css/beas.css" rel="stylesheet" type="text/css">
<link href="./css/inof.css" rel="stylesheet" type="text/css">
<link href="./css/JQstyle.css" rel="stylesheet" type="text/css">
<script src="./js/back.js"></script>
<script src="./js/nav.js" type="text/javascript"></script>
<script src="./js/urlRewrit.js"></script>
<link href="http://fonts.googleapis.com/css?family=News+Cycle" rel="stylesheet" type="text/css">
<!--公用-->
<style type="text/css">
    @font-face {
        font-family: 'dd';
        src: url('font/Novecentowide-Normal.otf');
        src: local('dd'), url('Novecentowide-Normal.otf');
    }

    .num {
        font-family: miso-bold;
    }
</style>
<script src="./js/state.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        //设置当前左边状态
        $("#li" + request("typeid")).addClass("hover");

        //取得当前地址参数对应的值

    });
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
</script>

<style type="text/css">
    object, embed {
        -webkit-animation-duration: .001s;
        -webkit-animation-name: playerInserted;
        -ms-animation-duration: .001s;
        -ms-animation-name: playerInserted;
        -o-animation-duration: .001s;
        -o-animation-name: playerInserted;
        animation-duration: .001s;
        animation-name: playerInserted;
    }

    @-webkit-keyframes playerInserted {
        from {
            opacity: 0.99;
        }

        to {
            opacity: 1;
        }
    }

    @-ms-keyframes playerInserted {
        from {
            opacity: 0.99;
        }

        to {
            opacity: 1;
        }
    }

    @-o-keyframes playerInserted {
        from {
            opacity: 0.99;
        }

        to {
            opacity: 1;
        }
    }

    @keyframes playerInserted {
        from {
            opacity: 0.99;
        }

        to {
            opacity: 1;
        }
    }
</style><body style="float: left;" >
   <jsp:include page="header.jsp"></jsp:include>
    <div class="bread_bg"></div>
    <div class="box_bg">
        <div class="Details">
            <div class="Position">
                <ul style="padding-right:12px;">
                    <span><a href="#"><img alt="跳过导航链接" height="0" width="0" src="./宝能集团_files/WebResource.axd" style="border-width:0px;"></a>
                    <span><a>首页</a></span><span> &gt; </span>
                    <span>案例详情</span><a></a></span>
                </ul>
                
            </div>
            <div class="estate"><h1><img src="./img/h1.jpg" width="250" height="37"></h1>
                
                

<div class="cyzh_xq">
    <h2>${project.name}<a href="javascript:history.go(-1);">
        <img src="./img/fh_tb.jpg"></a></h2>
    <h3>完工日期：${project.finishDate}<br>项目地址：${project.address}</h3>


</div>
<div id="ctl00_ContentPlaceHolder1_ctl00_ctl00_imgShow" class="tup_01">
    <div class="slidebox">
        <a href="javascript:;" id="prev_1" class="btn_1"></a>
        <a href="javascript:;" id="next_1" class="btn_2"></a>
        <a href="javascript:;" id="prevTop_1" class="btn_3"></a>
        <a href="javascript:;" id="nextTop_1" class="btn_4"></a>
        <div id="picBox" class="picBox">
            <ul class="cf" style="width: 3620px; left: -2172px;">
                <c:forEach var="image" items="${images}">
                  <li>
                    <img src="${image.path}" width="724" height="424">
                  </li>
                </c:forEach>
            
            </ul>
        </div>
        <div id="listBox" class="listBox">
            <ul class="cf" style="height: 605px; top: 0px;">
                <c:forEach var="image" items="${images}">
                  <li>
                    <img src="${image.path}" width="724" height="424">
                  </li>
                </c:forEach>
     
            </ul>
        </div>
    </div>
    <script src="./js/news_g_02.js" type="text/javascript"></script>
</div>
<div class="xq_jies">
    <p>${project.description}</p><p><br></p>
</div>

            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(function () {
            nav(5);//设置菜单状态
            $(".cy_nav ul li").eq(parseInt(request("tags")) - 1).addClass("cy_hover").siblings().removeClass("cy_hover");
        });
    </script>
    <!--下拉-->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".dd").hover(function () {
                $(".dd dl").toggle();
            });
        });
    </script>
    <!--下拉-->

    <script type="text/javascript">
        $(function () {
            $(".click").click(function () {
                if ($(".cont").hasClass("hiden")) {
                    $(".cont").removeClass("hiden");
                } else {
                    $(".cont").addClass("hiden");
                };
            });
        });
</script>

        <!--公用-->
        <jsp:include page="footer.jsp"></jsp:include>
        <!--公用-->
</body></html>
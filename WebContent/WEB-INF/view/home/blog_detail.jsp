<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html>
<base href="<%=basePath%>"/>
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><title>
	众启
</title><link rel="Shortcut Icon" href="img/favicon.ico"><link rel="Bookmark" href="img/favicon.ico">
    <!--公用-->
    <script type="text/javascript" charset="UTF-8" src="./js/logb02.js"></script><script src="./js/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="./js/jquery.easing.js" type="text/javascript"></script>
    <link href="./css/beas.css" rel="stylesheet" type="text/css"><link href="./css/inof.css" rel="stylesheet" type="text/css"><link href="./css/JQstyle.css" rel="stylesheet" type="text/css">
    <script src="./js/back.js"></script>
    <script src="./js/nav.js" type="text/javascript"></script>

     <script src="./js/urlRewrit.js"></script>

    <link href="http://fonts.googleapis.com/css?family=News+Cycle" rel="stylesheet" type="text/css">
    <!--公用-->
    <style type="text/css">
        @font-face { font-family: 'dd'; src: url('font/Novecentowide-Normal.otf'); src: local('dd'), url('Novecentowide-Normal.otf'); }

        .num { font-family: miso-bold; }
    </style>
    <script src="./js/state.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            //设置当前左边状态
            $("#li" + request("catalog")).addClass("hover");

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
    
<link href="http://fonts.googleapis.com/css?family=News+Cycle" rel="stylesheet" type="text/css">
<script id="hp_same_"></script>
<script id="hp_done_"></script>
   <style>
      @-moz-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}
      @-webkit-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}
      @-o-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}
      @keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}
      embed,object{animation-duration:.001s;-ms-animation-duration:.001s;-moz-animation-duration:.001s;-webkit-animation-duration:.001s;-o-animation-duration:.001s;animation-name:nodeInserted;-ms-animation-name:nodeInserted;-moz-animation-name:nodeInserted;-webkit-animation-name:nodeInserted;-o-animation-name:nodeInserted;}
   </style>
</head>
<body style="float: left;">
        <jsp:include page="header.jsp"></jsp:include>
        <div class="bread_bg"></div>
        <div class="box_bg">
            <div class="Details">
              <div class="Position">
                <ul>
                  <li>
                    <span><a href="<%=basePath%>Home">首页</a></span>
                  </li>
                  <li>
                    <span>&gt;</span><span>新闻中心</span>
                  </li>
                </ul>
                <h1>
                     <img src="./img/header/BlogDetail.jpg" width="1000" height="128">
                </h1>
            </div>
            <div class="Middle_box">
                <div class="left_box">
                    <ul>
                         <c:forEach var="catalog" items="${catalogs}">
                            <li id="li${catalog.id}"><a href="Home?action=Blog&catalog=${catalog.id}">${catalog.name}</a></li>
                         </c:forEach>
                    </ul>
                </div>
                <div class="right_box">
                   <div class="ne_Details">
                       <div class="bt_h1">
                          <h1><em>${blog.day}</em>${blog.year}-${blog.month}</h1>
                          <h2><strong>${blog.title}</strong>
                          <span>
                              <em>发布者：${blog.source}</em>
                              <em>浏览次数:${blog.clickNumber}</em>
                              <em>标签：${blog.keywords}</em></span></h2>
                       </div>
                       <div class="txd_01">
                           <article>
                            ${blog.content}
                           </article>
                       </div>
                       <div class="new_tou">
                           <h2>
                             <strong>
                               <a href="#" class="an_01"></a>
                               <a href="#" class="an_02"></a>
                             </strong>
                           </h2>
                       </div>
                   </div>
              </div>       
           </div>
       </div>
    </div>
    
    <script type="text/javascript">
					$(function(){
						$(".gy_Activities ul li").hover(function(){
							$(this).addClass("cur").siblings().removeClass("cur");
						},function(){
							$(".gy_Activities ul li").removeClass("cur");
						});
					});
				</script>

    <jsp:include page="footer.jsp"></jsp:include>

</body></html>
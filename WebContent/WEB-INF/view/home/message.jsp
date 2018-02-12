<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>
         众启
    </title>
    <link rel="Shortcut Icon" href="img/favicon.ico">
    <link rel="Bookmark" href="img/favicon.ico">
    <!--¹«ÓÃ-->
    <script type="text/javascript" charset="UTF-8" src="./js/logb01.js"></script>
    <script src="./js/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="./js/jquery.easing.js" type="text/javascript"></script>
    <link href="./css/beas.css" rel="stylesheet" type="text/css">
    <link href="./css/inof.css" rel="stylesheet" type="text/css">
    <link href="./css/JQstyle.css" rel="stylesheet" type="text/css">
    <script src="./js/back.js"></script>
    <script src="./js/nav.js" type="text/javascript"></script>

    <script src="./js/urlRewrit.js"></script>

    <link href="http://fonts.googleapis.com/css?family=News+Cycle" rel="stylesheet" type="text/css">
    <!--¹«ÓÃ-->
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
            //ÉèÖÃµ±Ç°×ó±ß×´Ì¬
            $("#li" + request("id")).addClass("hover");

            //È¡µÃµ±Ç°µØÖ·²ÎÊý¶ÔÓ¦µÄÖµ

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

    <script></script>
    <script id="hp_same_"></script>
    <script id="hp_done_"></script>
    <style>
        @-moz-keyframes nodeInserted {
            from {
                opacity: 0.99;
            }

            to {
                opacity: 1;
            }
        }

        @-webkit-keyframes nodeInserted {
            from {
                opacity: 0.99;
            }

            to {
                opacity: 1;
            }
        }

        @-o-keyframes nodeInserted {
            from {
                opacity: 0.99;
            }

            to {
                opacity: 1;
            }
        }

        @keyframes nodeInserted {
            from {
                opacity: 0.99;
            }

            to {
                opacity: 1;
            }
        }

        embed, object {
            animation-duration: .001s;
            -ms-animation-duration: .001s;
            -moz-animation-duration: .001s;
            -webkit-animation-duration: .001s;
            -o-animation-duration: .001s;
            animation-name: nodeInserted;
            -ms-animation-name: nodeInserted;
            -moz-animation-name: nodeInserted;
            -webkit-animation-name: nodeInserted;
            -o-animation-name: nodeInserted;
        }
        .title{
            font-family:'Adobe Heiti Std';
            font-size:25px;
            
        }
        #input {
            width: 70%;
            font-size: 15pt;
            font-family: 'Adobe Heiti Std';
        }
        #textarea {
            resize: none;
            width: 100%;
            height: 300px;
            font-size: 15pt;
            font-family: 'Adobe Heiti Std';
        }
    </style>
</head>
<body style="float: left;">
         <jsp:include page="header.jsp"></jsp:include>
         
        <div class="bread_bg"></div>
        <div class="box_bg">
            <div class="Details">

                <div class="Position">
                    <ul>
                        <span>
                            <a href="#"><img alt="跳过导航链接" height="0" width="0" src="./img/WebResource.axd" style="border-width:0px;"></a>
                            <span><a href="#">首页</a></span>
                            <span> &gt; </span>
                            <span>联系我们</span><a></a>
                        </span>
                    </ul>
                    <h1>
                        <img src="./img/01.jpg" width="1000" height="128">
                    </h1>
                </div>
                <div class="Middle_box">
                    <div class="left_box">
                        <ul>
                            <li id="li1"><a href="<%=basePath%>Home?action=Contact&id=1">联系我们</a></li>
                            <li id="li2"><a href="<%=basePath%>Home?action=Contact&id=2">客户留言</a></li>
                        </ul>
                    </div>
                    <div class="right_box">
                        <div class="words">
                            <h2>感谢您对众启的支持和关注，如果您有需要和我们取得联系和沟通。请填写下表，我们将在最短时间内和您取得联系。</h2>
                              <script type="text/javascript">
                                  $(document).ready(function(){
                                      $('#submit_mesg_btn').click(function()
                                              {
                                                 $.post("<%=basePath%>Home",
                                                         {
                                                           action:"AddMessage",
                                                           title:$('#title').attr('value'),
                                                           content:$('#content').val(),
                                                           contact:$('#contact').attr('value')
                                                         },
                                                         function(data,status)
                                                         {
                                                             alert("留言成功，感谢留言");
                                                         }      
                                                 );
                                          })
                                      }) 
                              </script> 
                              <ul>                            
                                <li><strong>留言标题</strong><span><input  type="text" name="title" id="title"/></span></li>
                                <li><strong>填写您的留言内容</strong><span><textarea  rows="2" cols="20" name="content" id="content"></textarea></span></li>
                                <li><strong>联络方式</strong><span><input  type="text" name="contact" id="contact"></span></li>
                              </ul>
                            
                            <div id="Validform_checktip"></div>
                            <p>
                                <input type="submit" value="提交" id="submit_mesg_btn"/>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
       <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
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
    <!--公用-->
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
            $("#li" + request("id")).addClass("hover");

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

    <script></script>
    <script id="hp_same_"></script>
    <script id="hp_done_"></script>
    <style type="text/css">
        html, body {
            margin: 0;
            padding: 0;
        }

        .iw_poi_title {
            color: #CC5522;
            font-size: 14px;
            font-weight: bold;
            overflow: hidden;
            padding-right: 13px;
            white-space: nowrap;
        }

        .iw_poi_content {
            font: 12px arial,sans-serif;
            overflow: visible;
            padding-top: 4px;
            white-space: -moz-pre-wrap;
            word-wrap: break-word;
        }
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
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

        .title {
            font-family: 'Adobe Heiti Std';
            font-size: 25px;
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
                        <span id="ctl00_ContentPlaceHolder1_SiteMapPath2">
                            <a href="#"><img alt="跳过导航链接" height="0" width="0" src="./img/WebResource.axd" style="border-width:0px;"></a>
                            <span><a href="#">首页</a></span>
                            <span> &gt; </span>
                            <span>联系我们</span><a id="ctl00_ContentPlaceHolder1_SiteMapPath2_SkipLink"></a>
                        </span>
                    </ul>
                    <h1>
                        <img src="./img/header/Contact.jpg" width="1000" height="128">
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
                        <div class="text">
                            <h2><img src="./img/lianxi.png" width="679" height="168"></h2>
                            <div class="diz" style="padding-bottom: 20px; ">
                                <ul>
                                    <li><p><strong>深圳市众启集团有限公司（办公地址1）</strong></p></li>
                                    <li><p>地址：新概念大厦810室</p></li>
                                    <li><p>电话：0755-22189088</p></li>
                                    <li><p>传真：0755-83845182</p></li>
                                    <li><p>邮编：518023</p></li>
                                </ul>
                            </div>
                            <div style="width: 680px; height: 320px; border: 1px solid rgb(204, 204, 204); overflow: hidden; position: relative; z-index: 0; background-image: url(http://api.map.baidu.com/images/bg.png); color: rgb(0, 0, 0); text-align: left;" id="dituContent">
                                <div id="platform" style="overflow: visible; position: absolute; z-index: 0; left: 2px; top: -13px; cursor: url(http://api.map.baidu.com/images/openhand.cur) 8 8, default;">
                                    <div style="position: absolute; z-index: -1; left: 347px; top: 288px; display: block;">
                                        <img src="http://online1.map.bdimg.com/tile/?qt=tile&amp;x=26400&amp;y=7101&amp;z=17&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 512px; height: 512px; left: -445px; top: -561px;">
                                        <img src="http://online1.map.bdimg.com/tile/?qt=tile&amp;x=26401&amp;y=7100&amp;z=17&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 512px; height: 512px; left: 67px; top: -49px;">
                                        <img src="http://online1.map.bdimg.com/tile/?qt=tile&amp;x=26402&amp;y=7099&amp;z=17&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 512px; height: 512px; left: 579px; top: 463px;">
                                        <img src="http://online0.map.bdimg.com/tile/?qt=tile&amp;x=26401&amp;y=7099&amp;z=17&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 512px; height: 512px; left: 67px; top: 463px;">
                                        <img src="http://online0.map.bdimg.com/tile/?qt=tile&amp;x=26400&amp;y=7100&amp;z=17&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 512px; height: 512px; left: -445px; top: -49px;">
                                        <img src="http://online2.map.bdimg.com/tile/?qt=tile&amp;x=26400&amp;y=7102&amp;z=17&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 512px; height: 512px; left: -445px; top: -1073px;">
                                        <img src="http://online0.map.bdimg.com/tile/?qt=tile&amp;x=26399&amp;y=7101&amp;z=17&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 512px; height: 512px; left: -957px; top: -561px;">
                                        <img src="http://online2.map.bdimg.com/tile/?qt=tile&amp;x=26401&amp;y=7101&amp;z=17&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 512px; height: 512px; left: 67px; top: -561px;">
                                        <img src="http://online2.map.bdimg.com/tile/?qt=tile&amp;x=26402&amp;y=7100&amp;z=17&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 512px; height: 512px; left: 579px; top: -49px;">
                                        <img src="http://online3.map.bdimg.com/tile/?qt=tile&amp;x=26401&amp;y=7102&amp;z=17&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 512px; height: 512px; left: 67px; top: -1073px;">
                                        <img src="http://online3.map.bdimg.com/tile/?qt=tile&amp;x=26402&amp;y=7101&amp;z=17&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 512px; height: 512px; left: 579px; top: -561px;">
                                        <img src="http://online4.map.bdimg.com/tile/?qt=tile&amp;x=26400&amp;y=7099&amp;z=17&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 512px; height: 512px; left: -445px; top: 463px;">
                                        <img src="http://online4.map.bdimg.com/tile/?qt=tile&amp;x=26399&amp;y=7100&amp;z=17&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 512px; height: 512px; left: -957px; top: -49px;">
                                        <img src="http://online3.map.bdimg.com/tile/?qt=tile&amp;x=26399&amp;y=7099&amp;z=17&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 512px; height: 512px; left: -957px; top: 463px;">
                                        <img src="http://online4.map.bdimg.com/tile/?qt=tile&amp;x=26402&amp;y=7102&amp;z=17&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 512px; height: 512px; left: 579px; top: -1073px;">
                                        <img src="http://online1.map.bdimg.com/tile/?qt=tile&amp;x=26399&amp;y=7102&amp;z=17&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 512px; height: 512px; left: -957px; top: -1073px;">
                                    </div><div id="mask" class=" BMap_mask" style="position: absolute; left: -2px; top: 13px; z-index: 9; overflow: hidden; -webkit-user-select: none; width: 697px; height: 550px;"></div>
                                    <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;">
                                        <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 800;">
                                            <div class="pop" style="position: absolute; cursor: default; left: 249px; top: 146px;">
                                                <div style="overflow: hidden; z-index: 1; position: absolute; left: 0px; top: 0px; width: 25px; height: 25px;">
                                                    <img style="border:none;margin:0px;padding:0px;position:absolute;left:0px;top:0px;width:690px;height:786px;" src="http://api.map.baidu.com/images/iw3.png">
                                                </div>
                                                <div class="top" style="overflow: hidden; z-index: 1; position: absolute; left: 25px; top: 0px; width: 202px; height: 25px;">
                                                    <img src="http://api.map.baidu.com/images/iw3.png" style="position:absolute; left: -65px; top: -60px;">
                                                </div>
                                                <div style="overflow: hidden; z-index: 1; position: absolute; left: 227px; top: 0px; width: 25px; height: 25px;">
                                                    <img style="border:none;margin:0px;padding:0px;position:absolute;left:-665px;top:0px;width:690px;height:786px;" src="http://api.map.baidu.com/images/iw3.png">
                                                </div>
                                                <div class="center" style="overflow: hidden; z-index: 1; position: absolute; left: 0px; top: 25px; width: 250px; height: 37px;">
                                                    <img src="http://api.map.baidu.com/images/iw3.png" style="position:absolute;left:-65px;top:-60px;">
                                                </div>
                                                <div style="overflow: hidden; z-index: 1; position: absolute; left: 0px; top: 62px; width: 25px; height: 25px;">
                                                    <img style="border:none;margin:0px;padding:0px;position:absolute;left:0px;top:-665px;width:690px;height:786px;" src="http://api.map.baidu.com/images/iw3.png">
                                                </div>
                                                <div class="bottom" style="overflow: hidden; z-index: 1; position: absolute; left: 25px; top: 62px; width: 202px; height: 24px;">
                                                    <img src="http://api.map.baidu.com/images/iw3.png" style="position:absolute;left:-65px;top:-146px;">
                                                </div>
                                                <div style="overflow: hidden; z-index: 1; position: absolute; left: 227px; top: 62px; width: 25px; height: 25px;">
                                                    <img style="border:none;margin:0px;padding:0px;position:absolute;left:-665px;top:-665px;width:690px;height:786px;" src="http://api.map.baidu.com/images/iw3.png">
                                                </div>
                                                <div style="overflow: hidden; z-index: 1; position: absolute; left: 109px; top: 62px; width: 34px; height: 50px;">
                                                    <img style="border:none;margin:0px;padding:0px;position:absolute;left:-186px;top:-691px;width:690px;height:786px;" src="http://api.map.baidu.com/images/iw3.png">
                                                </div>
                                                <div style="width: 220px; height: 55px; position: absolute; left: 16px; top: 16px; z-index: 10; overflow: hidden;">
                                                    <div class="BMap_bubble_title" style="display: none; overflow: hidden; height: auto; line-height: 24px; white-space: nowrap; width: auto;"></div>
                                                    <div class="BMap_bubble_content" style="width: auto; height: auto;">
                                                        <b class="iw_poi_title" title="本公司">本公司</b>
                                                        <div class="iw_poi_content">新概念大厦810室</div>
                                                    </div>
                                                    <div class="BMap_bubble_max_content" style="display: none; position: relative;"></div>
                                                </div>
                                                <img style="position: absolute; top: 12px; width: 12px; height: 12px; cursor: pointer; z-index: 10000; left: 227px;" src="http://api.map.baidu.com/images/iw_close.gif">
                                                <img style="position: absolute; top: 12px; width: 12px; height: 12px; cursor: pointer; z-index: 10000; display: none; left: 207px;" src="http://api.map.baidu.com/images/iw_plus.gif">
                                            </div>
                                        </div>
                                        <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 700;">
                                            <span class="BMap_Marker BMap_noprint" unselectable="on" "=" " style=" position absolute; padding 0px; margin 0px; border 0px; cursor pointer; background-image url(http />/api.map.baidu.com/images/blank.gif); width: 23px; height: 25px; left: 341px; top: 256px; z-index: -6238852; background-position: initial initial; background-repeat: initial initial;" title=""></span>
                                        </div>
                                        <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 600;">
                                            <div class="shadow" style="position: absolute; left: 227px; top: 190px;" type="infowindow_shadow">
                                                <div style="overflow: hidden; z-index: 1; position: absolute; left: 36px; top: 0px; width: 70px; height: 30px;"><img onmousedown="return false" style="left: -323px; top: 0px;" src="http://api.map.baidu.com/images/iws3.png"></div>
                                                <div style="overflow: hidden; z-index: 1; position: absolute; left: 106px; top: 0px; width: 163px; height: 30px;"><img onmousedown="return false" style="left: -393px; top: 0px;" src="http://api.map.baidu.com/images/iws3.png"></div>
                                                <div style="overflow: hidden; z-index: 1; position: absolute; left: 269px; top: 0px; width: 70px; height: 30px;"><img onmousedown="return false" style="left: -1033px; top: 0px;" src="http://api.map.baidu.com/images/iws3.png"></div>
                                                <div style="overflow: hidden; z-index: 1; position: absolute; left: 29px; top: 30px; width: 77px; height: 7px;"><img onmousedown="return false" style="top: -30px; left: -316px;" src="http://api.map.baidu.com/images/iws3.png"></div>
                                                <div style="overflow: hidden; z-index: 1; position: absolute; left: 106px; top: 30px; width: 185px; height: 7px;"><img onmousedown="return false" style="left: -360px; top: -30px;" src="http://api.map.baidu.com/images/iws3.png"></div>
                                                <div style="overflow: hidden; z-index: 1; position: absolute; left: 291px; top: 30px; width: 77px; height: 7px;"><img onmousedown="return false" style="top: -30px; left: -1056px;" src="http://api.map.baidu.com/images/iws3.png"></div>
                                                <div style="overflow: hidden; z-index: 1; position: absolute; left: 0px; top: 37px; width: 50px; height: 60px;"><img onmousedown="return false" style="left: -14px; top: -310px;" src="http://api.map.baidu.com/images/iws3.png"></div>
                                                <div style="overflow: hidden; z-index: 1; position: absolute; left: 50px; top: 37px; width: 11px; height: 60px;"><img onmousedown="return false" style="left: -255px; top: -310px;" src="http://api.map.baidu.com/images/iws3.png"></div>
                                                <div style="overflow: hidden; z-index: 1; position: absolute; left: 61px; top: 37px; width: 140px; height: 60px;"><img onmousedown="return false" style="left: -440px; top: -310px;" src="http://api.map.baidu.com/images/iws3.png"></div>
                                                <div style="overflow: hidden; z-index: 1; position: absolute; left: 201px; top: 37px; width: 61px; height: 60px;"><img onmousedown="return false" style="left: -255px; top: -310px;" src="http://api.map.baidu.com/images/iws3.png"></div>
                                                <div style="overflow: hidden; z-index: 1; position: absolute; left: 262px; top: 37px; width: 70px; height: 60px;"><img onmousedown="return false" style="left: -754px; top: -310px;" src="http://api.map.baidu.com/images/iws3.png"></div>
                                            </div>
                                        </div>
                                        <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 500;"></div>
                                        <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 400;">
                                            <span class="BMap_Marker" unselectable="on" style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 0px; height: 0px; left: 350px; top: 281px; z-index: -6238852;">
                                                <div style="position: absolute; margin: 0px; padding: 0px; width: 23px; height: 25px; left: -9px; top: -25px; overflow: hidden;">
                                                    <img src="http://app.baidu.com/map/images/us_mk_icon.png" style="border:none;left:-46px; top:-21px; position:absolute;">
                                                </div>
                                                <label class=" BMapLabel" unselectable="on" style="position: absolute; display: none; cursor: pointer; background-color: rgb(255, 255, 255); border: 1px solid rgb(128, 128, 128); padding: 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: normal; font-family: arial, simsun; z-index: 80; color: rgb(51, 51, 51); -webkit-user-select: none; left: 13px; top: -20px;">本公司</label>
                                            </span>
                                        </div>
                                        <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"></div>
                                    </div><div style="position: absolute; z-index: -1; left: 346px; top: 288px;">
                                        <img src="http://online2.map.bdimg.com/tile/?qt=tile&amp;x=52800&amp;y=14202&amp;z=18&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 256px; height: 256px; left: -445px; top: -305px;">
                                        <img src="http://online2.map.bdimg.com/tile/?qt=tile&amp;x=52801&amp;y=14201&amp;z=18&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 256px; height: 256px; left: -189px; top: -49px;">
                                        <img src="http://online1.map.bdimg.com/tile/?qt=tile&amp;x=52801&amp;y=14200&amp;z=18&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 256px; height: 256px; left: -189px; top: 207px;">
                                        <img src="http://online3.map.bdimg.com/tile/?qt=tile&amp;x=52801&amp;y=14202&amp;z=18&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 256px; height: 256px; left: -189px; top: -305px;">
                                        <img src="http://online1.map.bdimg.com/tile/?qt=tile&amp;x=52800&amp;y=14201&amp;z=18&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 256px; height: 256px; left: -445px; top: -49px;">
                                        <img src="http://online3.map.bdimg.com/tile/?qt=tile&amp;x=52802&amp;y=14201&amp;z=18&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 256px; height: 256px; left: 67px; top: -49px;">
                                        <img src="http://online3.map.bdimg.com/tile/?qt=tile&amp;x=52803&amp;y=14200&amp;z=18&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 256px; height: 256px; left: 323px; top: 207px;">
                                        <img src="http://online4.map.bdimg.com/tile/?qt=tile&amp;x=52802&amp;y=14202&amp;z=18&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 256px; height: 256px; left: 67px; top: -305px;">
                                        <img src="http://online0.map.bdimg.com/tile/?qt=tile&amp;x=52800&amp;y=14200&amp;z=18&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 256px; height: 256px; left: -445px; top: 207px;">
                                        <img src="http://online4.map.bdimg.com/tile/?qt=tile&amp;x=52803&amp;y=14201&amp;z=18&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 256px; height: 256px; left: 323px; top: -49px;">
                                        <img src="http://online0.map.bdimg.com/tile/?qt=tile&amp;x=52803&amp;y=14202&amp;z=18&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 256px; height: 256px; left: 323px; top: -305px;">
                                        <img src="http://online2.map.bdimg.com/tile/?qt=tile&amp;x=52802&amp;y=14200&amp;z=18&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 256px; height: 256px; left: 67px; top: 207px;">
                                    </div>
                                </div>
                                <div id="zoomer" style="position:absolute;z-index:0;top:0px;left:0px;overflow:hidden;visibility:hidden;cursor:url(http://api.map.baidu.com/images/openhand.cur) 8 8,default">
                                    <div class="BMap_zoomer" style="top:0;left:0;"></div>
                                    <div class="BMap_zoomer" style="top:0;right:0;"></div><div class="BMap_zoomer" style="bottom:0;left:0;"></div><div class="BMap_zoomer" style="bottom:0;right:0;"></div>
                                </div>
                                <div class=" anchorBL" style="height: 32px; position: absolute; z-index: 10; bottom: 0px; right: auto; top: auto; left: 1px;">
                                    <a title="到百度地图首页" target="_blank" href="http://map.baidu.com/?sr=1" style="outline: none;"><img style="border:none;width:77px;height:32px" src="http://api.map.baidu.com/images/copyright_logo.png"></a>
                                </div>
                                <div unselectable="on" class=" BMap_cpyCtrl anchorBL" style="cursor: default; white-space: nowrap; bottom: 2px; right: auto; top: auto; left: 81px; position: absolute; z-index: 10;">
                                    <span style="color: rgb(0, 0, 0); background-image: none; font-style: normal; font-variant: normal; font-weight: normal; font-size: 11px; line-height: normal; font-family: arial, simsun; display: inline; background-position: initial initial; background-repeat: initial initial;" _cid="1">© 2014 Baidu</span>
                                </div>
                                <div unselectable="on" class=" BMap_stdMpCtrl BMap_stdMpType0 BMap_noprint anchorTL" style="width: 52px; height: 226px; bottom: auto; right: auto; top: 10px; left: 10px; position: absolute; z-index: 1100;">
                                    <div class="BMap_stdMpPan">
                                        <div class="BMap_button BMap_panN" title="向上平移"></div><div class="BMap_button BMap_panW" title="向左平移"></div><div class="BMap_button BMap_panE" title="向右平移"></div><div class="BMap_button BMap_panS" title="向下平移"></div>
                                        <div class="BMap_stdMpPanBg BMap_smcbg"></div>
                                    </div><div class="BMap_stdMpZoom" style="height: 167px; width: 52px;">
                                        <div style="height: 167px; width: 37px;">
                                            <div class="BMap_button BMap_stdMpZoomIn" title="放大一级">
                                                <div class="BMap_smcbg"></div>
                                            </div><div class="BMap_button BMap_stdMpZoomOut" title="缩小一级"><div class="BMap_smcbg"></div></div>
                                        </div><div class="BMap_stdMpSlider" style="height: 133px;">
                                            <div class="BMap_stdMpSliderBgTop" style="height: 124px;"><div class="BMap_smcbg"></div></div><div class="BMap_stdMpSliderBgBot" style="top: 124px;"><div class="BMap_smcbg"></div></div>
                                            <div class="BMap_stdMpSliderMask" title="放置到此级别"></div><div class="BMap_stdMpSliderBar" title="拖动缩放" style="cursor: url(http://api.map.baidu.com/images/openhand.cur) 8 8, default; top: 1px;">
                                                <div class="BMap_smcbg"></div>
                                            </div>
                                        </div><div class="BMap_zlHolder">
                                            <div class="BMap_zlSt"><div class="BMap_smcbg"></div></div><div class="BMap_zlCity"><div class="BMap_smcbg"></div></div>
                                            <div class="BMap_zlProv"><div class="BMap_smcbg"></div></div><div class="BMap_zlCountry"><div class="BMap_smcbg"></div></div>
                                        </div>
                                    </div>
                                </div>
                                <div unselectable="on" class=" BMap_omCtrl BMap_noprint anchorBR quad4" style="width: 150px; height: 150px; bottom: 0px; right: 0px; top: auto; left: auto; position: absolute; z-index: 10;">
                                    <div class="BMap_omOutFrame" style="width: 149px; height: 149px;">
                                        <div class="BMap_omInnFrame" style="bottom: auto; right: auto; top: 8px; left: 8px; width: 139px; height: 139px;">
                                            <div class="BMap_omMapContainer" style="overflow: hidden; background-image: url(http://api.map.baidu.com/images/bg.png); color: rgb(0, 0, 0); text-align: left;">
                                                <div id="platform" style="overflow: visible; position: absolute; z-index: 0; left: 1px; top: 0px; cursor: url(http://api.map.baidu.com/images/openhand.cur) 8 8, default;">
                                                    <div id="mask" class=" BMap_mask" style="position: absolute; left: -1px; top: 0px; z-index: 9; overflow: hidden; -webkit-user-select: none; width: 139px; height: 139px;"></div>
                                                    <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;">
                                                        <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 800;"></div>
                                                        <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 700;">
                                                            <div class="BMap_Division" style="position: absolute; width: 44px; display: block; overflow: hidden; border-width: 1px; border-style: solid; border-color: rgb(173, 207, 244) rgb(39, 75, 139) rgb(39, 75, 139) rgb(132, 176, 223); opacity: 1; z-index: 60; -webkit-user-select: none; left: 46px; top: 52px; height: 34px;">
                                                                <div class="BMap_omViewInnFrame" style="width: 42px; height: 32px;"><div class="BMap_omViewMask"></div></div>
                                                            </div>
                                                        </div>
                                                        <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 600;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 500;"></div>
                                                        <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 400;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"></div>
                                                    </div><div style="position: absolute; z-index: -1; left: 69px; top: 69px;"><img src="http://online1.map.bdimg.com/tile/?qt=tile&amp;x=3299&amp;y=887&amp;z=14&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 256px; height: 256px; left: -284px; top: -99px;"><img src="http://online2.map.bdimg.com/tile/?qt=tile&amp;x=3300&amp;y=887&amp;z=14&amp;styles=pl&amp;udt=30130712" style="position: absolute; border: none; width: 256px; height: 256px; left: -28px; top: -99px;"></div>
                                                </div>
                                            </div><div class="BMap_omViewMv" style="cursor: url(http://api.map.baidu.com/images/openhand.cur) 8 8, default; width: 44px; height: 34px; left: 47px; top: 52px;"><div class="BMap_omViewInnFrame" style="width: 42px; height: 32px;"><div></div></div></div>
                                        </div>
                                    </div><div class="BMap_omBtn" style="bottom: 0px; right: 0px; top: auto; left: auto;"></div>
                                </div><div unselectable="on" class=" BMap_scaleCtrl BMap_noprint anchorBL" style="bottom: 18px; right: auto; top: auto; left: 81px; width: 62px; position: absolute; z-index: 10;"><div class="BMap_scaleTxt" unselectable="on">50&nbsp;米</div><div class="BMap_scaleBar BMap_scaleHBar"><img style="border:none" src="http://api.map.baidu.com/images/mapctrls11.png"></div><div class="BMap_scaleBar BMap_scaleLBar"><img style="border:none" src="http://api.map.baidu.com/images/mapctrls11.png"></div><div class="BMap_scaleBar BMap_scaleRBar"><img style="border:none" src="http://api.map.baidu.com/images/mapctrls11.png"></div></div>
                            </div>

                            <script type="text/javascript">
                                //创建和初始化地图函数：
                                function initMap() {
                                    createMap();//创建地图
                                    setMapEvent();//设置地图事件
                                    addMapControl();//向地图添加控件
                                    addMarker();//向地图中添加marker
                                }

                                //创建地图函数：
                                function createMap() {
                                    var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
                                    var point = new BMap.Point(121.426206, 31.194182);//定义一个中心点坐标
                                    map.centerAndZoom(point, 18);//设定地图的中心点和坐标并将地图显示在地图容器中
                                    window.map = map;//将map变量存储在全局
                                }

                                //地图事件设置函数：
                                function setMapEvent() {
                                    map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
                                    map.enableScrollWheelZoom();//启用地图滚轮放大缩小
                                    map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
                                    map.enableKeyboard();//启用键盘上下左右键移动地图
                                }

                                //地图控件添加函数：
                                function addMapControl() {
                                    //向地图中添加缩放控件
                                    var ctrl_nav = new BMap.NavigationControl({ anchor: BMAP_ANCHOR_TOP_LEFT, type: BMAP_NAVIGATION_CONTROL_LARGE });
                                    map.addControl(ctrl_nav);
                                    //向地图中添加缩略图控件
                                    var ctrl_ove = new BMap.OverviewMapControl({ anchor: BMAP_ANCHOR_BOTTOM_RIGHT, isOpen: 1 });
                                    map.addControl(ctrl_ove);
                                    //向地图中添加比例尺控件
                                    var ctrl_sca = new BMap.ScaleControl({ anchor: BMAP_ANCHOR_BOTTOM_LEFT });
                                    map.addControl(ctrl_sca);
                                }

                                //标注点数组
                                var markerArr = [{ title: "本公司", content: "新概念大厦810室", point: "121.426193|31.194267", isOpen: 1, icon: { w: 23, h: 25, l: 46, t: 21, x: 9, lb: 12 } }
                                ];
                                //创建marker
                                function addMarker() {
                                    for (var i = 0; i < markerArr.length; i++) {
                                        var json = markerArr[i];
                                        var p0 = json.point.split("|")[0];
                                        var p1 = json.point.split("|")[1];
                                        var point = new BMap.Point(p0, p1);
                                        var iconImg = createIcon(json.icon);
                                        var marker = new BMap.Marker(point, { icon: iconImg });
                                        var iw = createInfoWindow(i);
                                        var label = new BMap.Label(json.title, { "offset": new BMap.Size(json.icon.lb - json.icon.x + 10, -20) });
                                        marker.setLabel(label);
                                        map.addOverlay(marker);
                                        label.setStyle({
                                            borderColor: "#808080",
                                            color: "#333",
                                            cursor: "pointer"
                                        });

                                        (function () {
                                            var index = i;
                                            var _iw = createInfoWindow(i);
                                            var _marker = marker;
                                            _marker.addEventListener("click", function () {
                                                this.openInfoWindow(_iw);
                                            });
                                            _iw.addEventListener("open", function () {
                                                _marker.getLabel().hide();
                                            })
                                            _iw.addEventListener("close", function () {
                                                _marker.getLabel().show();
                                            })
                                            label.addEventListener("click", function () {
                                                _marker.openInfoWindow(_iw);
                                            })
                                            if (!!json.isOpen) {
                                                label.hide();
                                                _marker.openInfoWindow(_iw);
                                            }
                                        })()
                                    }
                                }
                                //创建InfoWindow
                                function createInfoWindow(i) {
                                    var json = markerArr[i];
                                    var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>" + json.content + "</div>");
                                    return iw;
                                }
                                //创建一个Icon
                                function createIcon(json) {
                                    var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w, json.h), { imageOffset: new BMap.Size(-json.l, -json.t), infoWindowOffset: new BMap.Size(json.lb + 5, 1), offset: new BMap.Size(json.x, json.h) })
                                    return icon;
                                }

                                initMap();//创建和初始化地图
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
   </body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: Tetiana
  Date: 12.04.2016
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<META NAME="keywords" LANG="ukr">
<head>

    <title>Friends Recommender</title>

    <link rel="shortcut icon" href="images/favicon.gif" />
    <link rel="stylesheet" type="text/css" href="style.css" />
    <script src="//vk.com/js/api/openapi.js" type="text/javascript"></script>
    <script type="text/javascript">
        VK.init({
            apiId: 5409577
        });
    </script>
</head>
<body>
<!--Header Begin-->
<div id="header">
    <div class="center">
        <div id="logo"><a href="#">Friends Recommender</a></div>
        <!--Menu Begin-->

        <div id="menu">
            <ul>
                <li><a class="active"href="index.jsp"><span>Home</span></a></li>
                <li><a href="recommendation.jsp"><span>Recommend</span></a></li>
                <li><a onclick="VK.Auth.login(authInfo);" href="#"><span>Log in</span></a></li>

            </ul>
        </div>
        <!--Menu END-->

        <script language="javascript">

            function authInfo(response) {
                if (response.session) {
                    alert('user: '+response.session.mid);
                } else {
                    alert('not auth');
                }
            }
            VK.UI.button('login_button');//там поки що посто логування

        </script>
    </div>
</div>
<!--Header END-->
<!--SubPage Toprow Begin-->
<div id="toprowsub">
    <div class="center">
        <h2>Friends Recommender</h2>
    </div>
</div>
<!--Toprow END-->
<!--SubPage MiddleRow Begin-->
<div id="midrow">
    <div class="center">
        <div class="textbox2">
            <p><h4><i>Friends Recommender</i> зручний і корисний застосунок для тих хто не любить сидіти вдома і віддає перевагу активному відпочинку в широкому колі друзів.</a></h4></p>
            <p><h4>Хочете відвідати виставку або піти на концерт? Але не знаєте, кому з Ваших друзів це до душі! Тоді Ви на правильному шляху)<i>Friends Recommender</i> допоможе Вам з`ясувати хто з Ваших друзів залюбки розділить з Вами час в квест-кімнатах або піде на концерт</h4></p>
        </div>
    </div>
</div>
<!--MiddleRow END-->
<!--SubPage BottomRow Begin-->
<div id="bottomrow">
    <div id="box2holder">
        <h1>Events</h1>
        <div class="box2"> <img alt="" src="images/222.jpg" width="405" height="320" />
            <h3>Подорожі</h3>
            <p>Неважливо, чи ви бажаєте подорожувати навколо світу чи просто поїхати в сусіднє місто!</p>
        </div>
        <div class="box2"> <img alt="" src="images/234.png" width="405" height="320" />
            <h3>Кіно</h3>
            <p>Або хочете подивитися кіно з справжнім поціновувачем!</p>
        </div>


    </div>
</div>

<!--BottomRow END-->
<!--Footer Begin-->
<div id="footer">
    <div class="foot"> <span>Friends Recommender</span> by Tetyana Voytovych and Iryna Zhuravel </div>
</div>

<!--Footer END-->
</body>
</html>

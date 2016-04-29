<%--
  Created by IntelliJ IDEA.
  User: Tetiana
  Date: 24.04.2016
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<META NAME="keywords" LANG="ukr">
<head>
    <title>Friends Recommender</title>

    <link rel="shortcut icon" href="images/favicon.gif" />
    <link rel="stylesheet" type="text/css" href="style.css" />
    <script src="//vk.com/js/api/openapi.js" type="text/javascript"></script>
    <script language="javascript">
        VK.init({
            apiId: 5409577
        });

        function work() {
            var str_a = document.getElementById("association").value;
            var str_n = document.getElementById("en").value;
            var number = document.getElementById("number").value;
            if(isEmpty(str_a)||isEmpty(str_n)||isEmpty(number)) alert( "Введіть усі дані");
            str_a = str_a.toLowerCase();
            var re = /\s*,\s*/
            var tagList = str_a.split(re);
            str_n = str_n.toLowerCase();
            var t =' ';
            var c = 0;
            var items = new Array();

            VK.Api.call("friends.get", {fields: "user_id, first_name, last_name, interests, music, movies, books, games"}, function (data) {
                for (i = 0; i < data.response.length; i++) {
                    var t1 = '' + data.response[i].interests;
                    var t2 = '' + data.response[i].games;
                    var t3 = '' + data.response[i].music;
                    var t4 = '' + data.response[i].movies;
                    var t5 = '' + data.response[i].books;
                    t1=t1.toLowerCase();
                    t2=t2.toLowerCase();
                    t3=t3.toLowerCase();
                    t4=t4.toLowerCase();
                    t5=t5.toLowerCase();
                    for(j=0; j < tagList.length;j++){
                        if (t1.indexOf(tagList[j]) != -1) {
                            c=c+1;
                        }
                        if (t2.indexOf(tagList[j]) != -1) {
                            c=c+1;
                        }
                        if (t3.indexOf(tagList[j]) != -1) {
                            c=c+1;
                        }
                        if (t4.indexOf(tagList[j]) != -1) {
                            c=c+1;
                        }
                        if (t5.indexOf(tagList[j]) != -1) {
                            c=c+1;
                        }

                    }
                   if(c>0){
                       t = data.response[i].first_name+" "+data.response[i].last_name + ' ';
                       items.push({count:c,name:t });

                   }
                    c=0;
                }
                items.sort(function (a, b) {
                    if (a.count > b.count) {
                        return -1;
                    }
                    if (a.count < b.count) {
                        return 1;
                    }
                    return 0;
                });

                var res ="";
                var n = number;
                if(number>items.length){alert("Нажаль, наш сервіс знайшов меншу\nкількість друзів, яких зацікавила б дана подія");n=items.length}
                for(i=0;i<n;i++){
                    res += items[i].name+" "+items[i].count+"\n";
                }
                if(res.length!=0){ alert(res);}


            });

        }
        function isEmpty(str){
            return (str == null) || (str.length == 0);
        }


        function authInfo(response) {
            if (response.session) {
                alert('user: '+response.session.mid);
            } else {
                alert('not auth');
            }
        }





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
                <li><a href="index.jsp"><span>Home</span></a></li>
                <li><a class="active" href="recommendation.html"><span>Recommend</span></a></li>
                <li><a onclick="VK.Auth.login(authInfo);" href="#"><span>Log in</span></a></li>
            </ul>
        </div>
        <!--Menu END-->
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
            <div class="imagebox">
                <img alt="" src="images/456.jpg" width="400" height="320" />
            </div>
            <form action="javacode" name="event" method="post">
            <p><b>Введіть назву події, куди б ви хотіли піти:</b><br>
                <input type="text" id="en" size="45">
            </p>
            <br>
           <!-- </form>-->
            <!--<form action="javacode" name="association" method="post">-->
            <p><b>Ваші асоціації:</b><Br>
                <textarea name="comment" id = "association" cols="45" rows="3"></textarea></p>
                <!-- </form>-->
            <br>
            <!-- <form action="javacode" name="event" method="post">-->
            <p><b>Розмір компанії:</b><br>
                <input type="number" id="number"size="10" min="1">
            </p>
                <!-- </form>-->
            <br>
            <p><input type="button" value="Рекомендувати" onclick="work()">
                <input type="reset" value="Очистити"></p>
            <!-- <form action="javacode" target="_blank" target="file:///C:/Users/Zhuravel/Downloads/5_SMPR/Sydorenko/recommender%20system/results.html">
       ... -->
            </form>
        </div>
    </div>
</div>
<!--MiddleRow END-->

<!--Footer Begin-->
<div id="footer">
    <div class="foot"> <span>Friends Recommender</span> by Tetyana Voytovych and Iryna Zhuravel </div>
</div>
<!--Footer END-->
</body>
</html>

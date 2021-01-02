<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注 册</title>
    <link rel="stylesheet" type="text/css" href="css/LoginAndRegister.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1803712_190aham4mrt.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <script>
        <%--
            0：邮箱可以注册
            1：邮箱已被注册
            2：邮箱格式错误
            3：密码长度不符合要求
        --%>
        var flag = 0;
        var xhr;

        function validate() {
            var email = document.getElementById("email");
            var password = document.getElementById("myPassword");
            var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;

            if (!pattern.test(email.value)) {
                flag = 2;
                return false;
            }
            if (password.value.length < 6 || password.value.length > 12) {
                flag = 3;
                return false;
            }
        }

        function createXMLHttpRequest() {
            try {
                xhr = new XMLHttpRequest();
            } catch (e) {
                try {
                    xhr = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {
                    xhr = false;
                }
            }
            if (!xhr) {
                alert("初始化XMLHttpRequest对象失败！");
            }
        }

        function emailValidate() {
            //创建XMLHttpRequest对象
            createXMLHttpRequest();
            var email = document.getElementById("email").value;
            var url = "RegisterServlet";
            var content = "type=validate&email=" + email;
            xhr.open("post", url, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var text = xhr.responseText;
                    if(text == "√"){
                        flag = 0;
                    }
                    else if(text == "×"){
                        flag = 1;
                    }
                }
            };
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send(content);

            validate();

            if(flag == 0 || flag == 3){
                document.getElementById("info").innerText = "√";
            }
            else if(flag != 3){
                document.getElementById("info").innerText = "×";
            }
        }
        function ifNull() {
            validate();
            var email = document.getElementById("email");
            var password = document.getElementById("myPassword");

            if (email.value == "") {
                alert("邮箱不能为空！");
                return false;
            }
            else if(flag == 1){
                alert("邮箱已被注册！");
                return false;
            }
            else if(flag == 2){
                alert("邮箱格式错误！");
                return false;
            }
            else if(password.value == ""){
                alert("密码不能为空！");
                return false;
            }
            else if (flag == 3) {
                alert("密码长度不符合要求！请输入6-12位密码！");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
<form action="RegisterServlet" method="post" onsubmit="return ifNull();" autocomplete="off">
    <span id="info" style="color: red"></span>
    <div class="form-wrapper">
        <div class="header">
            register
        </div>
        <div class="input-wrapper">
            <div class="border-wrapper">
                <input type="text" name="email" placeholder="email" autocomplete="off" class="border-item" id="email"
                       onblur="emailValidate()">
            </div>
            <div class="border-wrapper">
<%--                <input type="text" name="password" autocomplete="off" onfocus="this.type='password'">--%>
                <input type="text" name="myPassword" autocomplete="off" onfocus="this.type='password'" placeholder="password" class="border-item" id="myPassword">
            </div>
        </div>
        <div class="action">
            <input class="btn" type="submit" value="注 册">
        </div>
        <div class="icon-wrapper">
            <i class="iconfont icon-weixin"></i>
            <i class="iconfont icon-weibo"></i>
            <i class="iconfont icon-github"></i>
        </div>
        <div class="goto-page">
            <span>已有账号？去<a href="login.jsp">登录</a></span>
        </div>
    </div>
</form>
</body>
</html>

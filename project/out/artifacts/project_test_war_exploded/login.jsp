<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登 录</title>
    <link rel="stylesheet" type="text/css" href="css/LoginAndRegister.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1803712_190aham4mrt.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
</head>
<body>
<form action="LoginServlet" method="post">
    <div class="form-wrapper">
        <div class="header">
            login
        </div>
<%--        <div class="type">--%>
<%--            <div class="user-type">--%>
<%--                <label>管理员：</label>--%>
<%--                <label><input type="radio" name="userType" class="border-item" value="manager" checked></label>--%>
<%--                <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>--%>
<%--                <label>员工：</label>--%>
<%--                <label><input type="radio" name="userType" class="border-item" value="employee"></label>--%>
<%--            </div>--%>
<%--        </div>--%>
        <div class="input-wrapper">
            <div class="border-wrapper">
                <input type="text" name="email" placeholder="email" autocomplete="off" class="border-item">
            </div>
            <div class="border-wrapper">
<%--                <input type="text" name="myPassword" autocomplete="off" onfocus="this.type='password'">--%>
                <input type="text" name="myPassword" autocomplete="off" onfocus="this.type='password'" placeholder="password" autocomplete="new-" class="border-item">
            </div>
        </div>
        <div class="action">
            <input class="btn" type="submit" value="登 录">
        </div>
        <div class="icon-wrapper">
            <i class="iconfont icon-weixin"></i>
            <i class="iconfont icon-weibo"></i>
            <i class="iconfont icon-github"></i>
        </div>
        <div class="goto-page">
            <span>没有账号？去<a href="register.jsp">注册</a></span>
        </div>
    </div>
</form>
</body>
</html>

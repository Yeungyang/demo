<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="app.jsp"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=appPath%>/css/page.css">
    <link rel="stylesheet" type="text/css" href="<%=appPath%>/css/common.css">
</head>
<body>
<!-- 内容区域 -->
<div class="w1180 content clear">
    <div class="left">
        <h3 class="title">
            <span>系统选项</span>
        </h3>
        <table rules="rows" bordercolor="#999999" frame="below" width="180px">
            <tbody>
            <tr>
                <td>
                    <a href="<%=appPath%>/EmployeeServlet?method=info"><span>员工信息</span></a>
                </td>
            </tr>
            <tr>
                <td>
                    <a><span style="color: #CC0000">添加员工</span></a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href=""><span>工资统计</span></a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href=""><span>发放工资</span></a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href=""><span>工资信息</span></a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>

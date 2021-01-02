<%@ page import="com.jsu.bean.Employee" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../app.jsp"%>
<%!
    int num = 0;
%>
<%
    this.num++;
    List<Employee> employees = (List<Employee>)session.getAttribute("employeeList");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/iconfont.css">
<%--    <script type="text/javascript" src="../framework/jquery-1.11.3.min.js"></script>--%>
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
<%--    <script type="text/javascript" src="../layui/layui.js"></script>--%>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="../css/jquery.mCustomScrollbar.css">
    <script src="../js/jquery.min.js"></script>
<%--    <script src="../framework/jquery-ui-1.10.4.min.js"></script>--%>
<%--    <script src="../framework/jquery.mousewheel.min.js"></script>--%>
<%--    <script src="../framework/jquery.mCustomScrollbar.min.js"></script>--%>
    <%--    <script src="../framework/cframe.js"></script><!-- 仅供所有子页面使用 -->--%>
    <!-- 公共样式 结束 -->

    <style>
        .layui-form-label{
            width: 100px;
        }
        .layui-input-block{
            margin-left: 130px;
        }
    </style>
</head>

<body>
<form id="addForm" class="layui-form" action="<%=appPath%>/DepartServlet?method=add" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">部门名称：</label>
        <div class="layui-input-block">
            <input type="text" name="departName" required lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">负责人：</label>
        <div class="layui-input-block">
            <select id="mySelect" name="emIdAndName" style="display: block" class="layui-input">
                <option style="display: none"></option>
                <%
                    if(employees != null){
                %>
                <%
                    for(Employee employee : employees){
                %>
                <option value="<%=employee.getId()%>-<%=employee.getName()%>">
                    <%=employee.getName()%>
                </option>
                <%
                }
                %>
                <%
                    }
                %>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话：</label>
        <div class="layui-input-block">
            <input type="text" name="emTel" readonly class="layui-input tel" value="">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱：</label>
        <div class="layui-input-block">
            <input type="text" name="emEmail"  readonly class="layui-input email" value="">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">创建时间：</label>
        <div class="layui-input-block">
            <input type="date" name="createTime" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注：</label>
        <div class="layui-input-block">
            <textarea name="bz" class="layui-textarea"></textarea>
        </div>
    </div>

    <div align="center">
        <div align="center">
            <button  type="button" class="layui-btn" lay-submit lay-filter="submitBut">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script>
    document.getElementById("mySelect").onchange = function () {
        var selectValue = this.options[this.options.selectedIndex].value;
        var arrayValue = selectValue.split('-');
        $.ajax({
            async:true,
            type:'get',
            data:{
                "method":"getSelected",
                "emId":arrayValue[0],
            },
            url:"<%=appPath%>/DepartServlet",
            success:function (data) {
                var resObj = JSON.parse(data);
                $(".tel").attr("value",resObj.tel);
                $(".email").attr("value",resObj.email);
            }
        });
    };
    $('button[type=button]').click(function () {
        $.ajax({
            async:true,
            type:'get',
            data:{
                "method":"add",
                "departName":$('input[name=departName]').val(),
                "emIdAndName":$('select[name=emIdAndName]').val(),
                "emTel":$('input[name=emTel]').val(),
                "emEmail":$('input[name=emEmail]').val(),
                "createTime":$('input[name=createTime]').val(),
                "bz":$('textarea[name=bz]').val(),
            },
            url:"<%=appPath%>/DepartServlet",
            success:function () {
                parent.location.reload();
                <%--window.location.replace("<%=appPath%>/DepartServlet?method=info");--%>
                window.location.href = "<%=appPath%>/DepartServlet?method=info";
            }
        });
    });
</script>
</body>
</html>

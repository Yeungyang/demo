<%@ page import="com.jsu.bean.Employee" %>
<%@ page import="com.jsu.bean.Page" %>
<%@ page import="com.jsu.util.DateUtil" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../app.jsp" %>
<%
    Page page1 = (Page) session.getAttribute("page");
%>
<html>
<head>
    <title>Title</title>
    <script src="<%=appPath%>/js/jquery.min.js"></script>
    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/iconfont.css">
    <script type="text/javascript" src="../framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
    <script type="text/javascript" src="../layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="../css/jquery.mCustomScrollbar.css">
    <script src="../framework/jquery-ui-1.10.4.min.js"></script>
    <script src="../framework/jquery.mousewheel.min.js"></script>
    <script src="../framework/jquery.mCustomScrollbar.min.js"></script>
    <script src="../framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <style type="text/css">
        #tab, #tab tr td {
            text-align: center;
            vertical-align: middle;
        }

        .pageOperate {
            margin-top: 19px;
            font-size: 18px;
        }
        .pageOperate table{
            border-width: 1px;
            border-style: solid;
            border-color: #e6e6e6;
        }
        .pageOperate table td{
            width: 78px;
            text-align: center;
        }

        .pageNum a {
            font-size: 18px;
        }
    </style>
</head>
<body onload="showData()">

<div class="cBody">
<div class="content clear">
    <div class="console">
        <form class="layui-form" action="<%=appPath%>/EmployeeServlet?method=search" method="post">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="searchInfo" required lay-verify="required" placeholder="输入检索信息" autocomplete="off" class="layui-input">
                </div>
                <button type="submit" class="layui-btn search" lay-submit lay-filter="formDemo">搜索</button>
            </div>
        </form>
    </div>
    <form action="<%=appPath%>/EmployeeServlet?method=info" method="post">
        <div align="center" class="table-box" style="text-align: center">
            <h3 class="title" style="margin: auto"></h3>
            <table class="layui-table" id="tab" border="1" cellspacing="0" align="center">
                <thead>
                <tr>
                    <td>员工工号</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>年龄</td>
                    <td>部门</td>
                    <td>身份证</td>
                    <td>电话</td>
                    <td>邮箱</td>
                    <td>出生日期</td>
                    <td>职务</td>
                    <td>地址</td>
                    <td>操作</td>
                </tr>
                </thead>
            </table>
        </div>
        <div align="center" class="pageOperate">
            <table align="center" border="1" cellspacing="0">
                <tr>
                    <td><button class="layui-btn lastPage"><a href="javascript:beforePage(<%=page1.getBeforePage()%>)">上一页</a></button></td>
                    <td>共<%=page1.getTotalPages()%>页</td>
                    <td>共<%=page1.getTotalRows()%>行</td>
                    <td>第<%=page1.getCurrentPage()%>页</td>
                    <td><button class="layui-btn nextPage"><a href="javascript:afterPage(<%=page1.getAfterPage()%>)">下一页</a></button></td>
                </tr>
            </table>
<%--            <a  class="layui-btn layui-btn-xs" onclick="deleteBut(this,<%=employee.getId()%>)">删除</a>&nbsp;&nbsp;&nbsp; +--%>
        </div>
        <script>
            //展示数据
            function showData() {
                <%
                if (page1.getList() != null) {
                        for (Employee employee : (List<Employee>) page1.getList()) {
                %>
                var str = "";//定义用于拼接的字符串
                //拼接表格的行和列
                // str = "<tr><td>" + data[i].name + "</td><td>" + data[i].password + "</td></tr>";
                str = "<tr><td>" + "<%=employee.getJobNum()%>" +
                    "</td><td>" + "<%=employee.getName()%>" +
                    "</td><td>" + "<%=employee.getSex()%>" +
                    "</td><td>" + "<%=employee.getAge()%>" +
                    "</td><td>" + "<%=employee.getDepartId()%>" +
                    "</td><td>" + "<%=employee.getIDCard()%>" +
                    "</td><td>" + "<%=employee.getTel()%>" +
                    "</td><td>" + "<%=employee.getEmail()%>" +
                    "</td><td>" + "<%=DateUtil.format(employee.getBirthday())%>" +
                    "</td><td>" + "<%=employee.getTypeWork()%>" +
                    "</td><td>" + "<%=employee.getAddress()%>" +
                    "</td><td>" + "<a  class=\"layui-btn layui-btn-xs\" onclick=\"deleteBut(this,<%=employee.getId()%>)\">删除</a>&nbsp;&nbsp;&nbsp;" +
                    "<a  class=\"layui-btn layui-btn-xs\" href=\"<%=appPath%>/employee/employee_update.jsp?empId=<%=employee.getId()%>\">修改</a>" +
                    "</td></tr>";
                //追加到table中
                $("#tab").append(str);
                <%
                        }
                    }
                %>
            }

            function beforePage(page) {
                console.log("current:"+page);
                console.log("pageSize:"+<%=page1.getPageSize()%>);
                window.location = "<%=appPath%>/EmployeeServlet?method=info&currentPage=" + page + "&pageSize=<%=page1.getPageSize()%>";
            }

            function afterPage(page) {
                console.log("current:"+page);
                console.log("pageSize:"+<%=page1.getPageSize()%>);
                window.location = "<%=appPath%>/EmployeeServlet?method=info&currentPage=" + page + "&pageSize=<%=page1.getPageSize()%>";
            }

            function deleteBut(_this,empId) {
                layer.confirm('是否确定删除？', {
                    btn: ['确定', '取消'] //按钮
                }, function() {
                    $(_this).parent().parent().remove();
                    $.ajax({
                        async:true,
                        type:'get',
                        data:{
                            "method":"delete",
                            "empId":empId,
                        },
                        url:"<%=appPath%>/EmployeeServlet",
                        success:function () {

                        }
                    });
                    layer.msg('删除成功', {
                        icon: 1
                    });
                }, function() {
                    layer.msg('取消删除', {
                        time: 1500 //15s后自动关闭
                    });
                });
            }
            <%--$(".search").click(function () {--%>
            <%--    $.ajax({--%>
            <%--        async:true,--%>
            <%--        type:'get',--%>
            <%--        data:{--%>
            <%--            "method":"search",--%>
            <%--            "searchInfo":$('input[name=searchInfo]').val(),--%>
            <%--        },--%>
            <%--        url:"<%=appPath%>/EmployeeServlet",--%>
            <%--        success:function () {--%>
            <%--            // parent.location.reload();--%>
            <%--            &lt;%&ndash;window.location.replace("<%=appPath%>/DepartServlet?method=info");&ndash;%&gt;--%>
            <%--            window.location.href = "<%=appPath%>/EmployeeServlet?method=info&search=search";--%>
            <%--        }--%>
            <%--    });--%>
            <%--});--%>
        </script>
    </form>
</div>
</div>
</body>
</html>

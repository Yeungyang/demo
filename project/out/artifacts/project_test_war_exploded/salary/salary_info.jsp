<%@ page import="com.jsu.util.DateUtil" %>
<%@ page import="com.jsu.bean.Page" %>
<%@ page import="com.jsu.bean.Salary" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../app.jsp"%>
<%
    Page page1 = (Page) session.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>工资信息</title>

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/iconfont.css">
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="../css/jquery.mCustomScrollbar.css">
    <script type="text/javascript" src="../framework/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <script src="../framework/jquery-ui-1.10.4.min.js"></script>
    <script src="../framework/jquery.mousewheel.min.js"></script>
    <script src="../framework/jquery.mCustomScrollbar.min.js"></script>
    <script src="../framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <!-- 公共样式 结束 -->

    <style>
        .layui-table img {
            max-width: none;
        }
        #tab tr td{
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
    <div class="console">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="name" required lay-verify="required" placeholder="输入检索信息" autocomplete="off" class="layui-input">
                </div>
                <button class="layui-btn">搜索</button>
            </div>
        </form>
        <script>
            layui.use('form', function() {
                var form = layui.form;
                //监听提交
                form.on('submit(formDemo)', function(data) {
                    layer.msg(JSON.stringify(data.field));
                    return false;
                });
            });
        </script>
    </div>

    <table class="layui-table" id="tab" border="1" cellspacing="0" align="center">
        <thead>
        <tr>
            <td rowspan="2">工号</td>
            <td rowspan="2">姓名</td>
            <td colspan="3">工资</td>
            <td rowspan="2">专项扣款</td>
            <td rowspan="2">税前工资</td>
            <td colspan="4">五险一金(个人缴纳)</td>
            <td rowspan="2">缴税</td>
            <td rowspan="2">实际工资</td>
            <td rowspan="2" class="time">时间</td>
        </tr>
        <tr>
            <td>基本工资</td>
            <td>奖金</td>
            <td>提成</td>
            <td>养老</td>
            <td>医疗</td>
            <td>失业</td>
            <td>公积金</td>
        </tr>
        </thead>
    </table>
    <script>

    </script>

    <!-- layUI 分页模块 -->
    <div id="pages"></div>
    <div align="center" class="pageOperate">
        <table align="center" border="1" cellspacing="0">
            <tr>
                <td><button class="layui-btn"><a href="javascript:beforePage(<%=page1.getBeforePage()%>)">上一页</a></button></td>
                <td>共<%=page1.getTotalPages()%>页</td>
                <td>共<%=page1.getTotalRows()%>行</td>
                <td>第<%=page1.getCurrentPage()%>页</td>
                <td><button class="layui-btn"><a href="javascript:afterPage(<%=page1.getAfterPage()%>)">下一页</a></button></td>
            </tr>
        </table>
    </div>
    <script>
        //展示数据
        function showData() {
            <%
            if (page1.getList() != null) {
                    for (Salary salary : (List<Salary>) page1.getList()) {
            %>
            var str = "";//定义用于拼接的字符串
            //拼接表格的行和列
            // str = "<tr><td>" + data[i].name + "</td><td>" + data[i].password + "</td></tr>";
            str = "<tr><td>" + "<%=salary.getEmJobNum()%>" +
                "</td><td>" + "<%=salary.getEmName()%>" +
                "</td><td>" + "<%=salary.getBaseSalary()%>" +
                "</td><td>" + "<%=salary.getReward()%>" +
                "</td><td>" + "<%=salary.getPenalty()%>" +
                "</td><td>" + "<%=salary.getSpecial()%>" +
                "</td><td>" + "<%=salary.getPretaxSalary()%>" +
                "</td><td>" + "<%=salary.getYanglao()%>" +
                "</td><td>" + "<%=salary.getYiliao()%>" +
                "</td><td>" + "<%=salary.getShiye()%>" +
                "</td><td>" + "<%=salary.getGongjijin()%>" +
                "</td><td>" + "<%=salary.getTaxation()%>" +
                "</td><td>" + "<%=salary.getActualSalary()%>" +
                "</td><td  class=\"time\">" + "<%=DateUtil.format(salary.getTime())%>" +
                "</td></tr>";
            //追加到table中
            $("#tab").append(str);
            <%
                    }
                }
            %>
        }

        function beforePage(page) {
            window.location = "<%=appPath%>/SalaryServlet?method=info&currentPage=" + page + "&pageSize=<%=page1.getPageSize()%>";
        }

        function afterPage(page) {
            window.location = "<%=appPath%>/SalaryServlet?method=info&currentPage=" + page + "&pageSize=<%=page1.getPageSize()%>";
        }
    </script>
</div>
</body>

</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../app.jsp" %>
<%
    List<String> stringList = (List<String>)session.getAttribute("salaryDate");
%>
<html>
<head>
    <title>Title</title>
    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/iconfont.css">
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="../css/jquery.mCustomScrollbar.css">
    <script src="../js/echarts.min.js"></script>
    <script type="text/javascript" src="../framework/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../layui/layui.js"></script>
    <!-- 滚动条插件 -->
<%--    <script src="../framework/jquery-ui-1.10.4.min.js"></script>--%>
<%--    <script src="../framework/jquery.mousewheel.min.js"></script>--%>
<%--    <script src="../framework/jquery.mCustomScrollbar.min.js"></script>--%>
    <%--    <script src="../framework/cframe.js"></script><!-- 仅供所有子页面使用 -->--%>
</head>
<body>
<div class="cBody">
    <div class="console">
        <form class="layui-form" action="<%=appPath%>/EmployeeServlet?method=report" method="post">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <select name="selectTime" style="display: block" id="mySelect" class="layui-input">
                        <option style="display: none"></option>
                        <%
                            if(stringList != null){
                                for(String str : stringList){
                        %>
                        <option value="<%=str%>">
                            <%=str%>
                        </option>
                        <%
                                }
                            }
                        %>
                    </select>
                    <%--                        <input type="text" name="searchInfo" required lay-verify="required" placeholder="输入检索信息" autocomplete="off" class="layui-input">--%>
                </div>
                <button type="button" class="layui-btn search" lay-submit lay-filter="formDemo">查看</button>
            </div>
        </form>
    </div>
    <div id="main" style="width: 600px;height:400px;"></div>
    <script>
        $("#mySelect").change(function () {
            var selectValue = $("#mySelect").val();
        });

        var myChart = echarts.init(document.getElementById('main'));
        $('button[type=button]').click(function () {
            $.ajax({
                async:true,
                type:'post',
                data:{
                    "method":"report",
                    "selectTime":$('select[name=selectTime]').val(),
                },
                url:"<%=appPath%>/SalaryServlet",
                success:function (data) {
                    console.log(data);
                    var res = data.split("-");
                    var departName = JSON.parse(res[0]);
                    var salary = JSON.parse(res[1]);
                    console.log(departName);
                    console.log(salary);
                    var option = {
                        xAxis: {
                            type: 'category',
                            boundaryGap: false,
                            data: departName,
                        },
                        yAxis: {
                            type: 'value'
                        },
                        series: [{
                            data: salary,
                            type: 'line',
                            areaStyle: {}
                        }]
                    };
                    myChart.setOption(option);
                }
            });
        });
        function refreshData(data,_this) {
            $(_this).addClass("active");
            $(_this).siblings().removeClass("active");
            if(!myChart) {
                return;
            }

            //更新数据
            var option = myChart.getOption();
            option.series[0].data = data;
            myChart.setOption(option);
        }
    </script>
</div>
</body>
</html>

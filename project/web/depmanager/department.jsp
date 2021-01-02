<%@ page import="com.jsu.bean.Page" %>
<%@ page import="com.jsu.util.DateUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../app.jsp"%>
<%
    Page page1 = (Page) session.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>部门管理</title>

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
    <!-- 公共样式 结束 -->
    <style>
        #customList td{
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

<body>
<div class="cBody">
    <form class="layui-form" action="">
        <div class="console">
            <div class="layui-form-item">
                <a class="layui-btn" onclick="addBut()">新增</a>
            </div>
        </div>

        <table id="customList" class="layui-table">
            <thead>
            <tr>
                <td rowspan="2">名称</td>
                <td rowspan="2">负责人</td>
                <td colspan="2">联系方式</td>
                <td rowspan="2">创建时间</td>
                <td rowspan="2">备注</td>
                <td rowspan="2">操作</td>
            </tr>
            <tr>
                <td>电话</td>
                <td>邮箱</td>
            </tr>
            </thead>
            <tbody>
            <%
                if(page1.getList() != null){
                    for(Department depart : (List<Department>) page1.getList()){
            %>
            <tr>
                <input type="hidden" name="mgId" value="<%=depart.getMgId()%>">
                <td width="50px"><input type="hidden" value="<%=depart.getDepartId()%>-<%=depart.getName()%>" name="departName" class="layui-input"><%=depart.getName()%></td>
                <td width="60px"><input type="hidden" value="<%=depart.getEmName()%>" name="emName" class="layui-input"><%=depart.getEmName()%></td>
                <td width="100px"><input type="hidden" value="<%=depart.getEmTel()%>" name="emTel" class="layui-input"><%=depart.getEmTel()%></td>
                <td width="115px"><input type="hidden" value="<%=depart.getEmEmail()%>" name="emEmail" class="layui-input"><%=depart.getEmEmail()%></td>
                <td width="85px"><input type="hidden" value="<%=depart.getCreateTime()%>" name="createTime" class="layui-input"><%=DateUtil.format(depart.getCreateTime())%></td>
                <td><input type="hidden" value="<%=depart.getBz()%>" name="bz" class="layui-input"><%=depart.getBz()%></td>
                <td width="90px">
                    <a class="layui-btn layui-btn-xs" onclick="updateBut(<%=depart.getDepartId()%>)">修改</a>
                    <a class="layui-btn layui-btn-xs" onclick="deleteBut(this,<%=depart.getDepartId()%>)">删除</a>
                </td>
            </tr>
            <%
                }
                }
            %>
            </tbody>
        </table>
    </form>
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
</div>
<script>
    function beforePage(page) {
        window.location = "<%=appPath%>/DepartServlet?method=info&currentPage=" + page + "&pageSize=<%=page1.getPageSize()%>";
    }

    function afterPage(page) {
        window.location = "<%=appPath%>/DepartServlet?method=info&currentPage=" + page + "&pageSize=<%=page1.getPageSize()%>";
    }
</script>

<script>
    function addBut(){
        var layer = layui.layer;
        //iframe层-父子操作
        updateFrame = layer.open({
            title: "部门信息修改",
            type: 2,
            area: ['40%', '70%'],
            scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
            maxmin: true,
            content: 'depart_add.jsp'
        });
        // layui.use('layer', function() {
        //
        // });
    }
    function updateBut(id){
        layui.use('layer', function() {
            var layer = layui.layer;

            //iframe层-父子操作
            updateFrame = layer.open({
                title: "部门信息修改",
                type: 2,
                area: ['40%', '70%'],
                scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                maxmin: true,
                content: 'depart_update.jsp?departId='+id
            });
        });
    }
    function deleteBut(_this,departId) {
        layer.confirm('确定要删除么？', {
            btn: ['确定', '取消'] //按钮
        }, function() {
            $(_this).parent().parent().remove();
            $.ajax({
                async:true,
                type:'get',
                data:{
                    "method":"delete",
                    "departId":departId,
                },
                url:"<%=appPath%>/DepartServlet",
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
</script>
</body>
</html>

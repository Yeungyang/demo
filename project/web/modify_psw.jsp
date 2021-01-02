<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
    <meta   http-equiv= "Pragma"   content= "no-cache" />
    <meta   http-equiv= "Cache-Control"   content= "no-cache" />
    <meta   http-equiv= "Expires"   content= "0" />

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <link rel="stylesheet" type="text/css" href="css/iconfont.css">
    <script type="text/javascript" src="framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
    <script type="text/javascript" src="layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.css">
    <script src="framework/jquery-ui-1.10.4.min.js"></script>
    <script src="framework/jquery.mousewheel.min.js"></script>
    <script src="framework/jquery.mCustomScrollbar.min.js"></script>
    <!--		<script src="../framework/cframe.js"></script>&lt;!&ndash; 仅供所有子页面使用 &ndash;&gt;-->
    <!-- 公共样式 结束 -->

</head>

<body>
<div class="cBody">
    <form id="addForm" class="layui-form" autocomplete="off">
        <div class="layui-form-item">
            <label class="layui-form-label">原始密码</label>
            <div class="layui-input-inline shortInput">
                <input type="password" style="display: none;"/>
                <input type="password" name="oldpassword" required lay-verify="required" autocomplete="new-password" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-inline shortInput">
                <input type="password" name="password" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认新密码</label>
            <div class="layui-input-inline shortInput">
                <input type="password" name="password2" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn confirmBut">确认修改</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

    <script>
        $('.confirmBut').click(function () {
            $.ajax({
                async:true,
                type:'post',
                data:{
                    'method':'modifyPsw',
                    'password':$('input[name=password]').val(),
                    'password2':$('input[name=password2]').val(),
                    'oldpassword':$('input[name=oldpassword]').val(),
                },
                url:'ManagerServlet',
                success:function (data) {
                    console.log(data);
                    alert(data);
                }
            });
        });
    </script>

</div>
</body>
</html>

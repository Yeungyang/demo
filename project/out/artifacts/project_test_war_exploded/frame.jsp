<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="app.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>

	<!-- 公共样式 开始 -->
	<link rel="shortcut icon" href="images/favicon.ico"/>
	<link rel="bookmark" href="images/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/iconfont.css">
	<script type="text/javascript" src="framework/jquery-1.11.3.min.js" ></script>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
	<!--[endif]-->
	<script src="framework/html5shiv.min.js"></script>
	<script src="framework/respond.min.js"></script>
	<script type="text/javascript" src="layui/layui.js"></script>
	<!-- 滚动条插件 -->
	<link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.css">
	<script src="framework/jquery-ui-1.10.4.min.js"></script>
	<script src="framework/jquery.mousewheel.min.js"></script>
	<script src="framework/jquery.mCustomScrollbar.min.js"></script>
<%--	<script src="framework/cframe.js"></script><!-- 仅供所有子页面使用 -->--%>
	<!-- 公共样式 结束 -->

	<link rel="stylesheet" type="text/css" href="css/frameStyle.css">
	<script type="text/javascript" src="framework/frame.js" ></script>

</head>

<body>
<!-- 左侧菜单 - 开始 -->
<div class="frameMenu">
	<div class="logo">
		<img src="images/logo.png"/>
		<div class="logoText">
			<h1>工资管理系统</h1>
			<p>guanlixitong</p>
		</div>
	</div>
	<div class="menu">
		<ul>
			<li>
				<a class="menuFA" href="javascript:void(0)" onclick="menuCAClick('index.jsp',this)"><i class="iconfont icon-zhishi left"></i>首页</a>
			</li>
			<li>
				<a class="menuFA" href="javascript:void(0)" onclick="menuCAClick('<%=appPath%>/EmployeeServlet?method=info',this)"><i class="iconfont icon-huojian left"></i>员工信息</a>
			</li>
			<li>
				<a class="menuFA" href="javascript:void(0)" onclick="menuCAClick('<%=appPath%>/employee/employee_add.jsp',this)"><i class="iconfont icon-huojian left"></i>添加员工</a>
			</li>
			<li>
				<a class="menuFA" href="javascript:void(0)" onclick="menuCAClick('<%=appPath%>/DepartServlet?method=info',this)"><i class="iconfont icon-huojian left"></i>部门管理</a>
			</li>
			<li>
				<a class="menuFA" href="javascript:void(0)" onclick="menuCAClick('salary/salary_pay.jsp',this)"><i class="iconfont icon-huojian left"></i>发放工资</a>
			</li>
			<li>
				<a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-icon left"></i>工资统计<i class="iconfont icon-dajiantouyou right"></i></a>
				<dl>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('<%=appPath%>/SalaryServlet?method=info&pageSize=8',this)">工资统计表格</a></dt>
					<dt><a href="javascript:void(0)" onclick="menuCAClick('<%=appPath%>/salary/salary_report.jsp',this)">工资统计报表</a></dt>
				</dl>
			</li>
		</ul>
	</div>
</div>
<!-- 左侧菜单 - 结束 -->

<div class="main">
	<!-- 头部栏 - 开始 -->
	<div class="frameTop">
		<img class="jt" src="images/top_jt.png"/>
		<div class="topMenu">
			<ul>
				<li><a href="javascript:void(0)"><i class="iconfont icon-yonghu1"></i>管理员</a></li>
				<li><a href="javascript:void(0)" onclick="menuCAClick('modify_psw.jsp',this)"><i class="iconfont icon-xiugaimima"></i>修改密码</a></li>
				<li><a id="exit"><i class="iconfont icon-084tuichu"></i>退出</a></li>
			</ul>
		</div>
	</div>
<%--	 onclick="menuCAClick('modify_psw.jsp',this)"--%>
	<script>
		$("#exit").on("click",function(){  //将退出按钮的id设置为exit，然后将这个函数在公共文件里面即可
			var flag = confirm("是否退出");
			if(flag){
				window.location = "logout.jsp";
			}
		})
	</script>
	<!-- 头部栏 - 结束 -->

	<!-- 核心区域 - 开始 -->
	<div class="frameMain">
		<div class="title" id="frameMainTitle">
			<span><i class="iconfont icon-xianshiqi"></i>后台首页</span>
		</div>
		<div class="con">
			<iframe id="mainIframe" src="index.jsp" scrolling="no"></iframe>
		</div>
	</div>
	<!-- 核心区域 - 结束 -->
</div>
</body>

</html>
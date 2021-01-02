<%@ page import="com.jsu.bean.Department" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jsu.bean.Employee" %>
<%@ page import="com.jsu.dao.EmployeeDAO" %>
<%@ page import="com.jsu.util.DateUtil" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="../app.jsp" %>
<%--<%@ include file="../left.jsp"%>--%>
<%
	List<Department> departments = (List<Department>) session.getAttribute("departmentList");
	String empId = request.getParameter("empId");
	Employee employee = EmployeeDAO.getOneEmById(Integer.parseInt(empId));
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>工资管理系统--添加员工信息</title>
	<link rel="stylesheet" type="text/css" href="<%=appPath%>/css/center.css">
	<script type="text/javascript" src="<%=appPath%>js/My97DatePicker/WdatePicker.js"></script>
<%--	<link rel="stylesheet" type="text/css" href="<%=appPath%>/css/page.css">--%>
<%--	<link rel="stylesheet" type="text/css" href="<%=appPath%>/css/common.css">--%>
	<style type="text/css">
		.content .right .title {
			height: 40px;
			border-bottom-style: none;
			border-bottom-color: #CCCCCC;
		}

		.content .right input{
			font-size: 18px;
			outline: none;
		}
		.content .right select{
			font-size: 18px;
			outline: none;
		}
		.content .right select option{
			font-size: 15px;
			outline: none;
		}
		.content .right table{
			border: 1px solid #000000;
		}
		.content .right table tr {
			color: black;
			font-size: 18px;
			line-height: 40px;
		}
		.content .right table tr td{
			vertical-align: middle;
			text-align: center;
			width: 260px;
			border: 1px solid #000000;
		}
		.content .right table tr th{
			vertical-align: middle;
			text-align: center;
			width: 120px;
			border: 1px solid #000000;
		}
	</style>
</head>
<body>
<!-- 内容区域 -->
<div class="w1180 content clear">
	<form action="<%=appPath%>/EmployeeServlet?method=update" method="post">
		<div class="right" style="text-align: center">
			<h3 class="title"></h3>
			<input type="hidden" name="mgId" value="<%=mgId%>">
			<table class="myTable" style="margin: auto;width: 70%;border-collapse: collapse" cellSpacing=0 rules=all>
				<tr>
					<th colspan="4" style="font-size: 18px">
						修&nbsp;改&nbsp;员&nbsp;工&nbsp;信&nbsp;息
					</th>
				</tr>
				<tr>
					<th>员工工号：</th>
					<td>
						<input type="hidden" name="empId" value="<%=employee.getId()%>"/>
						<input type="text" name="jobNum" value="<%=employee.getJobNum()%>"/>
					</td>
					<th>员工姓名：</th>
					<td>
						<input type="text" name="name" value="<%=employee.getName()%>"/>
					</td>
				</tr>

				<tr>
					<th>性&nbsp;&nbsp;别：</th>
					<td>
						<%
							if(employee.getSex().equals("男")){
						%>
						<input type="radio" name="sex" id="" value="男" checked="checked"/>男
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="sex" value="女"/>女
						<%
							}else{
						%>
						<input type="radio" name="sex" id="" value="男"/>男
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="sex" value="女" checked="checked"/>女
						<%
							}
						%>
					</td>
					<th>年&nbsp;&nbsp;龄：</th>
					<td>
						<input type="text" name="age" value="<%=employee.getAge()%>"/>
					</td>
				</tr>

				<tr>
					<th>身份证：</th>
					<td>
						<input type="text" name="IDCard" value="<%=employee.getIDCard()%>"/>
					</td>
					<th>电 话：</th>
					<td>
						<input type="text" name="tel" value="<%=employee.getTel()%>"/>
					</td>
				</tr>

				<tr>
					<th>邮 箱：</th>
					<td>
						<input type="text" name="email" value="<%=employee.getEmail()%>"/>
					</td>
					<th>出生日期：</th>
					<td>
						<input type="date" name="birthday" value="<%=DateUtil.format(employee.getBirthday())%>"/>
					</td>
				</tr>

				<tr>
					<th>职&nbsp;&nbsp;务：</th>
					<td>
						<select name="typeWork" value="">
							<%
								if(employee.getTypeWork().equals("程序员")){
							%>
							<option value="程序员" selected>程序员</option>
							<option value="文档人员">文档人员</option>
							<option value="部门经理">部门经理</option>
							<%
								}else if(employee.getTypeWork().equals("文档人员")){
							%>
							<option value="程序员">程序员</option>
							<option value="文档人员" selected>文档人员</option>
							<option value="部门经理">部门经理</option>
							<%
								}else if(employee.getTypeWork().equals("部门经理")){
							%>
							<option value="程序员">程序员</option>
							<option value="文档人员">文档人员</option>
							<option value="部门经理" selected>部门经理</option>
							<%
								}
							%>
						</select>
					</td>
					<th>地 址：</th>
					<td>
						<input type="text" name="address" value="<%=employee.getAddress()%>"/>
					</td>
				</tr>

				<tr>
					<th>部门：</th>
					<td>
						<select name="departIdAndName" value="">
							<%
								if(departments != null){
							%>
							<%
								for(Department depart : departments){
									if(depart.getDepartId() == employee.getDepartId()){
							%>
							<option value="<%=depart.getDepartId()%>-<%=depart.getName()%>" selected><%=depart.getName()%></option>
							<%
								}else {
							%>
							<option value="<%=depart.getDepartId()%>-<%=depart.getName()%>"><%=depart.getName()%></option>
							<%
								}
							%>
							<%
									}
								}
							%>
						</select>
					</td>
					<th></th>
					<td>

					</td>
				</tr>
				<tr>
					<td colspan="4" valign="center">
						<input type="submit" value="提&nbsp;交" id="submit"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="back" type="button" value="返&nbsp;回" onclick="javascript:history.go(-1)"/>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
</body>
</html>
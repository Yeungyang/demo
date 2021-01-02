<%@ page import="com.jsu.bean.Department" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jsu.bean.Employee" %>
<%@ page language="java" pageEncoding="utf-8"%>
<%@include file="../app.jsp"%>
<%--<%@ include file="../left.jsp"%>--%>
<%
//    List<Employee> employeeList = (List<Employee>)session.getAttribute("employeeList");e
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>工资管理系统--发放工资</title>
    <link rel="stylesheet" type="text/css" href="<%=appPath%>/css/center.css">
    <script type="text/javascript" src="<%=appPath%>js/My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=appPath%>/css/page.css">
    <link rel="stylesheet" type="text/css" href="<%=appPath%>/css/common.css">
    <style type="text/css">
        .jine{
            cursor: not-allowed;
        }
        table{
            line-height: 29px;
        }
        form table,form table tr,form table tr td{
            text-align: center;
            vertical-align: middle;
            border: 1px solid #000000;
        }
        table tr td.title{
            width: 120px;
        }
        table tr input{
            font-size: 15px;
        }
    </style>
</head>
<body onload="flushClear()">
<!-- 内容区域 -->
<div class="w1180 content clear">
    <form action="<%=appPath%>/SalaryServlet?method=pay" method="post" onsubmit="calculate()">
        <input name="mgId" type="hidden" value="<%=mgId%>">
        <div style="text-align: center;">
            <p style="margin-top: 30px"></p>
            <table style="width: 80%; margin: auto" rules="rows" >
                <thead>
                <tr>
                    <td></td>
                    <td >
                        <select name="empId">
                            <%
                                for(Employee employee : employeeList){
                            %>
                            <option value="<%=employee.getId()%>-<%=employee.getDepartName()%>-<%=employee.getJobNum()%>-<%=employee.getName()%>" onclick="flushClear()"><%=employee.getJobNum()%>--<%=employee.getName()%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td style="width: 80px"><input type="submit" value="发 放"></td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th class="title">基本工资：</th>
                    <td><input type="text" value="" required class="jibengongzi" name="jibengongzi"></td>
                    <th class="title">税前工资：</th>
                    <td class="jine"><input type="text" value="" readonly class="shuiqiangongzi jine" name="shuiqiangongzi"></td>
                    <th style="display: none" class="title">税后工资：</th>
                    <td style="display: none" class="jine"><input type="text" value="" readonly class="shuihougongzi jine" name="shuihougongzi"></td>
                    <th class="title">实发工资：</th>
                    <td class="jine"><input type="text" value="" readonly class="shifagongzi jine" name="shifagongzi"></td>
                    <td><input type="button" value="计 算" onclick="calculate()"></td>
                </tr>
                <tr>
                    <th class="title">奖金：</th>
                    <td><input type="text" value="0" class="jiangjin" name="jiangjin"></td>
                    <th class="title">提成：</th>
                    <td><input type="text" value="0" class="ticheng" name="ticheng"></td>
                    <th class="title">专项扣款：</th>
                    <td><input type="text" value="0" class="koukuan" name="koukuan"></td>
                    <td></td>
                </tr>
                <tr>
                    <th class="title">社保：</th>
                    <td><input type="text" value="0" class="shebao" name="" required></td>
                    <th class="title">公积金：</th>
                    <td><input type="text" value="0" class="all-gongjijin" name="" required></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            <p style="margin-top: 30px;margin-bottom: 30px"></p>
            <table style="width: 80%; margin: auto" rules="all">
                <thead>
                <tr>
                    <th>名称</th>
                    <th>个人比例</th>
                    <th>个人金额</th>
                    <th>单位比例</th>
                    <th>单位金额</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th class="title">养老：</th>
                    <td><input type="text" value="0.08" class="grbl-yanglao"></td>
                    <td class="jine"><input type="text" value="" readonly class="grje-yanglao jine" name="grje-yanglao"></td>
                    <td><input type="text" value="0.2" class="dwbl-yanglao"></td>
                    <td class="jine"><input type="text" value="" readonly class="dwje-yanglao jine"></td>
                </tr>
                <tr>
                    <th class="title">医疗：</th>
                    <td><input type="text" value="0.02" class="grbl-yiliao"></td>
                    <td class="jine"><input type="text" value="" readonly class="grje-yiliao jine" name="grje-yiliao"></td>
                    <td><input type="text" value="0.1" class="dwbl-yiliao"></td>
                    <td class="jine"><input type="text" value="" readonly class="dwje-yiliao jine"></td>
                </tr>
                <tr>
                    <th class="title">失业：</th>
                    <td><input type="text" value="0.002" class="grbl-shiye"></td>
                    <td class="jine"><input type="text" value="" readonly class="grje-shiye jine" name="grje-shiye"></td>
                    <td><input type="text" value="0.01" class="dwbl-shiye"></td>
                    <td class="jine"><input type="text" value="" readonly class="dwje-shiye jine"></td>
                </tr>
                <tr>
                    <th class="title">工伤：</th>
                    <td>
                        <input type="text" value="0" class="grbl-gongshang">
                    </td>
                    <td class="jine"><input type="text" value="" readonly class="grje-gongshang jine" name="grje-gongshang"></td>
                    <td><input type="text" value="0.008" class="dwbl-gongshang"></td>
                    <td class="jine"><input type="text" value="" readonly class="dwje-gongshang jine"></td>
                </tr>
                <tr>
                    <th class="title">生育：</th>
                    <td>
                        <input type="text" value="0" class="grbl-shenyu">
                    </td>
                    <td class="jine"><input type="text" value="" readonly class="grje-shenyu jine" name="grje-shenyu"></td>
                    <td><input type="text" value="0.02" class="dwbl-shenyu"></td>
                    <td class="jine"><input type="text" value="" readonly class="dwje-shenyu jine"></td>
                </tr>
                <tr>
                    <th class="title">公积金：</th>
                    <td>
                        <input type="text" value="0.12" class="grbl-gongjijin">
                    </td>
                    <td class="jine"><input type="text" value="" readonly class="grje-gongjijin jine" name="grje-gongjijin"></td>
                    <td><input type="text" value="0.12" class="dwbl-gongjijin"></td>
                    <td class="jine"><input type="text" value="" readonly class="dwje-gongjijin jine"></td>
                </tr>
                </tbody>
            </table>
            <p style="margin-top: 30px"></p>
            <table style="width: 80%; margin: auto" rules="all">
                <tr>
                    <th class="title">个人缴税：</th>
                    <td class="grjs jine"></td>
                    <th class="title">单位缴税：</th>
                    <td class="dwjs  jine"></td>
                    <th class="title">个人所得税：</th>
                    <td class="my-grsds jine"></td>
                    <input type="hidden" name="grsds" value=""class="grsds">
                </tr>
            </table>
        </div>
    </form>
</div>
<script>
    function calculate() {
        var grje = parseFloat($(".grbl-yanglao").val()) * parseFloat($(".shebao").val());
        $(".grje-yanglao").attr("value",grje);
        grje = parseFloat($(".dwbl-yanglao").val()) * parseFloat($(".shebao").val());
        $(".dwje-yanglao").attr("value",grje);
        grje = parseFloat($(".grbl-yiliao").val()) * parseFloat($(".shebao").val());
        $(".grje-yiliao").attr("value",grje);
        grje = parseFloat($(".dwbl-yiliao").val()) * parseFloat($(".shebao").val());
        $(".dwje-yiliao").attr("value",grje);
        grje = parseFloat($(".grbl-shiye").val()) * parseFloat($(".shebao").val());
        $(".grje-shiye").attr("value",grje);
        grje = parseFloat($(".dwbl-shiye").val()) * parseFloat($(".shebao").val());
        $(".dwje-shiye").attr("value",grje);
        grje = parseFloat($(".grbl-gongshang").val()) * parseFloat($(".shebao").val());
        $(".grje-gongshang").attr("value",grje);
        grje = parseFloat($(".dwbl-gongshang").val()) * parseFloat($(".shebao").val());
        $(".dwje-gongshang").attr("value",grje);
        grje = parseFloat($(".grbl-shenyu").val()) * parseFloat($(".shebao").val());
        $(".grje-shenyu").attr("value",grje);
        grje = parseFloat($(".dwbl-shenyu").val()) * parseFloat($(".shebao").val());
        $(".dwje-shenyu").attr("value",grje);
        grje = parseFloat($(".grbl-gongjijin").val()) * parseFloat($(".all-gongjijin").val());
        $(".grje-gongjijin").attr("value",grje);
        grje = parseFloat($(".dwbl-gongjijin").val()) * parseFloat($(".all-gongjijin").val());
        $(".dwje-gongjijin").attr("value",grje);

        grje = parseFloat($(".grje-yanglao").val()) + parseFloat($(".grje-yiliao").val()) +
            parseFloat($(".grje-shiye").val()) + parseFloat($(".grje-gongshang").val()) +
            parseFloat($(".grje-shenyu").val()) + parseFloat($(".grje-gongjijin").val());
        $(".grjs").html(grje);
        grje = parseFloat($(".dwje-yanglao").val()) + parseFloat($(".dwje-yiliao").val()) +
            parseFloat($(".dwje-shiye").val()) + parseFloat($(".dwje-gongshang").val()) +
            parseFloat($(".dwje-shenyu").val()) + parseFloat($(".dwje-gongjijin").val());
        $(".dwjs").html(grje);
        grje = parseFloat($(".jibengongzi").val()) * 0.06118;
        $(".my-grsds").html(grje);
        $(".grsds").attr("value",grje);

        grje = parseFloat($(".jibengongzi").val()) + parseFloat($(".jiangjin").val()) + parseFloat($(".ticheng").val()) - parseFloat($(".koukuan").val());
        $(".shuiqiangongzi").attr("value",grje);
        console.log(grje);

        grje = parseFloat($(".shuiqiangongzi").val()) - parseFloat($(".grjs").html()) - parseFloat($(".my-grsds").html());
        $(".shuihougongzi").attr("value",grje);

        grje = parseFloat($(".shuihougongzi").val()) + parseFloat($(".jiangjin").val()) +
            parseFloat($(".ticheng").val()) - parseFloat($(".koukuan").val());
        $(".shifagongzi").attr("value",grje);
    }
    function flushClear() {
        $(".jibengongzi").val("");
        $(".shebao").val("");
        $(".all-gongjijin").val("");
        $(".jiangjin").attr("value","0");
        $(".ticheng").attr("value","0");
        $(".koukuan").attr("value","0");
    }
</script>
</body>
</html>
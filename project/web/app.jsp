<%@ page import="com.jsu.bean.Employee" %>
<%@ page import="com.jsu.dao.EmployeeDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jsu.bean.Salary" %>
<%@ page import="com.jsu.dao.SalaryDAO" %>
<%@ page import="com.jsu.bean.Department" %>
<%@ page import="com.jsu.dao.DepartDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String appPath = pageContext.getServletContext().getContextPath();
%>
<html>
<script src="<%=appPath%>/js/jquery.min.js"></script>
<script type="text/javascript">
    getAllEmployee = function () {
        <%
            Integer mgId = (Integer)session.getAttribute("mgId");
            List<Employee> employeeList = EmployeeDAO.getAllEm(mgId);
            session.setAttribute("employeeList",employeeList);

            List<Salary> salaryList = SalaryDAO.getAllSalary(mgId);
            session.setAttribute("salaryList",salaryList);

            List<Department> departmentList = DepartDAO.getAllDepart(mgId);
            session.setAttribute("departmentList",departmentList);

            List<String> salaryDate = SalaryDAO.getAllYearMouth(mgId);
            session.setAttribute("salaryDate",salaryDate);
        %>
    };
</script>
</html>
package com.jsu.servlet;

import com.jsu.bean.Department;
import com.jsu.bean.Employee;
import com.jsu.bean.Manager;
import com.jsu.bean.Salary;
import com.jsu.dao.DepartDAO;
import com.jsu.dao.EmployeeDAO;
import com.jsu.dao.ManagerDAO;
import com.jsu.dao.SalaryDAO;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;

@WebServlet(urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        HttpSession session = request.getSession();

        String type = request.getParameter("userType");
        String email = request.getParameter("email");
        String password = request.getParameter("myPassword");

        type = "manager";
       if(type.equals("manager")){
           ManagerDAO dao = new ManagerDAO();
           Manager manager = dao.queryForLogin(email,password);
           if(manager != null){
               session.setAttribute("SESSION_MANAGER",manager);
               session.setAttribute("mgId",manager.getManagerId());
               //查找所有员工
               List<Employee> employeeList = EmployeeDAO.getAllEm(manager.getManagerId());
               session.setAttribute("employeeList",employeeList);
               //查找所有部门
               List<Department> departmentList = DepartDAO.getAllDepart(manager.getManagerId());
               session.setAttribute("departmentList",departmentList);
               //查找所有工资信息
               List<Salary> salaryList = SalaryDAO.getAllSalary(manager.getManagerId());
               session.setAttribute("salaryList",salaryList);

//               session.setAttribute("selectedEmp",employeeList.get(0));

               response.sendRedirect("frame.jsp");
           }
           else {
               pw.print("<script type = 'text/javascript'>");
               pw.print("alert('账号或密码错误！');");
               pw.print("window.location = 'login.jsp';");
               pw.print("</script>");
           }
       }
        pw.flush();
        pw.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

package com.jsu.servlet;

import com.jsu.bean.Manager;
import com.jsu.dao.ManagerDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();

        //获取账号密码
        String email = request.getParameter("email");
        String password = request.getParameter("myPassword");
        String type = request.getParameter("type");
        ManagerDAO dao = new ManagerDAO();
        if (type == null){
            Manager manager = new Manager(null, email, password);
            if (dao.saveManager(manager)) {
                response.sendRedirect("/project/login.jsp");
            }
            else {
                request.getRequestDispatcher("/register.jsp").forward(request,response);
            }
        }
        else if(type.equals("validate")){
            Boolean flag = dao.ifExistEmail(email);
            if(flag){
                pw.print("×");
            }
            else {
                pw.print("√");
            }
        }
        pw.flush();
        pw.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

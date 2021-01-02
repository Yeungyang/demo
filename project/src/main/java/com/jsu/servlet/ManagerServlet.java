package com.jsu.servlet;

import com.jsu.bean.Manager;
import com.jsu.dao.ManagerDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/ManagerServlet")
public class ManagerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter pw = response.getWriter();
        String method = request.getParameter("method");
        HttpSession session = request.getSession();
        Manager manager = (Manager)session.getAttribute("SESSION_MANAGER");
        if(method.equals("modifyPsw")){
            String oldPassword = request.getParameter("oldpassword");
            String password = request.getParameter("password");
            String password2 = request.getParameter("password2");


            if(oldPassword.equals("")){
                pw.print("原密码不能为空！");
            }
            else if(password.equals("") || password2.equals("")){
                pw.print("新密码不能为空！");
            }
            else if(!oldPassword.equals(ManagerDAO.getPsw(manager.getManagerId()))){
                pw.print("原密码错误！");
            }
            else if(password.equals(password2)){
                manager.setManagerPassword(password);
                ManagerDAO.modifyPsw(manager);
                pw.print("密码修改成功！");
            }
            else {
                pw.print("两次输入的密码不一致！");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

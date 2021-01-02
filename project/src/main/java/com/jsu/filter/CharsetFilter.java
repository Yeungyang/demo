package com.jsu.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = {"/*"},
        servletNames = {
                "com.jsu.servlet.CheckServlet",
                "com.jsu.servlet.DepartServlet",
                "com.jsu.servlet.EmployeeServlet",
                "com.jsu.servlet.ApplicantLoginServlet",
                "com.jsu.servlet.LoginServlet",
                "com.jsu.servlet.ManagerLoginServlet",
                "com.jsu.servlet.RegisterServlet"})
public class CharsetFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {
    }

}

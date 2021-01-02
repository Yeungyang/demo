package com.jsu.servlet;

import com.alibaba.fastjson.JSON;
import net.sf.json.JSONArray;
import com.jsu.bean.*;
import com.jsu.dao.DepartDAO;
import com.jsu.dao.SalaryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/SalaryServlet")
public class SalaryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String method = request.getParameter("method");
        HttpSession session = request.getSession();
        List<Salary> salaryList = (List<Salary>)session.getAttribute("salaryList");
        Integer mgId = (Integer)session.getAttribute("mgId");

        if(method.equals("pay")){
            paySalary(request,response,salaryList,session);
        }
        else if(method.equals("info")){
            showInfo(request,response,salaryList,session,mgId);
        }
        else if(method.equals("report")){
            reportData(request,response,session,mgId);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    private Salary getRequestData(HttpServletRequest request){
        String mgId = request.getParameter("mgId");
        String idAndName = request.getParameter("empId");
        String jibengongzi = request.getParameter("jibengongzi");
        String shuiqiangongzi = request.getParameter("shuiqiangongzi");
        String shuihougongzi = request.getParameter("shuihougongzi");
        String shifagongzi = request.getParameter("shifagongzi");
        String jiangjin = request.getParameter("jiangjin");
        String ticheng = request.getParameter("ticheng");
        String koukuan = request.getParameter("koukuan");
        String grjeYanglao = request.getParameter("grje-yanglao");
        String grjeYiliao = request.getParameter("grje-yiliao");
        String grjeShiye = request.getParameter("grje-shiye");
        String grjeGongshang = request.getParameter("grje-gongshang");
        String grjeShenyu = request.getParameter("grje-shenyu");
        String grjeGongjijin = request.getParameter("grje-gongjijin");
        String grsds = request.getParameter("grsds");

        String[] str = idAndName.split("-");
        Integer empId = Integer.parseInt(str[0]);

        Salary salary = new Salary(Integer.parseInt(mgId),null,str[1],empId,str[2],str[3],Double.parseDouble(jibengongzi),Double.parseDouble(jiangjin),
                Double.parseDouble(ticheng),Double.parseDouble(grjeYanglao),Double.parseDouble(grjeYiliao),Double.parseDouble(grjeGongshang),
                Double.parseDouble(grjeShenyu),Double.parseDouble(grjeShiye),Double.parseDouble(grjeGongjijin),Double.parseDouble(koukuan),
                Double.parseDouble(shuihougongzi),Double.parseDouble(grsds),Double.parseDouble(shifagongzi),new Date());
        return salary;
    }

    private void paySalary(HttpServletRequest request, HttpServletResponse response,List<Salary> salaryList,HttpSession session) throws IOException {
        Salary salary = getRequestData(request);
        Boolean flag = SalaryDAO.save(salary);
        if(flag){
            salaryList.add(salary);
            session.setAttribute("salaryList",salaryList);
            DepartDAO.updateDepartAllSalary(salary.getActualSalary(),salary.getEmDepartName());
        }
        response.sendRedirect("salary/salary_pay.jsp");
    }
    private void showInfo(HttpServletRequest request, HttpServletResponse response,List<Salary> salaryList,HttpSession session,int mgId) throws IOException {
        List<Salary> salaries = new ArrayList<Salary>();
        //  每页多少行pageSize
        String pageSizeStr = request.getParameter("pageSize");
        int pageSize;
        if(pageSizeStr != null && pageSizeStr.length() > 0){
            pageSize = Integer.parseInt(pageSizeStr);
        }
        else {
            pageSize = 8;
        }

        // 当前是第几页 currentPage
        String currentPageStr = request.getParameter("currentPage");
        int currentPage;
        if(currentPageStr != null && currentPageStr.length() > 0){
            currentPage = Integer.parseInt(currentPageStr);
        }
        else {
            currentPage = 1;
        }

//        一共有多少行数据 totalRows
        int totalRows = salaryList.size();

//        起始行 startRow
        int startRow = (currentPage - 1) * pageSize;

        if(request.getParameter("search") != null){
            for(int i=startRow,j=0; j<pageSize && i<totalRows;i++,j++){
                salaries.add(salaryList.get(i));
            }
        }else {
            salaries = SalaryDAO.getPageEm(startRow,pageSize,mgId);
        }
        Page page = new Page(currentPage, pageSize, totalRows, salaries);
        session.setAttribute("page",page);

        response.sendRedirect("salary/salary_info.jsp");
    }

    private void reportData(HttpServletRequest request, HttpServletResponse response,HttpSession session,int mgId) throws IOException {
        PrintWriter pw = response.getWriter();
        List<Department> departmentList = (List<Department>)session.getAttribute("departmentList");

        String selectTime = request.getParameter("selectTime");
        List<Salary> salaryByOneTime = SalaryDAO.getSalaryByDate(selectTime,mgId);

        String[] name = new String[departmentList.size()];
        Double[] salary = new Double[departmentList.size()];

        for(int i=0; i<departmentList.size(); i++){
            name[i] = departmentList.get(i).getName();
            salary[i] = 0.0;
            for(int j=0;j<salaryByOneTime.size(); j++){
                if(salaryByOneTime.get(j).getEmDepartName().equals(name[i])){
                    salary[i] = salary[i] + salaryByOneTime.get(j).getActualSalary();
                }
            }
        }
        pw.print(net.sf.json.JSONArray.fromObject(name)+"-"+JSONArray.fromObject(salary));
    }


}

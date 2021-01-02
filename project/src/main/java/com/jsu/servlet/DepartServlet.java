package com.jsu.servlet;

import com.alibaba.fastjson.JSON;
import com.jsu.bean.Department;
import com.jsu.bean.Employee;
import com.jsu.bean.Page;
import com.jsu.dao.DepartDAO;
import com.sun.deploy.net.HttpRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@WebServlet(urlPatterns = "/DepartServlet")
public class DepartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter pw = response.getWriter();
        String method = request.getParameter("method");
        HttpSession session = request.getSession();
        List<Department> departmentList = (List<Department>)session.getAttribute("departmentList");
        Integer mgId = (Integer)session.getAttribute("mgId");

        if(method.equals("add")){
            addInfo(request,response,session,departmentList,mgId);
        }
        if(method.equals("info")){
            showInfo(request,response,session,departmentList,mgId);
        }
        else if(method.equals("getSelected")){
            getSelected(request,response,session);
        }
        else if(method.equals("update")){
            update(request,response,session,departmentList,mgId);
        }
        else if(method.equals("delete")){
            delete(request,response,session,departmentList);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    private Department getRequestData(HttpServletRequest request,int mgId){
        String departIdStr = request.getParameter("departId");
        Integer departId;
        if(departIdStr == null){
            departId = null;
        }else {
            departId = Integer.parseInt(departIdStr);
        }
        String departName = request.getParameter("departName");
        String emIdAndName = request.getParameter("emIdAndName");
        String emTel = request.getParameter("emTel");
        String emEmail = request.getParameter("emEmail");
        String createTime = request.getParameter("createTime");
        String bz = request.getParameter("bz");

        String[] arrIdAndName = emIdAndName.split("-");
        Date time = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            time = sdf.parse(createTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Department depart = new Department(mgId,departId,time,departName,
                bz,Integer.parseInt(arrIdAndName[0]),arrIdAndName[1],emTel,emEmail);
        return depart;
    }

    private int removeDepart(List<Department> departmentList,Department depart){
        int i = -1;
        Iterator iterator = departmentList.iterator();
        while (iterator.hasNext()){
            i++;
            Department emp = (Department)iterator.next();
            if(emp.getDepartId() == depart.getDepartId()){
                iterator.remove();
                break;
            }
        }
        return i;
    }

    private void addInfo(HttpServletRequest request, HttpServletResponse response,HttpSession session,List<Department> departmentList,int mgId) throws IOException {
        PrintWriter pw = response.getWriter();
        Department department = getRequestData(request,mgId);
        if(DepartDAO.saveDepart(department)){
            departmentList.add(department);
            session.setAttribute("departmentList",departmentList);
        }
        pw.print("true");
    }
    private void showInfo(HttpServletRequest request, HttpServletResponse response,HttpSession session,List<Department> departmentList,int mgId) throws IOException {
        List<Department> departments = new ArrayList<Department>();
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
        int totalRows = departmentList.size();

//        起始行 startRow
        int startRow = (currentPage - 1) * pageSize;

        if(request.getParameter("search") != null){
            for(int i=startRow,j=0; j<pageSize && i<totalRows;i++,j++){
                departments.add(departmentList.get(i));
            }
        }else {
            departments = DepartDAO.getPageEm(startRow,pageSize,mgId);
        }
        Page page = new Page(currentPage, pageSize, totalRows, departments);
        session.setAttribute("page",page);

        response.sendRedirect("depmanager/department.jsp");
    }
    private void getSelected(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
        PrintWriter pw = response.getWriter();
        List<Employee> employeeList = (List<Employee>)session.getAttribute("employeeList");
        String emId = request.getParameter("emId");
        Integer id = Integer.parseInt(emId);
        if(employeeList != null){
            for(Employee employee : employeeList){
                if(id == employee.getId()){
                    String data = JSON.toJSONString(employee);
                    pw.print(data);
                }
            }
        }else {
            pw.print("false");
        }
    }
    private void update(HttpServletRequest request, HttpServletResponse response,HttpSession session,List<Department> departmentList,int mgId) throws IOException {
        Department depart = getRequestData(request,mgId);
        if(DepartDAO.updateDepart(depart)){
            departmentList.add(removeDepart(departmentList,depart),depart);
            session.setAttribute("departmentList",departmentList);
        }
        response.sendRedirect("DepartServlet?method=info");
    }
    private void delete(HttpServletRequest request, HttpServletResponse response,HttpSession session,List<Department> departmentList) throws IOException {
        String departId = request.getParameter("departId");
        if(DepartDAO.deleteDepart(Integer.parseInt(departId))){
            removeDepart(departmentList,new Department(Integer.parseInt(departId),0,
                    null,null,null,null,null,null,null));
            session.setAttribute("departmentList",departmentList);
        }
        response.sendRedirect("DepartServlet?method=info");
    }

}

package com.jsu.servlet;

import com.jsu.bean.Employee;
import com.jsu.bean.Page;
import com.jsu.dao.EmployeeDAO;
import com.mysql.cj.xdevapi.JsonArray;

import javax.servlet.ServletContext;
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

@WebServlet(urlPatterns = "/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        HttpSession session = request.getSession();
        List<Employee> employeeList = (List<Employee>)session.getAttribute("employeeList");
        Integer mgId = (Integer)session.getAttribute("mgId");

        String method = request.getParameter("method");
        if(method.equals("add")){
            add(request,response,session,employeeList);
        }
        else if(method.equals("info")){
            showInfo(request,response,session,employeeList,mgId);
        }
        else if(method.equals("delete")){
            delete(request,response);
        }
        else if(method.equals("update")){
            update(request,response,session,employeeList);
        }
        else if(method.equals("search")){
            search(request,response,session,mgId);
        }
        pw.flush();
        pw.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    private Employee getRequestData(HttpServletRequest request){
        String mgId = request.getParameter("mgId");
        Integer id;
        String empId = request.getParameter("empId");
        String jobNum = request.getParameter("jobNum");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String age = request.getParameter("age");
        String IDCard = request.getParameter("IDCard");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        String birthdayStr = request.getParameter("birthday");
        String typeWork = request.getParameter("typeWork");
        String address = request.getParameter("address");
        String departIdAndNameStr = request.getParameter("departIdAndName");

        Date birthday = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            birthday = sdf.parse(birthdayStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if(empId == null){
            id = null;
        }else {
            id = Integer.parseInt(empId);
        }
        Employee employee;
        if(departIdAndNameStr != null){
            String[] departIdAndName = departIdAndNameStr.split("-");
            employee = new Employee(Integer.parseInt(mgId),id,Integer.parseInt(departIdAndName[0]),departIdAndName[1],Integer.parseInt(jobNum),name,
                    sex,Integer.parseInt(age),tel,email,typeWork,birthday,IDCard,address);
        }else {
            employee = new Employee(Integer.parseInt(mgId),id,null,null,Integer.parseInt(jobNum),name,
                    sex,Integer.parseInt(age),tel,email,typeWork,birthday,IDCard,address);
        }

        return employee;
    }
    private int removeEmp(List<Employee> employeeList,Employee employee){
        int i = -1;
        Iterator iterator = employeeList.iterator();
        while (iterator.hasNext()){
            i++;
            Employee emp = (Employee)iterator.next();
            if(emp.getId() == employee.getId()){
                iterator.remove();
                break;
            }
        }
        return i;
    }

    private void showInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session,List<Employee> employeeList,int mgId) throws IOException {
        List<Employee> employees = new ArrayList<Employee>();
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
        int totalRows = employeeList.size();

//        起始行 startRow
        int startRow = (currentPage - 1) * pageSize;

        if(request.getParameter("search") != null){
            for(int i=startRow,j=0; j<pageSize && i<totalRows;i++,j++){
                employees.add(employeeList.get(i));
            }
        }else {
            employees = EmployeeDAO.getPageEm(startRow,pageSize,mgId);
        }
        Page page = new Page(currentPage, pageSize, totalRows, employees);
        session.setAttribute("page",page);

        response.sendRedirect("employee/employee_info.jsp");
//            response.sendRedirect("frame.jsp");
    }

    private void add(HttpServletRequest request, HttpServletResponse response, HttpSession session,List<Employee> employeeList) throws IOException {
        Employee employee = getRequestData(request);

        boolean flag = EmployeeDAO.saveEmployee(employee);
        if(flag){
            employeeList.add(employee);
            session.setAttribute("employeeList",employeeList);
        }
        response.sendRedirect("employee/employee_add.jsp");
    }

    private void update(HttpServletRequest request, HttpServletResponse response, HttpSession session,List<Employee> employeeList) throws IOException {
        Employee employee = getRequestData(request);
        boolean flag = EmployeeDAO.updateEmployee(employee);
        if(flag){
            response.sendRedirect("EmployeeServlet?method=info");
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response, HttpSession session,int mgId) throws IOException {
        String searchInfo = request.getParameter("searchInfo");
        if(searchInfo != null){
            List<Employee> employees = EmployeeDAO.searchEmpInfo(searchInfo,mgId);
            session.setAttribute("employeeList",employees);
        }
        response.sendRedirect("EmployeeServlet?method=info&search=search");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String empId = request.getParameter("empId");

        EmployeeDAO.deleteEmp(Integer.parseInt(empId));

        response.sendRedirect("EmployeeServlet?method=info");
    }

}

package com.jsu.dao;

import com.jsu.bean.Employee;
import com.jsu.util.DBUtil;

import java.util.List;

public class EmployeeDAO {
    public static boolean saveEmployee(Employee employee) {
        if(employee.getDepartId() != null){
            String sql = "INSERT INTO tb_employee (mg_id,em_dt_id,em_dt_name,em_jobnum,em_name,em_sex,em_age,em_IDCard," +
                    "em_typeWork,em_address,em_tel,em_email,em_birthday) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);";
            return DBUtil.update(sql,employee.getMgId(),employee.getDepartId(),employee.getDepartName(),employee.getJobNum(),employee.getName(),
                    employee.getSex(),employee.getAge(),employee.getIDCard(),employee.getTypeWork(),
                    employee.getAddress(),employee.getTel(), employee.getEmail(),employee.getBirthday());
        }else {
            String sql = "INSERT INTO tb_employee (mg_id,em_jobnum,em_name,em_sex,em_age,em_IDCard," +
                    "em_typeWork,em_address,em_tel,em_email,em_birthday) VALUES (?,?,?,?,?,?,?,?,?,?,?);";
            return DBUtil.update(sql,employee.getMgId(),employee.getJobNum(),employee.getName(),
                    employee.getSex(),employee.getAge(),employee.getIDCard(),employee.getTypeWork(),
                    employee.getAddress(),employee.getTel(), employee.getEmail(),employee.getBirthday());
        }
    }

    public static List<Employee> getAllEm(int mgId){
        String sql = "SELECT\n" +
                "tb_employee.em_id id, \n" +
                "tb_employee.mg_id mgId, \n" +
                "tb_employee.em_dt_name departName, \n" +
                "tb_employee.em_jobnum jobNum, \n" +
                "tb_employee.em_name `name`, \n" +
                "tb_employee.em_sex sex, \n" +
                "tb_employee.em_age age, \n" +
                "tb_employee.em_IDCard IDCard, \n" +
                "tb_employee.em_typeWork typeWork, \n" +
                "tb_employee.em_dt_id departId, \n" +
                "tb_employee.em_address address, \n" +
                "tb_employee.em_tel tel, \n" +
                "tb_employee.em_email email, \n" +
                "tb_employee.em_birthday birthday \n" +
                "FROM \n" +
                "tb_employee where mg_id = ?";
        List<Employee> list = DBUtil.getList(Employee.class,sql,mgId);
        return list;
    }
    public static List<Employee> getPageEm(int startRow, int pageSize,int mgId){
        StringBuffer sql = new StringBuffer("SELECT\n" +
                "tb_employee.em_id id, \n" +
                "tb_employee.mg_id mgId, \n" +
                "tb_employee.em_dt_name departName, \n" +
                "tb_employee.em_jobnum jobNum, \n" +
                "tb_employee.em_name `name`, \n" +
                "tb_employee.em_sex sex, \n" +
                "tb_employee.em_age age, \n" +
                "tb_employee.em_IDCard IDCard, \n" +
                "tb_employee.em_typeWork typeWork, \n" +
                "tb_employee.em_dt_id departId, \n" +
                "tb_employee.em_address address, \n" +
                "tb_employee.em_tel tel, \n" +
                "tb_employee.em_email email, \n" +
                "tb_employee.em_birthday birthday \n" +
                "FROM \n" +
                "tb_employee where mg_id = ?");
        sql.append(" limit ").append(startRow).append(",").append(pageSize);
        return DBUtil.getList(Employee.class,sql.toString(),mgId);
    }

    public static boolean deleteEmp(int empId) {
        String sql = "DELETE FROM tb_employee WHERE em_id = ?";
        return DBUtil.update(sql,empId);
    }

    public static Employee getOneEmById(int empId) {
        String sql = "SELECT\n" +
                "tb_employee.em_id id, \n" +
                "tb_employee.mg_id mgId, \n" +
                "tb_employee.em_dt_name departName, \n" +
                "tb_employee.em_jobnum jobNum, \n" +
                "tb_employee.em_name `name`, \n" +
                "tb_employee.em_sex sex, \n" +
                "tb_employee.em_age age, \n" +
                "tb_employee.em_IDCard IDCard, \n" +
                "tb_employee.em_typeWork typeWork, \n" +
                "tb_employee.em_dt_id departId, \n" +
                "tb_employee.em_address address, \n" +
                "tb_employee.em_tel tel, \n" +
                "tb_employee.em_email email, \n" +
                "tb_employee.em_birthday birthday \n" +
                "FROM \n" +
                "tb_employee \n" +
                "WHERE \n" +
                "tb_employee.em_id = ?";
        return DBUtil.getOneObject(Employee.class,sql,empId);
    }

    public static boolean updateEmployee(Employee employee) {
        String sql = "UPDATE tb_employee SET\n" +
                "tb_employee.mg_id = ?, \n" +
                "tb_employee.em_jobnum = ?, \n" +
                "tb_employee.em_name = ?, \n" +
                "tb_employee.em_sex = ?, \n" +
                "tb_employee.em_age = ?, \n" +
                "tb_employee.em_IDCard = ?, \n" +
                "tb_employee.em_typeWork = ?, \n" +
                "tb_employee.em_dt_id = ?, \n" +
                "tb_employee.em_dt_name = ?, \n" +
                "tb_employee.em_address = ?, \n" +
                "tb_employee.em_tel = ?, \n" +
                "tb_employee.em_email = ?, \n" +
                "tb_employee.em_birthday = ? \n" +
                "WHERE \n" +
                "tb_employee.em_id = ?";
        return DBUtil.update(sql,employee.getMgId(),employee.getJobNum(),employee.getName(),employee.getSex(), employee.getAge(),
                employee.getIDCard(),employee.getTypeWork(),employee.getDepartId(), employee.getDepartName(),employee.getAddress(),
                employee.getTel(), employee.getEmail(),employee.getBirthday(),employee.getId());
    }

    public static List<Employee> searchEmpInfo(String info,int mgId) {
        info = "%"+info+"%";
        String sql = "SELECT\n" +
                "tb_employee.em_id id, \n" +
                "tb_employee.mg_id mgId, \n" +
                "tb_employee.em_dt_name departName, \n" +
                "tb_employee.em_jobnum jobNum, \n" +
                "tb_employee.em_name `name`, \n" +
                "tb_employee.em_sex sex, \n" +
                "tb_employee.em_age age, \n" +
                "tb_employee.em_IDCard IDCard, \n" +
                "tb_employee.em_typeWork typeWork, \n" +
                "tb_employee.em_dt_id departId, \n" +
                "tb_employee.em_address address, \n" +
                "tb_employee.em_tel tel, \n" +
                "tb_employee.em_email email, \n" +
                "tb_employee.em_birthday birthday \n" +
                "FROM \n" +
                "tb_employee \n" +
                "WHERE \n" +
                "("+
                "OR tb_employee.em_jobnum LIKE ? "+
                "OR tb_employee.em_dt_name LIKE ? "+
                "OR tb_employee.em_name LIKE ? "+
                "OR tb_employee.em_sex LIKE ? "+
                "OR tb_employee.em_age LIKE ? "+
                "OR tb_employee.em_IDCard LIKE ? "+
                "OR tb_employee.em_typeWork LIKE ? "+
                "OR tb_employee.em_address LIKE ? "+
                "OR tb_employee.em_tel LIKE ? "+
                "OR tb_employee.em_email LIKE ? "+
                "OR tb_employee.em_birthday LIKE ?) and mg_id = ?";
        return DBUtil.getList(Employee.class,sql,info,info,info,info,info,info,info,info,info,info,info,mgId);
    }
}

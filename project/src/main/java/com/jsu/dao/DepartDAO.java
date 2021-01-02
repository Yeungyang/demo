package com.jsu.dao;

import com.jsu.bean.Department;
import com.jsu.util.DBUtil;
import com.jsu.util.DateUtil;

import java.util.List;

public class DepartDAO {
    public static Boolean saveDepart(Department depart){
        String sql = "INSERT INTO tb_department(mg_id,dt_creatTime,dt_name,dt_bz," +
                "em_id,em_name,em_tel,em_email) VALUES(?,?,?,?,?,?,?,?)";
        return DBUtil.update(sql,depart.getMgId(),depart.getCreateTime(),depart.getName()
                ,depart.getBz(),depart.getEmId(),depart.getEmName(),depart.getEmTel(),depart.getEmEmail());
    }
    public static Boolean deleteDepart(int departId){
        String sql = "DELETE FROM tb_department WHERE dt_id = ?";
        return DBUtil.update(sql,departId);
    }
    public static List<Department> getAllDepart(int mgId){
        String sql = "SELECT\n" +
                "tb_department.mg_id AS mgId, \n" +
                "tb_department.dt_salary AS allSalary, \n" +
                "tb_department.dt_id AS departId, \n" +
                "tb_department.dt_creatTime AS createTime, \n" +
                "tb_department.dt_name AS `name`, \n" +
                "tb_department.dt_bz AS bz, \n" +
                "tb_department.em_id AS emId, \n" +
                "tb_department.em_name AS emName, \n" +
                "tb_department.em_tel AS emTel, \n" +
                "tb_department.em_email AS emEmail \n" +
                "FROM \n" +
                "tb_department where mg_id = ?";
        return DBUtil.getList(Department.class,sql,mgId);
    }

    public static List<Department> getPageEm(int startRow, int pageSize, int mgId) {
        StringBuffer sql = new StringBuffer("SELECT\n" +
                "tb_department.mg_id AS mgId, \n" +
                "tb_department.dt_salary AS allSalary, \n" +
                "tb_department.dt_id AS departId, \n" +
                "tb_department.dt_creatTime AS createTime, \n" +
                "tb_department.dt_name AS `name`, \n" +
                "tb_department.dt_bz AS bz, \n" +
                "tb_department.em_id AS emId, \n" +
                "tb_department.em_name AS emName, \n" +
                "tb_department.em_tel AS emTel, \n" +
                "tb_department.em_email AS emEmail \n" +
                "FROM \n" +
                "tb_department \n" +
                "where mg_id = ?");
        sql.append(" limit ").append(startRow).append(",").append(pageSize);
        return DBUtil.getList(Department.class,sql.toString(),mgId);
    }

    public static Department getOneDepartById(int departId) {
        String sql = "SELECT\n" +
                "tb_department.mg_id AS mgId, \n" +
                "tb_department.dt_salary AS allSalary, \n" +
                "tb_department.dt_id AS departId, \n" +
                "tb_department.dt_creatTime AS createTime, \n" +
                "tb_department.dt_name AS `name`, \n" +
                "tb_department.dt_bz AS bz, \n" +
                "tb_department.em_id AS emId, \n" +
                "tb_department.em_name AS emName, \n" +
                "tb_department.em_tel AS emTel, \n" +
                "tb_department.em_email AS emEmail \n" +
                "FROM \n" +
                "tb_department where tb_department.dt_id = ?";
        return DBUtil.getOneObject(Department.class,sql,departId);
    }

    public static Boolean updateDepart(Department depart){
        String sql = "UPDATE tb_department SET\n" +
                "tb_department.mg_id = ?, \n" +
                "tb_department.dt_creatTime = ?, \n" +
                "tb_department.dt_name = ?, \n" +
                "tb_department.dt_bz = ?, \n" +
                "tb_department.em_id = ?, \n" +
                "tb_department.em_name = ?, \n" +
                "tb_department.em_tel = ?, \n" +
                "tb_department.em_email = ? \n" +
                "WHERE \n" +
                "tb_department.dt_id = ?";
        return DBUtil.update(sql,depart.getMgId(),depart.getCreateTime(),depart.getName(),depart.getBz()
                ,depart.getEmId(),depart.getEmName(),depart.getEmTel(),depart.getEmEmail(),depart.getDepartId());
    }

    public static Boolean updateDepartAllSalary(double salary, String departName){
        String sql = "UPDATE tb_department SET dt_salary = dt_salary+? WHERE em_departName = ?";
        return DBUtil.update(sql,salary,departName);
    }
}

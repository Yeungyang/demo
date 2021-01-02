package com.jsu.dao;

import com.jsu.bean.Manager;
import com.jsu.util.DBUtil;

public class ManagerDAO {
    public Boolean ifExistEmail(String email) {
        String sql = "SELECT * FROM tb_manager WHERE mg_email = ?";
        return DBUtil.queryIfExist(Manager.class,sql,email);
    }

    public boolean saveManager(Manager manager) {
        String sql = "INSERT INTO tb_manager(mg_email,mg_pwd) VALUES (?,?)";
        return DBUtil.update(sql,manager.getManagerEmail(),manager.getManagerPassword());
    }

    public Manager queryForLogin(String email, String password) {
        String sql = "SELECT\n" +
                "tb_manager.mg_id AS managerId, \n" +
                "tb_manager.mg_email AS managerEmail, \n" +
                "tb_manager.mg_pwd AS managerPassword \n" +
                "FROM \n" +
                "tb_manager \n" +
                "WHERE \n" +
                "tb_manager.mg_email = ?  AND \n" +
                "tb_manager.mg_pwd = ?";
        return DBUtil.getOneObject(Manager.class,sql,email,password);
    }

    public static Boolean modifyPsw(Manager manager){
        String sql = "UPDATE tb_manager SET mg_pwd = ? WHERE mg_id = ?";
        return DBUtil.update(sql,manager.getManagerPassword(),manager.getManagerId());
    }
    public static String getPsw(int mgId){
        String sql = "SELECT\n" +
                "tb_manager.mg_id AS managerId, \n" +
                "tb_manager.mg_email AS managerEmail, \n" +
                "tb_manager.mg_pwd AS managerPassword \n" +
                "FROM \n" +
                "tb_manager \n" +
                "WHERE \n" +
                "tb_manager.mg_id = ?";
        return DBUtil.getOneObject(Manager.class,sql,mgId).getManagerPassword();
    }
}

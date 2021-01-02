package com.jsu.dao;

import com.jsu.bean.Salary;
import com.jsu.util.DBUtil;
import com.jsu.util.DateUtil;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class SalaryDAO {
    public static Boolean save(Salary salary) {
        String sql = "INSERT INTO tb_salary(mg_id,em_id,em_departName,em_jobNum,em_name,base_salary,reward,penalty,special," +
                "pretax_salary,taxation,actual_salary,time,yanglao,yiliao,shiye,gongshang," +
                "shenyu,gongjijin) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        return DBUtil.update(sql,salary.getMgId(),salary.getEmId(),salary.getEmDepartName(),salary.getEmJobNum(),salary.getEmName(),salary.getBaseSalary(),salary.getReward()
                ,salary.getPenalty(),salary.getSpecial(),salary.getPretaxSalary(),salary.getTaxation(),
                salary.getActualSalary(),salary.getTime(),salary.getYanglao(),salary.getYiliao(),
                salary.getShiye(),salary.getGongshang(),salary.getShenyu(),salary.getGongjijin());
    }

    public static List<Salary> getPageEm(int startRow, int pageSize,int mgId) {
        StringBuffer sql = new StringBuffer("SELECT\n" +
                "tb_salary.mg_id AS mgId, \n"+
                "tb_salary.salary_id AS salaryId, \n" +
                "tb_salary.em_id AS emId, \n" +
                "tb_salary.em_departName AS emDepartName, \n" +
                "tb_salary.em_jobNum AS emJobNum, \n" +
                "tb_salary.em_name AS emName, \n" +
                "tb_salary.base_salary AS baseSalary, \n" +
                "tb_salary.reward AS reward, \n" +
                "tb_salary.penalty AS penalty, \n" +
                "tb_salary.special AS special, \n" +
                "tb_salary.pretax_salary AS pretaxSalary, \n" +
                "tb_salary.taxation AS taxation, \n" +
                "tb_salary.actual_salary AS actualSalary, \n" +
                "tb_salary.time AS time, \n" +
                "tb_salary.yanglao AS yanglao, \n" +
                "tb_salary.yiliao AS yiliao, \n" +
                "tb_salary.shiye AS shiye, \n" +
                "tb_salary.gongshang AS gongshang, \n" +
                "tb_salary.shenyu AS shenyu, \n" +
                "tb_salary.gongjijin AS gongjijin \n" +
                "FROM \n" +
                "tb_salary \n" +
                "where tb_salary.mg_id = ?");
        sql.append(" limit ").append(startRow).append(",").append(pageSize);
        return DBUtil.getList(Salary.class,sql.toString(),mgId);
    }

    public static List<Salary> getAllSalary(int mgId) {
        StringBuffer sql = new StringBuffer("SELECT\n" +
                "tb_salary.mg_id AS mgId, \n"+
                "tb_salary.salary_id AS salaryId, \n" +
                "tb_salary.em_id AS emId, \n" +
                "tb_salary.em_departName AS emDepartName, \n" +
                "tb_salary.em_jobNum AS emJobNum, \n" +
                "tb_salary.em_name AS emName, \n" +
                "tb_salary.base_salary AS baseSalary, \n" +
                "tb_salary.reward AS reward, \n" +
                "tb_salary.penalty AS penalty, \n" +
                "tb_salary.special AS special, \n" +
                "tb_salary.pretax_salary AS pretaxSalary, \n" +
                "tb_salary.taxation AS taxation, \n" +
                "tb_salary.actual_salary AS actualSalary, \n" +
                "tb_salary.time AS time, \n" +
                "tb_salary.yanglao AS yanglao, \n" +
                "tb_salary.yiliao AS yiliao, \n" +
                "tb_salary.shiye AS shiye, \n" +
                "tb_salary.gongshang AS gongshang, \n" +
                "tb_salary.shenyu AS shenyu, \n" +
                "tb_salary.gongjijin AS gongjijin \n" +
                "FROM \n" +
                "tb_salary \n" +
                "where tb_salary.mg_id = ?");
        return DBUtil.getList(Salary.class,sql.toString(),mgId);
    }

    public static List<String> getAllYearMouth(int mgId){
        String sql = "SELECT\n" +
                "tb_salary.time AS time \n" +
                "FROM \n" +
                "tb_salary \n" +
                "where tb_salary.mg_id = ?";
        List<Date> dates =  DBUtil.getList(Date.class,sql,mgId);
        return removeRepeat(dates);
    }

    private static List<String> removeRepeat(List<Date> dates){
        List<String> stringList = new ArrayList<String>();
        Iterator iterator = dates.iterator();
        while (iterator.hasNext()){
            Date current = (Date)iterator.next();
            if(stringList.size() == 0){
                stringList.add(DateUtil.yearAndMouth(current));
            }else {
                boolean flag = true;
                for(String date : stringList){
                    if(date.equals(DateUtil.yearAndMouth(current))){
                        flag = false;
                        break;
                    }
                }
                if(flag){
                    stringList.add(DateUtil.yearAndMouth(current));
                }
            }
        }
        return stringList;
    }

    public static List<Salary> getSalaryByDate(String date,int mgId){
        StringBuffer sql = new StringBuffer("SELECT\n" +
                "tb_salary.mg_id AS mgId, \n"+
                "tb_salary.salary_id AS salaryId, \n" +
                "tb_salary.em_id AS emId, \n" +
                "tb_salary.em_departName AS emDepartName, \n" +
                "tb_salary.em_jobNum AS emJobNum, \n" +
                "tb_salary.em_name AS emName, \n" +
                "tb_salary.base_salary AS baseSalary, \n" +
                "tb_salary.reward AS reward, \n" +
                "tb_salary.penalty AS penalty, \n" +
                "tb_salary.special AS special, \n" +
                "tb_salary.pretax_salary AS pretaxSalary, \n" +
                "tb_salary.taxation AS taxation, \n" +
                "tb_salary.actual_salary AS actualSalary, \n" +
                "tb_salary.time AS time, \n" +
                "tb_salary.yanglao AS yanglao, \n" +
                "tb_salary.yiliao AS yiliao, \n" +
                "tb_salary.shiye AS shiye, \n" +
                "tb_salary.gongshang AS gongshang, \n" +
                "tb_salary.shenyu AS shenyu, \n" +
                "tb_salary.gongjijin AS gongjijin \n" +
                "FROM \n" +
                "tb_salary \n" +
                "WHERE DATE_FORMAT(tb_salary.time,'%Y-%m')=? \n" +
                "and tb_salary.mg_id = ?");
        return DBUtil.getList(Salary.class,sql.toString(),date,mgId);
    }
}

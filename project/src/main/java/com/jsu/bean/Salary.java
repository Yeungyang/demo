package com.jsu.bean;

import java.util.Date;

public class Salary {
    private Integer mgId;
    private Integer salaryId;
    private Integer emId;
    private String emDepartName;
    private String emJobNum;
    private String emName;
    private Double baseSalary;
    private Double reward;
    private Double penalty;
    private Double yanglao;
    private Double yiliao;
    private Double gongshang;
    private Double shenyu;
    private Double shiye;
    private Double gongjijin;
    private Double special;
    private Double pretaxSalary;
    private Double taxation;
    private Double actualSalary;
    private Date time;

    public Salary() {
    }

    public Salary(Integer mgId,Integer salaryId, String emDepartName,Integer emId, String emJobNum, String emName, Double baseSalary, Double reward, Double penalty, Double yanglao, Double yiliao, Double gongshang, Double shenyu, Double shiye, Double gongjijin, Double special, Double pretaxSalary, Double taxation, Double actualSalary, Date time) {
        this.mgId = mgId;
        this.salaryId = salaryId;
        this.emDepartName = emDepartName;
        this.emId = emId;
        this.emJobNum = emJobNum;
        this.emName = emName;
        this.baseSalary = baseSalary;
        this.reward = reward;
        this.penalty = penalty;
        this.yanglao = yanglao;
        this.yiliao = yiliao;
        this.gongshang = gongshang;
        this.shenyu = shenyu;
        this.shiye = shiye;
        this.gongjijin = gongjijin;
        this.special = special;
        this.pretaxSalary = pretaxSalary;
        this.taxation = taxation;
        this.actualSalary = actualSalary;
        this.time = time;
    }

    public Integer getSalaryId() {
        return salaryId;
    }

    public void setSalaryId(Integer salaryId) {
        this.salaryId = salaryId;
    }

    public Integer getEmId() {
        return emId;
    }

    public String getEmJobNum() {
        return emJobNum;
    }

    public void setEmJobNum(String emJobNum) {
        this.emJobNum = emJobNum;
    }

    public void setEmId(Integer emId) {
        this.emId = emId;
    }

    public String getEmName() {
        return emName;
    }

    public void setEmName(String emName) {
        this.emName = emName;
    }

    public Double getBaseSalary() {
        return baseSalary;
    }

    public void setBaseSalary(Double baseSalary) {
        this.baseSalary = baseSalary;
    }

    public Double getReward() {
        return reward;
    }

    public void setReward(Double reward) {
        this.reward = reward;
    }

    public Double getPenalty() {
        return penalty;
    }

    public void setPenalty(Double penalty) {
        this.penalty = penalty;
    }

    public Double getYanglao() {
        return yanglao;
    }

    public void setYanglao(Double yanglao) {
        this.yanglao = yanglao;
    }

    public Double getYiliao() {
        return yiliao;
    }

    public void setYiliao(Double yiliao) {
        this.yiliao = yiliao;
    }

    public Double getGongshang() {
        return gongshang;
    }

    public void setGongshang(Double gongshang) {
        this.gongshang = gongshang;
    }

    public Double getShenyu() {
        return shenyu;
    }

    public void setShenyu(Double shenyu) {
        this.shenyu = shenyu;
    }

    public Double getShiye() {
        return shiye;
    }

    public void setShiye(Double shiye) {
        this.shiye = shiye;
    }

    public Double getGongjijin() {
        return gongjijin;
    }

    public void setGongjijin(Double gongjijin) {
        this.gongjijin = gongjijin;
    }

    public Double getSpecial() {
        return special;
    }

    public void setSpecial(Double special) {
        this.special = special;
    }

    public Double getPretaxSalary() {
        return pretaxSalary;
    }

    public void setPretaxSalary(Double pretaxSalary) {
        this.pretaxSalary = pretaxSalary;
    }

    public Double getTaxation() {
        return taxation;
    }

    public void setTaxation(Double taxation) {
        this.taxation = taxation;
    }

    public Double getActualSalary() {
        return actualSalary;
    }

    public void setActualSalary(Double actualSalary) {
        this.actualSalary = actualSalary;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getEmDepartName() {
        return emDepartName;
    }

    public void setEmDepartName(String emDepartName) {
        this.emDepartName = emDepartName;
    }

    public Integer getMgId() {
        return mgId;
    }

    public void setMgId(Integer mgId) {
        this.mgId = mgId;
    }
}

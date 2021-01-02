package com.jsu.bean;

import java.util.Date;

public class Department {
    private Integer mgId;
    private Integer departId;
    private Date createTime;
    private String name;
    private String bz;
    private Integer emId;
    private String emName;
    private String emTel;
    private String emEmail;
    private Double allSalary = 0.0;

    public Department() {
    }

    public Department(Integer mgId, Integer departId, Date createTime, String name, String bz, Integer emId, String emName, String emTel, String emEmail) {
        this.mgId = mgId;
        this.departId = departId;
        this.createTime = createTime;
        this.name = name;
        this.bz = bz;
        this.emId = emId;
        this.emName = emName;
        this.emTel = emTel;
        this.emEmail = emEmail;
    }

    public Department(Integer mgId, Integer departId, Date createTime, String name, String bz, Integer emId, String emName, String emTel, String emEmail, Double allSalary) {
        this.mgId = mgId;
        this.departId = departId;
        this.createTime = createTime;
        this.name = name;
        this.bz = bz;
        this.emId = emId;
        this.emName = emName;
        this.emTel = emTel;
        this.emEmail = emEmail;
        this.allSalary = allSalary;
    }

    public Integer getMgId() {
        return mgId;
    }

    public void setMgId(Integer mgId) {
        this.mgId = mgId;
    }

    public int getDepartId() {
        return departId;
    }

    public void setDepartId(int departId) {
        this.departId = departId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public Integer getEmId() {
        return emId;
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

    public String getEmTel() {
        return emTel;
    }

    public void setEmTel(String emTel) {
        this.emTel = emTel;
    }

    public String getEmEmail() {
        return emEmail;
    }

    public void setEmEmail(String emEmail) {
        this.emEmail = emEmail;
    }

    public Double getAllSalary() {
        return allSalary;
    }

    public void setAllSalary(Double allSalary) {
        this.allSalary = allSalary;
    }
}

package com.jsu.bean;

import java.util.Date;

public class Employee {
    private Integer mgId;
    private Integer id;
    private Integer departId;
    private String departName;
    private Integer jobNum;
    private String name;
    private String sex;
    private Integer age;
    private String tel;
    private String email;
    private String typeWork;
    private Date birthday;
    private String IDCard;
    private String address;

    public Employee() {
    }

    public Employee(Integer mgId,Integer id, Integer departId, String departName,Integer jobNum, String name, String sex, Integer age, String tel, String email, String typeWork, Date birthday, String IDCard, String address) {
        this.mgId = mgId;
        this.id = id;
        this.departId = departId;
        this.departName = departName;
        this.jobNum = jobNum;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.tel = tel;
        this.email = email;
        this.typeWork = typeWork;
        this.birthday = birthday;
        this.IDCard = IDCard;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getDepartId() {
        return departId;
    }

    public void setDepartId(int departId) {
        this.departId = departId;
    }

    public int getJobNum() {
        return jobNum;
    }

    public void setJobNum(int jobNum) {
        this.jobNum = jobNum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTypeWork() {
        return typeWork;
    }

    public void setTypeWork(String typeWork) {
        this.typeWork = typeWork;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getIDCard() {
        return IDCard;
    }

    public void setIDCard(String IDCard) {
        this.IDCard = IDCard;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getMgId() {
        return mgId;
    }

    public void setMgId(Integer mgId) {
        this.mgId = mgId;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setDepartId(Integer departId) {
        this.departId = departId;
    }

    public String getDepartName() {
        return departName;
    }

    public void setDepartName(String departName) {
        this.departName = departName;
    }

    public void setJobNum(Integer jobNum) {
        this.jobNum = jobNum;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}

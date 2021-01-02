package com.jsu.bean;

public class Manager {
    private Integer managerId;
    private String managerEmail;
    private String managerPassword;

    public Manager() {
    }

    public Manager(Integer managerId, String managerEmail, String managerPassword) {
        this.managerId = managerId;
        this.managerEmail = managerEmail;
        this.managerPassword = managerPassword;
    }

    public Integer getManagerId() {
        return managerId;
    }

    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
    }

    public String getManagerEmail() {
        return managerEmail;
    }

    public void setManagerEmail(String managerEmail) {
        this.managerEmail = managerEmail;
    }

    public String getManagerPassword() {
        return managerPassword;
    }

    public void setManagerPassword(String managerPassword) {
        this.managerPassword = managerPassword;
    }
}

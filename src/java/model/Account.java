/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;



/**
 *
 * @author Admin
 */
public class Account {
    private String userName;
    private String password;
    private String displayName;
    private String address;
    private String email;
    private String phone;
    private int role_id;
    private int status;
    private String create_date;
    private String active_code;

    public Account() {
    }

    public Account(String userName, String password, String displayName, String address, String email, String phone, int role_id, int status, String create_date, String active_code) {
        this.userName = userName;
        this.password = password;
        this.displayName = displayName;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.role_id = role_id;
        this.status = status;
        this.create_date = create_date;
        this.active_code = active_code;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public String getActive_code() {
        return active_code;
    }

    public void setActive_code(String active_code) {
        this.active_code = active_code;
    }

    @Override
    public String toString() {
        return "Account{" + "userName=" + userName + ", password=" + password + ", displayName=" + displayName + ", address=" + address + ", email=" + email + ", phone=" + phone + ", role_id=" + role_id + ", status=" + status + ", create_date=" + create_date + ", active_code=" + active_code + '}';
    }
    
}

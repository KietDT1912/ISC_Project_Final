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
public class DuplicateAccount {
    private String usernameDup;
    private String emailDup;
    private String phoneDup;

    public DuplicateAccount() {
    }

    public DuplicateAccount(String usernameDup, String emailDup, String phoneDup) {
        this.usernameDup = usernameDup;
        this.emailDup = emailDup;
        this.phoneDup = phoneDup;
    }

    public String getUsernameDup() {
        return usernameDup;
    }

    public void setUsernameDup(String usernameDup) {
        this.usernameDup = usernameDup;
    }

    public String getEmailDup() {
        return emailDup;
    }

    public void setEmailDup(String emailDup) {
        this.emailDup = emailDup;
    }

    public String getPhoneDup() {
        return phoneDup;
    }

    public void setPhoneDup(String phoneDup) {
        this.phoneDup = phoneDup;
    }
    
}

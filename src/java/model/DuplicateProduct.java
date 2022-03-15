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
public class DuplicateProduct {
    private String codeDup;
    private String nameDup;
    private String imageErr;

    public DuplicateProduct() {
    }

    public DuplicateProduct(String codeDup, String nameDup, String imageErr) {
        this.codeDup = codeDup;
        this.nameDup = nameDup;
        this.imageErr = imageErr;
    }

    public String getCodeDup() {
        return codeDup;
    }

    public void setCodeDup(String codeDup) {
        this.codeDup = codeDup;
    }

    public String getNameDup() {
        return nameDup;
    }

    public void setNameDup(String nameDup) {
        this.nameDup = nameDup;
    }

    public String getImageErr() {
        return imageErr;
    }

    public void setImageErr(String imageErr) {
        this.imageErr = imageErr;
    }
    
    
}

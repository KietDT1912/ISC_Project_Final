package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Product {
    private int id;
    private int categoryId;
    private String code;
    private String name;
    private int quantity;
    private double price;
    private String description;
    private String image;
    private String createDate;
    private int status;

    public Product() {
    }

    public Product(int id, int categoryId, String code, String name, int quantity, double price, String description, String image, String createDate, int status) {
        this.id = id;
        this.categoryId = categoryId;
        this.code = code;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.description = description;
        this.image = image;
        this.createDate = createDate;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", categoryId=" + categoryId + ", code=" + code + ", name=" + name + ", quantity=" + quantity + ", price=" + price + ", description=" + description + ", image=" + image + ", createDate=" + createDate + ", status=" + status + '}';
    }
    
    
}
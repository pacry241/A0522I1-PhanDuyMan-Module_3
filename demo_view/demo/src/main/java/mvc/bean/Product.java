package mvc.bean;

import java.util.Date;

public class Product {
    private String id;
    private String name;
    private Double price;
    private Date dateRelease;
    private int quantity;

    public Product() {
    }

    public Product(String id, String name, Double price, Date dateRelease, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.dateRelease = dateRelease;
        this.quantity = quantity;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getDateRelease() {
        return dateRelease;
    }

    public void setDateRelease(Date dateRelease) {
        this.dateRelease = dateRelease;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}

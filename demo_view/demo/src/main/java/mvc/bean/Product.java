package mvc.bean;

public class Product {
    private String id;
    private String name;
    private Double price;
    private String color;
    private int quantity;
    private String description;
//    private String category;

    public Product() {
    }



    public Product(String id, String name, Double price,  int quantity,String color, String description) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.color = color;
        this.quantity = quantity;
        this.description = description;
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

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}

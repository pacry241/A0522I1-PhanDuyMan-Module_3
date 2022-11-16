package mvc.bean;

public class Category {
    private int Id;
    private String name;

    public Category() {
    }

    public Category(String name, int Id) {
        this.name = name;
        this.Id = Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    @Override
    public String toString() {
        return "Category{" +
                "Id=" + Id +
                ", name='" + name + '\'' +
                '}';
    }
}

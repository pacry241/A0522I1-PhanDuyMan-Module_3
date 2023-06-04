package bean;

public class Customer {
    private int cId;
    private String cName;
    private String cSDT;
    private int idThue;

    private String typeName;

    private int typeId;

    private String dateStart;

    private String description;
    public Customer() {
    }

    public Customer(int cId, String cName, String cSDT, int idThue, String typeName, int typeId, String dateStart, String description) {
        this.cId = cId;
        this.cName = cName;
        this.cSDT = cSDT;
        this.idThue = idThue;
        this.typeName = typeName;
        this.typeId = typeId;
        this.dateStart = dateStart;
        this.description = description;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcSDT() {
        return cSDT;
    }

    public void setcSDT(String cSDT) {
        this.cSDT = cSDT;
    }

    public int getIdThue() {
        return idThue;
    }

    public void setIdThue(int idThue) {
        this.idThue = idThue;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getDateStart() {
        return dateStart;
    }

    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

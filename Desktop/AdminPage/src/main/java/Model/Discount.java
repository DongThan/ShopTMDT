package Model;
// Generated Dec 7, 2020 8:24:16 AM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Discount generated by hbm2java
 */
public class Discount  implements java.io.Serializable {


     private Integer discountId;
     private String name;
     private Float percent;
     private Date startDate;
     private Date endDate;
     private Set<Product> products = new HashSet<Product>(0);

    public Discount() {
    }

    public Discount(String name, Float percent, Date startDate, Date endDate, Set<Product> products) {
       this.name = name;
       this.percent = percent;
       this.startDate = startDate;
       this.endDate = endDate;
       this.products = products;
    }
   
    public Integer getDiscountId() {
        return this.discountId;
    }
    
    public void setDiscountId(Integer discountId) {
        this.discountId = discountId;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public Float getPercent() {
        return this.percent;
    }
    
    public void setPercent(Float percent) {
        this.percent = percent;
    }
    public Date getStartDate() {
        return this.startDate;
    }
    
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    public Date getEndDate() {
        return this.endDate;
    }
    
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    public Set<Product> getProducts() {
        return this.products;
    }
    
    public void setProducts(Set<Product> products) {
        this.products = products;
    }




}



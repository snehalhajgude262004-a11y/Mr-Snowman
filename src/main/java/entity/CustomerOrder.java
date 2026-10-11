package entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;

@Entity
@Table(name = "customer_orders")

public class CustomerOrder {

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;

@Column(
        name="order_number",
        nullable=false,
        unique=true,
        length=30
)
private String orderNumber;

@Column(
        name="customer_name",
        nullable=false,
        length=120
)
private String customerName;

@Column(
        name="customer_email",
        nullable=false,
        length=120
)
private String customerEmail;

@Column(
        name="customer_mobile",
        nullable=false,
        length=20
)
private String customerMobile;

@Column(
        nullable=false,
        length=80
)
private String city;

@Column(
        nullable=false,
        length=80
)
private String state;

@Column(
        nullable=false,
        length=10
)
private String pincode;

@Column(
        name="delivery_address",
        nullable=false,
        length=500
)
private String deliveryAddress;

@Column(
        name="card_holder_name",
        nullable=false,
        length=120
)
private String cardHolderName;

@Column(
        name="card_last_four",
        nullable=false,
        length=4
)
private String cardLastFour;

@Column(
        name="total_quantity",
        nullable=false
)
private int totalQuantity;

@Column(
        name="total_amount",
        nullable=false,
        precision=10,
        scale=2
)
private BigDecimal totalAmount;

@Column(
        nullable=false,
        length=30
)
private String status="PLACED";

@Column(
        name="created_at",
        nullable=false
)
private LocalDateTime createdAt;

@OneToMany(
        mappedBy="order",
        cascade=CascadeType.ALL,
        orphanRemoval=true
)
private List<OrderItem> items=
        new ArrayList<>();



@PrePersist
public void beforeSave(){

    createdAt=
            LocalDateTime.now();

    if(orderNumber==null
            ||
            orderNumber.isBlank()){

        orderNumber=
                "BCO-"
                +
                System.currentTimeMillis();

    }

}



public void addItem(
        OrderItem item
){

    item.setOrder(this);

    items.add(item);

}



public int getId(){
    return id;
}



public String getOrderNumber(){
    return orderNumber;
}

public void setOrderNumber(
        String orderNumber
){
    this.orderNumber=
            orderNumber;
}



public String getCustomerName(){
    return customerName;
}

public void setCustomerName(
        String customerName
){
    this.customerName=
            customerName;
}



public String getCustomerEmail(){
    return customerEmail;
}

public void setCustomerEmail(
        String customerEmail
){
    this.customerEmail=
            customerEmail;
}



public String getCustomerMobile(){
    return customerMobile;
}

public void setCustomerMobile(
        String customerMobile
){
    this.customerMobile=
            customerMobile;
}



public String getCity(){
    return city;
}

public void setCity(
        String city
){
    this.city=
            city;
}



public String getState(){
    return state;
}

public void setState(
        String state
){
    this.state=
            state;
}



public String getPincode(){
    return pincode;
}

public void setPincode(
        String pincode
){
    this.pincode=
            pincode;
}



public String getDeliveryAddress(){
    return deliveryAddress;
}

public void setDeliveryAddress(
        String deliveryAddress
){
    this.deliveryAddress=
            deliveryAddress;
}



public String getCardHolderName(){
    return cardHolderName;
}

public void setCardHolderName(
        String cardHolderName
){
    this.cardHolderName=
            cardHolderName;
}



public String getCardLastFour(){
    return cardLastFour;
}

public void setCardLastFour(
        String cardLastFour
){
    this.cardLastFour=
            cardLastFour;
}



public int getTotalQuantity(){
    return totalQuantity;
}

public void setTotalQuantity(
        int totalQuantity
){
    this.totalQuantity=
            totalQuantity;
}



public BigDecimal getTotalAmount(){
    return totalAmount;
}

public void setTotalAmount(
        BigDecimal totalAmount
){
    this.totalAmount=
            totalAmount;
}



public String getStatus(){
    return status;
}

public void setStatus(
        String status
){
    this.status=
            status;
}



public LocalDateTime getCreatedAt(){
    return createdAt;
}

public void setCreatedAt(
        LocalDateTime createdAt
){
    this.createdAt=
            createdAt;
}



public List<OrderItem> getItems(){
    return items;
}

public void setItems(
        List<OrderItem> items
){
    this.items=
            items;
}

}

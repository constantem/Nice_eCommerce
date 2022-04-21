package tw.nicesport.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;


@Entity
@Table(name = "Orders")
@JsonIdentityInfo(
	    generator = ObjectIdGenerators.PropertyGenerator.class, 
	    property = "order_id",
	    scope = Integer.class
)
public class OrdersBean {
	
	// 訂單編號
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_id")
	private Integer order_id; 
	// 會員編號 外來鍵, 關聯 Member table (會員table) 的主鍵
	@Transient
	@Column(name = "member_id")
	private Integer member_id;
	// 下單日期
	@Column(name = "orderDate")
	private String orderDate;
	// 出貨日期
	@Column(name = "shippingDate")
	private String shippingDate;
	// 運費
	@Column(name = "shippingFee")
	private Integer shippingFee;
	// 所使用的優惠券的編號
//	private int discount_id;
	// 最終總價
	@Column(name = "totalPrice")
	private Integer totalPrice;
	// 收貨人姓名
	@Column(name = "shipName")
	private String shipName;
	// 收貨人住址
	@Column(name = "shipAddress")
	private String shipAddress;
	// 郵遞區號
	@Column(name = "shipPostalCode")
	private String shipPostalCode;
	// 付款狀態, yes or no
	@Column(name = "paymentStatus")
	private String paymentStatus;
	// 出貨狀態, yes or no
	@Column(name = "shipStatus")
	private String shipStatus;
	// 刪除狀態, yes or no
	@Column(name = "deleteStatus")
	private String deleteStatus;
	// 訂單狀態, 1, 99, ...
	@Column(name = "orderStatus")
	private Integer orderStatus;
	// 建立日期
	@Column(name = "createdAt")
	private String createdAt;
	// 修改日期
	@Column(name = "modifiedAt")
	private String modifiedAt;
//
//	// 關聯 table
	@OneToMany(mappedBy = "ordersBean")
//	@JsonIgnore
	private Set<OrderDetailBean> orderDetail = new HashSet<OrderDetailBean>();
	// 多方不用連動
	@ManyToOne
	@JoinColumn(name = "member_id")
	private Member memberBean;

	// 建構子
	public OrdersBean() {
	}
	// GetSet

	public Integer getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getShippingDate() {
		return shippingDate;
	}

	public void setShippingDate(String shippingDate) {
		this.shippingDate = shippingDate;
	}

	public Integer getShippingFee() {
		return shippingFee;
	}

	public void setShippingFee(Integer shippingFee) {
		this.shippingFee = shippingFee;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getShipName() {
		return shipName;
	}

	public void setShipName(String shipName) {
		this.shipName = shipName;
	}

	public String getShipAddress() {
		return shipAddress;
	}

	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}

	public String getShipPostalCode() {
		return shipPostalCode;
	}

	public void setShipPostalCode(String shipPostalCode) {
		this.shipPostalCode = shipPostalCode;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getShipStatus() {
		return shipStatus;
	}

	public void setShipStatus(String shipStatus) {
		this.shipStatus = shipStatus;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getModifiedAt() {
		return modifiedAt;
	}

	public void setModifiedAt(String modifiedAt) {
		this.modifiedAt = modifiedAt;
	}

	public Set<OrderDetailBean> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(Set<OrderDetailBean> orderDetail) {
		this.orderDetail = orderDetail;
	}

	public Member getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(Member memberBean) {
		this.memberBean = memberBean;
	}

}
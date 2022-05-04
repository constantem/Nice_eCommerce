package tw.nicesport.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
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
	private Integer orderId; 
	// 會員編號 外來鍵, 關聯 Member table (會員table) 的主鍵
	@Transient
	@Column(name = "member_id")
	private Integer memberId;
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
	private List<OrderDetailBean> orderDetail = new ArrayList<OrderDetailBean>();
	// 多方不用連動
	@ManyToOne
	@JoinColumn(name = "member_id")
	private Member memberBean;

	// 建構子
	public OrdersBean() {
	}
	// GetSet

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
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

	public List<OrderDetailBean> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(List<OrderDetailBean> orderDetail) {
		this.orderDetail = orderDetail;
	}

	public Member getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(Member memberBean) {
		this.memberBean = memberBean;
	}

}
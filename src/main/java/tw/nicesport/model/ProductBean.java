package tw.nicesport.model;

import java.io.Serializable;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@SuppressWarnings("serial")
@Entity
@Table(name = "Product")
@Component
public class ProductBean implements Serializable {

	// 對應欄位
	// 產品編號, 主鍵
	@Id
	@Column(name = "product_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer product_id;

	// 產品名
	@Column(name = "productName")
	private String productName;

	// 廠商
	@Column(name = "supplier")
	private String supplier;

	// 顏色
	@Column(name = "color")
	private String color;

	// 尺寸
	@Column(name = "size")
	private String size;

	// 價格
	@Column(name = "price")
	private String price;

	// 重量
	@Column(name = "weight")
	private String weight;

	// 圖片陣列
	@Column(name = "img")
	private byte[] img;

	// 圖片url
	@Column(name = "imgUrl")
	private String imgUrl;

	private String imgUrl_A;

	private String imgUrl_B;

	private String imgUrl_C;

	private String imgUrl_D;

	// 商品描述
	@Column(name = "productDiscription")
	private String productDiscription;

	// 建立日期
	@Column(name = "createdAt")
	private String createdAt;

	// 修改日期
	@Column(name = "modifiedAt")
	private String modifiedAt;

	// 庫存編號
	@Transient
	@Column(name = "stock_id")
	private String stock_id;

	// 子類別
	@Column(name = "subcategory_id")
	@Transient
	private Integer subcategory_id;

	// 關聯 table

	@ManyToOne
	@JoinColumn(name = "subcategory_id")
	private SubCategoryBean subCategory;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "stock_id", referencedColumnName = "stock_id")
	private StockBean stock;

	@OneToMany(mappedBy = "productBean")
	private Set<OrderDetailBean> orderDetails = new HashSet<OrderDetailBean>();

	// 建構子

	public ProductBean() {
		super();
	}

	// getter, setter

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public byte[] getImg() {
		return img;
	}

	public void setImg(byte[] img) {
		this.img = img;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getImgUrl_A() {
		return imgUrl_A;
	}

	public void setImgUrl_A(String imgUrl_A) {
		this.imgUrl_A = imgUrl_A;
	}

	public String getImgUrl_B() {
		return imgUrl_B;
	}

	public void setImgUrl_B(String imgUrl_B) {
		this.imgUrl_B = imgUrl_B;
	}

	public String getImgUrl_C() {
		return imgUrl_C;
	}

	public void setImgUrl_C(String imgUrl_C) {
		this.imgUrl_C = imgUrl_C;
	}

	public String getImgUrl_D() {
		return imgUrl_D;
	}

	public void setImgUrl_D(String imgUrl_D) {
		this.imgUrl_D = imgUrl_D;
	}

	public String getProductDiscription() {
		return productDiscription;
	}

	public void setProductDiscription(String productDiscription) {
		this.productDiscription = productDiscription;
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

	public String getStock_id() {
		return stock_id;
	}

	public void setStock_id(String stock_id) {
		this.stock_id = stock_id;
	}

	public Integer getSubcategory_id() {
		return subcategory_id;
	}

	public void setSubcategory_id(Integer subcategory_id) {
		this.subcategory_id = subcategory_id;
	}

	// 關聯 table 的 getter, setter
	
	public SubCategoryBean getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(SubCategoryBean subCategory) {
		this.subCategory = subCategory;
	}

	public StockBean getStock() {
		return stock;
	}

	public void setStock(StockBean stock) {
		this.stock = stock;
	}

	public Set<OrderDetailBean> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetailBean> orderDetails) {
		this.orderDetails = orderDetails;
	}
}

package tw.nicesport.model;

import java.io.Serializable;

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

	@Id
	@Column(name = "product_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer product_id;

	@Column(name = "productName")
	private String productName;

	@Column(name = "supplier")
	private String supplier;

	@Column(name = "color")
	private String color;

	@Column(name = "size")
	private String size;

	@Column(name = "price")
	private String price;

	@Column(name = "weight")
	private String weight;

	@Column(name = "img") 
	private byte[] img;
	
	@Column(name = "imgUrl")
	private String imgUrl;
	
	private String imgUrl_A;
	
	private String imgUrl_B;
	
	private String imgUrl_C;
	
	private String imgUrl_D;
	
	@Column(name = "productDiscription")
	private String productDiscription;

	public String getProductDiscription() {
		return productDiscription;
	}

	public void setProductDiscription(String productDiscription) {
		this.productDiscription = productDiscription;
	}

	@Column(name = "createdAt")
	private String createdAt;

	@Column(name = "modifiedAt")
	private String modifiedAt;

//	@Column(name = "subcategory_id")
////	@Transient
//	private Integer subcategory_id;

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	@ManyToOne
	@JoinColumn(name = "subcategory_id")
	private SubCategoryBean subCategory;

	public SubCategoryBean getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(SubCategoryBean subCategory) {
		this.subCategory = subCategory;
	}
	
	
	public StockBean getStock() {
		return stock;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "stock_id", referencedColumnName = "stock_id")
	private StockBean stock;



	public void setStock(StockBean stock) {
		this.stock = stock;
	}

	public ProductBean() {
	}

	public ProductBean(String productName, Integer product_id, String price, String supplier, String color, String size,String productDiscription,
			String weight, byte[] img,String imgUrl, String createdAt, String modifiedAt, Integer subcategory_id, Integer stock_id,
			String imgUrl_A,String imgUrl_B,String imgUrl_C,String imgUrl_D) {

		this.color = color;
		this.createdAt = createdAt;
		this.img = img;
		this.imgUrl = imgUrl;
		this.modifiedAt = modifiedAt;
		this.price = price;
		this.product_id = product_id;
		this.productName = productName;
		this.supplier = supplier;
		this.weight = weight;
		this.size = size;
		this.productDiscription = productDiscription;
		this.imgUrl_A = imgUrl_A;
		this.imgUrl_B = imgUrl_B;
		this.imgUrl_C = imgUrl_C;
		this.imgUrl_D = imgUrl_D;

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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

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

}

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

  // 關聯表格
  
	@ManyToOne
	@JoinColumn(name = "subcategory_id")
	private SubCategoryBean subCategory;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "stock_id", referencedColumnName = "stock_id")
	private StockBean stock;

  @OneToMany(mappedBy = "productBean")
	private Set<OrderDetailBean> orderDetails = new HashSet<OrderDetailBean>();
  
  // 建構子
  

  // getter, setter
  


}

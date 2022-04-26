package tw.nicesport.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

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

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "CartProduct")
@JsonIdentityInfo(
	    generator = ObjectIdGenerators.PropertyGenerator.class, 
	    property = "cartProductId",
	    scope = Integer.class
)
public class CartProductBean implements Serializable {

	private static final long serialVersionUID = 1L;

	public CartProductBean() {
	}
	
//	購物車編號, 主鍵
	@Id
	@Column(name = "cartProduct_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cartProductId;
//	購物車編號, 外來鍵, 關聯 Cart table (購物車table) 的主鍵	
	@Column(name = "cart_id")
	@Transient
	private Integer cartId;
//	商品編號, 外來鍵, 關聯 Product table (商品table) 的主鍵	
	@Column(name = "product_id")
	@Transient
	private Integer productId;
//	商品數量
	@Column(name = "quantity")
	private Integer quantity;
	
	


	@Override
	public String toString() {
		return "CartProductBean [cartProductId=" + cartProductId + ", cartId=" + cartId + ", productId=" + productId
				+ ", quantity=" + quantity + ", cartBean=" + cartBean + ", productBean=" + productBean + "]";
	}

	// 關聯 table
	// 對應購物車
	@ManyToOne
	@JoinColumn(name = "cart_id")
	private CartBean cartBean;
		
	
	// 對應產品
	@ManyToOne
	@JoinColumn(name = "product_id")
	private ProductBean productBean;
	
	// getter, setter
	
	public Integer getCartProductId() {
		return cartProductId;
	}


	public void setCartProductId(Integer cartProductId) {
		this.cartProductId = cartProductId;
	}


	public Integer getCartId() {
		return cartId;
	}


	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}


	public Integer getProductId() {
		return productId;
	}


	public void setProductId(Integer productId) {
		this.productId = productId;
	}


	public Integer getQuantity() {
		return quantity;
	}


	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}


	public CartBean getCartBean() {
		return cartBean;
	}


	public void setCartBean(CartBean cartBean) {
		this.cartBean = cartBean;
//		cartBean.getCartProductBeanList().add(this);
	}


	public ProductBean getProductBean() {
		return productBean;
	}


	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	
	

}

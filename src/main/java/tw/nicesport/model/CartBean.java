package tw.nicesport.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
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

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "Cart")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "cartId", scope = Integer.class)
public class CartBean implements Serializable {

	private static final long serialVersionUID = 1L;

//	購物車編號, 主鍵
	@Id
	@Column(name = "cart_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cartId;
//	會員編號, 外來鍵, 關聯 Member table (會員table) 的主鍵
	@Column(name = "member_id")
	@Transient
	private Integer memberId;

	// 關聯 table

	@Override
	public String toString() {
		return "CartBean [cartId=" + cartId + ", memberId=" + memberId + ", member=" + member + "]";
	}

	//// 對應會員
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "member_id")
	private Member member;

	// 對應購物車明細
	@OneToMany(
		cascade = CascadeType.ALL,
		mappedBy = "cartBean"
	)
	private List<CartProductBean> cartProductBeanList = new ArrayList<CartProductBean>();

	// 建構子
	public CartBean() {
		super();
	}

	// 同步用的方法

//	public void addCartProductBean(CartProductBean cartProductBean) {
//		cartProductBeanList.add(cartProductBean);
//		cartProductBean.setCartBean(this);
//	}

//	public void removeCartProductBean(CartProductBean cartProductBean) {
//		cartProductBeanList.remove(cartProductBean);
//		cartProductBean.setCartBean(null);
//	}

	// getter, setter

	public Integer getCartId() {
		return cartId;
	}

	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public List<CartProductBean> getCartProductBeanList() {
		return cartProductBeanList;
	}

	public void setCartProductBeanList(List<CartProductBean> cartProductBeanList) {
		this.cartProductBeanList = cartProductBeanList;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}

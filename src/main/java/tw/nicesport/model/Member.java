package tw.nicesport.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import tw.nicesport.security.UserType;

import javax.persistence.Table;


@Entity
@Table(name="member")
@JsonIdentityInfo( // 轉 JSON 時, A 中可以有 B, 但此 B 中不能再有 A 的設定
    generator = ObjectIdGenerators.PropertyGenerator.class, 
    property = "memberid", // 這邊要跟 java bean 的主鍵屬性一樣
    scope = Integer.class
)
public class Member {

	// 對應欄位
	// 會員編號, 主鍵
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name="member_id")
//	private Integer member_id;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="member_id")
	private Integer memberid;
	
	// 帳號
//	@NotBlank(message="帳號不可空白")
	@Column(name="username")
	private String username;
	
	// 密碼
//	@NotBlank(message="密碼不可空白")
//	@Size(min=6, max=12, message="密碼長度不符合")
	@Column(name="password")
	private String password;
	
	// 名
	@Column(name="firstName")
	private String firstname;
	
	// 姓
	@Column(name="lastName")
	private String lastname;
	
	// 生日, YYYY-MM-DD
	@Column(name="birthDate")
	private String birthdate;
	
	// 性別
	@Column(name="gender")
	private String gender;
	
	// 電話
	@Column(name="phone")
	private String phone;
	
	// 電子信箱
	@Column(name="email")
	@Email(message="請輸入email")
	private String email;
	
	// 住址
	@Column(name="address")
	private String address;
	
	// 第三方登入的提供商
	@Column(name="userType")
	private UserType userType;
	
	// 建立日期
//	@Column(name="createAt")
//	private String createat;
//	
	// 修改日期
//	@Column(name="modifiedAt")
//	private String modifiedat;

	// 關聯 table
	
	@OneToMany(
		cascade = CascadeType.ALL,
		mappedBy = "memberBean"
	)
	@JsonIgnore
	private List<OrdersBean> ordersBeanList = new ArrayList<OrdersBean>();
	
	@OneToMany(
		cascade = CascadeType.ALL,
		mappedBy="member"
	) // 不以上面的 PK 為了去關聯下面的 FK (但沒辦法填 PK)而去建 link table
//	@JsonIgnore // OneToMany 必加, 或加 EAGER, 不然 courses 為 null, 轉 Json 出錯
	private List<CourseBooking> courseBookingList = new ArrayList<>();
	
	@OneToMany(
		cascade = CascadeType.ALL,
		mappedBy = "member"
	)
	@JsonIgnore
	private Set<ProductWishListBean> productMyWishListSet = new HashSet<>();
	
	@OneToOne(
		cascade = CascadeType.ALL,
		mappedBy="member"
	)
	private CartBean cart;

	@OneToMany(
		cascade = CascadeType.ALL,
		mappedBy="member"
	)
	private Set<MemberDiscountDetailBean> memberDiscountDetailBeanSet = new HashSet<>();
	
	// 建構子

	public Member() {
	}

	// getter, setter



	public String getUsername() {
		return username;
	}

	public Integer getMemberid() {
		return memberid;
	}

	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public UserType getUserType() {
		return userType;
	}

	public void setUserType(UserType google) {
		this.userType = google;
	}

	@Override
	public String toString() {
		return "Member [member_id=" + memberid + ", username=" + username + ", password=" + password + ", firstname=" + firstname
				+ ", lastname=" + lastname + ", birthdate=" + birthdate + ", gender=" + gender + ", phone=" + phone
				+ ", email=" + email + ", address=" + address + "]";
	}

//	public String getCreatedAt() {
//		return createdAt;
//	}
//
//	public void setCreatedAt(String createdAt) {
//		this.createdAt = createdAt;
//	}
//
//	public String getModifiedAt() {
//		return modifiedAt;
//	}
//
//	public void setModifiedAt(String modifiedAt) {
//		this.modifiedAt = modifiedAt;
//	}

	// 關聯 table 的 getter, setter
	
	public List<OrdersBean> getOrdersBeanList() {
		return ordersBeanList;
	}

	public List<CourseBooking> getCourseBookingList() {
		return courseBookingList;
	}

	public void setCourseBookingList(List<CourseBooking> courseBookingList) {
		this.courseBookingList = courseBookingList;
	}

	public void setOrdersBeanList(List<OrdersBean> ordersBeanSet) {
		this.ordersBeanList = ordersBeanSet;
	}

	public Set<ProductWishListBean> getProductMyWishListSet() {
		return productMyWishListSet;
	}

	public void setProductMyWishListSet(Set<ProductWishListBean> productMyWishListSet) {
		this.productMyWishListSet = productMyWishListSet;
	}

	public CartBean getCart() {
		return cart;
	}

	public void setCart(CartBean cart) {
		this.cart = cart;
	}

	public Set<MemberDiscountDetailBean> getMemberDiscountDetailBeanSet() {
		return memberDiscountDetailBeanSet;
	}

	public void setMemberDiscountDetailBeanSet(Set<MemberDiscountDetailBean> memberDiscountDetailBeanSet) {
		this.memberDiscountDetailBeanSet = memberDiscountDetailBeanSet;
	}
	
	
	
}

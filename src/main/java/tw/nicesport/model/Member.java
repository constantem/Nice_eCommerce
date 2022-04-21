package tw.nicesport.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.Table;

@Entity
@Table(name="member")
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
	
	// 建立日期
//	@Column(name="createAt")
//	private String createat;
//	
	// 修改日期
//	@Column(name="modifiedAt")
//	private String modifiedat;

	// 關聯 table
	
	@OneToMany(mappedBy = "memberBean")
	private Set<OrdersBean> ordersBeanSet = new HashSet<OrdersBean>();
	
	@OneToMany(mappedBy="member") // 不以上面的 PK 為了去關聯下面的 FK (但沒辦法填 PK)而去建 link table
	@JsonIgnore // OneToMany 必加, 或加 EAGER, 不然 courses 為 null, 轉 Json 出錯
	private Set<CourseBooking> courseBookingSet = new HashSet<>();

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
	
	public Set<CourseBooking> getCourseBookingSet() {
		return courseBookingSet;
	}

	public void setCourseBookingSet(Set<CourseBooking> courseBookingSet) {
		this.courseBookingSet = courseBookingSet;
	}

	public Set<OrdersBean> getOrdersBeanSet() {
		return ordersBeanSet;
	}

	public void setOrdersBeanSet(Set<OrdersBean> ordersBeanSet) {
		this.ordersBeanSet = ordersBeanSet;
	}

}

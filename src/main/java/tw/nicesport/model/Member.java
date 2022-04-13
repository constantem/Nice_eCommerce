package tw.nicesport.model;

<<<<<<< HEAD
=======
import java.util.HashSet;
import java.util.Set;

>>>>>>> master
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
<<<<<<< HEAD
import javax.persistence.Table;

@Entity
@Table(name="Member")
public class Member {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="member_id")
	private Integer id;
	
	@Column(name="username")
	private String username;
	
	@Column(name="password")
	private String password;
	
	@Column(name="firstName")
	private String firstname;
	
	@Column(name="lastName")
	private String lastname;
	
	@Column(name="birthDate")
	private String birthdate;
	
	@Column(name="gender")
	private String gender;
	
	@Column(name="phone")
	private String phone;
	
	@Column(name="email")
	private String email;
	
	@Column(name="address")
	private String address;
	
//	@Column(name="createAt")
//	private String createat;
//	
//	@Column(name="modifiedAt")
//	private String modifiedat;
=======
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity @Table
@Component
public class Member {

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column
	private Integer member_id;
	
	@NotBlank(message="帳號不可空白")
	@Column
	private String username;
	
	@NotBlank(message="密碼不可空白")
	@Column
	private String password;
	
	@Column
	private String firstName;
	
	@Column
	private String lastName;
	
	@Column
	private String birthDate;
	
	@Column
	private String gender;
	
	@Column
	private String phone;
	
	@Column
	private String email;
	
	@Column
	private String address;
	
	@Column @Transient
	private String createdAt;
	
	@Column
	private String modifiedAt;
	
	// 以上為欄位, 以下為其他 entity
	
	@OneToMany(mappedBy="member") // 不以上面的 PK 為了去關聯下面的 FK (但沒辦法填 PK)而去建 link table
	@JsonIgnore // OneToMany 必加, 或加 EAGER, 不然 courses 為 null, 轉 Json 出錯
	private Set<CourseBooking> courseBookingSet = new HashSet<>();

	// 建構子
>>>>>>> master
	
	public Member() {
	}

<<<<<<< HEAD
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
=======
	// getter, setter
	
	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
>>>>>>> master
	}

	public String getUsername() {
		return username;
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

<<<<<<< HEAD
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
=======
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
>>>>>>> master
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

<<<<<<< HEAD
	@Override
	public String toString() {
		return "Member [id=" + id + ", username=" + username + ", password=" + password + ", firstname=" + firstname
				+ ", lastname=" + lastname + ", birthdate=" + birthdate + ", gender=" + gender + ", phone=" + phone
				+ ", email=" + email + ", address=" + address + "]";
	}

=======
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

	// 對側 entity 的 getter, setter
	
	public Set<CourseBooking> getCourseBookingSet() {
		return courseBookingSet;
	}

	public void setCourseBookingSet(Set<CourseBooking> courseBookingSet) {
		this.courseBookingSet = courseBookingSet;
	}
	
	
>>>>>>> master
}

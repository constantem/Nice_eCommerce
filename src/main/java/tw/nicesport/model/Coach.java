package tw.nicesport.model;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;

@Entity @Table(name="Coach")
@JsonIdentityInfo(
	    generator = ObjectIdGenerators.PropertyGenerator.class, 
	    property = "id", 
	    scope = Integer.class
	)
public class Coach {

	///////////
	// field //
	///////////
	
	// 主鍵
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	// 其他欄位
	
	@Column(name="lastName")
	private String lastName;
	
	@Column(name="firstName")
	private String firstName;
	
	@Column(name="nickname")
	private String nickname;
	
	@Column(name="gender")
	private String gender;
	
	@Column(name="phone")
	private String phone;
	
	@Column(name="email")
	private String email;
	
	@Column(name="address")
	private String address;
	
	@Column(name="hireDate")
	private String hireDate;
	
	@Column(name="profile")
	private byte[] profile;
	
	@Transient
	private String profileBase64;
	
	@Column(name="createdAt", insertable = false, updatable = false)
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonSerialize(using = LocalDateTimeSerializer.class) // 讓 ObjectMapper (不論是自己 new 還是 ResponseBody 背後做) 可以將 LocalDate 轉 String
	private LocalDateTime createdAt;
	
	@Column(name="modifiedAt")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonSerialize(using = LocalDateTimeSerializer.class) // 讓 ObjectMapper (不論是自己 new 還是 ResponseBody 背後做) 可以將 LocalDate 轉 String
	private LocalDateTime modifiedAt;
	
	@PreUpdate // 用 SQL UPDATE 用 PrePersist 無效
	void preUpate() {
		if(this.id != null) {
			modifiedAt = LocalDateTime.now();
		}
	}
	
	// associated entity
	
	@OneToMany(
		mappedBy="coach",
		cascade= CascadeType.ALL
	)
//	@JsonIgnore // OneToMany 必加, 或加 EAGER, 不然 courses 為 null, 轉 Json 出錯
	@JsonIdentityReference(alwaysAsId = true) // 只顯示 id, List/Set 要加
	private Set<Course> courses = new HashSet<>();
	
	///////////
	// 建構子 //
	///////////
	
	public Coach() {
	}
	
	///////////////////
	// getter,setter //
	///////////////////
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public String getHireDate() {
		return hireDate;
	}

	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}

	public byte[] getProfile() {
		return profile;
	}

	public void setProfile(byte[] profile) {
		this.profile = profile;
	}

	public String getProfileBase64() {
		return profileBase64;
	}

	public void setProfileBase64(String profileBase64) {
		this.profileBase64 = profileBase64;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getModifiedAt() {
		return modifiedAt;
	}

	public void setModifiedAt(LocalDateTime modifiedAt) {
		this.modifiedAt = modifiedAt;
	}

	// associated entity 的 getter, setter
	
	public Set<Course> getCourses() {
		return courses;
	}

	public void setCourses(Set<Course> courses) {
		this.courses = courses;
	}

	// toString, 不可雙向(一方不可access多方)
	@Override
	public String toString() {
		return "Coach [id=" + id + ", lastName=" + lastName + ", firstName=" + firstName + ", nickname=" + nickname
				+ ", gender=" + gender + ", phone=" + phone + ", email=" + email + ", address=" + address
				+ ", hireDate=" + hireDate + ", createdAt=" + createdAt + ", modifiedAt=" + modifiedAt + "]";
	}
}

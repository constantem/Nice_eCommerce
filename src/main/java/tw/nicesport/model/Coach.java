package tw.nicesport.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity @Table
public class Coach {

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="coach_id")
	private Integer coach_id;
	
	@Column
	private String lastName;
	
	@Column
	private String firstName;
	
	@Column
	private String nickname;
	
	@Column
	private String gender;
	
	@Column
	private String phone;
	
	@Column
	private String email;
	
	@Column
	private String address;
	
	@Column
	private String hireDate;
	
	@Column @Transient
	private String createdAt;
	
	@Column
	private String modifiedAt;
	
	// 以上為欄位, 以下為其他 entity
	
	@OneToMany(mappedBy="coach")
	@JsonIgnore // OneToMany 必加, 或加 EAGER, 不然 courses 為 null, 轉 Json 出錯
	private Set<Course> courses = new HashSet<>();
	
	// 建構子
	
	public Coach() {
	}
	
	// getter, setter
	
	public Integer getCoach_id() {
		return coach_id;
	}

	public void setCoach_id(Integer coach_id) {
		this.coach_id = coach_id;
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
	
	public Set<Course> getCourses() {
		return courses;
	}

	public void setCourses(Set<Course> courses) {
		this.courses = courses;
	}
}

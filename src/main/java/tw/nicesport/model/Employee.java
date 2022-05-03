package tw.nicesport.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat; 

@Entity
@Table(name = "Employee")
public class Employee {
 
//  @Id註釋指定表的主鍵	
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
//  @Column註釋定義了將成員屬性對映到關係表中的哪一列和該列的結構資訊
	@Column(name = "employee_id")
	private Integer employeeid;// 員工編號

	@Column(name = "firstName")
	private String firstName;// 名

	@Column(name = "lastName")
	private String lastName;// 姓
	
	@Column(name = "password")
	private String password;// 密碼

	@Column(name = "gender")
	private String gender;// 性別

	@Column(name = "phone")
	private String phone;// 電話

	@Column(name = "email")
	private String email;

	@Column(name = "address")
	private String address;// 住址

	@Column(name = "jobTitle")
	private String jobTitle;// 職稱
	
	@Column(name = "img")
	private String img; //照片

	@JsonFormat(pattern = "yyyy/MM/dd", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP) // 年 月 日 十分秒
	@Column(name = "hireDate")
	private Date hireDate;// 受雇起始日

	@Column(name = "permission")
	private String permission;// 權限

	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP) // 年 月 日 十分秒
	@Column(name = "createdAt", columnDefinition = "datetime")
	private Date createdAt;// 建立日期

	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@Column(name = "modifiedAt", columnDefinition = "datetime")
	private Date modifiedAt;// 修改日期

	public Employee() {
	}

	@PrePersist // 在轉換到 PrePersist狀態以前去做的  不能寫多個 只能注入一個
	public void onCreate() {
		if (hireDate == null&&createdAt == null) {
			hireDate = new Date();
			createdAt = new Date();
		}
//		if (createdAt == null) {
//			createdAt = new Date();
//		}
	}
	
	@PreUpdate // 在轉換到 PrePersist狀態以前去做的  不能寫多個 只能注入一個
	public void onUpdate() {
		modifiedAt = new Date();
		
		if (hireDate == null) {
			hireDate = new Date();
		}
		if (createdAt == null) {
			createdAt = new Date();
		}
	}
	public Integer getEmployee_id() {
		return employeeid;
	}

	public void setEmployee_id(Integer employeeid) {
		this.employeeid = employeeid;

	}

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {

		this.hireDate = hireDate;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getModifiedAt() {
		return modifiedAt;
	}

	public void setModifiedAt(Date modifiedAt) {
		this.modifiedAt = modifiedAt;
	}
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "Employee [employeeid=" + employeeid + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", password=" + password + ", gender=" + gender + ", phone=" + phone + ", email=" + email
				+ ", address=" + address + ", jobTitle=" + jobTitle + ", img=" + img + ", hireDate=" + hireDate
				+ ", permission=" + permission + ", createdAt=" + createdAt + ", modifiedAt=" + modifiedAt + "]";
	}

}

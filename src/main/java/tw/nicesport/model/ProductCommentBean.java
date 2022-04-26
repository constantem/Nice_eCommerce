package tw.nicesport.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "ProductComment")
@Component
public class ProductCommentBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "customerFullName")
	private String customerFullName;

	@Column(name = "email")
	@Email(message = "請輸入Email")
	private String email;

	@Column(name = "phone")
	private String phone;

	@Column(name = "productComment")
	private String productComment;

	// 建立日期
	@Column(name = "createdAt")
	private String createdAt;

	// 修改日期
	@Column(name = "modifiedAt")
	private String modifiedAt;

	@Column(name = "productScore")
	private String productScore;

	public String getCustomerFullName() {
		return customerFullName;
	}

	public String getProductScore() {
		return productScore;
	}

	public void setProductScore(String productScore) {
		this.productScore = productScore;
	}

	public void setCustomerFullName(String customerFullName) {
		this.customerFullName = customerFullName;
	}

	public ProductCommentBean() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProductComment() {
		return productComment;
	}

	public void setProductComment(String productComment) {
		this.productComment = productComment;
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

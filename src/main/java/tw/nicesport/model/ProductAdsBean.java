package tw.nicesport.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "ProductAds")
@Component
public class ProductAdsBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "imgUrl_A")
	private String imgUrl_A;

	@Column(name = "imgUrl_B")
	private String imgUrl_B;

	@Column(name = "imgUrl_C")
	private String imgUrl_C;

	@Column(name = "imgUrl_D")
	private String imgUrl_D;

	@Column(name = "createdAt")
	private String createdAt;

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

	@Column(name = "modifiedAt")
	private String modifiedAt;

	// 建構子
	public ProductAdsBean() {
		super();
	}

	// getter, setter

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getImgUrl_A() {
		return imgUrl_A;
	}

	public void setImgUrl_A(String imgUrl_A) {
		this.imgUrl_A = imgUrl_A;
	}

	public String getImgUrl_B() {
		return imgUrl_B;
	}

	public void setImgUrl_B(String imgUrl_B) {
		this.imgUrl_B = imgUrl_B;
	}

	public String getImgUrl_C() {
		return imgUrl_C;
	}

	public void setImgUrl_C(String imgUrl_C) {
		this.imgUrl_C = imgUrl_C;
	}

	public String getImgUrl_D() {
		return imgUrl_D;
	}

	public void setImgUrl_D(String imgUrl_D) {
		this.imgUrl_D = imgUrl_D;
	}

}

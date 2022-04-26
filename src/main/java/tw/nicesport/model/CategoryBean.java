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
@Table(name = "ProductCategory")
@Component
public class CategoryBean implements Serializable {

	private static final long serialVersionUID = 1L;


	public CategoryBean() {
	}

	public CategoryBean(Integer catrgory_id, String name, String createdAt, String modifiedAt) {

		this.id = catrgory_id;
		this.name = name;
		this.createdAt = createdAt;
		this.modifiedAt = modifiedAt;
	}

	@Id
	@Column(name = "category_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "name")
	private String name;

	@Column(name = "createdAt")
	private String createdAt;

	@Column(name = "modifiedAt")
	private String modifiedAt;
	

	public Integer getCategory_id() {
		return id;
	}

	public void setCategory_id(Integer category_id) {
		this.id = category_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

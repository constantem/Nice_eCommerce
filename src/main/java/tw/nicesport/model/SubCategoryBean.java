package tw.nicesport.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name = "ProductSubCategory")
@Component
public class SubCategoryBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "subcategory_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "name")
	private String name;
	
//	@Column(name = "category_id")
//	private Integer category_id;

	@Column(name = "createdAt")
	private String createdAt;

	@Column(name = "modifiedAt")
	private String modifiedAt;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	private CategoryBean category;


	public CategoryBean getCategory() {
		return category;
	}

	public void setCategory(CategoryBean category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public Integer getSubcategory_id() {
		return id;
	}

	public void setSubcategory_id(Integer subcategory_id) {
		this.id = subcategory_id;
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

	public SubCategoryBean() {
	}

}

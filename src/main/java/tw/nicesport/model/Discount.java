package tw.nicesport.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="discount")
public class Discount implements Serializable{
	//序列化(Serializable後端把資料轉成JSON)Spring會幫忙做，為了不忘記有這件事才打出來
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="description")
	private String description;
	
	@Column(name="conditionCategory")
	private String conditionCategory;
	
	@Column(name="conditionPrice")
	private Integer conditionPrice;
	
	@Column(name="discountCategory")
	private String discountCategory;
	
	@Column(name="discountPercent")
	private Integer discountPercent;
	
	@Column(name="discountAmount")
	private Integer discountAmount;
	
	@Column(name="startDate")
	private String startDate;
	
	@Column(name="endDate")
	private String endDate;
	
	//private Integer createdAt;
	
	//private Integer modifiedAt;
	
	public Discount() {
	}
	
	public Discount(String name, String description, String conditionCategory, Integer conditionPrice, 
			String discountCategory, Integer discountPercent, Integer discountAmount, String startDate, 
			String endDate) {
		super();
		this.name = name;
		this.description = description;
		this.conditionCategory = conditionCategory;
		this.conditionPrice = conditionPrice;
		this.discountCategory = discountCategory;
		this.discountPercent = discountPercent;
		this.discountAmount = discountAmount;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getConditionCategory() {
		return conditionCategory;
	}

	public void setConditionCategory(String conditionCategory) {
		this.conditionCategory = conditionCategory;
	}

	public Integer getConditionPrice() {
		return conditionPrice;
	}

	public void setConditionPrice(Integer conditionPrice) {
		this.conditionPrice = conditionPrice;
	}

	public String getDiscountCategory() {
		return discountCategory;
	}

	public void setDiscountCategory(String discountCategory) {
		this.discountCategory = discountCategory;
	}

	public Integer getDiscountPercent() {
		return discountPercent;
	}

	public void setDiscountPercent(Integer discountPercent) {
		this.discountPercent = discountPercent;
	}

	public Integer getDiscountAmount() {
		return discountAmount;
	}

	public void setDiscountAmount(Integer discountAmount) {
		this.discountAmount = discountAmount;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	
}

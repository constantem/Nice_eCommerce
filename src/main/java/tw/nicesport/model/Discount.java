package tw.nicesport.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Future;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name="discount")
@JsonIdentityInfo( // 轉 JSON 時, A 中可以有 B, 但此 B 中不能再有 A 的設定
	    generator = ObjectIdGenerators.PropertyGenerator.class, 
	    property = "id", // 這邊要跟 java bean 的主鍵屬性一樣
	    scope = Integer.class
	)
public class Discount implements Serializable{
	//序列化(Serializable後端把資料轉成JSON)Spring會幫忙做，為了不忘記有這件事才打出來
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	//優惠券名稱(兌換碼)
	//@Size(min = 2, max = 49, message = "請輸入 2 到 49 個字串")
	@Column(name="name", columnDefinition = "nvarchar(50)")//columnDefinition客製化資料庫資料型別
	private String name;
	
	//折扣規則
	//@Size(min = 2, max = 254, message = "請輸入 2 到 254 個字串")
	@Column(name="description", columnDefinition = "nvarchar(255)")
	private String description;
	
	//有無門檻
	//@Size(min = 2, max = 49, message = "請輸入 2 到 49 個字串")
	@Column(name="conditionCategory", columnDefinition = "nvarchar(50)")
	private String conditionCategory;
	
	//低銷金額
	@Column(name="conditionPrice", columnDefinition = "int", length = 8)
	private Integer conditionPrice;
	
	//比例/定額折扣
	//@Size(min = 2, max = 49, message = "請輸入 2 到 49 個字串")
	@Column(name="discountCategory", columnDefinition = "nvarchar(50)")
	private String discountCategory;
	
	//折扣比例
	@Column(name="discountPercent", columnDefinition = "int", length = 2)
	private Integer discountPercent;
	
	//折扣額度
	@Column(name="discountAmount", columnDefinition = "int", length = 8)
	private Integer discountAmount;
	
	//優惠開始日
	//@DateTimeFormat(pattern ="yyyy/MM/dd HH:mm:ss")//大寫MM是月，小寫mm是分鐘
	//@Temporal(TemporalType.TIMESTAMP)//說明要用哪種時間表示方式
	//@Future(message = "請輸入優惠開始日")
	@Column(name="startDate")
	private String startDate;
	
	//優惠結束日
//	@DateTimeFormat(pattern ="yyyy/MM/dd HH:mm:ss")
//	@Temporal(TemporalType.TIMESTAMP)
//	@Future(message = "請輸入優惠結束日")
	@Column(name="endDate")
	private String endDate;
	
	//折價券發放數量
	@Column(name="initialQuantity")
	private Integer initialQuantity;
	
	//折價券當前數量
	@Column(name="currentQuantity")
	private Integer currentQuantity;
	
//	private String createdAt;
//	
//	private String modifiedAt;
	
	@OneToMany(
		mappedBy="discount",
		cascade = {CascadeType.PERSIST,
	              CascadeType.DETACH,
	              CascadeType.MERGE,
	              CascadeType.REFRESH}
	)
	private Set<MemberDiscountDetailBean> memberDiscountDetailBeanSet = new HashSet<>();
	
	@OneToOne(
		mappedBy="discount",
		cascade = {CascadeType.PERSIST,
	               CascadeType.DETACH,
	               CascadeType.MERGE,
	               CascadeType.REFRESH}
	)
	private AnnouncementBean announcementBean;
	
//	@DateTimeFormat(pattern ="yyyy/MM/dd HH:mm:ss")
//	@Temporal(TemporalType.TIMESTAMP)
//	@Column(name="added", columnDefinition = "datetime")
//	private Date added;
	
	public Discount() {
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	
	
	public Integer getInitialQuantity() {
		return initialQuantity;
	}

	public void setInitialQuantity(Integer initialQuantity) {
		this.initialQuantity = initialQuantity;
	}

	public Integer getCurrentQuantity() {
		return currentQuantity;
	}

	public void setCurrentQuantity(Integer currentQuantity) {
		this.currentQuantity = currentQuantity;
	}

	public Set<MemberDiscountDetailBean> getMemberDiscountDetailBeanSet() {
		return memberDiscountDetailBeanSet;
	}

	public void setMemberDiscountDetailBeanSet(Set<MemberDiscountDetailBean> memberDiscountDetailBeanSet) {
		this.memberDiscountDetailBeanSet = memberDiscountDetailBeanSet;
	}
	
	public AnnouncementBean getAnnouncementBean() {
		return announcementBean;
	}

	public void setAnnouncementBean(AnnouncementBean announcementBean) {
		this.announcementBean = announcementBean;
	}

	@Override
	public String toString() {
		return "Discount [id=" + id + ", name=" + name + ", description=" + description + ", conditionCategory="
				+ conditionCategory + ", conditionPrice=" + conditionPrice + ", discountCategory=" + discountCategory
				+ ", discountPercent=" + discountPercent + ", discountAmount=" + discountAmount + ", startDate="
				+ startDate + ", endDate=" + endDate + "]";
	}

}

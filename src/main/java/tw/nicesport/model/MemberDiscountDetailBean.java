package tw.nicesport.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name="MemberDiscountDetail")
@JsonIdentityInfo( // 轉 JSON 時, A 中可以有 B, 但此 B 中不能再有 A 的設定
	    generator = ObjectIdGenerators.PropertyGenerator.class, 
	    property = "id", // 這邊要跟 java bean 的主鍵屬性一樣
	    scope = Integer.class
	)
public class MemberDiscountDetailBean {

	// 資料庫欄位
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name = "createdAt")
	private String createdAt;
	
	@Column(name = "modifiedAt")
	private String modifiedAt;
	
	// 關聯 table
	@ManyToOne(cascade = {CascadeType.PERSIST,
			              CascadeType.DETACH,
			              CascadeType.MERGE,
			              CascadeType.REFRESH})
	@JoinColumn(name="member_id")
	private Member member;
	
	@ManyToOne(cascade = {CascadeType.PERSIST,
                          CascadeType.DETACH,
                          CascadeType.MERGE,
                          CascadeType.REFRESH})
	@JoinColumn(name="discount_id")
	private Discount discount;
	


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Discount getDiscount() {
		return discount;
	}

	public void setDiscount(Discount discount) {
		this.discount = discount;
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

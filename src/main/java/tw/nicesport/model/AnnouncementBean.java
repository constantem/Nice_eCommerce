package tw.nicesport.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name="Announcement")
@JsonIdentityInfo( // 轉 JSON 時, A 中可以有 B, 但此 B 中不能再有 A 的設定
    generator = ObjectIdGenerators.PropertyGenerator.class, 
    property = "id", // 這邊要跟 java bean 的主鍵屬性一樣
    scope = Integer.class
)
public class AnnouncementBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="announcement_id")
	private Integer id;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "description")
	private String description;
	
	@Column(name="eventPicture")
	private byte[] eventPicture;
	
	@Transient
	private String eventPictureBase64; // bytes 轉 String 前端才認得, 此屬性不跟資料庫連動
	
	@Column(name = "createdAt")
	private String createdAt;
	
	@Column(name = "modifiedAt")
	private String modifiedAt;
	
	@Transient
	private Integer discountId;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="discount_id")
	private Discount discount;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public byte[] getEventPicture() {
		return eventPicture;
	}

	public void setEventPicture(byte[] eventPicture) {
		this.eventPicture = eventPicture;
	}

	public String getEventPictureBase64() {
		return eventPictureBase64;
	}

	public void setEventPictureBase64(String eventPictureBase64) {
		this.eventPictureBase64 = eventPictureBase64;
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

	public Discount getDiscount() {
		return discount;
	}

	public void setDiscount(Discount discount) {
		this.discount = discount;
	}

	public Integer getDiscountId() {
		return discountId;
	}

	public void setDiscountId(Integer discountId) {
		this.discountId = discountId;
	}
	
	
}

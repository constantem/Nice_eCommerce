package tw.nicesport.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashSet;
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
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;

import org.hibernate.annotations.NaturalId;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;

@Entity @Table(name="Course")
@JsonIdentityInfo(
    generator = ObjectIdGenerators.PropertyGenerator.class, 
    property = "id", 
    scope = Integer.class
)
public class Course {
	
	///////////
	// field //
	///////////
	
	// 主鍵
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	// 其他欄位
	
	@Column(name="courseName")
	@NotBlank(message="不可空白")
	private String courseName;
	
	@Column(name="courseDescription")
	private String courseDescription;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd") // spring mvc 前端給後端, 後端的 LocalDate 變數若要接到, 要加, 不然接不到, 會是 null
	@JsonFormat(pattern = "yyyy-MM-dd") // 前端 Stringify 要求的 String 格式(type="date")
	@JsonSerialize(using = LocalDateSerializer.class) // 讓 ObjectMapper (不論是自己 new 還是 ResponseBody 背後做) 可以將 LocalDate 轉 String
	@Column(name="courseStartDate")
	private LocalDate courseStartDate;
	
	@Column(name="courseClassAmount")
	private Integer courseClassAmount;
	
	@Column(name="coursePeriod")
	private String coursePeriod;
	
	@Column(name="coursePrice")
	private Integer coursePrice;
	
	@Column(name="courseStatus")
	private Boolean courseStatus;
	
	@Column(name="remainingPlaces")
	private Integer remainingPlaces;
	
	@Column(name="picture")
	private byte[] picture;
	
	@Transient
	private String pictureBase64;
	
	@Column(name="createdAt", insertable = false, updatable = false) // 靠資料庫的 DEFAULT GETDATE() 來塞值
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonSerialize(using = LocalDateTimeSerializer.class) // 讓 ObjectMapper (不論是自己 new 還是 ResponseBody 背後做) 可以將 LocalDate 轉 String
	private LocalDateTime createdAt;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonSerialize(using = LocalDateTimeSerializer.class)
	@Column(name="modifiedAt")
	private LocalDateTime modifiedAt;
	
	@PreUpdate // 用 SQL UPDATE 用 PrePersist 無效
	void preUpate() {
		if(this.id != null) {
			modifiedAt = LocalDateTime.now();
		}
	}
	
	// 外來鍵
	
	@Transient // 前端用
	private Integer coachId;
	
	@Transient // 前端用
	private String roomNo;
	
	// associated entity
	
	@ManyToOne(
		cascade= {
			CascadeType.PERSIST,
			CascadeType.DETACH,
			CascadeType.MERGE,
			CascadeType.REFRESH
		}
	)
	@JoinColumn(name="coach_id") // 以下面的 PK 來填上面的 FK
	private Coach coach;
	
	@ManyToOne(
		cascade= {
			CascadeType.PERSIST,
			CascadeType.DETACH,
			CascadeType.MERGE,
			CascadeType.REFRESH
		}
	)
	@JoinColumn(name="roomNo") // 以下面的 PK 來填上面的 FK
	private Room room;
	
	@OneToMany(
		mappedBy="course",
		cascade= {
			CascadeType.PERSIST,
			CascadeType.DETACH,
			CascadeType.MERGE,
			CascadeType.REFRESH,
			CascadeType.REMOVE // 測試刪 Course 一起刪 Booking
		}
	) // 不以上面的 PK 為了去關聯下面的 FK (但沒辦法填 PK)而去建 link table
//	@JsonIgnore // OneToMany 必加, 或加 EAGER, 不然 courses 為 null, 轉 Json 出錯
	private Set<CourseBooking> courseBookingSet = new HashSet<>();

	///////////
	// 建構子 //
	///////////
	
	public Course() {
	}

	///////////////////
	// getter,setter //
	///////////////////
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseDescription() {
		return courseDescription;
	}

	public void setCourseDescription(String courseDescription) {
		this.courseDescription = courseDescription;
	}

	public LocalDate getCourseStartDate() {
		return courseStartDate;
	}

	public void setCourseStartDate(LocalDate courseStartDate) {
		this.courseStartDate = courseStartDate;
	}

	public Integer getCourseClassAmount() {
		return courseClassAmount;
	}

	public void setCourseClassAmount(Integer courseClassAmount) {
		this.courseClassAmount = courseClassAmount;
	}

	public String getCoursePeriod() {
		return coursePeriod;
	}

	public void setCoursePeriod(String coursePeriod) {
		this.coursePeriod = coursePeriod;
	}

	public Integer getCoursePrice() {
		return coursePrice;
	}

	public void setCoursePrice(Integer coursePrice) {
		this.coursePrice = coursePrice;
	}

	public Boolean isCourseStatus() {
		return courseStatus;
	}

	public void setCourseStatus(Boolean courseStatus) {
		this.courseStatus = courseStatus;
	}

	public Boolean getCourseStatus() {
		return courseStatus;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}
	
	public String getPictureBase64() {
		return pictureBase64;
	}

	public void setPictureBase64(String pictureBase64) {
		this.pictureBase64 = pictureBase64;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getModifiedAt() {
		return modifiedAt;
	}

	public void setModifiedAt(LocalDateTime modifiedAt) {
		this.modifiedAt = modifiedAt;
	}

	public Integer getRemainingPlaces() {
		return remainingPlaces;
	}

	public void setRemainingPlaces(Integer remainingPlaces) {
		this.remainingPlaces = remainingPlaces;
	}

	// 外來鍵的 getter, setter
	
	public Integer getCoachId() {
		return coachId;
	}

	public void setCoachId(Integer coachId) {
		this.coachId = coachId;
	}

	public String getRoomNo() {
		return roomNo;
	}
	
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	
	// associated entity 的 getter, setter
	
	public Coach getCoach() {
		return coach;
	}
	
	public void setCoach(Coach coach) {
		this.coach = coach;
	}
	
	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public Set<CourseBooking> getCourseBookingSet() {
		return courseBookingSet;
	}

	public void setCourseBookingSet(Set<CourseBooking> courseBookingSet) {
		this.courseBookingSet = courseBookingSet;
	}

	// toString, 不可雙向(被 referenced 那方不可 access 外鍵那方)
	@Override
	public String toString() {
		return "Course [id=" + id + ", courseName=" + courseName + ", courseStartDate=" + courseStartDate
				+ ", courseClassAmount=" + courseClassAmount + ", coursePeriod=" + coursePeriod + ", coursePrice="
				+ coursePrice + ", createdAt=" + createdAt + ", modifiedAt=" + modifiedAt + ", coachId=" + coachId
				+ ", roomNo=" + roomNo + ", coach=" + coach + ", room=" + room + "]";
	}

}

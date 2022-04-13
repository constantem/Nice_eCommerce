package tw.nicesport.model;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;

@Entity @Table
public class Course {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column
	private Integer course_id;
	
	@Column
	@NotBlank(message="不可空白")
	private String courseName;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd") // 前端給後端, 後端的 LocalDate 變數若要接到, 要加, 不然接不到, 會是 null
//	@JsonFormat(pattern = "yyyy/MM/dd") 
	@JsonFormat(pattern = "yyyy-MM-dd") // 前端 Stringify 要求的格式
	@JsonSerialize(using = LocalDateSerializer.class) // 讓 ObjectMapper (不論是自己 new 還是 ResponseBody 背後做) 可以將 LocalDate 轉 String
//	@JsonDeserialize(using = LocalDateDeserializer.class) // 測試中
	@Column
	private LocalDate courseStartDate;
	
	@Column
	private Integer courseClassAmount;
	
	@Column
	private String coursePeriod;
	
	@Column 
	@Transient // FK 不做對應
	private Integer coach_id;
	
	@Column 
	@Transient // FK 不做對應
	private String roomNo;
	
	@Column
	private Integer coursePrice;
	
//	@DateTimeFormat(pattern ="yyyy/MM/dd")
	@Column(insertable = false, updatable = false) // 靠資料庫的 DEFAULT GETDATE() 來塞值
	private LocalDate createdAt;
	
//	@DateTimeFormat(pattern ="yyyy/MM/dd")
	@Column
	private LocalDate modifiedAt;
	
	@PrePersist
	void preUpate() {
		if(course_id != null) {
			modifiedAt = LocalDate.now();
		}
	}
	
	// 以上為欄位, 以下為其他 entity
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="coach_id") // 以下面的 PK 來填上面的 FK
	private Coach coach;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="roomNo") // 以下面的 PK 來填上面的 FK
	private Room room;
	
	@OneToMany(mappedBy="course") // 不以上面的 PK 為了去關聯下面的 FK (但沒辦法填 PK)而去建 link table
	@JsonIgnore // OneToMany 必加, 或加 EAGER, 不然 courses 為 null, 轉 Json 出錯
	private Set<CourseBooking> courseBookingSet = new HashSet<>();

	// 建構子
	
	public Course() {
	}

	// getter, setter
	
	public Integer getCourse_id() {
		return course_id;
	}

	public void setCourse_id(Integer course_id) {
		this.course_id = course_id;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
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

	public Integer getCoach_id() {
		return coach_id;
	}

	public void setCoach_id(Integer coach_id) {
		this.coach_id = coach_id;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public Integer getCoursePrice() {
		return coursePrice;
	}

	public void setCoursePrice(Integer coursePrice) {
		this.coursePrice = coursePrice;
	}

	public LocalDate getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDate createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDate getModifiedAt() {
		return modifiedAt;
	}

	public void setModifiedAt(LocalDate modifiedAt) {
		this.modifiedAt = modifiedAt;
	}

	// 對側 entity 的 getter, setter
	
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

}

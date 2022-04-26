package tw.nicesport.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;

@Entity @Table
@JsonIdentityInfo(
    generator = ObjectIdGenerators.PropertyGenerator.class, 
    property = "id", 
    scope = Integer.class
)
public class CourseBooking {

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name="bookingStatus")
	private String bookingStatus;
	
	@Column(name="createdAt", insertable = false, updatable = false)
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonSerialize(using = LocalDateTimeSerializer.class) // 讓 ObjectMapper (不論是自己 new 還是 ResponseBody 背後做) 可以將 LocalDate 轉 String
	private LocalDateTime createdAt;
	
	@Column(name="modifiedAt")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonSerialize(using = LocalDateTimeSerializer.class) // 讓 ObjectMapper (不論是自己 new 還是 ResponseBody 背後做) 可以將 LocalDate 轉 String
	private LocalDateTime modifiedAt;

	// 以上為欄位, 以下為其他 entity
	
	@ManyToOne 
	@JoinColumn(name="member_id") // 以下面的 PK 來填上面的 FK
	private Member member;
	
	@ManyToOne 
	@JoinColumn(name="course_id") // 以下面的 PK 來填上面的 FK
	private Course course;

	// 建構子
	
	public CourseBooking() {
	}

	// getter, setter
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBookingStatus() {
		return bookingStatus;
	}

	public void setBookingStatus(String bookingStatus) {
		this.bookingStatus = bookingStatus;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
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

	// 對側 entity 的 getter, setter
	
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}
	
	
	
}

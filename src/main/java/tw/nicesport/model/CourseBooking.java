package tw.nicesport.model;

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

@Entity @Table
@Component
public class CourseBooking {

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column
	private Integer courseBooking_id;
	
	@Column @Transient // FK 不做對應
	private Integer member_id;
	
	@Column @Transient // FK 不做對應
	private Integer course_id;
	
	@Column @Transient
	private String createdAt;
	
	@Column
	private String modifiedAt;

	// 以上為欄位, 以下為其他 entity
	
	@ManyToOne @JoinColumn(name="member_id") // 以下面的 PK 來填上面的 FK
	private Member member;
	
	@ManyToOne @JoinColumn(name="course_id") // 以下面的 PK 來填上面的 FK
	private Course course;

	// 建構子
	
	public CourseBooking() {
	}

	// getter, setter
	
	public Integer getCourseBooking_id() {
		return courseBooking_id;
	}

	public void setCourseBooking_id(Integer courseBooking_id) {
		this.courseBooking_id = courseBooking_id;
	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	public Integer getCourse_id() {
		return course_id;
	}

	public void setCourse_id(Integer course_id) {
		this.course_id = course_id;
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

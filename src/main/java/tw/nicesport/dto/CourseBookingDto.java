package tw.nicesport.dto;

import java.time.LocalDateTime;

import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


public class CourseBookingDto {
	private Integer id;
	private Integer memberId;
	private String memberFullName;
	private Integer courseId;
	private String courseName;
	private String courseDescription;
	private String coursePictureBase64;
	private Integer coursePrice;
	private String bookingStatus;
	private String paymentStatus;
	@DateTimeFormat(pattern = "yyyy-MM-dd") // spring mvc 前端給後端, 後端的 LocalDate 變數若要接到, 要加, 不然接不到, 會是 null
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonSerialize(using = LocalDateTimeSerializer.class) // 讓 ObjectMapper (不論是自己 new 還是 ResponseBody 背後做) 可以將 LocalDate 轉 String
	private LocalDateTime createdAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd") // spring mvc 前端給後端, 後端的 LocalDate 變數若要接到, 要加, 不然接不到, 會是 null
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@JsonSerialize(using = LocalDateTimeSerializer.class) // 讓 ObjectMapper (不論是自己 new 還是 ResponseBody 背後做) 可以將 LocalDate 轉 String
	private LocalDateTime modifiedAt;
	
	public CourseBookingDto() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getMemberFullName() {
		return memberFullName;
	}
	public void setMemberFullName(String memberFullName) {
		this.memberFullName = memberFullName;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
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
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public String getCoursePictureBase64() {
		return coursePictureBase64;
	}
	public void setCoursePictureBase64(String coursePictureBase64) {
		this.coursePictureBase64 = coursePictureBase64;
	}
	public Integer getCoursePrice() {
		return coursePrice;
	}
	public void setCoursePrice(Integer coursePrice) {
		this.coursePrice = coursePrice;
	}
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	
}

package tw.nicesport.dto;

import java.time.LocalDate;

import javax.persistence.Column;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;

public class CourseDto {
	private Integer courseId;
	private String courseName;
	private String coursePictureBase64;
	private Integer coachId;
	private String coachFullName;
	private String coachProfileBase64;
	private String roomNo;
	private String roomName;
	private String courseDescription;
	@DateTimeFormat(pattern = "yyyy-MM-dd") // spring mvc 前端給後端, 後端的 LocalDate 變數若要接到, 要加, 不然接不到, 會是 null
	@JsonFormat(pattern = "yyyy-MM-dd") // 前端 Stringify 要求的 String 格式(type="date")
	@JsonSerialize(using = LocalDateSerializer.class) // 讓 ObjectMapper (不論是自己 new 還是 ResponseBody 背後做) 可以將 LocalDate 轉 String
	private LocalDate courseStartDate;
	private Integer courseClassAmount;
	private String coursePeriod;
	private Integer coursePrice;
	
	public CourseDto() {
	}
	
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public Integer getCoachId() {
		return coachId;
	}
	public void setCoachId(Integer coachId) {
		this.coachId = coachId;
	}
	public String getCoachFullName() {
		return coachFullName;
	}
	public void setCoachFullName(String coachFullName) {
		this.coachFullName = coachFullName;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
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
	public String getCoursePictureBase64() {
		return coursePictureBase64;
	}
	public void setCoursePictureBase64(String coursePictureBase64) {
		this.coursePictureBase64 = coursePictureBase64;
	}
	public String getCoachProfileBase64() {
		return coachProfileBase64;
	}
	public void setCoachProfileBase64(String coachProfileBase64) {
		this.coachProfileBase64 = coachProfileBase64;
	}
}

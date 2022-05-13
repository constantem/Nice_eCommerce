package tw.nicesport.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.nicesport.dto.CourseBookingDto;
import tw.nicesport.model.Course;
import tw.nicesport.model.CourseBooking;
import tw.nicesport.model.Member;
import tw.nicesport.service.CourseBookingService;
import tw.nicesport.service.CourseService;
import tw.nicesport.service.MemberService;

@RestController // REST 寫法
public class CourseBookingApi {

	@Autowired
	private CourseBookingService courseBookingService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CourseService courseService;
	
	// 新增
	@PostMapping("/api/courseBooking")
	public void insert(CourseBooking courseBooking) {
		courseBookingService.insert(courseBooking);
	}	

	// 修改一筆
	@PutMapping("/api/courseBooking")
	public String update(@ModelAttribute("courseBooking") CourseBooking courseBooking) {
		courseBookingService.update(courseBooking);
		return "修改成功";
	}
	
	// 查詢一筆
	@GetMapping("/api/courseBooking/{id}")
	public CourseBooking findOne(@PathVariable("id") Integer id) {
		return courseBookingService.findById(id);
	}
	
	// 後台查詢全部
	@GetMapping("/api/courseBooking")
	public List<CourseBookingDto> findAll() {
		List<CourseBooking> courseBookingList = courseBookingService.findAll();
		List<CourseBookingDto> courseBookingDtoList = new ArrayList<>();
		for(CourseBooking courseBooking : courseBookingList) {
			CourseBookingDto courseBookingDto = new CourseBookingDto();
			courseBookingDto.setId(courseBooking.getId());
			courseBookingDto.setMemberId(courseBooking.getMember().getMemberid());
			courseBookingDto.setMemberFullName(
				Objects.toString( courseBooking.getMember().getLastname() , "")
				+
				Objects.toString( courseBooking.getMember().getFirstname() , "")
			);
			courseBookingDto.setCourseName(courseBooking.getCourse().getCourseName());
			courseBookingDto.setBookingStatus(courseBooking.getBookingStatus());
			courseBookingDto.setPaymentStatus(courseBooking.getPaymentStatus());
			courseBookingDto.setCreatedAt(courseBooking.getCreatedAt());
			courseBookingDto.setModifiedAt(courseBooking.getModifiedAt());
			courseBookingDtoList.add(courseBookingDto);
		}
		
		return courseBookingDtoList;
	}
	
	// 前台查詢全部 by member id
	@GetMapping("/api/courseBooking/member/{id}")
	public List<CourseBookingDto> findByMemberId(@PathVariable("id") Integer memberId) {

		// find member by id
		Member member = memberService.findById(memberId);
		
		// find courseBooking list by that member
		List<CourseBooking> courseBookingList = member.getCourseBookingList();
		
		// set courseBookingDto list
		List<CourseBookingDto> courseBookingDtoList = new ArrayList<>();
		for(CourseBooking courseBooking : courseBookingList) {
			CourseBookingDto courseBookingDto = new CourseBookingDto();
			// courseBooking id
			courseBookingDto.setId(courseBooking.getId());
			// member id
			courseBookingDto.setMemberId(courseBooking.getMember().getMemberid());
			// member full name
			courseBookingDto.setMemberFullName(
				Objects.toString( courseBooking.getMember().getLastname() , "")
				+
				Objects.toString( courseBooking.getMember().getFirstname() , "")
			);
			// course id
			courseBookingDto.setCourseId(courseBooking.getCourse().getId());
			// course name
			courseBookingDto.setCourseName(courseBooking.getCourse().getCourseName());
			// course price
			courseBookingDto.setCoursePrice(courseBooking.getCourse().getCoursePrice());
			// booking status
			courseBookingDto.setBookingStatus(courseBooking.getBookingStatus());
			// payment status
			courseBookingDto.setPaymentStatus(courseBooking.getPaymentStatus());
			// creation time
			courseBookingDto.setCreatedAt(courseBooking.getCreatedAt());
			// modification time
			courseBookingDto.setModifiedAt(courseBooking.getModifiedAt());
			///////////////轉base64開始///////////////
			if(courseBooking.getCourse().getPicture()==null) { // null 不轉
				courseBooking.getCourse().setPictureBase64(null);
			} else { // 有圖才轉
				courseBookingDto.setCoursePictureBase64(
					Base64.getEncoder().encodeToString( courseBooking.getCourse().getPicture() ) 
				);
			}
			///////////////轉base64結束/////////////////
			// 結束 setting
			courseBookingDtoList.add(courseBookingDto);
		}
		
		return courseBookingDtoList;
	}
	
	// 刪除一筆
	@DeleteMapping("/api/courseBooking/{id}")
	public void deleteOne(@PathVariable("id") Integer id) {
		courseBookingService.deleteOne(id);
	}
	
	// 查詢會員及課程, 包在 dto
	@GetMapping("/api/courseBooking/member/{memberId}/course/{courseId}")
	public CourseBookingDto memberAndCourse(
			@PathVariable("memberId") Integer memberId,
			@PathVariable("courseId") Integer courseId) {

		// find member by id
		Member member = memberService.findById(memberId);
		
		// find member by id
		Course course = courseService.queryById(courseId);
		
		// set courseBookingDto list
		CourseBookingDto courseBookingDto = new CourseBookingDto();
		// member id
		courseBookingDto.setMemberId(member.getMemberid());
		// member full name
		courseBookingDto.setMemberFullName(
			Objects.toString( member.getLastname() , "")
			+
			Objects.toString( member.getFirstname() , "")
		);
		// course id
		courseBookingDto.setCourseId(courseId);
		// course name
		courseBookingDto.setCourseName(course.getCourseName());
		// coach name
		courseBookingDto.setCoachFullName(
			Objects.toString( course.getCoach().getLastName() , "")
			+
			Objects.toString( course.getCoach().getFirstName() , "")
		);
		// course price
		courseBookingDto.setCoursePrice(course.getCoursePrice());

		return courseBookingDto;
	}
	
}

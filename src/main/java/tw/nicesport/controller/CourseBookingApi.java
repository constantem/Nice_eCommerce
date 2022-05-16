package tw.nicesport.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

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
	
	// 查詢會員及課程, 包在 dto, 準備新增課程訂單(新增寫在 pageController)
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
	
	// 新增
	@PostMapping("/api/courseBooking")
	public Integer insert(
				@ModelAttribute CourseBookingDto courseBookingDto
			) {
		
		System.out.println("============courseBookingDto============");
		System.out.println(courseBookingDto);
		
		Member member = memberService.findById( courseBookingDto.getMemberId() );
		Course course = courseService.queryById( courseBookingDto.getCourseId() );
		
		// 更新剩餘名額
		course.setRemainingPlaces( course.getRemainingPlaces()-1 );
		Course courseUpdated = courseService.update(course);
		
		// 製作新資料
		CourseBooking courseBooking = new CourseBooking();
		courseBooking.setMember(member);
		member.getCourseBookingList().add(courseBooking);
		courseBooking.setCourse(courseUpdated);
		courseUpdated.getCourseBookingSet().add(courseBooking);
		
		// 後端初始化
		courseBooking.setBookingStatus("有效");
		courseBooking.setPaymentStatus("未付款");
		
		// 新增此新資料
		CourseBooking courseBookingInserted = courseBookingService.insert(courseBooking);
		return courseBookingInserted.getId();
	}	

	// 修改一筆
	@PutMapping("/api/courseBooking")
	public String update(@ModelAttribute("courseBooking") CourseBooking courseBooking) {
		courseBookingService.update(courseBooking);
		return "修改成功";
	}
	
	// 查詢一筆
	@GetMapping("/api/courseBooking/{id}")
	public CourseBookingDto findOne(@PathVariable("id") Integer id) {
		CourseBooking courseBooking = courseBookingService.findById(id);
		return pojoToDto(courseBooking, new CourseBookingDto());
	}
	
	// 後台查詢全部
	@GetMapping("/api/courseBooking")
	public List<CourseBookingDto> findAll() {
		List<CourseBooking> courseBookingList = courseBookingService.findAll();
		
		// 轉 courseBookingDto list
		return courseBookingList.stream().map( 
					courseBooking -> pojoToDto( courseBooking, new CourseBookingDto() ) 
				).collect( Collectors.toList() );
	}
	
	// 前台查詢全部 by member id
	@GetMapping("/api/courseBooking/member/{id}")
	public List<CourseBookingDto> findByMemberId(@PathVariable("id") Integer memberId) {

		// find member by id
		Member member = memberService.findById(memberId);
		
		// find courseBooking list by that member
		List<CourseBooking> courseBookingList = member.getCourseBookingList();
		
		// 轉 courseBookingDto list
		return courseBookingList.stream().map( 
				courseBooking -> pojoToDto( courseBooking, new CourseBookingDto() ) 
			).collect( Collectors.toList() );
	}
	
	// 刪除一筆
	@DeleteMapping("/api/courseBooking/{id}")
	public void deleteOne(@PathVariable("id") Integer id) {
		courseBookingService.deleteOne(id);
	}
		
	// private 處理方法
	private CourseBookingDto pojoToDto(CourseBooking pojo, CourseBookingDto dto) {
		// courseBooking id
		dto.setId(pojo.getId());
		// member id
		dto.setMemberId(pojo.getMember().getMemberid());
		// member full name
		dto.setMemberFullName(
			Objects.toString( pojo.getMember().getLastname() , "")
			+
			Objects.toString( pojo.getMember().getFirstname() , "")
		);
		// course id
		dto.setCourseId(pojo.getCourse().getId());
		// course name
		dto.setCourseName(pojo.getCourse().getCourseName());
		// coach full name
		dto.setCoachFullName(
				Objects.toString( pojo.getCourse().getCoach().getLastName() , "")
				+
				Objects.toString( pojo.getCourse().getCoach().getFirstName() , "")
			);
		// course price
		dto.setCoursePrice(pojo.getCourse().getCoursePrice());
		// booking status
		dto.setBookingStatus(pojo.getBookingStatus());
		// payment status
		dto.setPaymentStatus(pojo.getPaymentStatus());
		// creation time
		dto.setCreatedAt(pojo.getCreatedAt());
		// modification time
		dto.setModifiedAt(pojo.getModifiedAt());
		///////////////轉base64開始///////////////
		if(pojo.getCourse().getPicture()==null) { // null 不轉
			pojo.getCourse().setPictureBase64(null);
		} else { // 有圖才轉
			dto.setCoursePictureBase64(
				Base64.getEncoder().encodeToString( pojo.getCourse().getPicture() ) 
			);
		}
		///////////////轉base64結束/////////////////
		return dto;
	}
	
}

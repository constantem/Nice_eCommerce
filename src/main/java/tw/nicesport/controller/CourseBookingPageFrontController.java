package tw.nicesport.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tw.nicesport.dto.CourseBookingDto;
import tw.nicesport.model.Course;
import tw.nicesport.model.CourseBooking;
import tw.nicesport.model.Member;
import tw.nicesport.service.CourseBookingService;
import tw.nicesport.service.CourseService;
import tw.nicesport.service.MemberService;

@Controller
public class CourseBookingPageFrontController {

	@Autowired
	private CourseBookingService courseBookingService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CourseService courseService;
	
	// 前台我的課程: 終點站
	@RequestMapping("/user/myCoursebookingByMemberId")
	public String showALLCoursesByMemberIdInFront(
			@RequestParam("id") Integer memberId,
			Model model) {	
		
		model.addAttribute("memberId", memberId);

		return "course/list-all-mycoursebooking-front";
	}
	
	// 前台報名課程表單: 終點站
	@RequestMapping("/user/courseBookingFormByMemberId")
	public String showCourseBookingFormByMemberIdInFront(
			@RequestParam("memberId") Integer memberId,
			@RequestParam("courseId") Integer courseId,
			RedirectAttributes redirectAttributes,
			Model model) {	
		
		// 若此會員已有報名過此課程, 則回到課程頁面
		List<Integer> courseListRegisteredByGivenMember = courseBookingService.findCourseListRegisteredByGivenMember(memberId);
		if(courseListRegisteredByGivenMember.contains(courseId)) {
			Map<String,String> map = new HashMap<>();
			String courseName = courseService.queryById(courseId).getCourseName();
			redirectAttributes.addAttribute("bookingErrorCourseName", courseName);
			return "redirect:/info/course/list/all";
		}
		
		model.addAttribute("memberId", memberId);
		model.addAttribute("courseId", courseId);

		return "course/form-coursebooking";
	}
	
	// 前台報名送出
	@RequestMapping("/courseBooking/confirm")
	public String addCourseBookingByMemberId(
			@ModelAttribute("courseBookingDtoForm") CourseBookingDto courseBookingDto,
			Model model
		) {
		System.out.println(courseBookingDto.getMemberId());
		System.out.println(courseBookingDto.getCourseId());
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
		
		// 將新增的 id 傳給下一動
		model.addAttribute( "courseBookingId", courseBookingInserted.getId() );
		return "course/success-coursebooking";
	}
	
}

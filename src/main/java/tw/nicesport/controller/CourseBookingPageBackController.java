package tw.nicesport.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.nicesport.dto.CourseBookingDto;
import tw.nicesport.model.Course;
import tw.nicesport.model.CourseBooking;
import tw.nicesport.model.Member;
import tw.nicesport.service.CourseBookingService;
import tw.nicesport.service.CourseService;
import tw.nicesport.service.MemberService;

@Controller
public class CourseBookingPageBackController {

	@Autowired
	private CourseBookingService courseBookingService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CourseService courseService;
	
	// 後台課程訂單列表
	@RequestMapping("/staff/courseBooking/listPage")
	public String toCourseBookingView(Model model) {
		model.addAttribute("activeLi", "courseBookingList");
		return "course/list-all-coursebooking-back";
	}
	
}

package tw.nicesport.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.nicesport.model.Course;
import tw.nicesport.model.Member;
import tw.nicesport.service.CourseService;
import tw.nicesport.service.LoginService;

@Controller
public class CourseFrontController {

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private CourseService courseService;
	
	// 前台轉跳 course detail
	@RequestMapping("/course/detail/{id}")
	public String detailCourseJsp(
		@PathVariable(name="id") Integer id,
		Model model) {		
		model.addAttribute("id",id);
		return "course/detail-a-course-front";
	}
	
	// 前台 course detail (用 Ajax) 
	@RequestMapping("/course/detail/data")
	@ResponseBody
	public Course detailCourseJson(@RequestBody Integer id) {		
		return courseService.queryById(id);
	}
	
	// 前端全部課程
	@RequestMapping("/info/course/list/all") // 要被 security filter chain 所攔截的 url 才能拿到 pricipal
	public String showAllCoursesInFront(
			Principal principal,
			Model model,
			@RequestParam(name="bookingErrorCourseName", required=false) String bookingErrorCourseName) throws Exception {	
		
		// 帶錯誤訊息過去
		if(bookingErrorCourseName!=null) {
			model.addAttribute("bookingErrorCourseName", bookingErrorCourseName);
		}
		
		System.out.println("principal");
		System.out.println(principal);
		
		// 若登入
		if(principal!=null) {
			String username = principal.getName();
			Member member = loginService.findMemberByUsername(username);
			System.out.println(member.getMemberid());
			model.addAttribute( "memberId", member.getMemberid() );
		}
		
		return "course/list-all-courses-front";
	}
}

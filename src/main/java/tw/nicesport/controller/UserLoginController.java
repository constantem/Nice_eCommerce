package tw.nicesport.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.nicesport.dto.UsernameAndPasswordWrapper;
import tw.nicesport.model.Course;
import tw.nicesport.model.CourseBooking;
import tw.nicesport.model.Employee;
import tw.nicesport.model.Member;
import tw.nicesport.service.LoginService;
import tw.nicesport.service.MemberService;

@Controller
public class UserLoginController {

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private MemberService memberService;
		
	//// 會員登入 ////
	
	@RequestMapping(value = "/userLogin", method = RequestMethod.GET) // GET /login/member
	public String showMemberLoginForm(Model model) {
		model.addAttribute("usernameAndPasswordWrapper", new UsernameAndPasswordWrapper());
		return "login/member-login-form";
	}
	
	@RequestMapping("/userLoginAutoInputFirst")
	@ResponseBody
	public Member memberLoginAutoInput() {
		System.out.println(loginService.findFirstMember());
		return loginService.findFirstMember();
	}
	
    @RequestMapping("/user/memberUsername")
    @ResponseBody
    public String currentUserName(Principal principal) {
        return principal.getName();
    }
    
    @RequestMapping("/user/role")
    @ResponseBody
    public Set<String> currentRole(Authentication authentication) {
    	Set<String> roles = authentication.getAuthorities().stream()
       	     .map(r -> r.getAuthority()).collect(Collectors.toSet());
        return roles;
    }
	
	// 前端會員中心個人資料: 中間站
	@RequestMapping("/user/myProfile")
	public String showMyProfile(Principal principal, Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/myProfileByMemberId?id="+member.getMemberid();
	}
	
	// 前端我的訂單: 中間站
	@RequestMapping("/user/myOrders")
	public String showMyOrders(Principal principal, Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/myOrdersByMemberId?id="+member.getMemberid();
	}
	
	// 前端我的收藏: 中間站
	@RequestMapping("/user/myWishList")
	public String showMyWishList(Principal principal, Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/myWishListByMemberId?id="+member.getMemberid();
	}
	
	// 前端我的優惠券: 中間站
	@RequestMapping("/user/myDiscounts")
	public String showMyDiscounts(Principal principal, Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/myDiscountsByMemberId?id="+member.getMemberid();
	}
	
	// 前端我的課程: 中間站
	@RequestMapping("/user/myCourses")
	public String showMyCourse(Principal principal, Authentication authentication, Model model) throws Exception {
		String username = principal.getName();
		System.out.println("登入帳號===================>"+username);
    	Set<String> roles = authentication.getAuthorities().stream()
          	     .map(r -> r.getAuthority()).collect(Collectors.toSet());
    	for(String role: roles) {
    		System.out.println("登入腳色====================>"+role);
    	}
    	
		Member member = loginService.findMemberByUsername(username);
		System.out.println("登入會員編號===================>"+member.getMemberid());
		return "forward:/user/myCoursesByMemberId?id="+member.getMemberid();
	}
	
	// 前端我的課程: 終點站
	@RequestMapping("/user/myCoursesByMemberId")
	public String showALLCoursesByMemberIdInFront(
			@RequestParam("id") Integer memberId,
			Model model) {	
		
		try {
			Member member = memberService.findById(memberId);
			Set<CourseBooking> courseBookingSet = member.getCourseBookingSet();
			List<Course> courses = new ArrayList<>();
			for(CourseBooking courseBooking : courseBookingSet) {
				courses.add(courseBooking.getCourse());
			}
			model.addAttribute("courses", courses);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "course/list-all-courses-front";
	}
}

package tw.nicesport.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ResolvableType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
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
	
	// 第三方登入所使用 dao
	@Autowired
	private ClientRegistrationRepository clientRegistrationRepository;

	// 第三方登入的 url 的前半段
	private static String authorizationRequestBaseUri = "oauth2/authorization";

	// 多個第三方, 其存登入用 url 的 map
	Map<String, String> oauthAuthUrls = new HashMap<>();
	
	//// 會員登入 ////
	
	@RequestMapping(value = "/userLogin", method = RequestMethod.GET) // GET /userLogin
	public String showMemberLoginForm(Model model) {
		
		// form:form 使用
		model.addAttribute("usernameAndPasswordWrapper", new UsernameAndPasswordWrapper());
		
		// 取得所有第三方登入驗證用的 url
	    Iterable<ClientRegistration> clientRegistrations = null;
	    ResolvableType type = ResolvableType.forInstance(clientRegistrationRepository).as(Iterable.class);
	    if (	type != ResolvableType.NONE 
	    		&& 
	    		ClientRegistration.class.isAssignableFrom(type.resolveGenerics()[0])
	    	) {
	        clientRegistrations = (Iterable<ClientRegistration>) clientRegistrationRepository;
	    }

	    for(ClientRegistration registration : clientRegistrations) {
	    	oauthAuthUrls.put(
	    		registration.getClientName(), 
	    		authorizationRequestBaseUri + "/" + registration.getRegistrationId()
	    	);
	    	System.out.println("key");
	    	System.out.println(registration.getClientName());
	    	System.out.println("value");
	    	System.out.println(authorizationRequestBaseUri + "/" + registration.getRegistrationId());
	    }
	    clientRegistrations.forEach(registration -> 
	      oauthAuthUrls.put(registration.getClientName(), 
	      authorizationRequestBaseUri + "/" + registration.getRegistrationId()));
	    
	    model.addAttribute("oauthAuthUrls", oauthAuthUrls);
		
		return "login/member-login-form";
	}
	
	@RequestMapping("/userLoginAutoInput")
	@ResponseBody
	public UsernameAndPasswordWrapper memberLoginAutoInput(@RequestParam("number") int numOneBased) {
		Member member = loginService.findOneOfTop3Member(numOneBased-1);
		UsernameAndPasswordWrapper userAndPass = new UsernameAndPasswordWrapper();
		userAndPass.setUsername( member.getUsername() );
		userAndPass.setPassword( member.getPassword() );
		return userAndPass;
	}
	
    @RequestMapping("/user/memberUsername")
    @ResponseBody
    public String currentUserName(Principal principal) {
        return principal.getName();
    }
    
    @RequestMapping("/user/memberId")
    @ResponseBody
    public Integer currentMemberId(Principal principal) throws Exception {
        String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return member.getMemberid();
    }
    
    @RequestMapping("/user/role")
    @ResponseBody
    public Set<String> currentRole(Authentication authentication) {
    	if(authentication!=null) {
    		// DB 紀錄的 roles (但如果是第三方登入的 roles 要加工)
        	Set<String> roles = authentication.getAuthorities().stream()
              	     .map(r -> r.getAuthority()).collect(Collectors.toSet());
           	System.out.println("後端 user roles=======>|"+roles);
           	
           	// 加工第三方登入的 roles, 只取出其中的 ROLE_ 開頭的字
           	Set<String> rolesTemp = new HashSet<>();
           	if(roles.contains("SCOPE_openid")) {
           		for(String role : roles) {
           			if(role.startsWith("ROLE")) {
           				rolesTemp.add(role);
           			}
           			roles = rolesTemp;
           		}
           	}
            return roles;
    	} else {
    		System.out.println("後端 user roles=======>|null");
    		return new HashSet<>();
    	}

    }
	
	// 前端我的訂單: 中間站
    // 
//    @RequestMapping("/user/memberUsername2")
//    @ResponseBody
//    public String currentUserName2(Principal principal) {
//    	String username = principal.getName();
//    	Member member = loginService.findMemberByUsername(username);
//        return ;
//    }
    
	// 前端我的購物車: 中間站
	@RequestMapping("/user/myCart")
	public String showMyCart(Principal principal, Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/myCartByMemberId?memberid="+member.getMemberid();
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
	
	// 前端我的優惠券: 中間站
	@RequestMapping("/user/myDiscount")
	public String showMyDiscount(Principal principal, Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/myDiscountByMemberId?memberId="+member.getMemberid();
	}
	

	// 前端商品加入追蹤清單: 中間站
	@RequestMapping("/user/addMyWishList")
	public String addMyWishList(
			@RequestParam("productId") Integer productId,
			Principal principal, 
			Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/addMyWishListByMemberId?memberId="+member.getMemberid()+"&productId="+productId;
	}
	
	// 前端商城頁加入追蹤清單: 中間站
	@RequestMapping("/user/addMyWishListFromShop")
	public String addMyWishListFromShop(
			@RequestParam("productId") Integer productId,
			Principal principal, 
			Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/addMyWishListFromShopByMemberId?memberId="+member.getMemberid()+"&productId="+productId;
	}
	
	// 前端商城頁移除追蹤清單: 中間站
		@RequestMapping("/user/deleteMyWishListFromShop")
		public String deleteMyWishListFromShop(
				@RequestParam("productId") Integer productId,
				Principal principal, 
				Model model) throws Exception {
			String username = principal.getName();
			Member member = loginService.findMemberByUsername(username);
			return "forward:/user/deleteWishFromShop?memberId="+member.getMemberid()+"&productId="+productId;
		}
	
	
	// 前端商城加入購物車: 中間站 
	@RequestMapping("/user/addMyCartFromShop")
	public String addMyCartFromShop(
			@RequestParam("productId") Integer productId,
			Principal principal, 
			Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/addMyCartFromShopByMemberId?memberid="+member.getMemberid()+"&productid="+productId+"&quantity=1";
	}
	
	// 前端商品頁加入購物車: 中間站 
	@RequestMapping("/user/addMyCartFromSingleProduct")
	public String addMyCartFromSingleProduct(
			
			@RequestParam("quantity") Integer quantity,
			Principal principal, 
			Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/addMyCartFromSingleProductByMemberId?memberid="
				+member.getMemberid()+"&quantity="+quantity;
	}
	
	// 前端我的收藏: 中間站
	@RequestMapping("/user/myWishList")
	public String showMyWishList(Principal principal, Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/myWishListByMemberId?id="+member.getMemberid();
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
	
	//// 前往後台並會員登出 ////
	@RequestMapping("/user/logoutAndToBackstage")
	public String logoutAndToBackstage(HttpServletRequest request) throws ServletException {
		request.logout();
		return "redirect:/";
	}
	
	////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////
	////////////                                            ////////////
	////////////                  第三方登入                  ////////////
	////////////                                            ////////////
	/////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////
	

	@RequestMapping(value = "/oauthLogin", method = RequestMethod.GET) // GET /oauthLogin
	public String getLoginPage(Model model) {
		
		// 取得所有第三方登入驗證用的 url
	    Iterable<ClientRegistration> clientRegistrations = null;
	    ResolvableType type = ResolvableType.forInstance(clientRegistrationRepository).as(Iterable.class);
	    if (	type != ResolvableType.NONE 
	    		&& 
	    		ClientRegistration.class.isAssignableFrom(type.resolveGenerics()[0])
	    	) {
	        clientRegistrations = (Iterable<ClientRegistration>) clientRegistrationRepository;
	    }

	    for(ClientRegistration registration : clientRegistrations) {
	    	oauthAuthUrls.put(
	    		registration.getClientName(), 
	    		authorizationRequestBaseUri + "/" + registration.getRegistrationId()
	    	);
	    	System.out.println("key");
	    	System.out.println(registration.getClientName());
	    	System.out.println("value");
	    	System.out.println(authorizationRequestBaseUri + "/" + registration.getRegistrationId());
	    }
	    clientRegistrations.forEach(registration -> 
	      oauthAuthUrls.put(registration.getClientName(), 
	      authorizationRequestBaseUri + "/" + registration.getRegistrationId()));
	    
	    model.addAttribute("oauthAuthUrls", oauthAuthUrls);
		return "login/member-login-form";
	}
}

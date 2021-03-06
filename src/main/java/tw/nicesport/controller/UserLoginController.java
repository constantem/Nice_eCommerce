package tw.nicesport.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tw.nicesport.dto.CourseBookingDto;
import tw.nicesport.dto.UsernameAndPasswordWrapper;
import tw.nicesport.model.Course;
import tw.nicesport.model.CourseBooking;
import tw.nicesport.model.Employee;
import tw.nicesport.model.Member;
import tw.nicesport.security.AuthenticationFacade;
import tw.nicesport.service.LoginService;
import tw.nicesport.service.MemberService;

@Controller
public class UserLoginController {

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AuthenticationFacade authFacade;
	
	private static Logger logger = LoggerFactory.getLogger(UserLoginController.class);
	
	// ???????????????????????? dao
	@Autowired
	private ClientRegistrationRepository clientRegistrationRepository;

	// ?????????????????? url ????????????
	private static String authorizationRequestBaseUri = "oauth2/authorization";

	// ???????????????, ??????????????? url ??? map
	Map<String, String> oauthAuthUrls = new HashMap<>();
	
	//// ???????????? ////
	
	@RequestMapping(value = "/userLogin", method = RequestMethod.GET) // GET /userLogin
	public String showMemberLoginForm(Model model) {
		
		// form:form ??????
		model.addAttribute("usernameAndPasswordWrapper", new UsernameAndPasswordWrapper());
		
		// ??????????????????????????????????????? url
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
    
    // ???????????????????????????, ??????????????????
//    @RequestMapping("/user/memberId")
//    @ResponseBody
//    public Integer currentMemberId(Principal principal) throws Exception {
//        String username = principal.getName();
//		Member member = loginService.findMemberByUsername(username);
//		return member.getMemberid();
//    }
    
    @RequestMapping("/user/role")
    @ResponseBody
    public Set<String> currentRole() {
    	
    	// ????????????
    	if(!authFacade.isAuthenticated()) {
    		logger.info("???????????? ajax ?????? role, ?????????????????????");
    		return new HashSet<>();
    	}
    	
    	// ?????????
    	logger.info("???????????? ajax ?????? role, ????????? roles: |" + authFacade.getRoles() + "|");
    	return authFacade.getRoles();
    }
    
    @RequestMapping("/user/memberId")
    @ResponseBody
    public Integer currentMemberId() {
    	// ????????????, ?????? null
    	// ??? USER ??????, ?????? member id
    	// ??? google ??????, ?????? member id
    	// ??? EMPLOYEE ??????, ?????? null
    	// ??? ADMIN ??????, ?????? null
    	return authFacade.getMemberId();
    }
	
	// ?????????????????????: ?????????
	@RequestMapping("/user/myCart")
	public String showMyCart(Principal principal, Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/myCartByMemberId?memberid="+member.getMemberid();
	}
    
	// ??????????????????????????????: ?????????
	@RequestMapping("/user/myProfile")
	public String showMyProfile(Principal principal, Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/myProfileByMemberId?id="+member.getMemberid();
	}
	
	// ??????????????????: ?????????
	@RequestMapping("/user/myOrders")
	public String showMyOrders(Principal principal, Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/myOrdersByMemberId?id="+member.getMemberid();
	}
	
	// ?????????????????????: ?????????
	@RequestMapping("/user/myDiscount")
	public String showMyDiscount(Principal principal, Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/myDiscountByMemberId?memberId="+member.getMemberid();
	}
	
	// ???????????????????????????????????????: ?????????
	@RequestMapping("/user/addToMyDiscount")
	public String showMyDiscount(
			Principal principal, 
			Model model,
			@RequestParam("discountId") Integer discountId) throws Exception {
		
		// ?????????????????????????????????????????? member id
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/addToMyDiscountByMemberId?memberId="+member.getMemberid()+"&discountId="+discountId;
	}
	

	// ??????????????????????????????: ?????????
	@RequestMapping("/user/addMyWishList")
	public String addMyWishList(
			@RequestParam("productId") Integer productId,
			Principal principal, 
			Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/addMyWishListByMemberId?memberId="+member.getMemberid()+"&productId="+productId;
	}
	
	// ?????????????????????????????????: ?????????
	@RequestMapping("/user/addMyWishListFromShop")
	public String addMyWishListFromShop(
			@RequestParam("productId") Integer productId,
			Principal principal, 
			Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/addMyWishListFromShopByMemberId?memberId="+member.getMemberid()+"&productId="+productId;
	}
	
	// ?????????????????????????????????: ?????????
		@RequestMapping("/user/deleteMyWishListFromShop")
		public String deleteMyWishListFromShop(
				@RequestParam("productId") Integer productId,
				Principal principal, 
				Model model) throws Exception {
			String username = principal.getName();
			Member member = loginService.findMemberByUsername(username);
			return "forward:/user/deleteWishFromShop?memberId="+member.getMemberid()+"&productId="+productId;
		}
	
	
	// ???????????????????????????: ????????? 
	@RequestMapping("/user/addMyCartFromShop")
	public String addMyCartFromShop(
			@RequestParam("productId") Integer productId,
			Principal principal, 
			Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/addMyCartFromShopByMemberId?memberid="+member.getMemberid()+"&productid="+productId+"&quantity=1";
	}
	
	// ??????????????????????????????: ????????? 
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
	
	// ??????????????????: ?????????
	@RequestMapping("/user/myWishList")
	public String showMyWishList(Principal principal, Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/myWishListByMemberId?id="+member.getMemberid();
	}
	
	// ??????????????????: ?????????
	@RequestMapping("/user/myCoursebooking")
	public String showMyCourse(
			Principal principal, 
			Authentication authentication, 
			Model model) throws Exception {
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/myCoursebookingByMemberId?id="+member.getMemberid();
	}
	
	// ????????????????????????: ?????????
	@RequestMapping("/user/courseBookingForm")
	public String showCourseBookingForm(
			@RequestParam("courseId") Integer courseId,
			Principal principal, 
			Authentication authentication, 
			Model model) throws Exception {
		// find member id
		String username = principal.getName();
		Member member = loginService.findMemberByUsername(username);
		return "forward:/user/courseBookingFormByMemberId?memberId="+member.getMemberid()+"&courseId="+courseId;
	}
	
	//// ??????????????????????????? ////
	@RequestMapping("/userLogoutAndToBackstage")
	public String logoutAndToBackstage(
			RedirectAttributes redirectAttributes, 
			@RequestParam(name="hasError",required = false) String hasError,
			HttpServletRequest request) throws ServletException {
		
		// ?????????????????????????????????
		redirectAttributes.addAttribute("hasError", hasError);
		
		request.logout();
		return "redirect:/backstage";
	}
	
	////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////
	////////////                                            ////////////
	////////////                  ???????????????                  ////////////
	////////////                                            ////////////
	/////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////
	

	@RequestMapping(value = "/oauthLogin", method = RequestMethod.GET) // GET /oauthLogin
	public String getLoginPage(Model model) {
		
		// ??????????????????????????????????????? url
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

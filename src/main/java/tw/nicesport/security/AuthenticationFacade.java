package tw.nicesport.security;

import java.util.HashSet;
import java.util.Set;
import java.util.logging.Logger;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import tw.nicesport.model.Member;
import tw.nicesport.service.LoginService;
import tw.nicesport.service.MemberService;

@Component
public class AuthenticationFacade {
		
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private LoginService loginService;
	
	// 必不為 null, 就算沒登入也是有 authentication (cf. controller 方法的參數的 authentication 則會為 null)
	// 若沒登入, 回傳 runtime class 為 AnonymousAuthenticationToken
	// 若 user 登入, 回傳 runtime class 為 UsernamePasswordAuthenticationToken
	// 若 google 登入, 回傳 runtime class 為 OAuth2AuthenticationToken
	// 若 EMPLOYEE 登入, 回傳 runtime class 為 UsernamePasswordAuthenticationToken
	// 若 ADMIN 登入, 回傳 runtime class 為 UsernamePasswordAuthenticationToken
	public Authentication getAuthentication() {
		return SecurityContextHolder.getContext().getAuthentication();
	}
	
	// 若沒登入, 回傳 false
	// 若 USER 登入, 回傳 true
	// 若 google 登入, 回傳 true
	// 若 EMPLOYEE 登入, 回傳 true
	// 若 ADMIN 登入, 回傳 true
	public boolean isAuthenticated() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		return !(authentication instanceof AnonymousAuthenticationToken);
	}
	
	// 慎用, 無法判斷是否登入中, 要搭配 isAuthenticated()
	// 若沒登入, 回傳 "anonymousUser"
	// 若 USER 登入, 回傳資料庫所儲存的 username
	// 若 google 登入, 回傳 OpenID Connect attribute sub, 同時也是資料庫的 username
	// 若 EMPLOYEE 登入, 回傳資料庫所儲存的 employee_id
	// 若 ADMIN 登入, 回傳資料庫所儲存的 employee_id
	public String getUsername() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();		
		return authentication.getName();
	}
	
	// 慎用, 無法判斷是否登入中, 要搭配 isAuthenticated()
	// 若沒登入, 回傳 HashSet [ROLE_ANONYMOUS]
	// 若 USER 登入, 回傳 HashSet [ROLE_USER]
	// 若 google 登入, 回傳 HashSet [ROLE_USER]
	// 若 EMPLOYEE 登入, 回傳 HashSet [ROLE_EMPLOYEE]
	// 若 ADMIN 登入, 回傳 HashSet [ROLE_ADMIN, ROLE_EMPLOYEE]
	public Set<String> getRoles() {
		// 帳密及第三方拿 authorities, 原為 UnmodifiableRandomAccessList, 轉 HashSet
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();	
    	Set<String> roles = authentication.getAuthorities().stream()
         	     .map( entry -> entry.getAuthority() )
         	     .collect(Collectors.toSet());
    	
    	// 第三方的 authorities 只取 ROLE 開頭的 entry
    	// 原本為 [SCOPE_openid, ROLE_USER, SCOPE_https://www.googleapis.com/auth/userinfo.profile, SCOPE_https://www.googleapis.com/auth/userinfo.email]
    	roles = roles.stream()
    			.filter( entry -> entry.startsWith("ROLE_") )
    			.collect(Collectors.toSet());
    	
		return roles;
	}
	
	// 若沒登入, 回傳 null
	// 若 USER 登入, 回傳 member
	// 若 google 登入, 回傳 member
	// 若 EMPLOYEE 登入, 回傳 null
	// 若 ADMIN 登入, 回傳 null
	public Member getMember() {
		if(!getRoles().contains("ROLE_USER")) {
			return null;
		}
		
		try {
			return loginService.findMemberByUsername(getUsername());
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 若沒登入, 回傳 null
	// 若 USER 登入, 回傳 member id
	// 若 google 登入, 回傳 member id
	// 若 EMPLOYEE 登入, 回傳 null
	// 若 ADMIN 登入, 回傳 null
	public Integer getMemberId() {
		Member member = getMember();
		if(member==null) {
			return null;
		}
		return member.getMemberid();
	}

}

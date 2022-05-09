package tw.nicesport.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tw.nicesport.model.Employee;
import tw.nicesport.model.EmployeeRepository;
import tw.nicesport.model.LoginERepository;
import tw.nicesport.model.Member;
import tw.nicesport.model.MemberRepository;

@Service("adminDetailsService")
public class AdminDetailsService implements UserDetailsService {

	@Autowired
	private LoginERepository employeeDao;
	
	@Override
	public UserDetails loadUserByUsername(String idString) throws UsernameNotFoundException {

		// 前端登入表單輸入的 String, 轉 entity Employee 的主鍵的型別 Integer
		int idInt = Integer.parseInt(idString);
		Integer idInteger;
		if(!String.valueOf(idInt).equals(idString)) {
			idInteger = null;
		} else {
			idInteger = Integer.valueOf(idInt);
		}
		
		// 先查出該 entity
		Employee employee = employeeDao.findById(idInteger).orElseThrow(
			()->new UsernameNotFoundException("id not found"));
		 
		// 剔除 Employee 有特別的 UserDetailsService 來處理
		if(!employee.getPermission().equals("ADMIN")) {
			throw new UsernameNotFoundException("ROLE_EMPLOYEE found instead of ROLE_ADMIN");
		}
		
		// 取出等效 spring security username 的欄位
		String usernameForAuth = Integer.toString(employee.getEmployee_id());
		
		// 取出等效 spring security password 的欄位
		String passwordForAuth = employee.getPassword();
		
		// 取出等效 spring security authorities 的欄位
		Collection<? extends GrantedAuthority> authoritiesForAuth;
		if(employee.getPermission() == null) {
			authoritiesForAuth = AuthorityUtils.createAuthorityList("ROLE_EMPLOYEE");
		} else if (employee.getPermission().contains("ADMIN")) {
			authoritiesForAuth = AuthorityUtils.createAuthorityList("ROLE_ADMIN", "ROLE_EMPLOYEE");
		} else {
			authoritiesForAuth = AuthorityUtils.createAuthorityList("ROLE_EMPLOYEE");
		}
		
		User user = new User(
			usernameForAuth,
			passwordForAuth,
			authoritiesForAuth
		);
		
		return user;
	}

}

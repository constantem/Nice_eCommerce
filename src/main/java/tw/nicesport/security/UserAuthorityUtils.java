package tw.nicesport.security;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;

import tw.nicesport.model.Employee;

public class UserAuthorityUtils {
	
	//利用Spring提供的AuthorityUtils中createAuthorityList將該群組加入相關roles
	//以便用一個List變數就儲存所有roles
	private static final List<GrantedAuthority> EMPLOYEE_ROLES = 
			AuthorityUtils.createAuthorityList("ROLE_ADMIN", "ROLE_EMPLOYEE");
	
	private static final List<GrantedAuthority> ADMIN_ROLES = 
			AuthorityUtils.createAuthorityList("ROLE_ADMIN");

	public static Collection<? extends GrantedAuthority> createAuthorities(Employee employee) {
		String role = employee.getPermission();
		if (role.contains("ADMIN")) { //權限中含有admin，即有管理者之role
			return ADMIN_ROLES;
		}
		return EMPLOYEE_ROLES; //否則則為一般使用者
	}
}

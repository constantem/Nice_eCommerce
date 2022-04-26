package tw.nicesport.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
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

@Service("employeeDetailsService")
public class EmployeeDetailsService implements UserDetailsService {

	@Autowired
	private LoginERepository employeeDao;
	
	@Override
	public UserDetails loadUserByUsername(String idString) throws UsernameNotFoundException {

		int idInt = Integer.parseInt(idString);
		Integer idInteger;
		if(!String.valueOf(idInt).equals(idString)) {
			idInteger = null;
		} else {
			idInteger = Integer.valueOf(idInt);
		}
		
		Employee employee = employeeDao.findById(idInteger).orElseThrow(
			()->new UsernameNotFoundException("id not found"));
		 
		User user = new User(
			Integer.toString(employee.getEmployee_id()),
			employee.getPassword(),
			UserAuthorityUtils.createAuthorities(employee)
		);
		
		return user;
	}

}

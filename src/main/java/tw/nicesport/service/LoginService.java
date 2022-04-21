package tw.nicesport.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.nicesport.model.Employee;
import tw.nicesport.model.EmployeeRepository;
import tw.nicesport.model.LoginERepository;
import tw.nicesport.model.Member;
import tw.nicesport.model.MemberRepository;

@Service
@Transactional
public class LoginService {

	@Autowired
	private MemberRepository memberDao;
	
	@Autowired
	private LoginERepository employeeDao;
	
	public boolean authenticateMember(String username, String password) {
		Member member = memberDao.findByUsername(username);
		
		if( 
			member!=null // 有此帳號
			&& member.getPassword().equals(password) // 密碼正確
		) { 
			return true;
		}
		
		return false;
	}
	
	public boolean authenticateEmployee(Integer id, String password) {
		Optional<Employee> empOption = employeeDao.findById(id);
		
		if(
			empOption.isPresent() // 有此員工編號
			&& empOption.get().getPassword().equals(password) // 密碼正確
		) { 
			return true;
		}
		
		return false;
	}
}

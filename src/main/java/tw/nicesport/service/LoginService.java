package tw.nicesport.service;

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
	
	public boolean checkMemberLogin(Member memberInput) {
		Member memberResult = memberDao.findByUsernameAndPassword(memberInput.getUsername(),memberInput.getPassword());
		
		if(memberResult!=null) { 
			return true;
		}
		
		return false;
	}
	
	public boolean checkEmployeeLogin(Employee employeeInput) {
		Employee employeeResult = employeeDao.findByIdAndPassword(employeeInput.getEmployee_id(),employeeInput.getPassword());
		
		if(employeeResult!=null) { 
			return true;
		}
		
		return false;
	}
}

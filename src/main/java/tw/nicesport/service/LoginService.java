package tw.nicesport.service;

import java.util.List;
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
	
//	// ROLE_USER 一鍵輸入用
//	public Member findFirstMember() {
//		return memberDao.findFirstByOrderByMemberid();
//	}
	
	// ROLE_USER 一鍵輸入用
	public Member findOneOfTop3Member(int numZeroBased) {
		return memberDao.findTop3ByOrderByMemberid().get(numZeroBased);
	}
	
	// ROLE_EMPLOYEE 一鍵輸入用
	public Employee findOneOfTop3RoleEmployee(int numZeroBased) {
		List<Employee> employees = employeeDao.findTop3ByOrderByIdWhereRoleEmployee();
		
		if(employees==null) {
			return null;
		}
		
		if( employees.size()<(numZeroBased+1) ) {
			return null;
		}
		
		return employees.get(numZeroBased);
	}
	
	// ROLE_ADMIN 一鍵輸入用
	public Employee findAdmin() {
		return employeeDao.findAdmin();
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
	
	public Member findMemberByUsername(String username) throws Exception {
		Optional<Member> memberOpt = memberDao.findByUsername(username);
		System.out.println("findMemberByUsername 所使用的 username");
		System.out.println(username);
		Member member = memberOpt.orElseThrow(
			() -> new Exception("查無 Member===>|"+username+"|的資訊.")
        );
		return member;
	}
	
	public Member findMemberByEmail(String email) throws Exception {
		Member member = memberDao.findByEmail(email).orElseThrow(
			() -> new Exception("查無 Member===>|"+email+"|的資訊.")
        );
		return member;
	}
	
	public Employee findEmployeeByUsername(Integer id) throws Exception {
		Optional<Employee> employeeOpt = employeeDao.findById(id);
		Employee employee = employeeOpt.orElseThrow(
			() -> new Exception("查無 Employee===>|"+id+"|的資訊.")
        );
		return employee;
	}
}

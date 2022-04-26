package tw.nicesport.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface LoginERepository extends JpaRepository<Employee, Integer> {
	
	public Employee findFirstByOrderByEmployeeid(); // 會員登入驗證也會用
	
//	public Optional<Employee> findByEmployeeid(Integer id);
}

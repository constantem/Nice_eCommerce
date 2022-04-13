package tw.nicesport.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface LoginERepository extends JpaRepository<Employee, Integer> {

	@Query("from Employee e where e.employeeid = :id and e.password = :password")
	public Employee findByIdAndPassword(@Param("id") Integer id, @Param("password") String password);

}

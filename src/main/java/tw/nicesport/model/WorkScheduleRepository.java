package tw.nicesport.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkScheduleRepository extends JpaRepository<WorkSchedule, Integer> {
	 	
//	@Query(value = "select * from workSchedule where workDate　like %:workDate",nativeQuery = true)
//	List<WorkSchedule> checkDateAll(String workdate);
		
	//@Query(value = "select * from workSchedule where year=:year and month=:month",nativeQuery=true)
	@Query(value = "SELECT WS.*  FROM workSchedule WS ,  Employee EMP WHERE WS.employee_id = EMP.employee_id and  year=:year and month=:month",nativeQuery=true)
	List<WorkSchedule> findDate(@Param ("year")String year, @Param ("month")String month);
	
	@Transactional
	@Modifying
	@Query(value = "delete workSchedule where year=:year and month=:month",nativeQuery=true)
	void delDate(@Param ("year")String year, @Param ("month")String month);
	

}

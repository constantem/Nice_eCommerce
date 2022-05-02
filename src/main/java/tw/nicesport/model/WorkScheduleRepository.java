package tw.nicesport.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkScheduleRepository extends JpaRepository<WorkSchedule, Integer> {
	 	
//	@Query(value = "select * from workSchedule where workDate　like %:workDate",nativeQuery = true)
//	List<WorkSchedule> checkDateAll(String workdate);
}

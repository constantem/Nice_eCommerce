package tw.nicesport.model;



import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PunchCardSystemRepository extends JpaRepository<PunchCardSystem, Integer> {
	 
//	@Query(value = "select CONVERT (nvarchar , year) year ,CONVERT (nvarchar , month) month,CONVERT (nvarchar , day) day, CONVERT (nvarchar , employee_id) employee_id ,(select schedule from scheduleType st where st.work_id=ws.work_id) as work_name  from workSchedule ws  where year=:year and month=:month and day=:day and employee_id=:employee_id ",nativeQuery=true)
//	List<WorkSchedule> findPunchCard(
//			@Param ("year")String year,
//			@Param ("month")String month,
//			@Param ("day")String day,
//			@Param ("employee_id")String employeeid
//			
//			);
	
	@Query(value = "select * from PunchCardSystem where (( DATEPART(year, punchIn)  = :year and DATEPART(month, punchIn)  = :month) and DATEPART(day, punchIn)  =:day or (DATEPART(year, punchOut) = :year and DATEPART(month, punchOut) = :month and DATEPART(day, punchOut)  =:day )) and employee_id=:employeeid",nativeQuery=true)
	List<PunchCardSystem> confirmPunch(
			@Param ("year")String year,
			@Param ("month")String month,
			@Param ("day")String day,
			@Param ("employeeid")String employeeid
			);
	
	//@Query(value = "select *,CONVERT(varchar, punchIn, 111) work_date from PunchCardSystem where ( DATEPART(year, punchIn)  = :year and DATEPART(month, punchIn)  = :month) or (DATEPART(year, punchOut) = :year and DATEPART(month, punchOut) = :month)",nativeQuery=true)
//	@Query(value = "select *  , CASE  WHEN  punchStatus = 'in' then '上班'\r\n"
//			+ "	 WHEN  punchStatus = 'out' then'下班' END AS punchStatusName from PunchCardSystem where (( DATEPART(year, punchIn)  = :year and DATEPART(month, punchIn)  = :month) or (DATEPART(year, punchOut) = :year and DATEPART(month, punchOut) = :month)) and employee_id=:employeeid ",nativeQuery=true)
	@Query(value = "select *  , CASE  WHEN  punchStatus = 'in' then '上班'\r\n"
			+ "	 WHEN  punchStatus = 'out' then'下班' END from PunchCardSystem where (( DATEPART(year, punchIn)  = :year and DATEPART(month, punchIn)  = :month) or (DATEPART(year, punchOut) = :year and DATEPART(month, punchOut) = :month)) and employee_id=:employeeid ",nativeQuery=true)
	List<PunchCardSystem> findCard(
			@Param ("year")String year,
			@Param ("month")String month,
			@Param ("employeeid")String employeeid
			);
	
	
	@Transactional
	@Modifying
	@Query(value = "delete PunchCardSystem where punchstatus=:punchstatus and  employee_id=:employee_id  and ( DATEDIFF(day,punchIn,GETDATE()) = 0 or  DATEDIFF(day,punchOut,GETDATE()) = 0  )",nativeQuery=true)
	void delPunchCard(
			@Param ("punchstatus")String punchstatus,
			@Param ("employee_id")String employeeid);
}

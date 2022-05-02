package tw.nicesport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.nicesport.model.WorkSchedule;
import tw.nicesport.model.WorkScheduleRepository;

@Service
public class WorkScheduleService {
	
	@Autowired
	private WorkScheduleRepository WorkScheduleDao;

	public List<WorkSchedule> findAllSchedule(){
		return WorkScheduleDao.findAll();
	}
	
	public void insertSchedule(WorkSchedule workschedule) {
		WorkScheduleDao.save(workschedule);
	}
	
	public List<WorkSchedule> saveSchedule(List<WorkSchedule>workschedule) {
		return WorkScheduleDao.saveAll(workschedule);
	}
}

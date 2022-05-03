package tw.nicesport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.nicesport.model.ScheduleType;
import tw.nicesport.model.ScheduleTypeRepository;
import tw.nicesport.model.WorkSchedule;
import tw.nicesport.model.WorkScheduleRepository;

@Service
public class ScheduleTypeService {
	
	@Autowired
	private ScheduleTypeRepository ScheduleTypeDao;

	public List<ScheduleType> findAllSchedule(){
		return ScheduleTypeDao.findAll();
	}
	
}

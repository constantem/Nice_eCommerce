package tw.nicesport.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.nicesport.model.Coach;
import tw.nicesport.model.CoachRepository;

@Service
@Transactional
public class CoachService {
	
	@Autowired
	private CoachRepository coachDao;
	
	public List<Coach> queryAll() {
		return coachDao.findAll();
	}
	
	public Coach queryById(Integer id) {
		Optional<Coach> result = coachDao.findById(id);
		
		if(result.isEmpty()) {
			return null;
		}
		
		return result.get();
	}
}

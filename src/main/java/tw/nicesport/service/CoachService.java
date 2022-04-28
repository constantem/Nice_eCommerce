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
	
	// 教練新增
	public void insert(Coach coach) {
		coachDao.save(coach);
	}
	
	// 教練更新
	public void update(Coach coach) {
		coachDao.save(coach);
	}
	
	
	public List<Coach> findAll() {
		return coachDao.findAll();
	}
	
	public Coach findById(Integer id) {
		
		Optional<Coach> coachOpt = coachDao.findById(id);
		
		if(coachOpt.isEmpty()) {
			return null;
		}
		
		return coachOpt.get();
	}
	
	// 教練刪除一個
	public void deleteOne(Integer id) {
		coachDao.deleteById(id);
	}
}

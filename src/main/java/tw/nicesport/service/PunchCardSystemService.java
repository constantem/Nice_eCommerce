package tw.nicesport.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import tw.nicesport.model.PunchCardSystem;
import tw.nicesport.model.PunchCardSystemRepository;

@Service
public class PunchCardSystemService {

	@Autowired
	private PunchCardSystemRepository PunchCardSystemDao;

	// save 新增
	public void insertPunchCardSystem(PunchCardSystem punchCardSystem) {
		PunchCardSystemDao.save(punchCardSystem);
	}

	// 查詢ID
	public PunchCardSystem findByPunchCardSystemId(Integer punchCardsystemmid) {
		Optional<PunchCardSystem> option = PunchCardSystemDao.findById(punchCardsystemmid);

		if (option.isPresent()) {
			return option.get();
		}
		return null;
	}

	// 查詢All
	public List<PunchCardSystem> findAllPunchCardSystem() {
		return PunchCardSystemDao.findAll();
	}
//		// 由最新資料在上面
//	public PunchCardSystem getLastest() {
//
//		return PunchCardSystemDao.findFirstByOrderByEmployeeidDesc();
//	}
//	
	
}
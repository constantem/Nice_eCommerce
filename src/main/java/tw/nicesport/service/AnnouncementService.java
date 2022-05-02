package tw.nicesport.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.nicesport.model.AnnouncementBean;
import tw.nicesport.model.AnnouncementRepository;


@Service
@Transactional
public class AnnouncementService {
	@Autowired
	private AnnouncementRepository announcementDao;

	//新增優惠
	public AnnouncementBean insert(AnnouncementBean announcementBean) {
		AnnouncementBean announcementResult = announcementDao.save(announcementBean);
	return announcementResult;
	}
	
	//修改優惠
	public AnnouncementBean update(AnnouncementBean announcementBean) {
		AnnouncementBean announcementResult = announcementDao.save(announcementBean);
	return announcementResult;
	}

	// 查詢ID
	public AnnouncementBean findById(Integer announcement_id) {
	Optional<AnnouncementBean> option = announcementDao.findById(announcement_id);

	if (option.isPresent()) {
		return option.get();
	}
	return null;
	}
	
	//找全部
	public List<AnnouncementBean> findAllAnnouncement(){
		return announcementDao.findAll();
	}
	
	//頁面
	public Page<AnnouncementBean> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 5, Sort.Direction.ASC, "announcement_id");
		
		Page<AnnouncementBean> page = announcementDao.findAll(pgb);
		
		return page;
	}
	
	//找最新訊息
//	public Discount getLastest() {
//		return discountDao.findFirstByOrderByAddedDesc();
//	}
//	
		
	//依ID刪除
	public void deleteById(Integer announcement_id) {
		announcementDao.deleteById(announcement_id);
	}
	
	// 分頁功能
	public Page<AnnouncementBean> findByPage(Integer pageNumber , Integer size) {
		Pageable pgb = PageRequest.of(pageNumber, size, Sort.Direction.ASC, "announcement_id");
		Page<AnnouncementBean> page = announcementDao.findAll(pgb);
		return page;
	}

	public List<AnnouncementBean> queryAll() {
		return announcementDao.findAll();
	}
}

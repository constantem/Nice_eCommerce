package tw.nicesport.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.nicesport.model.SubCategoryBean;
import tw.nicesport.model.SubCategoryDao;

@Service
@Transactional
public class SubCategoryService {
	
	@Autowired
	private SubCategoryDao subDao;
	
	public List<SubCategoryBean> queryAll(){
		return subDao.queryAll();
	}
	
	public SubCategoryBean insertSubCategory(SubCategoryBean subBean) {
		return subDao.insertSubCategory(subBean);
	}

}

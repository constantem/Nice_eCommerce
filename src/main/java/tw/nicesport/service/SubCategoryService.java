package tw.nicesport.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.nicesport.model.SubCategoryBean;
import tw.nicesport.model.SubCategoryDao;
import tw.nicesport.model.SubCategoryRepository;

@Service
@Transactional
public class SubCategoryService {
	
	@Autowired
	private SubCategoryDao subDao;
	
	@Autowired
	private SubCategoryRepository subRepoImpl;
	
	public List<SubCategoryBean> queryAll(){
		return subRepoImpl.findAll();
	}
	
	public SubCategoryBean insertSubCategory(SubCategoryBean subBean) {
		return subRepoImpl.save(subBean);
	}

}

package tw.nicesport.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.nicesport.model.CategoryBean;
import tw.nicesport.model.CategoryDao;
import tw.nicesport.model.CategoryRepository;

@Service
@Transactional
public class CategoryService {

	@Autowired
	private CategoryDao catDao;
	
	@Autowired
	private CategoryRepository catRepoImpl;

	public List<CategoryBean> queryAll() {
		return catRepoImpl.findAll();
	}

	public CategoryBean insertCategory(CategoryBean catBean) {
		return catRepoImpl.save(catBean);
	}
}

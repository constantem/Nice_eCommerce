package tw.nicesport.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.nicesport.model.CategoryBean;
import tw.nicesport.model.CategoryDao;

@Service
@Transactional
public class CategoryService {

	@Autowired
	private CategoryDao catDao;

	public List<CategoryBean> queryAll() {
		return catDao.queryAll();
	}

	public CategoryBean insertCategory(CategoryBean catBean) {
		return catDao.insertCategory(catBean);
	}
}

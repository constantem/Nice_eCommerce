package tw.nicesport.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.nicesport.model.ProductCommentBean;
import tw.nicesport.model.ProductCommentRepository;

@Service
@Transactional
public class ProductCommentService {

	@Autowired
	private ProductCommentRepository pcrRes;
	
	public void insertComment(ProductCommentBean pcrBean) {
		pcrRes.save(pcrBean);
	}
	
	public List<ProductCommentBean> findTopByOrderByIdDesc(){
		return pcrRes.findTop3ByOrderByIdDesc();
	}
}

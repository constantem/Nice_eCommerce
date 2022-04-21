package tw.nicesport.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductCommentRepository extends JpaRepository<ProductCommentBean, Integer> {

	List<ProductCommentBean> findTop3ByOrderByIdDesc();
	
}

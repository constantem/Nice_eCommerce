package tw.nicesport.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CartRepository extends JpaRepository<CartBean, Integer>{
	
//	List<CartBean> findByMemberId(Integer memberId);
	 
}


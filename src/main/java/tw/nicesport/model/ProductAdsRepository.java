package tw.nicesport.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductAdsRepository extends JpaRepository<ProductAdsBean, Integer> {
	
	public ProductAdsBean findFirst1ByOrderById();
	
	public ProductAdsBean findFirstByOrderByIdDesc();
}

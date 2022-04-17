package tw.nicesport.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<ProductBean, Integer> {

	List<ProductBean> findByPriceBetween(String startPrice, String endPrice);

	List<ProductBean> findByColor(String color);

	List<ProductBean> findByProductNameLike(String productName);

}

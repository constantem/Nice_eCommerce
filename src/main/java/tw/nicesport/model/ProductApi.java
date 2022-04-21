package tw.nicesport.model;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductApi {
	
	@Autowired
	private ProductRepository pRes;
	
	
	@GetMapping(value = "product/get{product_id}")
	public ProductBean getProductById(@PathVariable Integer product_id) {
		Optional<ProductBean> responseProd = pRes.findById(product_id);
		
		if(responseProd.isPresent()) {
			return responseProd.get();
		}
		return null;
	}
	
	@GetMapping(value = "product/delete{product_id}")
	public ProductBean delProductById(@PathVariable Integer product_id) {
		pRes.deleteById(product_id);
		return null;
	}

}

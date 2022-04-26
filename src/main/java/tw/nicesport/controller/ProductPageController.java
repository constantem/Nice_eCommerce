package tw.nicesport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductPageController {
	
	//改為path
	@GetMapping(path = "/mainpage.controller")
	public String processMainPage() {
		return "/product/MainPage";
	}
	
	@GetMapping(path = "/insertPdpage.controller")
	public String processInsertProductPage() {
		
		return "/product/InsertProduct";
	}
	
	@GetMapping(path = "/oneProductpage.controller")
	public String processindexPage() {
		
		return "/product/OneProduct";
	}
	
	@GetMapping(path = "/ProductFrontpage.controller")
	public String processFrontProductPage() {
		return "/product/shop";
	}
	
	@GetMapping(path = "/singleProductFrontpage.controller")
	public String processFrontSingleProductPage() {
		return "/product/single-product";
	}
	
	
	@GetMapping(path = "/ProductAdsController.controller")
	public String processProductAdsController() {
		return "/product/ProductAdsImg";
	}
	
	@GetMapping(path = "/ProductCartController.controller")
	public String processProductCartController() {
		return "/product/cart";
	}
	
	@GetMapping(path = "/ProductMyFavorController.controller")
	public String processProductMyFavorController() {
		return "/product/myWishList";
	}
	

	

}

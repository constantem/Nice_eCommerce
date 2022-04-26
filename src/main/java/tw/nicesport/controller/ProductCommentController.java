package tw.nicesport.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.nicesport.model.ProductCommentBean;
import tw.nicesport.service.ProductCommentService;

@Controller
public class ProductCommentController {

	@Autowired
	private ProductCommentService pcrService;
	
	@GetMapping("/insertComment")
	public String insertComment(@RequestParam("id") Integer productId, @RequestParam("name") String name,@RequestParam("phone")String phone,
			@RequestParam("email")String email,@RequestParam("productComment")String productComment,@RequestParam("score")String score,@RequestParam("createdAt")String createdAt) {
			
		Date date = new Date();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creDate = sdFormat.format(date);
		
		ProductCommentBean pcrBean = new ProductCommentBean();
		
		pcrBean.setCustomerFullName(name);
		pcrBean.setEmail(email);
		pcrBean.setPhone(phone);
		pcrBean.setProductComment(productComment);
		pcrBean.setProductScore(score);
		pcrBean.setCreatedAt(creDate);
		
		
		pcrService.insertComment(pcrBean);

		
		return "redirect:/getOneProductShop"+Integer.valueOf(productId);
	}
	
	@PostMapping("/findTopCommentById")
	@ResponseBody
	public List<ProductCommentBean> findTop3ById(){
		
		 List<ProductCommentBean> list = pcrService.findTopByOrderByIdDesc();
		
		 return list;
	}
}

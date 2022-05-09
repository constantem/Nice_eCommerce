package tw.nicesport.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.ProductAdsBean;
import tw.nicesport.model.ProductAdsRepository;
import tw.nicesport.model.ProductBean;
import tw.nicesport.service.ProductAdsService;

@Controller
public class ProductAdsController {

	@Autowired
	private ProductAdsService pAdsService;

	@Autowired
	private ProductAdsRepository pAdsRes;
	
	@Autowired
	HttpServletRequest request;

	@PostMapping("/insertProductAds.controller")
	public String insertProductAdsImg(@RequestParam("imgUrl_A") MultipartFile file1,
			@RequestParam("imgUrl_B") MultipartFile file2, @RequestParam("imgUrl_C") MultipartFile file3,
			@RequestParam("imgUrl_D") MultipartFile file4, @RequestParam("createdAt") String createdAt,HttpServletRequest request) {

		Date date = new Date();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creDate = sdFormat.format(date);

		System.out.println("====================>"+file1.isEmpty());
		ProductAdsBean pAdsBean = new ProductAdsBean();
		
		if (file1.isEmpty()) {
			pAdsBean.setImgUrl_A(null);
			pAdsBean.setImgUrl_B(null);
			pAdsBean.setImgUrl_C(null);
			pAdsBean.setImgUrl_D(null);
		} else {
			String fileName1 = file1.getOriginalFilename();
			String fileName2 = file2.getOriginalFilename();
			String fileName3 = file3.getOriginalFilename();
			String fileName4 = file4.getOriginalFilename();

			String suffixName1 = fileName1.substring(fileName1.lastIndexOf(".")); // 後綴名
			String suffixName2 = fileName2.substring(fileName2.lastIndexOf("."));
			String suffixName3 = fileName3.substring(fileName3.lastIndexOf("."));
			String suffixName4 = fileName4.substring(fileName4.lastIndexOf("."));

//			String filePath = "C:\\Nice_eCommerce_FinalProject\\Nice_eCommerce\\src\\main\\webapp\\ProductTempImg\\";
			
			System.out.println("servletContext getRealPath===========>" + request.getServletContext().getRealPath("") + "\\ProductTempImg\\");
			
			String filePath = request.getServletContext().getRealPath("") + "\\ProductTempImg\\";
			
			fileName1 = UUID.randomUUID() + suffixName1;
			fileName2 = UUID.randomUUID() + suffixName2;
			fileName3 = UUID.randomUUID() + suffixName3;
			fileName4 = UUID.randomUUID() + suffixName4;

			File dest1 = new File(filePath + fileName1);
			File dest2 = new File(filePath + fileName2);
			File dest3 = new File(filePath + fileName3);
			File dest4 = new File(filePath + fileName4);

			if (!dest1.getParentFile().exists()) {

				dest1.getParentFile().mkdirs();
				dest2.getParentFile().mkdirs();
				dest3.getParentFile().mkdirs();
				dest4.getParentFile().mkdirs();
			}
			try {
				file1.transferTo(dest1);
				file2.transferTo(dest2);
				file3.transferTo(dest3);
				file4.transferTo(dest4);
			} catch (Exception e) {
				e.printStackTrace();
			}
			pAdsBean.setImgUrl_A(fileName1);
			pAdsBean.setImgUrl_B(fileName2);
			pAdsBean.setImgUrl_C(fileName3);
			pAdsBean.setImgUrl_D(fileName4);

			System.out.println(filePath);
			System.out.println(fileName1);
		}

		pAdsBean.setCreatedAt(creDate);

		pAdsService.insert(pAdsBean);

		System.out.println(file1.getSize());
		System.out.println(file1.getContentType());

		return "/product/ProductAdsImg";
	}

	@GetMapping("/staff/searchProductAds.controller")
	public ModelAndView searchAdsPhoto(ModelAndView mav) {
		List<ProductAdsBean> prodAds = pAdsRes.findAll();

		mav.getModel().put("prodAds", prodAds);
		mav.setViewName("/product/ProductAdsImg");

		return mav;
	}
	
	@PostMapping("/shopCenterProductAds.controller")
	@ResponseBody
	public ProductAdsBean searchAdsPhotoForShop() {
		return  pAdsService.findFirst();
	}
	
	
	@PostMapping(value = "getOneProductAds")	
	@ResponseBody
	public ProductAdsBean getOneProductAdsImg(Model m) {
		
		ProductAdsBean pd = pAdsService.findFirst();

		return pd;
	}
	
	@PostMapping("/editProductAds")
	public ModelAndView editProductAds(ModelAndView mav,@RequestParam("imgFile1") MultipartFile file1,@RequestParam("imgFile2") MultipartFile file2,
			@RequestParam("imgFile3") MultipartFile file3,@RequestParam("imgFile4") MultipartFile file4,@RequestParam("modifiedAt") String modifiedAt,
			@ModelAttribute ProductAdsBean prodAdsBean) throws IOException {
		
		mav.setViewName("/product/ProductAdsImg");	
		
		if(!file1.isEmpty()) {
			String fileName1 = saveFile(file1);
			prodAdsBean.setImgUrl_A(fileName1);
		}
		
		if(!file2.isEmpty()) {
			String fileName2 = saveFile(file2);
			prodAdsBean.setImgUrl_B(fileName2);
		}
		
		if(!file3.isEmpty()) {
			String fileName3 = saveFile(file3);
			prodAdsBean.setImgUrl_C(fileName3);
		}
		
		if(!file4.isEmpty()) {
			String fileName4 = saveFile(file4);
			prodAdsBean.setImgUrl_D(fileName4);
		}
		
		Date date = new Date();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String modDate = sdFormat.format(date);
		prodAdsBean.setModifiedAt(modDate);
		
		pAdsService.update(prodAdsBean);
		
		mav.setViewName("redirect:/staff/searchProductAds.controller");
		
		return mav;
		
	}
	
	private String saveFile(MultipartFile file) {
		
		
		String fileName = file.getOriginalFilename();
		
		String suffixName = fileName.substring(fileName.lastIndexOf(".")); 
		
		String filePath = request.getServletContext().getRealPath("") + "\\ProductTempImg\\";

		System.out.println("new path====================>>>"+request.getServletContext().getRealPath(""));
		
		fileName = UUID.randomUUID() + suffixName;
		
		File dest = new File(filePath + fileName);
		
		if (!dest.getParentFile().exists()) {
			dest.getParentFile().mkdirs();

		}
		try {
			file.transferTo(dest);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fileName;
	}

}

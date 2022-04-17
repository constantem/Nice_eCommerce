package tw.nicesport.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.ProductAdsBean;
import tw.nicesport.model.ProductAdsRepository;
import tw.nicesport.service.ProductAdsService;

@Controller
public class ProductAdsController {

	@Autowired
	private ProductAdsService pAdsService;

	@Autowired
	private ProductAdsRepository pAdsRes;

	@Autowired
	private ProductAdsBean pAdsBean;

	@PostMapping("/insertProductAds.controller")
	public String insertProductAdsImg(@RequestParam("imgUrl_A") MultipartFile file1,
			@RequestParam("imgUrl_B") MultipartFile file2, @RequestParam("imgUrl_C") MultipartFile file3,
			@RequestParam("imgUrl_D") MultipartFile file4, @RequestParam("createdAt") String createdAt) {

		Date date = new Date();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creDate = sdFormat.format(date);

		System.out.println(file1.isEmpty());

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

			String filePath = "C:\\Nice_eCommerce_FinalProject\\Nice_eCommerce\\src\\main\\webapp\\ProductTempImg\\";
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

	@GetMapping("/searchProductAds.controller")
	public ModelAndView searchAdsPhoto(ModelAndView mav) {
		List<ProductAdsBean> prodAds = pAdsRes.findAll();

		mav.getModel().put("prodAds", prodAds);
		mav.setViewName("/product/ProductAdsImg");

		return mav;

	}

}

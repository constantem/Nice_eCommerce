package tw.nicesport.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.CategoryBean;
import tw.nicesport.model.ProductApi;
import tw.nicesport.model.ProductBean;
import tw.nicesport.model.ProductRepository;
import tw.nicesport.service.CategoryService;
import tw.nicesport.service.ProductService;
import tw.nicesport.model.StockBean;
import tw.nicesport.model.StockRepository;
import tw.nicesport.model.SubCategoryBean;
import tw.nicesport.service.StockService;
import tw.nicesport.service.SubCategoryService;

@Controller
public class ProductController {

	@Autowired
	private ProductService pService;

	@Autowired
	private ProductBean prodBean;

	@Autowired
	private StockBean stBean;

	@Autowired
	private SubCategoryBean subBean;
	
	@Autowired
	private CategoryBean catBean;

	@Autowired
	private ProductApi pApi;

	@Autowired
	private ProductRepository pRes;

	@Autowired
	private SubCategoryService subServic;
	
	@Autowired
	private CategoryService catService;


	// insert product  順序固定
	@RequestMapping(path = "/insertProduct.controller", method = RequestMethod.POST)
	public String insertAction(@RequestParam("productName") String productName,
			@RequestParam("supplier") String supplier, @RequestParam("color") String color,
			@RequestParam("size") String size, @RequestParam("weight") String weight, @RequestParam("productDiscription") String productDiscription,
			@RequestParam("price") String price, @RequestParam("createdAt") String createdAt,
			@RequestParam("quantity") Integer quantity, @RequestParam("subcategory_id") Integer subcategory_id,
			@RequestParam("img") MultipartFile file, Model m, HttpServletRequest request)
			throws IOException {

		Date date = new Date();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creDate = sdFormat.format(date);
		
		System.out.println(file.isEmpty());
		if(file.isEmpty()) {
			prodBean.setImg(null);
			prodBean.setImgUrl(null);
		} else {
			prodBean.setImg(file.getBytes());
			String fileName = file.getOriginalFilename(); // 文件名稱
			String suffixName = fileName.substring(fileName.lastIndexOf(".")); // 後綴名
			String filePath = "C:\\Nice_eCommerce_Git\\Nice_eCommerce\\src\\main\\webapp\\ProductTempImg\\";
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
			prodBean.setImgUrl(fileName);
			System.out.println(filePath);
			System.out.println(fileName);
		}
		
		subBean.setSubcategory_id(subcategory_id);
		stBean.setQuantity(quantity);
		stBean.setCreatedAt(creDate);
		prodBean.setProductName(productName);
		prodBean.setSupplier(supplier);
		prodBean.setColor(color);
		prodBean.setSize(size);
		prodBean.setWeight(weight);
		prodBean.setPrice(price);
		prodBean.setProductDiscription(productDiscription);
		prodBean.setCreatedAt(creDate);


		prodBean.setSubCategory(subBean);
		prodBean.setStock(stBean);
		pService.insertProduct(prodBean);


		System.out.println(file.getSize());
		System.out.println(file.getContentType());


		return "/product/InsertProduct";
	}

	@RequestMapping(path = "/insertSubCategory.controller", method = RequestMethod.POST)
	@ResponseBody
	public String insertSubCategory(@RequestBody String name) {

		Date date = new Date();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creDate = sdFormat.format(date);
		
//		catBean.setCategory_id(category_id);
		subBean.setName(name);
		subBean.setCreatedAt(creDate);
//		subBean.setCategory(catBean);
		subServic.insertSubCategory(subBean);
		
		return "insertSuccess";
	}
	
	@RequestMapping(path = "/insertCategory.controller", method = RequestMethod.POST)
	@ResponseBody
	public String insertCategory(@RequestBody String name) {

		Date date = new Date();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creDate = sdFormat.format(date);

		catBean.setName(name);
		catBean.setCreatedAt(creDate);
		catService.insertCategory(catBean);
		
		return "/product/insertSuccess";
	}
	
	@RequestMapping(path = "/queryProduct.controller", method = RequestMethod.POST)
	@ResponseBody
	public List<ProductBean> queryAllProduct() {
		return pService.selectAll();

	}	
	
	@RequestMapping(path = "/queryAllSubCategory.controller", method = RequestMethod.POST)
	@ResponseBody
	public List<SubCategoryBean> queryAllSubCategory() {
		return subServic.queryAll();
	}
	
	
	@RequestMapping(path = "/queryAllCategory.controller", method = RequestMethod.POST)
	@ResponseBody
	public List<CategoryBean> queryAllCategory() {
		return catService.queryAll();
	}
	

	@GetMapping(value = "getOneProduct{product_id}")
	public String getOneProductInfo1(Model m, @PathVariable Integer product_id) {
		ProductBean pd = pService.findById(product_id);

		m.addAttribute("pdVal", pd);
		return "/product/OneProduct";
	}
	
	//商城商品頁
	@GetMapping(value = "getOneProductShop{product_id}")
	public String getOneProductShop(Model m, @PathVariable Integer product_id) {
		ProductBean pd = pService.findById(product_id);

		m.addAttribute("pdVal", pd);
		
		return "/product/single-product";
	}
	

	@PostMapping("editProduct")
	public ModelAndView editProduct(@RequestParam("imgFile") MultipartFile file, ModelAndView mav,@ModelAttribute(name = "pdVal") ProductBean prodBean) throws IOException {
		
		mav.setViewName("/product/OneProduct");
		
		if(!file.isEmpty()) {
			prodBean.setImg(file.getBytes());
			String fileName = file.getOriginalFilename(); // 文件名稱
			String suffixName = fileName.substring(fileName.lastIndexOf(".")); // 後綴名
			String filePath = "C:\\Nice_eCommerce_Git\\Nice_eCommerce\\src\\main\\webapp\\ProductTempImg\\";
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
			prodBean.setImgUrl(fileName);
			System.out.println(filePath);
			System.out.println(fileName);
		} 
		

		pService.insert(prodBean);
		mav.setViewName("redirect:pageSeperate");
	
		return mav;
	}

	
	@GetMapping(value = "deleteOneProduct{product_id}")
	public String deleteOneProduct(@PathVariable Integer product_id) {
		pApi.delProductById(product_id);
		return "/product/MainPage";
	}

	@GetMapping(value = "pageSeperate")
	public ModelAndView viewProduct(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		Page<ProductBean> page = pService.findByPage(pageNumber);
		
		mav.getModel().put("page", page);
		mav.setViewName("/product/SearchAllProduct");
		return mav;
	}
	

	//前台按照商品價格排序
	@GetMapping(value = "FrontpageSeperate")
	public ModelAndView viewShopProduct(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		Page<ProductBean> page = pService.findByPage(pageNumber);

		mav.getModel().put("page", page);
		mav.setViewName("/product/shop");
		return mav;
	}
	
	
	//前台按照商品上架日期排序
	@GetMapping(value = "FrontpageSeperateSortByCreatedAt")
	public ModelAndView viewShopProductSortByCreatedAt(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		Page<ProductBean> page = pService.findByPageSortByCreatedAt(pageNumber);

		mav.getModel().put("page", page);
		mav.setViewName("/product/shop");
		return mav;
	}

}

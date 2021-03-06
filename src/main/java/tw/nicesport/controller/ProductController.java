package tw.nicesport.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import tw.nicesport.model.Member;
import tw.nicesport.model.OrdersBean;
import tw.nicesport.model.ProductApi;
import tw.nicesport.model.ProductBean;
import tw.nicesport.model.ProductRepository;
import tw.nicesport.service.CategoryService;
import tw.nicesport.service.ProductService;
import tw.nicesport.model.StockBean;
import tw.nicesport.model.StockRepository;
import tw.nicesport.model.SubCategoryBean;
import tw.nicesport.model.SubCategoryRepository;
import tw.nicesport.service.StockService;
import tw.nicesport.service.SubCategoryService;

@Controller
public class ProductController {

	@Autowired
	private ProductService pService;

	@Autowired
	private SubCategoryRepository subCategoryRepositoryImpl;

	@Autowired
	private SubCategoryBean subBean;
	
	@Autowired
	private CategoryBean catBean;

	@Autowired
	private ProductApi pApi;

	@Autowired
	private SubCategoryService subServic;
	
	@Autowired
	private CategoryService catService;
	
	@Autowired
	private StockService stService;
	
	@Autowired
	HttpServletRequest request;
	
	
	
	
//	@Autowired
//	private ServletContext servletContext;


		//insert product ???????????? Dao
		@RequestMapping(path = "/insertProduct.controller", method = RequestMethod.POST)
		public String insertAction(@RequestParam("productName") String productName,
				@RequestParam("supplier") String supplier, @RequestParam("color") String color,
				@RequestParam("size") String size, @RequestParam("weight") String weight,
				@RequestParam("productDiscription") String productDiscription, @RequestParam("price") String price,
				@RequestParam("createdAt") String createdAt, @RequestParam("quantity") Integer quantity,
				@RequestParam("subcategory_id") Integer subcategory_id, @RequestParam("img") MultipartFile file,
				@RequestParam("imgUrl_A") MultipartFile file1, @RequestParam("imgUrl_B") MultipartFile file2,
				@RequestParam("imgUrl_C") MultipartFile file3, @RequestParam("imgUrl_D") MultipartFile file4, Model m,
				HttpServletRequest request) throws IOException {

			Date date = new Date();
			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String creDate = sdFormat.format(date);

			System.out.println(file.isEmpty());
			
			String filePath = request.getServletContext().getRealPath("") + "\\ProductTempImg\\";

			ProductBean prodBean = new ProductBean();
			
			prodBean.setImg(file.getBytes());
			
			String fileName = file.getOriginalFilename(); // ????????????
			String fileName1 = file1.getOriginalFilename();
			String suffixName = fileName.substring(fileName.lastIndexOf("."));
			String suffixName1 = fileName1.substring(fileName1.lastIndexOf(".")); // ?????????
			
			fileName = UUID.randomUUID() + suffixName;
			fileName1 = UUID.randomUUID() + suffixName1;
			
			File dest = new File(filePath + fileName);
			File dest1 = new File(filePath + fileName1);
			
			if(!dest.getParentFile().exists()) {
				dest1.getParentFile().mkdirs();
				dest.getParentFile().mkdirs();
			}try {
				file.transferTo(dest);
				file1.transferTo(dest1);
				
			}catch(Exception e) {
				e.printStackTrace();
			}	
			prodBean.setImgUrl(fileName);
			prodBean.setImgUrl_A(fileName1);
			
			
			if (file2.isEmpty()||file3.isEmpty()||file4.isEmpty()) {
//				prodBean.setImg(null);
//				prodBean.setImgUrl(null);
//				prodBean.setImgUrl_A(null);
				prodBean.setImgUrl_B(null);
				prodBean.setImgUrl_C(null);
				prodBean.setImgUrl_D(null);
			} else {
				
				String fileName2 = file2.getOriginalFilename();
				String fileName3 = file3.getOriginalFilename();
				String fileName4 = file4.getOriginalFilename();

				String suffixName2 = fileName2.substring(fileName2.lastIndexOf("."));
				String suffixName3 = fileName3.substring(fileName3.lastIndexOf("."));
				String suffixName4 = fileName4.substring(fileName4.lastIndexOf("."));
				
				
				System.out.println("servletContext getRealPath===========>" + request.getServletContext().getRealPath("") + "\\ProductTempImg\\");
				
				fileName2 = UUID.randomUUID() + suffixName2;
				fileName3 = UUID.randomUUID() + suffixName3;
				fileName4 = UUID.randomUUID() + suffixName4;

				
				File dest2 = new File(filePath + fileName2);
				File dest3 = new File(filePath + fileName3);
				File dest4 = new File(filePath + fileName4);

				if (!dest1.getParentFile().exists()) {
					dest2.getParentFile().mkdirs();
					dest3.getParentFile().mkdirs();
					dest4.getParentFile().mkdirs();
				}
				try {
					file2.transferTo(dest2);
					file3.transferTo(dest3);
					file4.transferTo(dest4);
				} catch (Exception e) {
					e.printStackTrace();
				}	
				
				prodBean.setImgUrl_B(fileName2);
				prodBean.setImgUrl_C(fileName3);
				prodBean.setImgUrl_D(fileName4);

				System.out.println(filePath);
				System.out.println(fileName);
			}

			Optional<SubCategoryBean> subBeanOption = subCategoryRepositoryImpl.findById(subcategory_id);
			SubCategoryBean subBean = subBeanOption.get();
			StockBean stBean = new StockBean();
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

//			catBean.setCategory_id(category_id);
			subBean.setName(name);
			subBean.setCreatedAt(creDate);
//			subBean.setCategory(catBean);
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

			return "insertSuccess";
		}

		//Jpa
		@RequestMapping(path = "/queryProduct.controller", method = RequestMethod.POST)
		@ResponseBody
		public List<ProductBean> queryAllProduct() {
			return pService.findAllProduct();
		}
		
		
		//??????????????????6?????????for????????????
		@RequestMapping(path = "/queryTopSixProduct.controller", method = RequestMethod.POST)
		@ResponseBody
		public List<ProductBean> queryTopSixProduct() {
			System.out.println("????????????");
			return pService.findTop6ByOrderByCreatedAtDesc();
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

		@GetMapping(value = "getOneProduct{id}")
		public String getOneProductInfo1(Model m, @PathVariable("id") Integer product_id) {
			ProductBean pd = pService.findById(product_id);

			m.addAttribute("pdVal", pd);
			return "/product/OneProduct";
		}
		
		
		@PostMapping("editProduct")
		public ModelAndView editProduct(@RequestParam("subcategory_id")Integer subcategory_id,@RequestParam("modifiedAt") String modifiedAt,
				@RequestParam("imgFile") MultipartFile file,
				@RequestParam("imgFile1") MultipartFile file1,
				@RequestParam("imgFile2") MultipartFile file2,
				@RequestParam("imgFile3") MultipartFile file3,
				@RequestParam("imgFile4") MultipartFile file4, ModelAndView mav,
				@ModelAttribute ProductBean prodBean) throws IOException {
			
			Optional<SubCategoryBean> subBeanOption = subCategoryRepositoryImpl.findById(subcategory_id);
			SubCategoryBean subBean = subBeanOption.get();
			
//			SubCategoryBean subBean = new SubCategoryBean();

			mav.setViewName("/product/OneProduct");
			
			if(!file.isEmpty()) {
				String fileName = saveFile(file);
				prodBean.setImgUrl(fileName);
			}
			if(!file1.isEmpty()) {
				String fileName1 = saveFile(file1);
				prodBean.setImgUrl_A(fileName1);
			}
			
			if(!file2.isEmpty()) {
				String fileName2 = saveFile(file2);
				prodBean.setImgUrl_B(fileName2);
			}
			
			if(!file3.isEmpty()) {
				String fileName3 = saveFile(file3);
				prodBean.setImgUrl_C(fileName3);
			}
			
			if(!file4.isEmpty()) {
				String fileName4 = saveFile(file4);
				prodBean.setImgUrl_D(fileName4);
			}
			
			Date date = new Date();
			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String modDate = sdFormat.format(date);
			prodBean.setModifiedAt(modDate);
			
			
			prodBean.setSubCategory(subBean);
	
			
			pService.insert(prodBean);
			mav.setViewName("redirect:/staff/pageSeperate");

			return mav;
		}
		
		
		
		//??????????????????
		private String saveFile(MultipartFile file){
			
			String fileName = file.getOriginalFilename();
			
			String suffixName = fileName.substring(fileName.lastIndexOf(".")); 
			
//			String filePath = "C:\\Nice_eCommerce_ThirdProject\\Nice_eCommerce\\src\\main\\webapp\\ProductTempImg\\";
			
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

		
		// ???????????????
		@GetMapping(value = "getOneProductShop{id}")
		public String getOneProductShop(Model m, @PathVariable("id") Integer product_id) {
			ProductBean pd = pService.findById(product_id);

			m.addAttribute("pdVal", pd);

			return "/product/single-product";
		}

		@GetMapping(value = "deleteOneProduct{product_id}")
		public String deleteOneProduct(@PathVariable Integer product_id) {
			pApi.delProductById(product_id);
//			return "/product/MainPage";
			return "redirect:/staff/pageSeperate";
		}

		@GetMapping(value = "/staff/pageSeperate")
		public ModelAndView viewProduct(ModelAndView mav,
				@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
			Page<ProductBean> page = pService.findByPage(pageNumber);

			mav.getModel().put("page", page);
			mav.setViewName("/product/SearchAllProduct");
			return mav;
		}

		// ??????????????????????????????
		@GetMapping(value = "FrontpageSeperate")
		public ModelAndView viewShopProduct(ModelAndView mav,
				@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
			Page<ProductBean> page = pService.findByPage(pageNumber);

			mav.getModel().put("page", page);
			mav.setViewName("/product/shop");
			return mav;
		}

		// ????????????????????????????????????
		@GetMapping(value = "FrontpageSeperateSortByCreatedAt")
		public ModelAndView viewShopProductSortByCreatedAt(ModelAndView mav,
				@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
			Page<ProductBean> page = pService.findByPageSortByCreatedAt(pageNumber);

			mav.getModel().put("page", page);
			mav.setViewName("/product/shop");
			return mav;
		}

		// ????????????????????????????????????
		@GetMapping(value = "FrontpageSeperateSortByPriceBetween")
		public ModelAndView viewShopProductPriceBetween(ModelAndView mav,@RequestParam("startPrice") String startPrice,
				@RequestParam("endPrice") String endPrice,@RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		List<ProductBean> prod = pService.findByPriceBetween(startPrice,endPrice);
		
		List<ProductBean> pdList = new ArrayList<>();
		
		for(int i =0;i<=prod.size()-1;i++) {
			pdList.add(prod.get(prod.size()-1-i));
		}
		
		List<ProductBean> prodListOnePage = listOnePage(pdList, pageNumber-1, 5);
		int totalPages = totalPages(pdList, 5);

			mav.getModel().put("prod", prod);
			mav.getModel().put("prodListOnePage", prodListOnePage);
			mav.getModel().put("totalPages", totalPages);
			mav.setViewName("/product/shopPriceBtw");
			return mav;
		}
		
		// ????????????????????????????????????
		@GetMapping(value = "FrontpageSeperateSortByColor")
		public ModelAndView viewShopProductPriceBetween(ModelAndView mav,@RequestParam("color") String color) {
		
		List<ProductBean> prodList = pService.findByColor(color);
		List<ProductBean> prod = new ArrayList<>();
		
			for(int i =0;i<=prodList.size()-1;i++) {
				prod.add(prodList.get(prodList.size()-1-i));
			
			}
			mav.getModel().put("prod", prod);
			mav.setViewName("/product/shopColor");
			return mav;
		}
		
		//?????????????????????????????????
		
		@GetMapping("/BackpageSearchBySupplier")
		public ModelAndView searcProductBySupplier(ModelAndView mav,@RequestParam("supplier")String supplier) {
			List<ProductBean> prod = pService.findBySupplier(supplier);
			
			mav.getModel().put("prod", prod);
			mav.setViewName("/product/SearchAllProductBrand");
			return mav;
		}
		
		// ????????????????????????
		@RequestMapping(value="/FrontpageSearchByKeyword")
		public ModelAndView searchProduct(ModelAndView mav,@RequestParam(name="p", defaultValue = "1") Integer pageNumber,
				@RequestParam("brand") String brand) {
			List<ProductBean> prod = pService.findByProductNameLike(brand);
			
			List<ProductBean> pdList = new ArrayList<>();
			
			for(int i =0;i<=prod.size()-1;i++) {
				pdList.add(prod.get(prod.size()-1-i));
			}
			
			List<ProductBean> prodListOnePage = listOnePage(pdList, pageNumber-1, 5);
			int totalPages = totalPages(pdList, 5);

			mav.getModel().put("prod", prod);
			mav.getModel().put("prodListOnePage", prodListOnePage);
			mav.getModel().put("totalPages", totalPages);
			mav.setViewName("/product/shopKeyWord");
			return mav;
		}
		
		//????????????????????????
		@RequestMapping(value = "/FrontPageSearchBySubCategory")
		public ModelAndView searchProductBySubCategory(ModelAndView mav,@RequestParam("name")String name) {
			
			SubCategoryBean subBean = subServic.findByName(name);
			List<ProductBean> pdList = new ArrayList<>();
			if(subBean != null) {
				pdList = subBean.getPdList();
			}                 
			
			List<StockBean> stock = stService.findAll();
			
			mav.getModel().put("pdList", pdList);
			mav.getModel().put("stock", stock);
			mav.setViewName("/product/shopCategory");
			
			return mav;
		}
		
		//????????????????????????for ajax
		@RequestMapping(value = "/FrontPageSearchBySubCategoryAjax")
		@ResponseBody
		public List<ProductBean> searchProductBySubCategoryAjax(@RequestParam("name")String name) {	
			SubCategoryBean subBean = subServic.findByName(name);
			List<ProductBean> pdList = subBean.getPdList();
			
			return pdList;
		}
		
		private int totalPages(List<ProductBean> prodBeanList ,int pageSize) {
			if(prodBeanList == null) {
				return 0;
			}
			if(prodBeanList.isEmpty()) {
				return 0;
			}
			Double listSizeDouble = Double.valueOf(prodBeanList.size());
			if( ( listSizeDouble % pageSize)==0 ) { // ?????????
				return prodBeanList.size() / pageSize;
			} else { // ????????????
				return prodBeanList.size() / pageSize + 1;
			}
		}
		
		// pageNumber ??????0?????????
		private List<ProductBean> listOnePage(List<ProductBean> prodBeanList, int pageNumber, int pageSize) {
			
			if(pageNumber < 0) {
				return null;
			} 
			
			if(pageSize < 1) {
				return null;
			}
			
			if(prodBeanList==null) {
				return null;
			}
			
			if(prodBeanList.isEmpty()) {
				return null;
			}
			
			int startIndex = pageSize * pageNumber;
			int endIndex = startIndex + pageSize-1;
			if(endIndex > prodBeanList.size()-1 ) {
				endIndex = prodBeanList.size()-1;
			}
			List<ProductBean> prodBeanListOnePage = new ArrayList<>();
			for(int i=startIndex; i<= endIndex; i++) {
				prodBeanListOnePage.add(prodBeanList.get(i));
			}
			return prodBeanListOnePage;
		}
		
		
		


}

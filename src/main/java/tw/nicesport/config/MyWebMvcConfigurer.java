package tw.nicesport.config;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class MyWebMvcConfigurer implements WebMvcConfigurer {
	
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/ProductTempImg/**").addResourceLocations("file:C:\\Nice_eCommerce_FinalProject\\Nice_eCommerce\\src\\main\\webapp\\ProductTempImg\\");
//		C:\Nice_eCommerce_Git\Nice_eCommerce\src\main\webapp\ProductTempImg
	}



}

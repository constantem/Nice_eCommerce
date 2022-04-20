package tw.nicesport.config;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

public class WebMvcConfigurer implements org.springframework.web.servlet.config.annotation.WebMvcConfigurer {
	
    @Override
	 public void addResourceHandlers(ResourceHandlerRegistry registry) {
	     registry.addResourceHandler("/imctemp-rainy/**").addResourceLocations("file:C:\\Nice_eCommerce_Git\\Nice_eCommerce\\src\\main\\webapp\\upload\\");
	 }
}

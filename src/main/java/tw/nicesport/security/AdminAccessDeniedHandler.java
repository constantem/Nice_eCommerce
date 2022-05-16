package tw.nicesport.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.stereotype.Component;

import tw.nicesport.controller.UserLoginController;

@Component("adminAccessDeniedHandler")
public class AdminAccessDeniedHandler implements AccessDeniedHandler {

	private static Logger logger = LoggerFactory.getLogger(UserLoginController.class);
	
    @Autowired
    @Qualifier("customRequestCache")
    private RequestCache myRequestCache;
	
    public AdminAccessDeniedHandler() {
    }
    
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {

        if (!response.isCommitted()) {

            //Save Target-Request
            myRequestCache.saveRequest(request, response);
        
            logger.info("admin 用 security filter chain 攔截到錯誤");
            
            //Forward to the 後台首頁 controller 方法
            response.sendRedirect(request.getContextPath() + "/backstage?hasError=adminDeny");
        }

	}

}

package tw.nicesport.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.stereotype.Component;

@Component("employeeAccessDeniedHandler")
public class EmployeeAccessDeniedHandler implements AccessDeniedHandler {

    @Autowired
    @Qualifier("customRequestCache")
    private RequestCache myRequestCache;
	
    public EmployeeAccessDeniedHandler() {
    }
    
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {

        if (!response.isCommitted()) {

            //Save Target-Request
            myRequestCache.saveRequest(request, response);
        
            //Forward to the 後台首頁 controller 方法
            response.sendRedirect(request.getContextPath() + "/backstage?hasError=employeeDeny");
        }

	}

}

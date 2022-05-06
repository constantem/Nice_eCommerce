package tw.nicesport.aspect;

import java.util.Objects;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Component
@Aspect
public class CustomLoggingAspect {
    
	private static final String CONTROLLER_ALL_METHOD = "execution(* tw.nicesport.controller.*.*(..) )";
	private static final String SERVICE_ALL_METHOD = "execution(* tw.nicesport.service.*.*(..) )";
	private static final String DAO_ALL_METHOD = "execution(* tw.nicesport.model.*Dao*.*(..) )";
	private static final String REPOSITORY_ALL_METHOD = "this(org.springframework.data.jpa.repository.JpaRepository)";
	
	//////////////////
	//  印出用的物件  //
	//////////////////
	
	// 創 java.util.Logger, 並以 logger output stream 來印在 console, 是 spring 的做法, 並給他名字(用本 class name)
    private Logger myLogger = Logger.getLogger(getClass().getName());
   
    
    
    //////////////////
    //  定義介入對象  //
    //////////////////
    
    // 定義 pointcut 變數, 對象為 controller package 下所有 class 中所有方法執行時 
    @Pointcut(CONTROLLER_ALL_METHOD)
    private void forControllerPackage() {}
   
    // 定義 pointcut 變數, 對象為 controller package 下所有 class 中所有方法執行時 
    @Pointcut(CONTROLLER_ALL_METHOD + "&& @annotation(org.springframework.web.bind.annotation.ResponseBody)")
    private void forControllerPackageWithResponseBody() {}
    
    // 定義 pointcut 變數, 對象為 controller package 下所有 class 中所有方法執行時 
    @Pointcut(CONTROLLER_ALL_METHOD + "&& !@annotation(org.springframework.web.bind.annotation.ResponseBody)")
    private void forControllerPackageWithoutResponseBody() {}
    
    // 定義 pointcut 變數, 對象為 service package 下所有 class 中所有方法執行時 
    @Pointcut(SERVICE_ALL_METHOD)
    private void forServicePackage() {}
   
	// 定義 pointcut 變數, 對象為 dao package 下所有 class 中所有方法執行時 
    @Pointcut(DAO_ALL_METHOD + "||" + REPOSITORY_ALL_METHOD)
    private void forDaoPackage() {}
   
    // 定義 pointcut 變數, 對象為 controller, service, dao package 下所有 class 中所有方法執行時
    @Pointcut("forControllerPackage() || forServicePackage() || forDaoPackage()")
    private void forAppFlow() {}
   
    // 定義 pointcut 變數, 對象為沒有 controller, 只有 service, dao package 下所有 class 中所有方法執行時
    @Pointcut("forServicePackage() || forDaoPackage()")
    private void forServiceAndDaoFlow() {}
    
    
	//////////////////
	//  定義介入時機  //
	//////////////////
    
    // @Before
    
    // 對 Controller 方法
    @Before("forControllerPackage()")
    public void beforeForController(JoinPoint theJoinPoint) {
    	myLogger.info("╔═════════════↘ 呼叫 ↙═════════════···");
        
        // URL
        RequestAttributes reqAttr = RequestContextHolder.getRequestAttributes(); 
        ServletRequestAttributes servletReqAttr = (ServletRequestAttributes) reqAttr; 
        HttpServletRequest request = servletReqAttr.getRequest(); 
        String handlerMethodUrl = request.getServletPath();
        // arguments 名
        Object[] args = theJoinPoint.getArgs();
        String argsString ="";
        if(args.length == 0) { // 無參數
        	argsString ="無參數";
        } else { // 有參數
            for (int i=0; i< args.length; i++) {
            	argsString += "參數☛" + Objects.requireNonNullElse(args[i],"null");
            			
            	if(i!=args.length-1) { // 不是最後一個
            		argsString += ", ";
            	} 
            }
        }

        // 印出
        myLogger.info("║ URL:\"" + handlerMethodUrl + "\", " + argsString);
        myLogger.info("║ (方法執行中...)");
    }
    
    // 對 Service 方法
    @Before("forServicePackage()")
    public void beforeForService(JoinPoint theJoinPoint) {
    	myLogger.info("   ┌─────────────↘ 呼叫 ↙─────────────···");
        
        // 方法名
        String methodName = theJoinPoint.getSignature().toShortString();
        // arguments 名
        Object[] args = theJoinPoint.getArgs();
        String argsString ="";
        if(args.length == 0) { // 無參數
        	argsString ="無參數";
        } else { // 有參數
            for (int i=0; i< args.length; i++) {
            	argsString += "參數☛" + Objects.requireNonNullElse(args[i],"null");
            			
            	if(i!=args.length-1) { // 不是最後一個
            		argsString += ", ";
            	} 
            }
        }

        // 印出
        myLogger.info("   │ service 方法: " + methodName + ", " + argsString);
        myLogger.info("   │ (方法執行中...)");
    }
    
    // 對 Dao 方法
    @Before("forDaoPackage()")
    public void beforeForDao(JoinPoint theJoinPoint) {
    	myLogger.info("      ╭┄┄┄┄┄┄┄┄┄┄┄┄┄↘ 呼叫 ↙┄┄┄┄┄┄┄┄┄┄┄┄┄···");
        
        // 方法名
        String methodName = theJoinPoint.getSignature().toShortString();
        // arguments 名
        Object[] args = theJoinPoint.getArgs();
        String argsString ="";
        if(args.length == 0) { // 無參數
        	argsString ="無參數";
        } else { // 有參數
            for (int i=0; i< args.length; i++) {
            	argsString += "參數☛" + Objects.requireNonNullElse(args[i],"null");
            			
            	if(i!=args.length-1) { // 不是最後一個
            		argsString += ", ";
            	} 
            }
        }

        // 印出
        myLogger.info("      ┊ dao 方法: " + methodName + ", " + argsString);
        myLogger.info("      ┊ (方法執行中...)");
    }
   
    
    
    // @AfterReturning
    
    // 對 回傳物件(String或JSON String)的Controller方法
    @AfterReturning(
            pointcut="forControllerPackageWithResponseBody()",
            returning="theResult"
            )
    public void afterReturningForControllerWithResponsebody(JoinPoint theJoinPoint, Object theResult) {
      
        // 印出回傳值與URL
        RequestAttributes reqAttr = RequestContextHolder.getRequestAttributes(); 
        ServletRequestAttributes servletReqAttr = (ServletRequestAttributes) reqAttr; 
        HttpServletRequest request = servletReqAttr.getRequest(); 
        String handlerMethodUrl = request.getServletPath();
        myLogger.info("║ 回傳物件:" + theResult.getClass().getSimpleName() + ", 由 URL:\"" + handlerMethodUrl +"\"");
        myLogger.info("╚══════════════ 結束 ══════════════···");
    }
    
    // 對 回傳jsp的Controller方法
    @AfterReturning(
            pointcut="forControllerPackageWithoutResponseBody()",
            returning="theResult"
            )
    public void afterReturningForControllerWithoutResponsebody(JoinPoint theJoinPoint, Object theResult) {
      
        // 印出回傳值與URL
        RequestAttributes reqAttr = RequestContextHolder.getRequestAttributes(); 
        ServletRequestAttributes servletReqAttr = (ServletRequestAttributes) reqAttr; 
        HttpServletRequest request = servletReqAttr.getRequest(); 
        String handlerMethodUrl = request.getServletPath();
        myLogger.info("║ 回傳 jsp:\"" + theResult.getClass().getSimpleName() + "\", 由 URL:\"" + handlerMethodUrl +"\"");
        myLogger.info("╚══════════════ 結束 ══════════════···");
    }
    
	// 對 Service 方法
    @AfterReturning(
            pointcut="forServicePackage()",
            returning="theResult"
            )
    public void afterReturningForService(JoinPoint theJoinPoint, Object theResult) {
      
        // 印出回傳值與方法名
    	String theMethod = theJoinPoint.getSignature().toShortString();
        myLogger.info("   │ 回傳:" + theResult.getClass().getSimpleName() + ", 由方法: " + theMethod);
        myLogger.info("   └────────────── 結束 ──────────────···");
    }
    
	// 對 Dao 方法
    @AfterReturning(
            pointcut="forDaoPackage()",
            returning="theResult"
            )
    public void afterReturningForDao(JoinPoint theJoinPoint, Object theResult) {
      
        // 印出回傳值與方法名
    	String theMethod = theJoinPoint.getSignature().toShortString();
        myLogger.info("      ┊ 回傳:" + theResult.getClass().getSimpleName() + ", 由方法: " + theMethod);
        myLogger.info("      ╰┄┄┄┄┄┄┄┄┄┄┄┄┄┄ 結束 ┄┄┄┄┄┄┄┄┄┄┄┄┄┄···");
    }
}

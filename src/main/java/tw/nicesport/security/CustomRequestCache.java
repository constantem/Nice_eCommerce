package tw.nicesport.security;

import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.stereotype.Component;

@Component("customRequestCache") // custom request cache, 用來出錯時存 request
public class CustomRequestCache extends HttpSessionRequestCache {
    public CustomRequestCache() {
        super();
    }
}

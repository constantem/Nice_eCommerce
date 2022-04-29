package tw.nicesport.security;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

// 將 springSecurityFilterChain 註冊到 existing ApplicationContext
// Register the springSecurityFilterChain Filter for every URL in this application
// Since we already had a WebApplicationInitializer (web.xml) that is loading our Spring Configuration,
// we should register Spring Security with the existing ApplicationContext
public class SecurityWebApplicationInitializer extends AbstractSecurityWebApplicationInitializer {

}

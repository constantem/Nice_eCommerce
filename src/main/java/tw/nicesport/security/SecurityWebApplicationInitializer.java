package tw.nicesport.security;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

// Register the springSecurityFilterChain Filter for every URL in this application
// Since we already had a WebApplicationInitializer that is loading our Spring Configuration,
// we should register Spring Security with the existing ApplicationContext
public class SecurityWebApplicationInitializer extends AbstractSecurityWebApplicationInitializer {

}

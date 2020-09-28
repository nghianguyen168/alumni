package dtu.captone.alumni.configs;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

@Configuration
public class ViewConfig implements WebApplicationInitializer {

	public void onStartup(ServletContext servletCxt) throws ServletException {
        AnnotationConfigWebApplicationContext ac = new AnnotationConfigWebApplicationContext();
        
        ac.register(WebMvcConfig.class); 
        ac.setServletContext(servletCxt);
        ac.refresh();
        
        DispatcherServlet servlet = new DispatcherServlet(ac);
        ServletRegistration.Dynamic registration = servletCxt.addServlet("app", servlet);
        registration.setInitParameter("XMLConfig","classpath:web.xml");
        registration.setLoadOnStartup(1);
        registration.addMapping("/demo");
	}
	
	
	
	
}
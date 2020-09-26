package dtu.captone.alumni.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.jpa.support.OpenEntityManagerInViewFilter;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
@ComponentScan("dtu.captone.alumni.*")
@EnableWebMvc // bắt buộc phải có nếu ko có ko chạy đc
public class WebMvcConfig extends WebMvcConfigurationSupport {
	@Bean
	public OpenEntityManagerInViewFilter meatboxOpenEntityManagerInViewFilter() {
		OpenEntityManagerInViewFilter osivFilter = new OpenEntityManagerInViewFilter();
		osivFilter.setEntityManagerFactoryBeanName("alumniEntityManager");
		return osivFilter;
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

		registry.addResourceHandler("/resources/**").addResourceLocations("/WEB-INF/resources/");
		registry.addResourceHandler("swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/");

		registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");

	}

	@Bean
	public MultipartResolver multipartResolver() {
		CommonsMultipartResolver resover = new CommonsMultipartResolver();
		return resover;
		
	}
	@Bean(name = "viewResolver")
    public ViewResolver getViewResolver() {
        UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
        // TilesView 3
        viewResolver.setViewClass(TilesView.class);
        return viewResolver;
    }
	@Bean(name = "tilesConfigurer")// giup tạo và đọc được file tiles.xml
    public TilesConfigurer getTilesConfigurer() {
        TilesConfigurer tilesConfigurer = new TilesConfigurer();
        // TilesView 3
        tilesConfigurer.setDefinitions(new String [] {
        		"/WEB-INF/templates/tiles-admin.xml"
        		
        });
        return tilesConfigurer;
    }

}

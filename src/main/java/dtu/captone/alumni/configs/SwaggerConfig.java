package dtu.captone.alumni.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.google.common.base.Predicate;

import springfox.documentation.RequestHandler;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfig {

	  @Bean
	    public Docket api() { 
	        return new Docket(DocumentationType.SWAGGER_2)  
	          .select()                                  
	          .apis((Predicate<RequestHandler>) RequestHandlerSelectors.any())              
	          .paths((Predicate<String>) PathSelectors.any())                          
	          .build();                                           
	    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("Books Project API")
                .description("MEATBOX PROJECT API reference for developers")
                .termsOfServiceUrl("http://hantsy.blogspot.com")
                .license("Apache License Version 2.0")
                .licenseUrl("https://github.com/springfox/springfox/blob/master/LICENSE")
                .version("2.0")
                .build();
    }
}

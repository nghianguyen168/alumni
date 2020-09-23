package dtu.captone.alumni.configs;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.core.env.Environment;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@PropertySources({ @PropertySource("classpath:application.properties") })
@EnableJpaRepositories(basePackages = {"dtu.captone.alumni.respository"}
,entityManagerFactoryRef = "alumniEntityManager",
transactionManagerRef = "alumniTransactionManager"
)
public class AlumniDatabaseConfigs {
	  @Autowired
	    private Environment env;
	    
	    @Primary
	    @Bean
	    @ConfigurationProperties(prefix="spring.datasource")
	    public DataSourceProperties meatboxDataSourceProperties() {
	        return new DataSourceProperties();
	    }


	  
	    @Bean(name="alumniDataSource")
	    public DataSource dataSource() {
	    	DataSourceProperties meatboxDataSourceProperties = meatboxDataSourceProperties();
	        return DataSourceBuilder.create()
	                .driverClassName(meatboxDataSourceProperties.getDriverClassName())
	                .url(meatboxDataSourceProperties.getUrl())
	                .username(meatboxDataSourceProperties.getUsername())
	                .password(meatboxDataSourceProperties.getPassword())
	                .build();
	    }


	    @Primary
	    @Bean(name ="alumniEntityManager")
	    public LocalContainerEntityManagerFactoryBean meatboxEntityManager() {
	        LocalContainerEntityManagerFactoryBean em 
	        = new LocalContainerEntityManagerFactoryBean();
	      em.setDataSource(dataSource());
	      em.setPackagesToScan(new String[] { "dtu.captone.alumni.domain" });
	 
	      JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
	      em.setJpaVendorAdapter(vendorAdapter);
	      em.setJpaProperties(additionalProperties());
	 
	      return em;
	    }


	    @Primary
	    @Bean(name = "alumniTransactionManager")
	    public PlatformTransactionManager meatboxTransactionManager() {
	        EntityManagerFactory factory = meatboxEntityManager().getObject();
	        return new JpaTransactionManager(factory);
	    }
	    
	    @Bean
	    public PersistenceExceptionTranslationPostProcessor exceptionTranslation(){
	        return new PersistenceExceptionTranslationPostProcessor();
	    }
	     
	    Properties additionalProperties() {
	        Properties properties = new Properties();
	        properties.put("hibernate.hbm2ddl.auto", env.getProperty("spring.jpa.hibernate.ddl-auto"));
	        properties.put("hibernate.show-sql", env.getProperty("spring.jpa.show-sql"));
	           
	        return properties;
	    }
}

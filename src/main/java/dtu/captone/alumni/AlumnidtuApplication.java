package dtu.captone.alumni;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class AlumnidtuApplication {
    public static void main(String[] args) {
        SpringApplication.run(AlumnidtuApplication.class, args);
    }
}
	
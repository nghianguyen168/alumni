package dtu.captone.alumni;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import dtu.captone.alumni.domain.Major;
import dtu.captone.alumni.service.MajorServiceImpl;

@SpringBootApplication
public class AlumnidtuApplication {
	public static void main(String[] args) {
		SpringApplication.run(AlumnidtuApplication.class, args);
	}

}

package com.hello.bms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//@EntityScan(basePackages = {"com.hello.bms.entity"})
//@EnableJpaRepositories(basePackages = {"com.hello.bms.repository"})

@SpringBootApplication
public class BmsApplication {

	public static void main(String[] args) {
		SpringApplication.run(BmsApplication.class, args);
	}

}

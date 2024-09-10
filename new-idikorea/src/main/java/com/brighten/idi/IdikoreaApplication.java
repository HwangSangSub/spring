package com.brighten.idi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class IdikoreaApplication {

	public static void main(String[] args) {
		SpringApplication.run(IdikoreaApplication.class, args);
	}

}

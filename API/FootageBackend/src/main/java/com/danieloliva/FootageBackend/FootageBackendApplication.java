package com.danieloliva.FootageBackend;

import com.danieloliva.FootageBackend.config.StorageProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@SpringBootApplication
@EnableConfigurationProperties({StorageProperties.class})
public class FootageBackendApplication {

	public static void main(String[] args) {
		SpringApplication.run(FootageBackendApplication.class, args);
	}

}

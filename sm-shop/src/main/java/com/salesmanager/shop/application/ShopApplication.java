package com.salesmanager.shop.application;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
public class ShopApplication extends SpringBootServletInitializer {
	
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ShopApplication.class);
    }
	
    //Main function of the project
    public static void main(String[] args) {
        SpringApplication.run(ShopApplication.class, args);
    }
    
    

}

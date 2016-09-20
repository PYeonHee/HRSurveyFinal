package com.sanhak.hrsurvey.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.BeanNameViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.sanhak.hrsurvey.controller.HomeController;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.sanhak.hrsurvey" })
public class AppConfig extends WebMvcConfigurerAdapter {

	@Bean
	public HomeController homeController() {
		return new HomeController();
	}
	
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Bean
	public ViewResolver getViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	@Override
    public void addViewControllers(org.springframework.web.servlet.config.annotation.ViewControllerRegistry registry) {
 
        // 특별히 controller 를 타지 않아도 되는 뷰만 있는 경우 등록
        // ex) 디자인만 입힌 것들.
        registry.addViewController("/simpleView").setViewName("/simpleView");
 
 
        // 404 오류가 발생했을때 보여줄 뷰를 등록
        // registry.addViewController("/page-not-found").setViewName("errors/404");
    }
	@Bean
	public ViewResolver	getViewJava(){
		BeanNameViewResolver resolver2 = new BeanNameViewResolver();
		resolver2.setOrder(0);
		return resolver2;
	}
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
		return new CommonsMultipartResolver();
	}

}
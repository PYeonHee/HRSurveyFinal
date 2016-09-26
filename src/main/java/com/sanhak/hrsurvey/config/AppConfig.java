package com.sanhak.hrsurvey.config;

import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.BeanNameViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import com.sanhak.hrsurvey.controller.HomeController;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.sanhak.hrsurvey" })
public class AppConfig extends WebMvcConfigurerAdapter implements HandlerExceptionResolver{

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
 
        // registry.addViewController("/page-not-found").setViewName("errors/404");
    }
   @Bean
   public ViewResolver getViewJava(){
      BeanNameViewResolver resolver2 = new BeanNameViewResolver();
      resolver2.setOrder(0);
      return resolver2;
   }
   @Bean(name = "multipartResolver")
   public CommonsMultipartResolver multipartResolver() {
      return new CommonsMultipartResolver();
   }
   
   public ModelAndView resolveException(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2,
            Exception exception) {
         Map<Object, Object> model = new HashMap<Object, Object>();
         
         if (exception instanceof DuplicateKeyException) {
            model.put("errors", "Duplicate error");
            return new ModelAndView("/ViewSrvyDupPage", (Map) model);
         }
         
         /*if (true) {
               model.put("errors", "Unexpected error:MySQLIntegrityConstraintViolationException");
               return new ModelAndView("/ViewSrvyDupPage", (Map) model);
            } */
         else {
            System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            model.put("errors", "Unexpected error: " + exception.getMessage());
            return new ModelAndView("/ViewErrorPage", (Map) model);
         }
        
      }

}
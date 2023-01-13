package tech.code2048.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import tech.code2048.interceptor.AdminInterceptor;

//@WebAppConfiguration
//启用SpringMVC
@EnableWebMvc
@ComponentScan(basePackages = "tech.code2048", useDefaultFilters = false, includeFilters = @ComponentScan.Filter(type = FilterType.ANNOTATION, classes = Controller.class))
public class WebConfig implements WebMvcConfigurer {
    //配置视图解析器
    @Bean
    public ViewResolver viewResolver() {
        //创建视图解析器
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        //配置前缀
        resolver.setPrefix("/WEB-INF/");
        //配置后缀
        resolver.setSuffix(".jsp");
        return resolver;
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        /**
         *    配置静态资源放行，DispatcherServlet将对静态资源的请求转发到Servlet容器中默认的Servlet上，
         *    而不是使用DispatcherServlet本身来处理此类请求
         *  
         *  配置静态资源放行
        */    
        configurer.enable();
    }
    
    //配置拦截器 - 如果需要的话
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AdminInterceptor())
                .addPathPatterns("/admin/**");
    }
}
package tech.code2048.init;

import tech.code2048.config.MainConfig;
import tech.code2048.config.WebConfig;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
    @Override
    protected String[] getServletMappings() {
        //配置DispatcherServlet路径
        return new String[]{"/"};
    }

    @Override
    protected Class<?>[] getRootConfigClasses() {
        //加载Spring的配置类
        return new Class<?>[]{MainConfig.class};
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        //加载SpringMVC的配置
        return new Class<?>[]{WebConfig.class};
    }
}
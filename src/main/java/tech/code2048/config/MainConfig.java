package tech.code2048.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.Import;
import org.springframework.stereotype.Controller;

/**
 * 配置类 - Java类
 * 作用：代替Spring的XML配置文件
 */
//表示当前类是一个配置类
@Configuration
//配置包扫描，代替<context:component-scan base-package="com.stedu" />
@ComponentScan(basePackages = "tech.code2048", excludeFilters = @ComponentScan.Filter(type = FilterType.ANNOTATION, classes = Controller.class))
//导入其它的配置类
@Import({MyBatisConfig.class, KaptchaConfig.class})
public class MainConfig {
}

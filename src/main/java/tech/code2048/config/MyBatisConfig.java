package tech.code2048.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.github.pagehelper.PageHelper;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
//引入外部配置文件, 代替<context:property-placeholder location="classpath:jdbc.properties" />
@PropertySource("classpath:jdbc.properties")
//扫描特定包下的mapper
@MapperScan(basePackages = "tech.code2048.mapper")
//开启事务注解支持
@EnableTransactionManagement
public class MyBatisConfig {
    //注入简单类型
    @Value("${jdbc.driverClassName}")
    private String driverName;
    @Value("${jdbc.url}")
    private String url;
    @Value("${jdbc.username}")
    private String username;
    @Value("${jdbc.password}")
    private String password;

    //实例化第三方的bean，交给Spring管理
    @Bean("dataSource")
    public DataSource dataSource() {
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setDriverClassName(driverName);
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);

        return dataSource;
    }

    @Bean("sqlSessionFactory")
    public SqlSessionFactoryBean sqlSessionFactoryBean(@Qualifier("dataSource") DataSource dataSource) {
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        factoryBean.setTypeAliasesPackage("tech.code2048.bean");
        factoryBean.setDataSource(dataSource);
        factoryBean.setConfigLocation(new PathMatchingResourcePatternResolver().getResource("classpath:mybatis-config.xml"));

        //设置PageHelper分页插件
        Properties prop = new Properties();
        prop.setProperty("dialect", "mysql");
        PageHelper pageHelper = new PageHelper();
        pageHelper.setProperties(prop);
        factoryBean.setPlugins(pageHelper);

        return factoryBean;
    }

    @Bean("transactionManager")
    public DataSourceTransactionManager dataSourceTransactionManager(@Qualifier("dataSource") DataSource dataSource) {
        DataSourceTransactionManager transactionManager = new DataSourceTransactionManager();
        transactionManager.setDataSource(dataSource);

        return transactionManager;
    }
}

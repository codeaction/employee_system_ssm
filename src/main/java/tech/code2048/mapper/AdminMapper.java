package tech.code2048.mapper;

import tech.code2048.bean.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
    Admin findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);
}

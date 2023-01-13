package tech.code2048.service.impl;

import tech.code2048.bean.Admin;
import tech.code2048.mapper.AdminMapper;
import tech.code2048.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin login(String username, String password) {
        return adminMapper.findByUsernameAndPassword(username,password);
    }
}

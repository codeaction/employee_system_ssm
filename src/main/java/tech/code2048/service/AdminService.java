package tech.code2048.service;

import tech.code2048.bean.Admin;

public interface AdminService {
    Admin login(String username, String password);
}

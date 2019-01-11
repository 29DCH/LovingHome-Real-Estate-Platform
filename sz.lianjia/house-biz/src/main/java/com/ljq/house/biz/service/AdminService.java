package com.ljq.house.biz.service;

import com.ljq.house.biz.mapper.AdminMapper;
import com.ljq.house.common.model.Admin;
import com.ljq.house.common.utils.HashUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Author: ljq
 * @Date: 19-1-2 上午8:28
 */

@Service
public class AdminService {

    @Autowired
    private AdminMapper adminMapper;

    public List<Admin> getAdmins() {
        return adminMapper.selectAdmins();
    }

    public boolean addAdmin(Admin admin) {
        if(getAdminsByName(admin).size()==0)
        {
            admin.setPwd(HashUtils.encryPassword(admin.getPwd()));
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            admin.setTime(df.format(new Date()));
            adminMapper.insert(admin);
            return true;
        }
        return false;
    }

    public Admin auth(String name, String pwd) {
        Admin admin = new Admin();
        admin.setName(name);
        admin.setPwd(HashUtils.encryPassword(pwd));
        List<Admin> list = getAdminsByQuery(admin);
        if (!list.isEmpty()) {
            return list.get(0);
        }
        return null;
    }

    public void updateAdmin(Admin updateAdmin,@Param("id") Integer id) {
        adminMapper.update(updateAdmin);
    }

    public void deleteAdmin(Admin deleteAdmin){
        adminMapper.delete(deleteAdmin.getId());
    }

    public List<Admin> getAdminsByName(Admin admin) {
        List<Admin> list = adminMapper.selectAdminByName(admin);
        return list;
    }

    public List<Admin> getAdminsByQuery(Admin admin) {
        List<Admin> list = adminMapper.selectAdminsByQuery(admin);
        return list;
    }

    public Admin getAdminById(@Param("id") Integer id) {
        Admin admin = adminMapper.selectAdminById(id);
        return admin;
    }

    public long getAdminCount(){
        return adminMapper.selectAdminCount();
    }

    public List<Admin> searchAdminByName(String name){
        return adminMapper.getAdminByName(name);
    }

    public Long searchAdminCount(String name){
        return adminMapper.getadminCount(name);
    }
}

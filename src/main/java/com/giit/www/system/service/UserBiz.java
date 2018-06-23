package com.giit.www.system.service;


import com.giit.www.entity.User;
import com.giit.www.entity.custom.UserVo;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Set;

/**
 * Created by c0de8ug on 16-2-9.
 */
public interface UserBiz {
    public List<UserVo> findAll() throws InvocationTargetException, IllegalAccessException;

    public User findById(String id);

    public void update(User user);

    public void add(User user);

    public void delete(String id);

    public void changePassword(String userId, String newPassword);


    public User findByUsername(String username);

    public Set<String> findRoles(String username);

    public Set<String> findPermissions(String username);
}

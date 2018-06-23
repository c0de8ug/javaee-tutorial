package com.giit.www.entity;

import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by c0de8ug on 16-2-9.
 */
public class User {
    String username; //用户名
    String userId;
    String password;
    String salt;
    private List<Long> roleIds; //拥有的角色列表
    private Boolean locked = Boolean.FALSE;


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<Long> getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(List<Long> roleIds) {
        this.roleIds = roleIds;
    }

    public Boolean getLocked() {
        return locked;
    }

    public void setLocked(Boolean locked) {
        this.locked = locked;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }


    public String getCredentialsSalt() {
        return username + salt;
    }

    public String getRoleIdsStr() {
        if (CollectionUtils.isEmpty(roleIds)) {
            return "";
        }
        StringBuilder s = new StringBuilder();
        int i = 0;
        for (; i < roleIds.size() - 1; i++) {
            Long roleId = roleIds.get(i);
            s.append(roleId);
            s.append(",");
        }
        s.append(roleIds.get(i));

        return s.toString();
    }

    public void setRoleIdsStr(String roleIdsStr) {
        if (StringUtils.isEmpty(roleIdsStr)) {
            return;
        }
        roleIds = new ArrayList<>();
        String[] roleIdStrs = roleIdsStr.split(",");
        for (String roleIdStr : roleIdStrs) {
            if (StringUtils.isEmpty(roleIdStr)) {
                continue;
            }
            roleIds.add(Long.valueOf(roleIdStr));
        }
    }
}

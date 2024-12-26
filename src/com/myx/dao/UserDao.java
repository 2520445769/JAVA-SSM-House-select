package com.myx.dao;

import com.myx.po.Register;
import com.myx.po.User;
import com.myx.po.UserInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {
    User findUserByUsername(String username);

    UserInfo findUserInfoByUsername(String username);

    int addUser(Register register);
    int addUserInfo(Register register);

    int changePassword(User user);

}

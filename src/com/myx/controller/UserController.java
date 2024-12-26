package com.myx.controller;

import com.myx.dao.UserDao;
import com.myx.po.Register;
import com.myx.po.User;
import com.myx.po.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    private UserDao userDao;
    @RequestMapping(value = "/toLogin")
    public String toLogin(){
        return "login";
    }

    @RequestMapping(value = "/login")
    public String login(User user, HttpSession session, Model model){

        String username = user.getUsername();
        String password = user.getPassword();

        user = userDao.findUserByUsername(username);

        if (user!= null && user.getPassword().equals(password)) {
            session.setAttribute("user", user);
            model.addAttribute("user", user);
            return "redirect:/toHome";
        } else {
            return "redirect:/toLogin?error=1";
        }
    }

    @RequestMapping(value = "/userinfo")
    public String userinfo(HttpSession session,Model model){
        User user= (User) session.getAttribute("user");
        String username = user.getUsername();
        UserInfo userInfo = userDao.findUserInfoByUsername(username);
        model.addAttribute("u",userInfo);
        System.out.println("个人信息"+userInfo);
        return "userinfo";
    }

    @RequestMapping(value = "/toRegister")
    public String toAddUser(){
        return "register";
    }

    @RequestMapping(value = "/register")
    public String AddUser(Register register){
        System.out.println("注册信息"+register.toString());
        if (userDao.findUserByUsername(register.getUsername()) != null){
            return "redirect:/toRegister?error=1";
        }else {
            userDao.addUser(register);
            userDao.addUserInfo(register);
            return "redirect:/toLogin?error=2";
        }
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "redirect:/toLogin";
    }

    @RequestMapping(value = "/changePassword")
    public String changePassword(User user){
        userDao.changePassword(user);
        return "redirect:/toLogin?error=3";
    }
}

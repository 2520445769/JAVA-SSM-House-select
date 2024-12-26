package com.myx.controller;

import com.myx.dao.CellInfoDao;
import com.myx.dao.UserDao;
import com.myx.po.CellInfo;
import com.myx.po.User;
import com.myx.po.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class CellInfoController {
    @Autowired
    private CellInfoDao cellInfoDao;
    @Autowired
    private UserDao userDao;
    @RequestMapping(value = "/toCellInfo")
    public String toCellInfo(CellInfo cellInfo, HttpServletRequest request, Model model){
        System.out.println(cellInfo.getCellname());
        List<CellInfo> cellInfoList = cellInfoDao.getAllCellInfo(cellInfo);
        HttpSession session = request.getSession();
        //获取当前用户信息
        User user = (User) session.getAttribute("user");
        model.addAttribute("cellInfoList",cellInfoList);
        model.addAttribute("user",user);
        return "cellinfo";
    }

    @RequestMapping(value = "/roomdetail")
    public String roomdetail(int id,HttpSession session ,Model model){
        CellInfo cellInfo= cellInfoDao.getCellInfoById(id);
        System.out.println(cellInfo);
        String[] imgs= cellInfo.getPicture().split(",");
        System.out.println(Arrays.toString(imgs));

        User user = (User) session.getAttribute("user");
        String username= user.getUsername();
        UserInfo userInfo= userDao.findUserInfoByUsername(username);

        model.addAttribute("userInfo",userInfo);
        model.addAttribute("imgs",imgs);
        model.addAttribute("cellInfo",cellInfo);
        return "roomdetail";
    }

    @RequestMapping(value = "/choose")
    public String updateCellInfo(int id,HttpSession session){
        System.out.println(id);
        //获取当前用户信息
        User user= (User) session.getAttribute("user");
        //通过用户名获取用户信息
        String username= user.getUsername();
        UserInfo userInfo=userDao.findUserInfoByUsername(username);
        //通过id获取cellInfo
        CellInfo cellInfo= cellInfoDao.getCellInfoById(id);
        String cellname= cellInfo.getCellname();
        String building= cellInfo.getBuilding();
        String roomno= cellInfo.getRoomno();
        cellInfo.setSelection("已选定");
        cellInfo.setUsername(username);
        //更新用户信息
        userInfo.setCellname(cellname);
        userInfo.setBuilding(building);
        userInfo.setRoomno(roomno);
        //更新cellInfo
        cellInfoDao.updateCellInfo(cellInfo);
        //更新用户信息
        cellInfoDao.UpdateUserInfo(userInfo);

        return "redirect:/toHome?error=1";
    }
}

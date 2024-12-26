package com.myx.controller;

import com.myx.dao.AdminInfoDao;
import com.myx.dao.HouseDao;
import com.myx.dao.UserDao;
import com.myx.po.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Arrays;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private AdminInfoDao adminInfoDao;
    @Autowired
    private HouseDao houseDao;
    @Autowired
    private UserDao userDao;

    @RequestMapping(value = "/toAdminLogin")
    public String toAdminLogin(){
        return "adminlogin";
    }

    @RequestMapping(value = "/adminLogin")
    public String login(Admin admin, HttpSession session, Model model){

        String a_name = admin.getA_name();
        String a_password = admin.getA_password();

        admin = adminInfoDao.findAdminByName(a_name);

        if (admin!= null && admin.getA_password().equals(a_password)) {
            session.setAttribute("admin", admin);
            model.addAttribute("admin", admin);
            return "redirect:/toAdminIndex";
        } else {
            return "redirect:/toAdminLogin?error=1";
        }
    }

    //显示主页，默认显示房源信息
    @RequestMapping(value = "/toAdminIndex")
    public String toAdminIndex(CellInfo cellInfo, Model model){
        List<HouseSource> houseSourceList=adminInfoDao.getAllHouse();
        model.addAttribute("houseSourceList",houseSourceList);
        return "adminIndex";
    }

    //显示小区信息
    @RequestMapping(value = "/adminCell")
    public String adminCell(CellInfo cellInfo,Model model){
        List<CellInfo> cellInfoList=adminInfoDao.gatAllCell(cellInfo);
        List<HouseSource> Cells = houseDao.getAllCellName();
        model.addAttribute("Cells",Cells);
        model.addAttribute("cellInfoList",cellInfoList);
        return "adminCell";
    }

    //显示用户
    @RequestMapping(value = "/adminUser")
    public String adminUser(User user,Model model){
        List<User> userList=adminInfoDao.getAllUser(user);
        List<UserInfo> userInfoList=adminInfoDao.getAllUserInfo(user);
        model.addAttribute("userList",userList);
        model.addAttribute("userInfoList",userInfoList);
        return "adminUser";
    }

    //跳转到对应的添加功能页面
    @RequestMapping(value = "/toAddHouse")
    public String toAddHouse(){
        return "adminAddHouse";
    }
    @RequestMapping(value = "/toAddCell")
    public String toAddCell(Model model){
        List<HouseSource> Cells = houseDao.getAllCellName();
        model.addAttribute("cellInfoList",Cells);
        return "adminAddCell";
    }
    @RequestMapping(value = "/toAddUser")
    public String toAddUser(){
        return "adminAddUser";
    }

    //修改房源信息功能
    private int id;
    @RequestMapping(value = "/toUpdateHouse")
    public String updateHouse(HttpServletRequest request,Model model){
        id=Integer.parseInt(request.getParameter("id"));
        HouseSource houseSource=adminInfoDao.getHouseById(id);
        System.out.println(houseSource);
        model.addAttribute("house",houseSource);
        return "updateHouse";
    }

    @RequestMapping(value = "/updateHouse")
    public String updateHouse(HouseSource houseSource,HttpServletRequest request){
        CTools cTools=new CTools();
        cTools.setOldCellName(adminInfoDao.getHouseById(id).getCellname());
        cTools.setNewCellName(houseSource.getCellname());
//        System.out.println(cTools.getNewCellName());
//        System.out.println(cTools.getOldCellName());
        int i=adminInfoDao.updateCellInfo(cTools);
//        System.out.println(i);

        MultipartFile multipartFile=houseSource.getMtf();
        String rn=multipartFile.getOriginalFilename();
        String rp=request.getServletContext().getRealPath("static/images");
        System.out.println(rp);
        System.out.println(rn);
        if (rn!=null){
            File file=new File(rp,rn);
            try {
                multipartFile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        houseSource.setPicture(rn);

        adminInfoDao.updateHouse(houseSource);
        return "redirect:/toAdminIndex";
    }

    //删除房源信息功能
    @RequestMapping(value = "/deleteHouse")
    public String deleteHouse(int id){
        HouseSource houseSource=adminInfoDao.getHouseById(id);
        String cellname=houseSource.getCellname();
        List<CellInfo> cellInfo=adminInfoDao.getCellInfoByCellName(cellname);
        if (cellInfo.size()!=0){
            return "redirect:/toAdminIndex?error=1";
        }else {
            adminInfoDao.deleteHouse(id);
            return "redirect:/toAdminIndex";
        }
    }

    //查看房源详细信息
    @RequestMapping(value = "/toadminroomdetail")
    public String toroomdetail(int id,Model model){
        CellInfo cellInfo= adminInfoDao.getCellInfoById(id);
        System.out.println(cellInfo);
        String[] imgs= cellInfo.getPicture().split(",");
        System.out.println(Arrays.toString(imgs));

        model.addAttribute("imgs",imgs);
        model.addAttribute("cellInfo",cellInfo);
        return "adminroomdetail";
    }

    //修改小区信息功能
    @RequestMapping(value = "/toUpdateCell")
    public String toUpdateCell(int id,Model model){
        CellInfo cellInfo=adminInfoDao.getCellInfoById(id);
        String [] imgs= cellInfo.getPicture().split(",");
        List<CellInfo> users=adminInfoDao.getAllUserNotInCell();
        System.out.println(cellInfo);
        model.addAttribute("users",users);
        model.addAttribute("imgs",imgs);
        model.addAttribute("cell",cellInfo);
        return "updateCell";
    }

    @RequestMapping(value = "/updateCell")
    public String updateCell(String OldName,CellInfo cellInfo,HttpServletRequest request){
        List<MultipartFile> multipartFile=cellInfo.getMtf();
        String n="";
        String rp=request.getServletContext().getRealPath("static/images");
        if (multipartFile!=null){
            for (int i=0;i<multipartFile.size();i++){
                String rn=multipartFile.get(i).getOriginalFilename();
                if (!rn.equals("")){
                    File file=new File(rp,rn);
                    try {
                        multipartFile.get(i).transferTo(file);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                System.out.println(rn+"文件");
                if (rn!=null && !rn.equals("")){
                    n=n+rn+",";
                }
            }
        }
        System.out.println("OldName:"+OldName);
        if (!OldName.equals(cellInfo.getUsername())){
            adminInfoDao.updateUserInfoByUsername1(OldName);
        }
        System.out.println(n+"图");
        cellInfo.setPicture(n);
        adminInfoDao.updateCellById(cellInfo);
        adminInfoDao.updateUserInfoByUsername(cellInfo);
        return "redirect:/adminCell";
    }

    //删除小区房源信息功能
    @RequestMapping(value = "/deleteCell")
    public String deleteCell(int id,String name){
        System.out.println(id);
        System.out.println(name);
        adminInfoDao.deleteCellById(id);
        if (name!=null){
            adminInfoDao.updateUserInfoByUsername1(name);
        }
        return "redirect:/adminCell?error=1";
    }

    //用户管理信息功能
    @RequestMapping(value = "/toUserInfo")
    public String toUserInfo(String username,Model model){
        User user= userDao.findUserByUsername(username);
        UserInfo userInfo= userDao.findUserInfoByUsername(username);
        model.addAttribute("u",user);
        model.addAttribute("ui",userInfo);
        return "adminUserInfo";
    }

    private int cell_id;
    @RequestMapping(value = "/toUpdateUserInfo")
    public String toUpdateUserInfo(String username,Model model){
        System.out.println(username);
        if (adminInfoDao.getCellInfoByUserName(username)!=null){
            cell_id=adminInfoDao.getCellInfoByUserName(username).getId();
        }
        User user= userDao.findUserByUsername(username);
        UserInfo userInfo= userDao.findUserInfoByUsername(username);
        List<CellInfo> c= adminInfoDao.gatAllCellNotUser();
        model.addAttribute("u",user);
        model.addAttribute("ui",userInfo);
        model.addAttribute("c",c);
        return "updateUserInfo";
    }

    @RequestMapping(value = "/updateUserInfo")
    public String updateUserInfo(UserInfo userInfo){
        System.out.println(userInfo);
        adminInfoDao.updateUserInfo(userInfo);
        UserInfo newUserInfo=userDao.findUserInfoByUsername(userInfo.getUsername());
//        System.out.println(newUserInfo.getCellname()+'1');
        CellInfo cellInfo=adminInfoDao.getCellInfoByUserName(userInfo.getUsername());
//        System.out.println(cellInfo.getCellname()+'2');
        while (newUserInfo.getCellname()!=null){
            if (!newUserInfo.getCellname().equals(cellInfo.getCellname())){
                adminInfoDao.updateCellInfoSelect(userInfo);
                adminInfoDao.updateCellInfoById(cell_id);
            }
            break;
        }

        return "redirect:/adminUser";
    }

    @RequestMapping(value = "/deleteUserInfo")
    public String deleteUserInfo(int id){
        UserInfo userInfo=adminInfoDao.getUserInfoById(id);
        String username=userInfo.getUsername();
        System.out.println(username);
        CellInfo cellInfo=new CellInfo();
        int id_s;
        if (adminInfoDao.getCellInfoByUserName(username)!=null){
            cellInfo=adminInfoDao.getCellInfoByUserName(username);
            id_s=cellInfo.getId();
            adminInfoDao.updateCellByIds(id_s);
        }
        adminInfoDao.deleteUserInfoById(id);
        adminInfoDao.deleteUserById(id);

        return "redirect:/adminUser";
    }

    @RequestMapping(value = "/insertHouse")
    public String insertHouse(HouseSource houseSource,HttpServletRequest request){
        adminInfoDao.insertHouse(houseSource);
        MultipartFile multipartFile=houseSource.getMtf();
        String rp=request.getServletContext().getRealPath("static/images");
        if (multipartFile!=null) {
            String rn = multipartFile.getOriginalFilename();
            if (!rn.equals("")) {
                File file = new File(rp, rn);
                try {
                    multipartFile.transferTo(file);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return "redirect:/toAdminIndex";
    }

    @RequestMapping(value = "/insertCell")
    public String insertCell(CellInfo cellInfo,HttpServletRequest request){
        adminInfoDao.insertCell(cellInfo);
        List<MultipartFile> multipartFile=cellInfo.getMtf();
        String n="";
        String rp=request.getServletContext().getRealPath("static/images");
        if (multipartFile!=null) {for (int i=0;i<multipartFile.size();i++){
            String rn=multipartFile.get(i).getOriginalFilename();
            if (!rn.equals("")){
                File file=new File(rp,rn);
                try {
                    multipartFile.get(i).transferTo(file);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            System.out.println(rn+"文件");
            if (rn!=null && !rn.equals("")){
                n=n+rn+",";
            }
        }
        }
        return "redirect:/adminCell";
    }

    @RequestMapping(value = "/insertUser")
    public String insertUser(UserInfo userInfo){
        adminInfoDao.insertUser(userInfo);
        adminInfoDao.insertUserInfo(userInfo);
        return "redirect:/adminUser";
    }
}

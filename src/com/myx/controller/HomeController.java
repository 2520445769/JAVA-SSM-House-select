package com.myx.controller;

import com.myx.dao.HouseDao;
import com.myx.po.HouseSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private HouseDao houseDao;
    @RequestMapping(value = "/toHome")
    public String ToHome(HouseSource houseSource,Model model){
        List<HouseSource> HSList =houseDao.getAllHouseSource(houseSource);
        List<HouseSource> Cells = houseDao.getAllCellName();
        model.addAttribute("Cells",Cells);
        model.addAttribute("HSList",HSList);
        return "homepage";
    }
}

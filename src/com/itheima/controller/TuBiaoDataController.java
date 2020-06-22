package com.itheima.controller;

import com.itheima.service.WorkDataInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class TuBiaoDataController {
    @Autowired
    private WorkDataInterface workDataInterface;

    @RequestMapping("/tubiao")
    public String start(HttpSession session) {
        workDataInterface.insertData(session);
        return "tubiao.jsp";
    }

    @RequestMapping("/aqi")
    @ResponseBody
    public String GetAQI(HttpSession session) {
        return workDataInterface.getAQI(session);
    }

    @RequestMapping("/aqi_2")
    @ResponseBody
    public String GetAQI2(HttpSession session) {
        return workDataInterface.getAQIYear(session);
    }

    @RequestMapping("/noise")
    @ResponseBody
    public String GetNoise(HttpSession session) {
        return workDataInterface.getNoise(session);
    }

    @RequestMapping("/noise_year")
    @ResponseBody
    public String GetNoiseYear(HttpSession session) {
        return workDataInterface.getNoiseYear(session);
    }

    @RequestMapping("/water_mouth")
    @ResponseBody
    public String GetWaterMounth(HttpSession session) {
        return workDataInterface.getWaterMouth(session);
    }

    @RequestMapping("/water_year")
    @ResponseBody
    public String GetWaterYear(HttpSession session) {
        return workDataInterface.getWaterYear(session);
    }

    @PostMapping(value = "/Ele_mounth", produces = "text/html;charset=utf-8;")
    @ResponseBody
    public String GetEleMounth(HttpSession session) {
        return workDataInterface.getEleMouth(session);
    }

    @PostMapping(value = "/Ele_year", produces = "text/html;charset=utf-8;")
    @ResponseBody
    public String GetEleYear(HttpSession session) {
        return workDataInterface.getEleYear(session);
    }
}

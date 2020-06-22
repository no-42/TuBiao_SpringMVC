package com.itheima.controller;

import com.itheima.po.Player;
import com.itheima.service.LoginAndRegisterInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class LoginAndRegisterController {
    @Autowired
    private LoginAndRegisterInterface loginAndRegisterInterface;
    @RequestMapping("/excel")
    public String Excel(){
        return "Excelimport.jsp";
    }
    @GetMapping(value = "/login")
    public String toLogin() {
        return "login2.jsp";
    }

    @RequestMapping("/logout")
    public String Logout(HttpSession httpSession) {
        httpSession.invalidate();
        return "redirect:login";
    }
    @RequestMapping("/start")
    public String Start(){
        return "user.jsp";
    }
    @PostMapping(value = "/login", produces = "text/html;charset=utf-8;")
    @ResponseBody
    public String LoginAjax(Player userImple, HttpSession session) {
        return loginAndRegisterInterface.Login(userImple, session);
    }

    @PostMapping(value = "/registered.nick", produces = "text/html;charset=utf-8;")
    @ResponseBody
    public String registerNick(String reg_nick) {
        return loginAndRegisterInterface.getNickname(reg_nick);
    }

    @PostMapping(value = "/register", produces = "text/html;charset=utf-8;")
    @ResponseBody
    public String to_register(Player player) {
            return loginAndRegisterInterface.insertUser(player);


    }

}

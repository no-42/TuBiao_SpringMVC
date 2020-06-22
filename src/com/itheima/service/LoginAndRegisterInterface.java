package com.itheima.service;

import com.itheima.po.Player;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface LoginAndRegisterInterface {
    String getNickname(String nickname);

    String insertUser(Player player);

    String Login(Player userImple, HttpSession session);
}

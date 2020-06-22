package com.itheima.dao;

import com.itheima.po.Player;

import java.util.List;


public interface LoginMapper {
    List<Player> getNickname(String nickname);

    void insertUser(Player player);

    Player login(String nickname);

}

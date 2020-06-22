package com.itheima.service;

import com.itheima.dao.LoginMapper;
import com.itheima.po.Player;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@Transactional
public class LoginAndRegister implements LoginAndRegisterInterface {
    @Autowired
    private LoginMapper loginMapper;

    public String getNickname(String reg_nick) {
        JSONObject jsonObject = new JSONObject();
        try {
            List<Player> list = loginMapper.getNickname(reg_nick);
            if (list.size() == 0) {
                jsonObject.put("res_nick", true);
            } else {
                jsonObject.put("res_nick", false);
            }
        } catch (Exception e) {
            jsonObject.put("res", false);
            e.printStackTrace();
        }
        System.out.println(jsonObject);
        return jsonObject.toString();
    }

    @Override
    public String insertUser(Player player) {
        JSONObject jsonObject = new JSONObject();
        try {
            loginMapper.insertUser(player);
            jsonObject.put("res", true);
            System.out.println(jsonObject);
        } catch (Exception e) {
            jsonObject.put("res", false);
        }
        return jsonObject.toString();
    }

    @Override
    public String Login(Player userImple, HttpSession session) {
        JSONObject jsonObject = new JSONObject();
        String nickname = userImple.getNickname();
        String passoword = userImple.getPassword();
        System.out.println(nickname + " " + passoword);
        try {
            Player list = loginMapper.login(nickname);
            if (list == null) {
                jsonObject.put("nickExist", false);
                jsonObject.put("login_res", "F");
            } else if (!list.getPassword().equals(passoword)) {
                jsonObject.put("nickExist", true);
                jsonObject.put("login_res", "F");
            } else {
                jsonObject.put("nickExist", true);
                jsonObject.put("login_res", "T");
                session.setAttribute("user_session", list);
            }
        } catch (Exception e) {
            jsonObject.put("nickExist", false);
            jsonObject.put("login_res", "F");
            e.printStackTrace();
        }
        System.out.println(jsonObject.toString());
        return jsonObject.toString();
    }


}

package com.itheima.controller;

import com.itheima.po.*;
import com.itheima.service.UserManagementInterface;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserManagementController {
    @Autowired
    private UserManagementInterface userManagementInterface;

    @RequestMapping("/message")
    public String Jump() {
        return "";//跳转的jsp
    }

    @RequestMapping("/nickInfo")
    public void AllMessage(String id, HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Player> list = userManagementInterface.getMessages(id);
            System.out.println(list);
            request.setAttribute("user_messages", list);
            request.getRequestDispatcher("/message").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/getUser", produces = "text/html;charset=utf-8;")
    @ResponseBody
    public String getUser() {
        JSONArray jsonArray = new JSONArray();
        List<Player> list = userManagementInterface.getUsers();
        for (int i = 0; i < list.size(); i++) {
            jsonArray = JSONArray.fromObject(list.toString());
        }
        System.out.println(jsonArray);
        return jsonArray.toString();
    }

    @RequestMapping(value = "/deleteusers")
    @ResponseBody
    public String deleteUsers(PlayerVo userVo) {
        JSONObject jsonObject = new JSONObject();
        int counttrue = 0, countfalse = 0;
        List<Player> userImples = userVo.getUserlist();
        List<Player> falseuser = new ArrayList<>();
        for (Player imple : userImples) {
            try {
                userManagementInterface.deleteUsers(imple);
                counttrue++;
            } catch (Exception e) {
                countfalse++;
                falseuser.add(imple);
                e.printStackTrace();
            }
        }
        jsonObject.put("delete_success", counttrue);
        jsonObject.put("delete_false", countfalse);
        jsonObject.put("false_user", falseuser);
        return jsonObject.toString();
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public String updateUser(Player player) {
        JSONObject jsonObject = new JSONObject();
        try {
            userManagementInterface.updateUsers(player);
            jsonObject.put("res", true);
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.put("res", false);
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "/updateuser")
    @ResponseBody
    public String updateUsers(PlayerVo playerVo) {
        JSONObject jsonObject = new JSONObject();
        int counttrue = 0, countfalse = 0;
        List<Player> list = playerVo.getUserlist();
        List<Player> listfalse = new ArrayList<>();
        for (Player player : list) {
            try {
                userManagementInterface.updateUsers(player);
                counttrue++;
            } catch (Exception e) {
                e.printStackTrace();
                countfalse++;
                list.add(player);
            }
        }
        jsonObject.put("updatesuccess", counttrue);
        jsonObject.put("updatefalse", countfalse);
        jsonObject.put("falseuser", listfalse);
        return jsonObject.toString();
    }

    @RequestMapping("/insert")
    @ResponseBody
    public String insertUser(Player player) {
        JSONObject jsonObject = new JSONObject();
        try {
            userManagementInterface.insertUsers(player);
            jsonObject.put("res", true);
        } catch (Exception e) {
            jsonObject.put("res", false);
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "/insertexcel")
    @ResponseBody
    public String insertUsers(MultipartFile file) {
        JSONObject jsonObject = new JSONObject();
        List<Player> list = userManagementInterface.getExcelData(file);
        List<Player> listfalse = new ArrayList<>();
        int counttrue = 0, countfalse = 0;
        for (Player player : list) {
            try {
                userManagementInterface.insertUsers(player);
                counttrue++;
            } catch (Exception e) {
                e.printStackTrace();
                countfalse++;
                listfalse.add(player);
            }
        }
        jsonObject.put("inserttrue", counttrue);
        jsonObject.put("insertfalse", countfalse);
        jsonObject.put("falseUser", listfalse);
        return jsonObject.toString();
    }

    @RequestMapping(value = "/getworksites")
    @ResponseBody
    public String getWorksites() {
        JSONObject jsonObject = new JSONObject();
        try {
            List<WorkSite> workSites = userManagementInterface.getWorksite();
            jsonObject.put("res", true);
            jsonObject.put("data", workSites);
        } catch (Exception e) {
            jsonObject.put("res", false);
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping("/getgrade")
    @ResponseBody
    public String getGrades(HttpSession session) {
        JSONObject jsonObject = new JSONObject();
        Player player = (Player) session.getAttribute("user_session");
        try {
            List<Grades> grades = userManagementInterface.getGrade(player.getGrade());
            jsonObject.put("res", true);
            jsonObject.put("data", grades);
        } catch (Exception e) {
            jsonObject.put("res", false);
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @RequestMapping("/download")
    public ResponseEntity<byte[]> downLoad(HttpSession session, HttpServletRequest request) {
        userManagementInterface.createExcel(request, session);
        String filePath = request.getServletContext().getRealPath("/files/模板.xls");
        File file = new File(filePath);
        byte[] body = null;
        ResponseEntity<byte[]> entity = null;
        try {
            InputStream inputStream = new FileInputStream(file);
            body = new byte[inputStream.available()];
            inputStream.read(body);
            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Disposition", "attachment;filename=" + URLEncoder.encode(file.getName(), "UTF-8"));
            HttpStatus status = HttpStatus.OK;
            entity = new ResponseEntity<byte[]>(body, headers, status);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return entity;
    }
}

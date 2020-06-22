package com.itheima.service;

import com.itheima.po.Grades;
import com.itheima.po.Player;
import com.itheima.po.WorkSite;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public interface UserManagementInterface {
    List<Player> getUsers();
    void deleteUsers(Player player);
    void updateUsers(Player player);
    void insertUsers(Player player);
    List<WorkSite> getWorksite();
    List<Grades> getGrade(int grade);
    List<Player> getExcelData(MultipartFile file);
    void createExcel(HttpServletRequest request, HttpSession session);
    List<Player> getMessages(String id);
}

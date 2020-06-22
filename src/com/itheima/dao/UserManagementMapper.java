package com.itheima.dao;

import com.itheima.po.Grades;
import com.itheima.po.Player;
import com.itheima.po.WorkSite;

import java.util.List;

public interface UserManagementMapper {
    List<Player> getUsers();

    void deleteUsers(Player player);

    void updateUsers(Player player);

    void insertUsers(Player player);

    List<WorkSite> getWorksite();

    List<Grades> getGrade(int grade);

    List<Grades> getGrades();

    List<Player> getMessages(String id);
}

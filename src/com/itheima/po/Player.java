package com.itheima.po;

public class Player {
    private int id;
    private String nickname;
    private String password;
    private String phone;
    private String email;
    private String worksite;
    private int grade;
    private int work_id;
    private String user_ID_card;
    private String user_home;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getWorksite() {
        return worksite;
    }

    public void setWorksite(String worksite) {
        this.worksite = worksite;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public int getWork_id() {
        return work_id;
    }

    public void setWork_id(int work_id) {
        this.work_id = work_id;
    }

    public String getUser_ID_card() {
        return user_ID_card;
    }

    public void setUser_ID_card(String user_ID_card) {
        this.user_ID_card = user_ID_card;
    }

    public String getUser_home() {
        return user_home;
    }

    public void setUser_home(String user_home) {
        this.user_home = user_home;
    }

    public Player(int id, String nickname, String password, String phone, String email, String worksite,
                           int grade, int work_id, String user_ID_card, String user_home) {
        super();
        this.id = id;
        this.nickname = nickname;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.worksite = worksite;
        this.grade = grade;
        this.work_id = work_id;
        this.user_ID_card = user_ID_card;
        this.user_home = user_home;
    }

    public Player() {
        super();
    }

    @Override
    public String toString() {
        return "[id=" + id + ", nickname=" + nickname + ", password=" + password + ", phone=" + phone
                + ", email=" + email + ", worksite=" + worksite + ", grade=" + grade + ", work_id=" + work_id
                + ", user_ID_card=" + user_ID_card + ", user_home=" + user_home + "]";
    }
}


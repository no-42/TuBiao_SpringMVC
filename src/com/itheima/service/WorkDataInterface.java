package com.itheima.service;

import javax.servlet.http.HttpSession;

public interface WorkDataInterface {
    void insertData(HttpSession session);

    String getAQI(HttpSession session);

    String getAQIYear(HttpSession session);

    String getNoise(HttpSession session);

    String getNoiseYear(HttpSession session);

    String getWaterMouth(HttpSession session);

    String getWaterYear(HttpSession session);

    String getEleMouth(HttpSession session);

    String getEleYear(HttpSession session);
}

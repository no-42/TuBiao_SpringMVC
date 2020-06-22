package com.itheima.dao;

import com.itheima.po.WorkData;

import java.util.List;

public interface WorkDataMapper {
    void insertData(WorkData workData);

    List<WorkData> getAQI(int worksite);

    List<WorkData> getNoise(int worksite);

    List<WorkData> getNoiseYear(int worksite);

    List<WorkData> getAQIYear(int worksite);

    List<WorkData> getWaterMouth(int worksite);

    List<WorkData> getWaterYear(int worksite);

    List<WorkData> getEleMounth(int worksite);

    List<WorkData> getEleYear(int worksite);
}

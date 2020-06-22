package com.itheima.po;

public class WorkSite {
    private String worksite;
    private int work_id;

    public String getWorksite() {
        return worksite;
    }

    public void setWorksite(String worksite) {
        this.worksite = worksite;
    }

    public int getWork_id() {
        return work_id;
    }

    public void setWork_id(int work_id) {
        this.work_id = work_id;
    }

    public WorkSite() {
    }

    public WorkSite(String worksite, int work_id) {
        this.worksite = worksite;
        this.work_id = work_id;
    }

    @Override
    public String toString() {
        return "{" +
                "worksite='" + worksite + '\'' +
                ", work_id=" + work_id +
                '}';
    }
}

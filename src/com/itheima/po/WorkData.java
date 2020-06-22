package com.itheima.po;

public class WorkData {
    private String worksite;
    private int pm25;
    private int pm10;
    private int noise;
    private int domesticelectricity;
    private int ofel;
    private int industrialelectricity;
    private int domesticwater;
    private int officewater;
    private int industrialwater;
    private String data;
    private int aqi;
    private int work_id;

    public int getWork_id() {
        return work_id;
    }

    public void setWork_id(int work_id) {
        this.work_id = work_id;
    }

    public String getWorksite() {
        return worksite;
    }

    public void setWorksite(String worksite) {
        this.worksite = worksite;
    }

    public int getPm25() {
        return pm25;
    }

    public void setPm25(int pm25) {
        this.pm25 = pm25;
    }

    public int getPm10() {
        return pm10;
    }

    public void setPm10(int pm10) {
        this.pm10 = pm10;
    }

    public int getNoise() {
        return noise;
    }

    public void setNoise(int noise) {
        this.noise = noise;
    }

    public int getDomesticelectricity() {
        return domesticelectricity;
    }

    public void setDomesticelectricity(int domesticelectricity) {
        this.domesticelectricity = domesticelectricity;
    }

    public int getOfel() {
        return ofel;
    }

    public void setOfel(int ofel) {
        this.ofel = ofel;
    }

    public int getIndustrialelectricity() {
        return industrialelectricity;
    }

    public void setIndustrialelectricity(int industrialelectricity) {
        this.industrialelectricity = industrialelectricity;
    }

    public int getDomesticwater() {
        return domesticwater;
    }

    public void setDomesticwater(int domesticwater) {
        this.domesticwater = domesticwater;
    }

    public int getOfficewater() {
        return officewater;
    }

    public void setOfficewater(int officewater) {
        this.officewater = officewater;
    }

    public int getIndustrialwater() {
        return industrialwater;
    }

    public void setIndustrialwater(int industrialwater) {
        this.industrialwater = industrialwater;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public int getAqi() {
        return aqi;
    }

    public void setAqi(int aqi) {
        this.aqi = aqi;
    }

    public WorkData() {
    }

    public WorkData(String worksite, int pm25, int pm10, int noise, int domesticelectricity, int ofel, int industrialelectricity, int domesticwater, int officewater, int industrialwater, String data, int aqi, int work_id) {
        this.worksite = worksite;
        this.pm25 = pm25;
        this.pm10 = pm10;
        this.noise = noise;
        this.domesticelectricity = domesticelectricity;
        this.ofel = ofel;
        this.industrialelectricity = industrialelectricity;
        this.domesticwater = domesticwater;
        this.officewater = officewater;
        this.industrialwater = industrialwater;
        this.data = data;
        this.aqi = aqi;
        this.work_id = work_id;
    }

    public WorkData(String worksite, int pm25, int pm10, int noise, int domesticelectricity, int ofel, int industrialelectricity, int domesticwater, int officewater, int industrialwater) {
        this.worksite = worksite;
        this.pm25 = pm25;
        this.pm10 = pm10;
        this.noise = noise;
        this.domesticelectricity = domesticelectricity;
        this.ofel = ofel;
        this.industrialelectricity = industrialelectricity;
        this.domesticwater = domesticwater;
        this.officewater = officewater;
        this.industrialwater = industrialwater;
    }

    public WorkData(int pm25, int pm10, int noise, int domesticelectricity, int ofel, int industrialelectricity, int domesticwater, int officewater, int industrialwater, int work_id) {
        this.pm25 = pm25;
        this.pm10 = pm10;
        this.noise = noise;
        this.domesticelectricity = domesticelectricity;
        this.ofel = ofel;
        this.industrialelectricity = industrialelectricity;
        this.domesticwater = domesticwater;
        this.officewater = officewater;
        this.industrialwater = industrialwater;
        this.work_id = work_id;
    }

    @Override
    public String toString() {
        return "WorkData{" +
                "worksite='" + worksite + '\'' +
                ", pm25=" + pm25 +
                ", pm10=" + pm10 +
                ", noise=" + noise +
                ", domesticelectricity=" + domesticelectricity +
                ", ofel=" + ofel +
                ", industrialelectricity=" + industrialelectricity +
                ", domesticwater=" + domesticwater +
                ", officewater=" + officewater +
                ", industrialwater=" + industrialwater +
                ", data='" + data + '\'' +
                ", aqi=" + aqi +
                '}';
    }
}

package com.itheima.tools;

import com.itheima.po.WorkData;

public class AQIauto {
	public WorkData AutoAQI(WorkData imple) {
		int pm25 = imple.getPm25();
		int pm25aqi;
		if (pm25 <= 35) {
			pm25aqi = 50 / 35 * (pm25);
		} else if (35 < pm25 && pm25 <= 75) {
			pm25aqi = 50 / 40 * (pm25 - 35) + 50;
		} else if (75 < pm25 && pm25 <= 115) {
			pm25aqi = 50 / 40 * (pm25 - 75) + 100;
		} else if (115 < pm25 && pm25 <= 150) {
			pm25aqi = 50 / 40 * (pm25 - 115) + 150;
		} else if (150 < pm25 && pm25 <= 250) {
			pm25aqi = 100 / 100 * (pm25 - 150) + 200;
		} else if (250 < pm25 && pm25 <= 350) {
			pm25aqi = 100 / 100 * (pm25 - 250) + 300;
		} else if (350 < pm25 && pm25 <= 500) {
			pm25aqi = 100 / 150 * (pm25 - 350) + 400;
		} else {
			pm25aqi = 500;
		}
		int pm10 = imple.getPm10();
		int pm10aqi;
		if (pm10 <= 50) {
			pm10aqi = 50 / 50 * (pm10);
		} else if (50 < pm10 && pm10 <= 150) {
			pm10aqi = 50 / 100 * (pm10 - 50) + 50;
		} else if (150 < pm10 && pm10 <= 250) {
			pm10aqi = 50 / 100 * (pm10 - 150) + 100;
		} else if (250 < pm10 && pm10 <= 350) {
			pm10aqi = 50 / 100 * (pm10 - 250) + 150;
		} else if (350 < pm10 && pm10 <= 420) {
			pm10aqi = 100 / 70 * (pm10 - 350) + 200;
		} else if (420 < pm10 && pm10 <= 500) {
			pm10aqi = 100 / 80 * (pm10 - 420) + 300;
		} else if (500 < pm10 && pm10 <= 600) {
			pm10aqi = 100 / 100 * (pm10 - 500) + 400;
		} else {
			pm10aqi = 500;
		}
		if (pm25aqi < pm10aqi) {
			imple.setAqi(pm10aqi);
		} else {
			imple.setAqi(pm25aqi);
		}
		return imple;

	}
}

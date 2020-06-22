package com.itheima.service;

import com.itheima.dao.WorkDataMapper;
import com.itheima.po.Player;
import com.itheima.po.WorkData;
import com.itheima.tools.AQIauto;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
@Transactional
public class WorkDataImple implements WorkDataInterface {
    private static String[] level = {"良好", "中等", "对敏感人群不健康", "不健康", "非常不健康", "有毒害"};
    private static String[] workplace = {"工业区", "办公区", "生活区"};
    @Autowired
    private WorkDataMapper workDataMapper;

    @Override
    public void insertData(HttpSession session) {
        Player player = (Player) session.getAttribute("user_session");
        AutoData(player.getWork_id());
    }

    @Override
    public String getAQI(HttpSession session) {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        Player player = (Player) session.getAttribute("user_session");
        int[] a = {0, 0, 0, 0, 0, 0};
        try {
            List<WorkData> list = workDataMapper.getAQI(player.getWork_id());
            if (list.size() == 0) {
                jsonObject.put("res", "F");
                jsonArray.add(jsonObject);
            } else {
                jsonObject.put("res", "T");
                jsonArray.add(jsonObject);
                for (WorkData workspaceImple : list) {
                    if (workspaceImple.getAqi() <= 50) {
                        a[0]++;
                    } else if (workspaceImple.getAqi() > 50 && workspaceImple.getAqi() <= 100) {
                        a[1]++;
                    } else if (workspaceImple.getAqi() > 100 && workspaceImple.getAqi() <= 150) {
                        a[2]++;
                    } else if (workspaceImple.getAqi() > 150 && workspaceImple.getAqi() <= 200) {
                        a[3]++;
                    } else if (workspaceImple.getAqi() > 200 && workspaceImple.getAqi() <= 300) {
                        a[4]++;
                    } else if (workspaceImple.getAqi() > 300) {
                        a[5]++;
                    }
                }
                for (int i = 0; i < a.length; i++) {
                    jsonObject.clear();
                    jsonObject.put("name", level[i]);
                    jsonObject.put("value", a[i]);
                    jsonArray.add(jsonObject);
                }
            }
        } catch (Exception e) {
            jsonObject.put("res", "F");
            jsonArray.add(jsonObject);
            e.printStackTrace();
        }
        return jsonArray.toString();
    }

    @Override
    public String getAQIYear(HttpSession session) {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        Player player = (Player) session.getAttribute("user_session");
        int[] a = {0, 0, 0, 0, 0, 0};
        try {
            List<WorkData> list = workDataMapper.getAQIYear(player.getWork_id());
            if (list.size() == 0) {
                jsonObject.put("res", "F");
                jsonArray.add(jsonObject);
            } else {
                jsonObject.put("res", "T");
                jsonArray.add(jsonObject);
                for (WorkData workspaceImple : list) {
                    if (workspaceImple.getAqi() <= 50) {
                        a[0]++;
                    } else if (workspaceImple.getAqi() > 50 && workspaceImple.getAqi() <= 100) {
                        a[1]++;
                    } else if (workspaceImple.getAqi() > 100 && workspaceImple.getAqi() <= 150) {
                        a[2]++;
                    } else if (workspaceImple.getAqi() > 150 && workspaceImple.getAqi() <= 200) {
                        a[3]++;
                    } else if (workspaceImple.getAqi() > 200 && workspaceImple.getAqi() <= 300) {
                        a[4]++;
                    } else if (workspaceImple.getAqi() > 300) {
                        a[5]++;
                    }
                }
                for (int i = 0; i < a.length; i++) {
                    jsonObject.clear();
                    jsonObject.put("name", level[i]);
                    jsonObject.put("value", a[i]);
                    jsonArray.add(jsonObject);
                }
            }
        } catch (Exception e) {
            jsonObject.put("res", "F");
            jsonArray.add(jsonObject);
            e.printStackTrace();
        }
        return jsonArray.toString();
    }

    @Override
    public String getNoise(HttpSession session) {
        Player player = (Player) session.getAttribute("user_session");
        String[] level = {"良好", "中等", "严重", "有害"};
        int[] levelint = {0, 0, 0, 0};
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        List<WorkData> list = workDataMapper.getNoise(player.getWork_id());
        if (list.size() == 0) {
            jsonObject.put("res", "F");
            jsonArray.add(jsonObject);
        } else {
            jsonObject.put("res", "T");
            jsonArray.add(jsonObject);
            for (WorkData workspaceImple : list) {
                if (workspaceImple.getNoise() >= 0 && workspaceImple.getNoise() < 30) {
                    levelint[0]++;
                } else if (workspaceImple.getNoise() >= 30 && workspaceImple.getNoise() < 60) {
                    levelint[1]++;
                } else if (workspaceImple.getNoise() >= 60 && workspaceImple.getNoise() < 90) {
                    levelint[2]++;
                } else if (workspaceImple.getNoise() > 90) {
                    levelint[3]++;
                }
            }
        }
        for (int i = 0; i < levelint.length; i++) {
            jsonObject.clear();
            jsonObject.put("name", level[i]);
            jsonObject.put("value", levelint[i]);
            jsonArray.add(jsonObject);
        }
        return jsonArray.toString();
    }

    @Override
    public String getNoiseYear(HttpSession session) {
        Player player = (Player) session.getAttribute("user_session");
        String[] level = {"良好", "中等", "严重", "有害"};
        int[] levelint = {0, 0, 0, 0};
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        List<WorkData> list = workDataMapper.getNoise(player.getWork_id());
        if (list.size() == 0) {
            jsonObject.put("res", "F");
            jsonArray.add(jsonObject);
        } else {
            jsonObject.put("res", "T");
            jsonArray.add(jsonObject);
            for (WorkData workspaceImple : list) {
                if (workspaceImple.getNoise() >= 0 && workspaceImple.getNoise() < 30) {
                    levelint[0]++;
                } else if (workspaceImple.getNoise() >= 30 && workspaceImple.getNoise() < 60) {
                    levelint[1]++;
                } else if (workspaceImple.getNoise() >= 60 && workspaceImple.getNoise() < 90) {
                    levelint[2]++;
                } else if (workspaceImple.getNoise() > 90) {
                    levelint[3]++;
                }
            }
        }
        for (int i = 0; i < levelint.length; i++) {
            jsonObject.clear();
            jsonObject.put("name", level[i]);
            jsonObject.put("value", levelint[i]);
            jsonArray.add(jsonObject);
        }
        return jsonArray.toString();
    }

    @Override
    public String getWaterMouth(HttpSession session) {
        int a = 0, b = 0, c = 0;
        Player player = (Player) session.getAttribute("user_session");
        List<WorkData> Water = workDataMapper.getWaterMouth(player.getWork_id());
        JSONArray JSONArray = new JSONArray();
        JSONObject JSONObject = new JSONObject();
        if (Water.size() == 0) {
            JSONObject.put("res", "F");
            JSONArray.add(JSONObject);
        } else {
            JSONObject.put("res", "T");
            JSONArray.add(JSONObject);
            for (WorkData workspaceImple : Water) {
                a += workspaceImple.getDomesticwater();
                b += workspaceImple.getOfficewater();
                c += workspaceImple.getIndustrialwater();
            }
            for (int i = 0; i < 3; i++) {
                JSONObject.clear();
                switch (i) {
                    case 0:
                        JSONObject.put("name", workplace[i]);
                        JSONObject.put("value", a);
                        break;
                    case 1:
                        JSONObject.put("name", workplace[i]);
                        JSONObject.put("value", b);
                        break;
                    case 2:
                        JSONObject.put("name", workplace[i]);
                        JSONObject.put("value", c);
                        break;
                }
                JSONArray.add(JSONObject);
            }
        }
        return JSONArray.toString();
    }

    @Override
    public String getWaterYear(HttpSession session) {
        Player player = (Player) session.getAttribute("user_session");
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        List<WorkData> list = workDataMapper.getWaterYear(player.getWork_id());
        if (list.size() == 0) {
            jsonObject.put("res", "F");
            jsonArray.add(jsonObject);
        } else if (list.size() == 1) {
            jsonObject.put("res", "T");
            jsonArray.add(jsonObject);
            jsonObject.clear();
            List<Integer> list1 = new ArrayList<>();
            list1.add(list.get(0).getIndustrialwater());
            list1.add(list.get(0).getOfficewater());
            list1.add(list.get(0).getDomesticwater());
            jsonObject.put("name", list.get(0).getData());
            jsonObject.put("value", list1);
            jsonArray.add(jsonObject);
        } else if (list.size() > 1) {
            jsonObject.put("res", "T");
            jsonArray.add(jsonObject);
            jsonObject.clear();
            for (int i = 0; i < list.size(); i++) {
                for (int b = 0; b < list.size() - i - 1; b++) {
                    Date date1 = string2Date(list.get(b).getData());
                    Date date2 = string2Date(list.get(b + 1).getData());
                    if (date1.after(date2)) {
                        WorkData workspaceImple = list.get(b);
                        list.set(b, list.get(b + 1));
                        list.set(b + 1, workspaceImple);
                    }
                }
            }
            int[] a = {list.get(0).getIndustrialwater(), list.get(0).getOfficewater(), list.get(0).getDomesticwater()};
            for (int i = 0; i < list.size() - 1; i++) {
                Date date1 = string2Date(list.get(i).getData());
                Date date2 = string2Date(list.get(i + 1).getData());
                if (i == list.size() - 2) {
                    if (date1.equals(date2)) {
                        a[0] += list.get(i + 1).getIndustrialwater();
                        a[1] += list.get(i + 1).getOfficewater();
                        a[2] += list.get(i + 1).getDomesticwater();
                        List<Integer> data = new ArrayList<>();
                        data.add(a[0]);
                        data.add(a[1]);
                        data.add(a[2]);
                        jsonObject.put("name", list.get(i).getData());
                        jsonObject.put("value", data);
                        jsonArray.add(jsonObject);
                    } else {
                        List<Integer> data = new ArrayList<>();
                        data.add(a[0]);
                        data.add(a[1]);
                        data.add(a[2]);
                        jsonObject.put("name", list.get(i).getData());
                        jsonObject.put("value", data);
                        jsonArray.add(jsonObject);
                        jsonObject.clear();
                        data.clear();
                        a[0] = list.get(i + 1).getIndustrialwater();
                        a[1] = list.get(i + 1).getOfficewater();
                        a[2] = list.get(i + 1).getDomesticwater();
                        data.add(a[0]);
                        data.add(a[1]);
                        data.add(a[2]);
                        jsonObject.put("name", list.get(i + 1).getData());
                        jsonObject.put("value", data);
                        jsonArray.add(jsonObject);
                    }
                } else if (date1.equals(date2)) {
                    a[0] += list.get(i + 1).getIndustrialwater();
                    a[1] += list.get(i + 1).getOfficewater();
                    a[2] += list.get(i + 1).getDomesticwater();
                } else {
                    List<Integer> data = new ArrayList<>();
                    data.add(a[0]);
                    data.add(a[1]);
                    data.add(a[2]);
                    jsonObject.put("name", list.get(i).getData());
                    jsonObject.put("value", data);
                    jsonArray.add(jsonObject);
                    a[0] = list.get(i + 1).getIndustrialwater();
                    a[1] = list.get(i + 1).getOfficewater();
                    a[2] = list.get(i + 1).getDomesticwater();
                    jsonObject.clear();
                }
            }
        }
        return jsonArray.toString();
    }

    @Override
    public String getEleMouth(HttpSession session) {
        Player player = (Player) session.getAttribute("user_session");
        int a = 0, b = 0, c = 0;
        List<WorkData> Water = workDataMapper.getEleMounth(player.getWork_id());
        JSONArray JSONArray = new JSONArray();
        JSONObject JSONObject = new JSONObject();
        if (Water.size() == 0) {
            JSONObject.put("res", "F");
            JSONArray.add(JSONObject);
        } else {
            JSONObject.put("res", "T");
            JSONArray.add(JSONObject);
            JSONObject.clear();
            for (WorkData workspaceImple : Water) {
                a += workspaceImple.getDomesticelectricity();
                b += workspaceImple.getOfel();
                c += workspaceImple.getIndustrialelectricity();
            }
            for (int i = 0; i < 3; i++) {
                switch (i) {
                    case 0:
                        JSONObject.put("name", workplace[i]);
                        JSONObject.put("value", a);
                        break;
                    case 1:
                        JSONObject.put("name", workplace[i]);
                        JSONObject.put("value", b);
                        break;
                    case 2:
                        JSONObject.put("name", workplace[i]);
                        JSONObject.put("value", c);
                        break;
                }
                JSONArray.add(JSONObject);
            }
        }
        return JSONArray.toString();
    }

    @Override
    public String getEleYear(HttpSession session) {
        Player player = (Player) session.getAttribute("user_session");
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        List<WorkData> list = workDataMapper.getEleYear(player.getWork_id());
        if (list.size() == 0) {
            jsonObject.put("res", "F");
            jsonArray.add(jsonObject);
        } else if (list.size() == 1) {
            jsonObject.put("res", "T");
            jsonArray.add(jsonObject);
            jsonObject.clear();
            List<Integer> list1 = new ArrayList<>();
            list1.add(list.get(0).getIndustrialelectricity());
            list1.add(list.get(0).getOfel());
            list1.add(list.get(0).getDomesticelectricity());
            jsonObject.put("name", list.get(0).getData());
            jsonObject.put("value", list1);
            jsonArray.add(jsonObject);
            jsonObject.clear();
        } else if (list.size() > 1) {
            jsonObject.put("res", "T");
            jsonArray.add(jsonObject);
            jsonObject.clear();
            for (int i = 0; i < list.size(); i++) {
                for (int b = 0; b < list.size() - i - 1; b++) {
                    Date date1 = string2Date(list.get(b).getData());
                    Date date2 = string2Date(list.get(b + 1).getData());
                    if (date1.after(date2)) {
                        WorkData workspaceImple = list.get(b);
                        list.set(b, list.get(b + 1));
                        list.set(b + 1, workspaceImple);
                    }
                }
            }
            int[] a = {list.get(0).getIndustrialelectricity(), list.get(0).getOfel(), list.get(0).getDomesticelectricity()};
            for (int i = 0; i < list.size() - 1; i++) {
                Date date1 = string2Date(list.get(i).getData());
                Date date2 = string2Date(list.get(i + 1).getData());
                if (i == list.size() - 2) {
                    if (date1.equals(date2)) {
                        a[0] += list.get(i + 1).getIndustrialelectricity();
                        a[1] += list.get(i + 1).getOfel();
                        a[2] += list.get(i + 1).getDomesticelectricity();
                        List<Integer> data = new ArrayList<>();
                        data.add(a[0]);
                        data.add(a[1]);
                        data.add(a[2]);
                        jsonObject.put("name", list.get(i).getData());
                        jsonObject.put("value", data);
                        jsonArray.add(jsonObject);
                        jsonObject.clear();
                    } else {
                        List<Integer> data = new ArrayList<>();
                        data.add(a[0]);
                        data.add(a[1]);
                        data.add(a[2]);
                        jsonObject.put("name", list.get(i).getData());
                        jsonObject.put("value", data);
                        jsonArray.add(jsonObject);
                        jsonObject.clear();
                        data.clear();
                        a[0] = list.get(i + 1).getIndustrialelectricity();
                        a[1] = list.get(i + 1).getOfel();
                        a[2] = list.get(i + 1).getDomesticelectricity();
                        data.add(a[0]);
                        data.add(a[1]);
                        data.add(a[2]);
                        jsonObject.put("name", list.get(i + 1).getData());
                        jsonObject.put("value", data);
                        jsonArray.add(jsonObject);
                    }
                } else if (date1.equals(date2)) {
                    a[0] += list.get(i + 1).getIndustrialelectricity();
                    a[1] += list.get(i + 1).getOfel();
                    a[2] += list.get(i + 1).getDomesticelectricity();
                } else {
                    List<Integer> data = new ArrayList<>();
                    data.add(a[0]);
                    data.add(a[1]);
                    data.add(a[2]);
                    jsonObject.put("name", list.get(i).getData());
                    jsonObject.put("value", data);
                    jsonArray.add(jsonObject);
                    a[0] = list.get(i + 1).getIndustrialelectricity();
                    a[1] = list.get(i + 1).getOfel();
                    a[2] = list.get(i + 1).getDomesticelectricity();
                    jsonObject.clear();
                }
            }
        }
        return jsonArray.toString();
    }

    public void AutoData(int work_id) {
        int pm25, pm10;
        Random random = new Random();
        pm25 = random.nextInt(401);
        pm10 = random.nextInt(501);
        WorkData workspaceImple = new WorkData(pm25, pm10, random.nextInt(131), random.nextInt(10000001), random.nextInt(10000001), random.nextInt(10000001), random.nextInt(10000001), random.nextInt(10000001), random.nextInt(10000001),work_id);
        workspaceImple = new AQIauto().AutoAQI(workspaceImple);
        try {
            workDataMapper.insertData(workspaceImple);
            System.out.println("添加成功");
        } catch (Exception e) {
            System.out.println("添加失败");
            e.printStackTrace();
        }
    }

    public static Date string2Date(String str) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
        try {
            return sdf.parse(str);
        } catch (ParseException e) {
            throw new RuntimeException("日期字符格式错误：" + str);
        }
    }
}

package com.itheima.service;

import com.itheima.dao.UserManagementMapper;
import com.itheima.po.Grades;
import com.itheima.po.Player;
import com.itheima.po.WorkSite;
import com.itheima.util.ExcelUtil;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;
import net.sf.json.JSONObject;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class UserManagement implements UserManagementInterface {
	@Autowired
	private UserManagementMapper userManagementMapper;

	@Override
	public List<Player> getUsers() {
		return userManagementMapper.getUsers();
	}

	@Override
	public void deleteUsers(Player player) {
		userManagementMapper.deleteUsers(player);
	}

	@Override
	public void updateUsers(Player player) {
		userManagementMapper.updateUsers(player);
	}

	@Override
	public void insertUsers(Player player) {
		userManagementMapper.insertUsers(player);
	}

	@Override
	public List<WorkSite> getWorksite() {
		return userManagementMapper.getWorksite();
	}

	@Override
	public List<Player> getExcelData(MultipartFile file) {
		JSONObject jsonObject = new JSONObject();
		List<Player> list = new ArrayList<>();
		List<Grades> gradesList = userManagementMapper.getGrades();
		try {
			org.apache.poi.ss.usermodel.Workbook workbook = new ExcelUtil().chooseWorkbook(file);
			Sheet sheet = workbook.getSheet("用户数据");
			int firstRowNum = sheet.getFirstRowNum();
			int lastRowNum = sheet.getLastRowNum();
			for (int i = firstRowNum + 1; i < lastRowNum; i++) {
				Row row = sheet.getRow(i);
				Player player = new Player();
				Cell nickanem = row.getCell(0);// 昵称
				if (nickanem != null) {
					nickanem.setCellType(Cell.CELL_TYPE_STRING);
					player.setNickname(nickanem.getStringCellValue());
				}
				Cell password = row.getCell(1);// 密码
				if (password != null) {
					password.setCellType(Cell.CELL_TYPE_STRING);
					player.setPassword(password.getStringCellValue());
				}
				Cell phone = row.getCell(2);
				if (phone != null) {
					phone.setCellType(Cell.CELL_TYPE_STRING);
					player.setPhone(phone.getStringCellValue());
				}
				Cell email = row.getCell(3);
				if (email != null) {
					email.setCellType(Cell.CELL_TYPE_STRING);
					player.setEmail(email.getStringCellValue());
				}
				Cell worksite = row.getCell(5);
				if (worksite != null) {
					worksite.setCellType(Cell.CELL_TYPE_STRING);
					player.setWorksite(worksite.getStringCellValue());
				}
				Cell grade = row.getCell(4);
				if (grade != null) {
					grade.setCellType(Cell.CELL_TYPE_STRING);
					for (Grades grades : gradesList) {
						if (grade.getStringCellValue().equals(grades.getName())) {
							player.setGrade(grades.getGrade());
						}
					}
				}
				list.add(player);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void createExcel(HttpServletRequest request, HttpSession session) {
		Player player = (Player) session.getAttribute("user_session");
		WritableWorkbook wwb = null;
		String fileName = request.getServletContext().getRealPath("/files/模板.xls");
		File file = new File(fileName);
		try {
			if (!file.exists()) {
				file.createNewFile();
			}
			wwb = Workbook.createWorkbook(file);
			WritableSheet ws1 = wwb.createSheet("用户数据", 0);
			WritableSheet ws2 = wwb.createSheet("可用权限", 1);
			WritableSheet ws3 = wwb.createSheet("可选项目", 2);
			List<Grades> gradesList = userManagementMapper.getGrade(player.getGrade());
			List<WorkSite> workDataList = userManagementMapper.getWorksite();
			Label nickanme = new Label(0, 0, "用户名");
			Label password = new Label(1, 0, "密码");
			Label phone = new Label(2, 0, "手机号");
			Label email = new Label(3, 0, "邮箱");
			Label grade = new Label(4, 0, "权限");
			Label worksite = new Label(5, 0, "项目名");
			Label grades = new Label(0, 0, "可用权限");
			Label worksites = new Label(0, 0, "可选项目");
			ws1.addCell(nickanme);
			ws1.addCell(password);
			ws1.addCell(phone);
			ws1.addCell(email);
			ws1.addCell(grade);
			ws1.addCell(worksite);
			ws2.addCell(grades);
			ws3.addCell(worksites);
			for (int i = 0; i < workDataList.size(); i++) {
				Label data = new Label(0, i + 1, workDataList.get(i).getWorksite());
				ws3.addCell(data);
			}
			for (int i = 0; i < gradesList.size(); i++) {
				Label data = new Label(0, i + 1, gradesList.get(i).getName());
				ws2.addCell(data);
			}
			wwb.write();
			wwb.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (RowsExceededException e) {
			e.printStackTrace();
		} catch (WriteException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Grades> getGrade(int grade) {
		return userManagementMapper.getGrade(grade);
	}

    @Override
    public List<Player> getMessages(String id) {
	    List<Player> list=userManagementMapper.getMessages(id);
        return list;
    }
}

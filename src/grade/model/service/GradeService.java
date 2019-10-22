package grade.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import grade.model.vo.Grade;
import grade.model.dao.GradeDao;

public class GradeService {
	private GradeDao gdao = new GradeDao();

	public int getGradeListCount(String studentNo) {
		Connection conn = getConnection();
		int listCount = gdao.getEnrollListCount(conn, studentNo);
		close(conn);
		return listCount;
	}

	public ArrayList<Grade> gradeCheckList(int startRow, int endRow, String studentNo) {
		Connection conn = getConnection();
		ArrayList<Grade> list = gdao.gradeCheckList(conn, startRow, endRow, studentNo);
		close(conn);
		return list;
	}

}

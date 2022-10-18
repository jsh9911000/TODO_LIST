package todoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db_connection.DBconnection;
import todoDto.TodoDto;

public class TodoDao {
	//1.전체 목록 조회 메소드.
	public List<TodoDto> selectAll(){
		List<TodoDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = new DBconnection().getConn();
			String sql = "select num, userID, todoTitle, todoContent, regdate"
					+ " from todo"
					+ " order by num asc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				TodoDto dto = new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setUserID(rs.getString("userID"));
				dto.setTodoTitle(rs.getString("todoTitle"));
				dto.setTodoContent(rs.getString("todoContent"));
				dto.setTodoDate(rs.getString("regdate"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {conn.close();}
				if(ps != null) {ps.close();}
				if(rs != null) {rs.close();}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	//2.할 일 조회하는 메소드.
	public List<TodoDto> selectOne(String id){
		List<TodoDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = new DBconnection().getConn();
			String sql = "select num, todoTitle, todoContent, regdate"
					+ " from todo"
					+ " where userID = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				TodoDto dto = new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setTodoTitle(rs.getString("todoTitle"));
				dto.setTodoContent(rs.getString("todoContent"));
				dto.setTodoDate(rs.getString("regdate"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {conn.close();}
				if(ps != null) {ps.close();}
				if(rs != null) {rs.close();}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	//3.할 일 추가하는 메소드.
	public boolean insert(TodoDto dto) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		try {
			conn = new DBconnection().getConn();
			String sql = "insert into todo"
					+" values(todo_seq.NEXTVAL, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getUserID());
			ps.setString(2, dto.getTodoTitle());
			ps.setString(3, dto.getTodoContent());
			ps.setString(4, dto.getTodoDate());
			flag = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {conn.close();}
				if(ps != null) {ps.close();}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(flag > 0) {
			return true;
		}else {
			return false;
		}
	}
	//4.할 일 수정하는 메소드.
	public boolean update(TodoDto dto) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		try {
			conn = new DBconnection().getConn();
			String sql = "update todo"
					+ " todoTitle = ?, todoContent = ?, regdate =?"
					+ " where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getUserID());
			ps.setString(2, dto.getTodoTitle());
			ps.setString(3, dto.getTodoContent());
			ps.setString(4, dto.getTodoDate());
			ps.setInt(5, dto.getNum());
			flag = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {conn.close();}
				if(ps != null) {conn.close();}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(flag > 0 ) {
			return true;
		}else {
			return false;
		}
	}
	//5.할 일 삭제하는 메소드.
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		try {
			conn = new DBconnection().getConn();
			String sql = "delete from todo"
					+ " where num =?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			flag = ps.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {conn.close();}
				if(ps != null) {ps.close();}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(flag > 0) {
			return true;
		}else {
			return false;
		}
	}
}

package usersDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db_connection.DBconnection;
import usersDto.UsersDto;

public class UsersDao {
	/*
	 * 	Data Access Object (DAO)
	 *  DB에 select,insert,update,delete 작업을 수행하는 객체.
	 *  테이블마다 하나의 DAO 혹은 주제마다 하나의 DAO를 작성하게 된다.
	 *  DAO를 만들기 위해서는 DTO를 미리 만들어야 한다.
	 */
	//1.모든 회원의 정보를 select해서 List<> type으로 return하는 메소드.
	public List<UsersDto> selectAll(){
		//select해 올 데이터가 여러 개이기 때문에, ArrayList(배열) 객체를 생성해 놓는다.
		List<UsersDto> list = new ArrayList<>();
		//DB연결하는 Connection 객체 준비.
		Connection conn = null;
		//sql 쿼리를 저장하는 PreparedStatement 객체 준비.
		PreparedStatement ps = null;
		//sql를 실행한 결과를 저장하는 ResultSet 객체 준비.
		ResultSet rs = null;
		
		try {
			conn = new DBconnection().getConn();	//DB 연결.
			//sql.
			String sql = "select num,users_name,users_addr"
					+ " from users"
					+ " order by num asc";
			ps = conn.prepareStatement(sql);	//sql 쿼리 저장해서 준비하기. => Exception 발생.
			rs = ps.executeQuery();	//sql 쿼리 실행한 결과를 저장하기.
			while (rs.next()) {		//결과 데이터가 여러개니까 반복문으로 도출한다.
				UsersDto dto = new UsersDto();		//결과데이터를 dto에 저장한다.
				dto.setNum(rs.getInt("num"));
				dto.setUsers_name(rs.getString("users_name"));
				dto.setUsers_addr(rs.getString("users_addr"));
				list.add(dto);	//배열에 저장한다.
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {	//준비해둔 객체들을 종료해야 한다.
			try {
				if(rs!=null) {rs.close();}	//Exception 발생.
				if(ps!=null) {ps.close();}
				if(conn!=null) {conn.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;		//메소드를 호출하면 배열을 return한다.
	}
	//2.회원 1명의 데이터를 select하는 메소드.	=> 매개변수로 찾을 회원의 고유값을 전달해야 한다.
	public UsersDto selectOne(int num) {
		//회원 1명의 데이터를 저장할 DTO 생성.
		UsersDto dto = null;
		//DB연결하는 Connection 객체 생성.
		Connection conn = null;
		//sql문을 저장하는 PreparedStatement 객체 생성.
		PreparedStatement ps = null;
		//sql 실행한 결과 데이터를 저장할 ResultSet 객체 생성.
		ResultSet rs = null;
		
		try {
			conn = new DBconnection().getConn();	//DB연결.
			//sql문.	=> ? 는 찾을 회원의 정보를 바인딩.
			String sql = "select users_name, users_addr, users_email"
					+ " from users"
					+ " where num = ?";
			ps = conn.prepareStatement(sql); //sql문 저장.
			ps.setInt(1, num);		//매개변수로 받은 회원의 고유값을 1번째 ?에 바인딩.
			rs = ps.executeQuery();	//sql문 실행한 결과 데이터 저장하기.
			if(rs.next()) {	//회원 1명의 데이터이기 때문에 반복문을 돌릴 필요가 없다.
				dto = new UsersDto();	//DTO 객체 생성한 후 결과 데이터 저장.
				dto.setNum(num);
				dto.setUsers_name(rs.getString("users_name"));
				dto.setUsers_addr(rs.getString("users_addr"));
				dto.setUsers_email(rs.getString("users_email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {	//준비했던 객체를 종료.
			try {
				if(rs!=null) {rs.close();}
				if(ps!=null) {ps.close();}
				if(conn!=null) {conn.close();}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;	//회원 1명의 데이터가 들어있는 DTO를 return.
	}
}

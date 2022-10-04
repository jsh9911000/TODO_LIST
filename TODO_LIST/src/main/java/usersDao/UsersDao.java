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
	//1.회원 전체 조회 메소드.
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
			String sql = "select num,users_name"
					+ " from users"
					+ " order by num asc";
			ps = conn.prepareStatement(sql);	//sql 쿼리 저장해서 준비하기. => Exception 발생.
			rs = ps.executeQuery();	//sql 쿼리 실행한 결과를 저장하기.
			while (rs.next()) {		//결과 데이터가 여러개니까 반복문으로 도출한다.
				UsersDto dto = new UsersDto();		//결과데이터를 dto에 저장한다.
				dto.setNum(rs.getInt("num"));
				dto.setUsers_name(rs.getString("users_name"));
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
	//2.회원 1명 조회하는 메소드.	=> 매개변수로 찾을 회원의 고유값을 전달해야 한다.
	public UsersDto selectOne(String id) {
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
			String sql = "select users_name, users_age, users_addr, users_email, users_pwd"
					+ " from users"
					+ " where users_id = ?";
			ps = conn.prepareStatement(sql); //sql문 저장.
			ps.setString(1, id);		//매개변수로 받은 회원의 고유값을 1번째 ?에 바인딩.
			rs = ps.executeQuery();	//sql문 실행한 결과 데이터 저장하기.
			if(rs.next()) {	//회원 1명의 데이터이기 때문에 반복문을 돌릴 필요가 없다.
				dto = new UsersDto();	//DTO 객체 생성한 후 결과 데이터 저장.
				dto.setUsers_name(rs.getString("users_name"));
				dto.setUsers_age(rs.getInt("users_age"));
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
	//3.회원 가입 메소드.
	public boolean insert(UsersDto dto) {
		//DB 연결하는 Connection 객체 준비.
		Connection conn = null;
		//sql 쿼리를 저장하는 PreparedStatement 객체 준비.
		PreparedStatement ps = null;
		//DB에 정상적으로 저장되면 추가되는 row의 개수를 return 받는 flag 변수 준비.
		int flag = 0;
		try {
		conn = new DBconnection().getConn();	//DB 연결.
		//sql.
		String sql = "insert into users"
				+ " values(users_seq.NEXTVAL, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);	//sql 저장.
			//?에 원하는 데이터 바인딩하기. => DB의 테이블명에 맞춰서 만들어야 한다.
			ps.setString(1, dto.getUsers_id());
			ps.setString(2, dto.getUsers_pwd());
			ps.setString(3, dto.getUsers_name());
			ps.setInt(4, dto.getUsers_age());
			ps.setString(5, dto.getUsers_addr());
			ps.setString(6, dto.getUsers_email());
			//sql 쿼리 실행 후 반환되는 값 flag에 저장.
			flag = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {	//준비된 객체들 닫기.
			try {
				if(conn != null ) { conn.close();}
				if(ps != null ) { ps.close(); }
			}catch(Exception e){
				System.out.println("Exception 발생.");
			}
		}
		if(flag > 0) {
			return true;
		}else {
			return false;
		}
		}
	//4.회원 조회 메소드. => 로그인을 위해서.
	public boolean searchUsers(String id, String pwd) {
		UsersDto dto = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int flag = 0;
		try {
			conn = new DBconnection().getConn();
			String sql = "select users_name"
					+ " from users"
					+ " where users_id = ? and users_pwd = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new UsersDto();
				dto.setUsers_name(rs.getString("users_name"));
				flag++;
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
		if(flag > 0) {
			return true;
		}else {
			return false;
		}
	}
	//5.회원 탈퇴 메소드.
	public boolean delete(String id) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		try {
			conn = new DBconnection().getConn();
			String sql = "delete from users"
					+ " where users_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
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
	//6.회원 정보 수정 메소드.
	public boolean update(UsersDto dto) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		try {
			conn = new DBconnection().getConn();
			String sql = "update users"
					+ " set users_pwd = ?, users_age = ?, users_addr = ?, users_email =?"
					+ " where users_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getUsers_pwd());
			ps.setInt(2, dto.getUsers_age());
			ps.setString(3, dto.getUsers_addr());
			ps.setString(4, dto.getUsers_email());
			ps.setString(5, dto.getUsers_id());
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



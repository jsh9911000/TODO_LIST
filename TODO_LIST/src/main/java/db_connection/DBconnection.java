package db_connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {
	//필드
	private Connection conn;
	//생성자
	public DBconnection() {
		try {
			//1.드라이버 로딩.
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//System.out.println("드라이버 로딩 성공~!");
			//접속할 DB 정보.
			//localhost: 본인 pc. 
			//1521: 포트번호.
			//xe: 자바 기본 SID.
			//String url="jdbc:oracle:thin:@14.63.164.99:8080:xe";
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			//2.접속하고 Connection 객체의 참조값 얻어오기. => 필드에 저장.
			conn=DriverManager.getConnection(url, "developerJ", "jyj9706");
			//System.out.println("Oracle DB 접속 성공~!");
		}catch(Exception e) {
			e.printStackTrace();
		}		
	}
	//Connection 객체를 리턴해주는 메소드. => DB에 연결된 객체 return.
	public Connection getConn() {
		return conn;
	}
}

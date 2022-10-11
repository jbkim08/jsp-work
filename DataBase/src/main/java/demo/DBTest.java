package demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBTest {
	public static void main(String[] args) {
		//DB연결을 위한 정보들
		String DB_URL = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC&characterEncoding=UTF-8";
        String DB_USER = "root";
        String DB_PASSWORD = "1234";
        
        String query = "SELECT * FROM mytable";
        
        //1.드라이버 로딩
        try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
        
        
        try {
        	//2. DB 연결 커넥션
			Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			System.out.println("DB연결완료!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        
	}
}

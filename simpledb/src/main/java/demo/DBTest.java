package demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBTest {
	public static void main(String[] args) {
		//DB연결을 위한 정보들
		String DB_URL = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC&characterEncoding=UTF-8&useSSL=false";
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
			//3. sql 쿼리 객체 생성
			Statement stmt = conn.createStatement(); //쿼리 객체 생성
			//4. sql 쿼리 실행후 결과가 있으면 받기
			ResultSet rs = stmt.executeQuery(query); //결과가 rs객체 저장됨
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				System.out.print(id + " : ");
				System.out.println(name);
			}
			//conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        
        
	}
}

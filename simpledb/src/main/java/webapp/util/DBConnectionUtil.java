package webapp.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 다른 클래스나 JSP에서 이 DB연결을 재 사용
 * @author admin
 */
public class DBConnectionUtil {
	//DB연결을 위한 정보들
	private static final String DB_URL = "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC&characterEncoding=UTF-8&useSSL=false";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "1234";
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	
	private static Connection connection = null;
	
	//DB연결 객체를 리턴하는 메서드
	public static Connection openConnection() {
		if(connection != null) {
			return connection;
		} else {
			try {
				Class.forName(DRIVER);
				connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return connection;
		}
		
	}

}





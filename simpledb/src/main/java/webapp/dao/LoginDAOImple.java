package webapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import webapp.model.Login;
import webapp.util.DBConnectionUtil;

public class LoginDAOImple implements LoginDAO {
	
	Connection connection = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;

	@Override
	public String loginCheck(Login login) {
		
		try {
			String sql = "SELECT * FROM tbl_login WHERE email=? and password=?";
			connection = DBConnectionUtil.openConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, login.getEmail());
			pstmt.setString(2, login.getPassword());
			rs = pstmt.executeQuery();
			if(rs.next()) { 
				return "true"; //DB에 이메일과 패스워드가 있을때 (로그인 됨)
			} else {
				return "false"; //DB에 없음 (로그인 안됨)
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return "error"; //에러 발생시
	}

}

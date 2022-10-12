package test;

import webapp.dao.LoginDAO;
import webapp.dao.LoginDAOImple;
import webapp.model.Login;

public class LoginTest {

	public static void main(String[] args) {
		
		LoginDAO loginDAO = new LoginDAOImple();
		String result = loginDAO.loginCheck(new Login("drv98@naver.com", "1234"));
		System.out.println(result);
	}

}

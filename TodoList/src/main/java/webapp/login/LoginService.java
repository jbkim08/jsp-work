package webapp.login;

public class LoginService {
	
	//임시 관리자유저 drv98 패스워드 1234 맞으면 참 아니면 거짓
	public boolean isUserValid(String user, String password) {
		if(user.equals("drv98") && password.equals("1234")) {
			return true;
		}
		
		return false;
	}

}

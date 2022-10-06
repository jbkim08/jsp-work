package beans;

public class User {
	private String email;
	private String password;
	
	private String message;
	
	public User() {
	}
	public User(String email, String password) {
		this.email = email;
		this.password = password;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getMessage() {
		return message;
	}
		
	@Override
	public String toString() {
		return "User [email=" + email + ", password=" + password + ", message=" + message + "]";
	}
	/**
	 * 이메일과 패스워드가 형식에 맞는지 체크해서 맞으면 true리턴
	 * @return true or false
	 */
	public boolean validate() {
		if(email == null) {
			message = "이메일 입력해 주세요";
			return false;
		}
		
		if(password == null) {
			message = "패스워드를 입력해 주세요";
			return false;
		}
		
		if(!email.matches("\\w+@\\w+\\.\\w+")) {
			message = "이메일 형식에 맞지 않습니다.";
			return false;
		}
		
		if(password.length() < 4) {
			message = "패스워드는 4자 이상";
			return false;
		}
		else if(password.matches("\\w*\\s+\\w*")) {
			message = "패스워드에 스페이스가 포함되면 안됩니다.";
			return false;	
		}
		//모든 체크를 끝냈을때 리턴 true
		return true;
	}
}

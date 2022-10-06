package test;

import beans.User;

public class Test {

	public static void main(String[] args) {
		User user = new User("drv98naver.com", "1234");
		
		if(user.validate()) {
			System.out.println("검사성공!");
		} else {
			System.out.println("오류메세지 :" + user.getMessage());
		}
	}

}

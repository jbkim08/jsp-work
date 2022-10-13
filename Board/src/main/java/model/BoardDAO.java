package model;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	//데이터 베이스의 커넥션을 사용하도록 설정하는 메소드
	//lib 에  ojdbc6.jar 라이브러리 등록 할것 
	public Connection getCon(){
		
		Connection conn;
		
		try{
			//외부에서 서버 xml 데이터를 읽어들어야 하기에
			Context initctx =new InitialContext();
			//톰켓 서버에 정보를 담아놓은 곳으로 이동
			Context envctx =(Context) initctx.lookup("java:comp/env");
			//데이터 소스 객체를 선언
			DataSource ds =(DataSource) envctx.lookup("jdbc/pool");
			//데이터 소스를 기준으로 커넥션을 연결해주시오
			conn = ds.getConnection();
			//연결 커넥션 리턴
			return conn;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return null;		
	}

}

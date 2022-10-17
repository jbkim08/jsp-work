package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//오라클 데이터 베이스에 연결하고 select, insert, update, delete 작업을 실행해주는 클래스입니다.
public class MemberDAO {
	

	Connection con; // 데이터베이스에 접근할수 있도록 설정
	PreparedStatement pstmt; //데이터 베이스에 쿼리를 실행시켜주는 객체
	ResultSet rs; //데이터베이스 테이블의 결과를 리턴받아 자바에 저장해주는 객체
	
	//데이터 베이스에 접근할 수 있도록 도와주는 메소드
	public void getCon(){
		//커넥션풀을 이용하여 데이터 베이스에 접근
		try{
			//외부에서 데이터를 읽어들어야 하기에
			Context initctx =new InitialContext();
			//톰켓 서버에 정보를 담아놓은 고으로 이동
			Context envctx =(Context) initctx.lookup("java:comp/env/");
			//데이터 소스 객체를 선언
			DataSource ds =(DataSource) envctx.lookup("jdbc/pool");
			//데이터 소스를 기준으로 커넥션을 연결해주시오
			con =ds.getConnection();
					
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
		
	
	//데이터 베이스에 한사람의 회원 정보를 저장해주는 메소드
	public void insertMember(MemberBean mbean){
		
		try{
			getCon();
			//3. 접속후 쿼리준비하여 쿼리를 사용하도록 설정
			String sql ="insert into member values(?, ? , ? ,? ,? , ?, ?, ?)";
			//쿼리를 사용하도록 설정
			pstmt=con.prepareStatement(sql);//jsp 에서 쿼리를 사용하도록 설정
			//?에 맞게 데이터를 맵핑
		    pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass1());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getHobby());
			pstmt.setString(6, mbean.getJob());
			pstmt.setString(7, mbean.getAge());
			pstmt.setString(8, mbean.getInfo());
			//4. 오라클에서 쿼리를 실행하시오
			pstmt.executeUpdate(); //insert, update, delete 사용하는 메소드
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				//5.자원 반납
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}	
		}
		
	}
	
	//모든회원의 정보를 리턴해주는 메소드 호출
	public ArrayList<MemberBean> allSelectMember(){
		ArrayList<MemberBean> v =new ArrayList<>();
		
		
		//무조건 데이터 베이스는 예외처리를 반드시 해야 합니다.
		try{
			//커넥션 연결
			getCon();
			//쿼리 준비
			String sql =" select * from member ";
			//쿼리를 실행시켜주는 객체 서언
			pstmt=con.prepareStatement(sql);
			//쿼리를 실행 시간 결과를 리턴해서 받아줌(오라클 데이블의 검색된 결과를 자바객체에 저장)
			rs=pstmt.executeQuery();
			//반복문을 사용해서 rs에 저장된 데이터를 추출해놓여야함
			while(rs.next()){//저장된 데이터 만큼까지 반복문을 돌리겠다라는 뜻입니다.
			    MemberBean bean =new MemberBean();//컬럼으로 나뉘어진 데이터를 빈클래스에 저장
			    bean.setId(rs.getString("id"));
			    bean.setAge(rs.getString("age"));
			    bean.setEmail(rs.getString("email"));
			    bean.setHobby(rs.getString("hobby"));
				bean.setTel(rs.getString("tel"));
				bean.setJob(rs.getString("job"));
				bean.setPass1(rs.getString("pass1"));
			    bean.setInfo(rs.getString("info"));
				//패키징된 memberbean 클래스를 벡터에 저장
			    v.add(bean); // 0번지부터 순서대로 데이터가 저장
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				
				//자원 반납
				if(rs!=null)rs.close();
				if(pstmt!=null)rs.close();
				if(con!=null)con.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//다 저장된 벡터를 리턴
		return v;
	}
	
	
	//한사람의 대한 정보를 리턴하는 메소드 작성
	public MemberBean oneSelectMember(String id){
		//한사람에 대한 정보만 리턴하기에 빈클래스 객체 생성
		MemberBean bean =new MemberBean();
		
		try{
			//커넥션연결
			getCon();
			//쿼리 준비
			String sql="select * from member where id =? ";
			pstmt = con.prepareStatement(sql);
			//?에 값을 맵핑
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){//레코드가 있다면
				bean.setId(rs.getString("id"));
			    bean.setAge(rs.getString("age"));
			    bean.setEmail(rs.getString("email"));
			    bean.setHobby(rs.getString("hobby"));
				bean.setTel(rs.getString("tel"));
				bean.setJob(rs.getString("job"));
				bean.setPass1(rs.getString("pass1"));
			    bean.setInfo(rs.getString("info"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{		
				//자원 반납
				if(rs!=null)rs.close();
				if(pstmt!=null)rs.close();
				if(con!=null)con.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return bean;
	}
	
	
	//한회원의 패스워드값을 리턴하는 메소드 작성
	public String getPass(String id){
		//스트림으로  리턴을 해야하기에 스트림변수 선언
		String pass="";
		try{
			getCon();
			//쿼리준비
			String sql="select pass1 from member where id=?";
			pstmt=con.prepareStatement(sql);
			//? 에 값을 맵핑
			pstmt.setString(1, id);
			//쿼리 실행
			rs=pstmt.executeQuery();
			if(rs.next()){
				pass=rs.getString(1); //패스워드값이 저장된 컬럼인덱스
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{		
				//자원 반납
				if(rs!=null)rs.close();
				if(pstmt!=null)rs.close();
				if(con!=null)con.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//결과를 리턴
		return pass;
	}
	
	
	
	//한회원의 정보를 수정하는 메소드
	public void updateMember(MemberBean mbean){
		getCon();
		try{
			//쿼리 준비
			String sql ="update member set email = ? , tel=? where id=?";
			//쿼리실행 객체 선언
			pstmt=con.prepareStatement(sql);
			//?에 값을 맴핑
			pstmt.setString(1, mbean.getEmail());
			pstmt.setString(2, mbean.getTel());
			pstmt.setString(3, mbean.getId());
			//쿼리 실행
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//자원 반납
			try{
				if(pstmt!=null) pstmt.close();
				if(con!=null)con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	
	//한 회원을 삭제하는 메소드 작성
	public void deleteMember(String id){
		
		getCon();
		
		try{
			//쿼리준비
			String sql ="delete from member where id=?";
			//쿼리실행 객체 선언
			pstmt=con.prepareStatement(sql);
			//?에 값을 맵핑
			pstmt.setString(1, id);
			//쿼리실행
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//자원 반납
			try{
				if(pstmt!=null) pstmt.close();
				if(con!=null)con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	
}



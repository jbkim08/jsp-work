package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	//데이터 베이스의 커넥션을 사용하도록 설정하는 메소드
	//lib 에  ojdbc6.jar 라이브러리 등록 할것 
	public Connection getcon(){
		
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
	
	//하나의 새로운 게시글이 넘어와서 저장되는 메소드
	public void insertBoard(BoardBean bean){

		Connection conn = getcon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//빈클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
		int ref=0; //글그룹을 의미 = 쿼리를 실행시켜서 가장큰 ref 값을 자져온 후  +1을 더해주면됨
		int re_step=1; //새글이기에 = 부모글
		int re_level=1; 
		try{
						
			//가장 큰 ref값을 읽어오는 쿼리 준비
			String refsql ="select max(ref) from board ";
			//쿼리실행 객체 
			pstmt =conn.prepareStatement(refsql);
			//쿼리실행후 결과를 리턴
			rs=pstmt.executeQuery();
			if(rs.next()){ //결과 값이 였다면
				ref =rs.getInt(1)+1;//최대값에 +1 를 더해서 글그룹을 설정
			}
			//실제로 게시글 전체값을 테이블에 저장
			//String sql =" insert into board values( board_seq.NEXTVAL, ?, ? , ?, ? , )";
			
		String sql =" insert into BOARD (NUM, WRITER, EMAIL, SUBJECT, PASSWORD, REG_DATE, REF, ";
			   sql +="	RE_STEP, RE_LEVEL, READCOUNT, CONTENT) "; 
			   sql +=" values(board_seq.NEXTVAL, ? ,? , ?, ?, sysdate, ?, ?, ? , 0, ? ) ";
			pstmt= conn.prepareStatement(sql);
			//?에 값을 맵핑	  	
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
			//쿼리를 실행하시오
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//자원 반납
			closeAll(rs, pstmt, conn);
		}
	}
	
	//자원 반납 메소드
	private void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn){
		try{
			//자원 반납
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//전체 글의 갯수를 리턴하는 메소드
	public int getAllCount(){
		
		Connection conn = getcon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//게시글 전체수를 저장하는 변수
		int count =0;
		try{
			//쿼리준비
			String sql ="select count(*) from board";
			//쿼리를 실행할 객체 선언
			pstmt = conn.prepareStatement(sql);
			//쿼리 실행 후 결과를 리턴
			rs=pstmt.executeQuery();
			if(rs.next()){
				count =rs.getInt(1);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return count;
	}

	//모든 게시글을 리턴해주는 
	public ArrayList<BoardBean> getAllBoard(int start, int end){	
		
		Connection conn = getcon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//리턴할 객체 선언
		ArrayList<BoardBean> list =new ArrayList<>();

		try{
			//쿼리 준비
			String sql ="select *  from "
					+ " (select A.* , Rownum Rnum from (select * from board order by ref desc, re_level asc) A ) "
					+ " where Rnum >= ? and Rnum <= ?";
					
			//쿼리를 실행할객체 선언
			pstmt =conn.prepareStatement(sql);
			//쿼리실행 후 결과 저장
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			//데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터를 추출
			while(rs.next()){
				//데이터를 패키징( 가방  = Boardbean 클래스를 이용)해줌
				BoardBean bean =new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("WRITER"));
				bean.setEmail(rs.getString("EMAIL"));
				bean.setSubject(rs.getString("SUBJECT"));
				bean.setPassword(rs.getString("PASSWORD"));
				bean.setReg_date(rs.getDate("REG_DATE").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("RE_STEP"));
				bean.setRe_level(rs.getInt("RE_LEVEL"));
				bean.setReadcount(rs.getInt("READCOUNT"));
				bean.setContent(rs.getString("CONTENT"));
				//패키징한 데이터를 벡터에 저장
				list.add(bean);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//자원 반납
			closeAll(rs, pstmt, conn);
		}
		return list;
	}
	
	//하나의 게시글을 리턴하는 메소드
	public BoardBean getOneBoard(int num){
		Connection conn = getcon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//리턴타입 선언
		BoardBean bean =new BoardBean();
		
		try{
			
			//조회수 증가쿼리
			String readsql ="update board set readcount= readcount+1 where num=?";
			pstmt =conn.prepareStatement(readsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			//쿼리준비
			String sql ="select * from board where num=?";
			//쿼리실행객체
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			//쿼리 실행후 결과를 리턴
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("WRITER"));
				bean.setEmail(rs.getString("EMAIL"));
				bean.setSubject(rs.getString("SUBJECT"));
				bean.setPassword(rs.getString("PASSWORD"));
				bean.setReg_date(rs.getDate("REG_DATE").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("RE_STEP"));
				bean.setRe_level(rs.getInt("RE_LEVEL"));
				bean.setReadcount(rs.getInt("READCOUNT"));
				bean.setContent(rs.getString("CONTENT"));				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//자원 반납
			closeAll(rs, pstmt, conn);
		}
		return bean;
	}
	
	//답변글이 저장되는 메소드
	public void reWriteBoard(BoardBean bean){
		//부모글 그룹과 글레벨 글스텝을 읽어드림
		int ref=bean.getRef();
		int re_step=bean.getRe_step();
		int re_level=bean.getRe_level();
		
		//System.out.println("re_step :" +re_step + " :  re_level :" +re_level);
		Connection conn = getcon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int maxLevel = 0;
		
		try{
			////////////// 핵심 코드   ////////////////
			//1.부모 글보다 큰 re_level 의 값을 전부 1씩 증가시켜줌
			String levelsql="update board set re_level =re_level+1 where ref=? and re_level > ?";			
			//쿼리실행객체 선언
			pstmt=conn.prepareStatement(levelsql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			//쿼리실행
			pstmt.executeUpdate();

			//답변글 데이터를 저장
			String sql =" insert into BOARD (NUM, WRITER, EMAIL, SUBJECT, PASSWORD, REG_DATE, REF, ";
			   sql +="	RE_STEP, RE_LEVEL, READCOUNT, CONTENT) "; 
			   sql +=" values(board_seq.NEXTVAL, ? ,? , ?, ?, sysdate, ?, ?, ? , 0, ? ) ";
			pstmt =conn.prepareStatement(sql);
			//?에 값을 대입
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);//부모의 ref값을 넣어줌
			pstmt.setInt(6, re_step+1);//답글이기에 부모 글 re_step 에 1을 더해줌
			pstmt.setInt(7, re_level+1);
			pstmt.setString(8, bean.getContent());
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			closeAll(rs, pstmt, conn);
		}
		
	}

}

package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentcarDAO {
	
	//데이터 베이스 연결
	public Connection getCon(){
		Connection conn = null;		
		try{			
			Context initCon=new InitialContext();
			Context envCon =(Context)initCon.lookup("java:comp/env");
			DataSource ds =(DataSource) envCon.lookup("jdbc/pool");
			conn=ds.getConnection();			
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}	
	
	//메인 최신순 3대의 자동차를 리턴하는 메소드
	public ArrayList<CarBean> getMainSelectCar(){
		String sql ="select * from RENTCAR  order by no desc";	
		return commonCarBean(sql, true, 3);
	}
	
	// 메인 배너 3대의 자동차를 리턴하는 메소드
	public ArrayList<CarBean> getMainBannerSelectCar(){
		String sql ="select * from RENTCAR  order by no asc";	
		return commonCarBean(sql, true, 3);
	}
	
	
	// 최신순 6대의 자동차를 리턴하는 메소드
	public ArrayList<CarBean> getSelectCar(){
		String sql ="select * from RENTCAR  order by no desc";	
		return commonCarBean(sql, true, 6);
	}
	
	
	//카테고리별 자동차 리스트를 저장하는 메소드
	public ArrayList<CarBean> getCategoryCar(int cate){
		//sql injection 에 대한 보안상 파라미터값이 숫자가 아니면  cate 값은 1로변경 
		if(!isNumeric(String.valueOf(cate))) cate=1 ;
		String sql="select * from rentcar where category=" +cate;
		return commonCarBean(sql, false, 0);
	}
	
	//모든 차량을 검색하는 메소드
	public  ArrayList<CarBean> getAllCar(){
		String sql="select * from rentcar ";
		return commonCarBean(sql, false, 0);
	}
	
	
	//하나의 자동차 정보를 리턴하는 메소드
	public CarBean getOneCar(int no){
		//sql injection 에 대한 보안상 파라미터값이 숫자가 아니면  no 값은 1로변경 
		if(!isNumeric(String.valueOf(no))) no=1 ;
	
		String sql ="select * from RentCar where no="+no;
		ArrayList<CarBean> list=commonCarBean(sql, false, 0);
		//리턴타입 선언
		CarBean bean =list.get(0);
		return bean;
	}
	
	//보안상 파라미터값이 숫자인지 체크
	public static boolean isNumeric(String s){
		try{
			Double.parseDouble(s);
			return true;
		}catch(NumberFormatException e){
			return false;
		}
	}
	
	
	//회원 정보가 있는지를 비교
	public int getMember(String id, String pass){
		
		Connection conn = getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		int result =0;
		
		try{
			String sql ="select count(*) from member where id =? and pass1= ?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			if(rs.next()){
				result=rs.getInt(1);//0또는 1값이 저장됨
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			closeAll(rs, pstmt, conn);
		}
		return result;
	}
	
	//하나의 예약 정보를 저장하는 메소드
	public void setReserveCar(CarReserveBean  bean){
		
		Connection conn = getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql ="insert into CARRESERVE (RESERVENO, NO, ID, QTY, DDAY, RDAY, USERIN, USEWIFI, USESEAT, USENAVI )"
					+ " VALUES(RESERVE_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt =conn.prepareStatement(sql);
			
			System.out.println(bean.toString());
			
			//?에 값을 대입
			pstmt.setInt(1, bean.getNo());
			pstmt.setString(2, bean.getId());
			pstmt.setInt(3, bean.getQty());
			pstmt.setInt(4, bean.getDday());
			pstmt.setString(5, bean.getRday());
			
			pstmt.setInt(6, bean.getUserin());
			pstmt.setInt(7, bean.getUsewifi());
			pstmt.setInt(8, bean.getUseseat());
			pstmt.setInt(9, bean.getUsenavi());
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			closeAll(rs, pstmt, conn);
		}
	}
	
	//회원의 예약정보를 리턴하는 메소드
	public ArrayList<CarViewBean> getAllReserve(String id){
		
		Connection conn = getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<CarViewBean> list=new ArrayList<CarViewBean>();
		CarViewBean bean=null;

		try{
			//쿼리문
			String sql="select * from  RENTCAR natural join CARRESERVE "
					+ " where  sysdate < to_date(rday, 'YYYY-MM-DD') and id= ?";
			
			pstmt =conn.prepareStatement(sql);
			//?
			pstmt.setString(1, id);
			//결과리턴
			rs=pstmt.executeQuery();
			while(rs.next()){
				bean=new CarViewBean();
				bean.setName(rs.getString("name"));
				bean.setDday(rs.getInt("dday"));
				bean.setImg(rs.getString("img"));
				bean.setPrice(rs.getInt("price"));
				bean.setQty(rs.getInt("qty"));
				bean.setRday(rs.getString("rday"));
				bean.setUsenavi(rs.getInt("usenavi"));
				bean.setUserin(rs.getInt("userin"));
				bean.setUseseat(rs.getInt("useseat"));
				bean.setUsewifi(rs.getInt("usewifi"));
				bean.setReserveno(rs.getInt("reserveno"));
				list.add(bean);
	
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			closeAll(rs, pstmt, conn);
		}
		return list;
	}
	
	//하나의 예약 삭제
	public void carRemoveReserve(int reserveno){
		
		Connection conn = getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql=" delete from CARRESERVE where reserveno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, reserveno);
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
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
	
	// 공통 부분 메소드 로 만듬.
	private ArrayList<CarBean> commonCarBean(String sql, boolean option, int num){
		
		Connection conn = getCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<CarBean> list =new ArrayList<>();
		CarBean bean =null;
		try {
			pstmt=conn.prepareStatement(sql);
			//쿼리 실행후 결과를 Result 타입으로 리턴
			
			rs =pstmt.executeQuery();
			int count=0;
			
			while(rs.next()){			
				bean = new CarBean();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				//벡터를 빈 클래스에 저장
				list.add(bean);
			
				if(option){	
					count++;
					if(count >=num)break; //반복문을 빠져나가시오.
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeAll(rs, pstmt, conn);
		}
		return list;
	}
	
}








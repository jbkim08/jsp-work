<%@page import="db.CarBean"%>
<%@page import="db.RentcarDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rbean" class="db.CarReserveBean">
	<jsp:setProperty name="rbean" property="*" />
</jsp:useBean> 

   
<div class="container marketing" id="marketing2">
   <!-- Three columns of text below the carousel -->
      <div class="row">
<%
	String id =(String)session.getAttribute("id");
	if(id==null){
%> 
	<script>
		alert("로그인후 예약이 가능 합니다.");
		location.href="RentCarMain.jsp?center=MemberLogin.jsp";
	</script>
	
<%
		}
		
		if(rbean.getRday()==null){
	%>		
		<script>
		alert("대여일을 선택하세요");
		history.go(-1);
		</script>
	
<%
		}else{
			
			//날짜 비교
			Date d1 =new Date();
			Date d2=new Date();
			//날짜를 2017-09-27 포멧 해주는 클래스 선언
			SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
			
			d1 =sdf.parse(rbean.getRday());
			d2 =sdf.parse(sdf.format(d2));
			
			//날짜 비교 메소드를 사용
	     	int compare = d1.compareTo(d2);
			//예약하려는 날짜보다 현재날짜가 크다면  -1;
			//예약하려는 날짜와 현재날짜가 같다면 0
			//예약하려는 날짜가 더 크다면 1을 리턴
			
			if(compare < 0){//오늘보다 이전 날짜 선택시
	%>
			
	<script>
		alert("현재 시스템 날짜보다 이전 날짜는 선택할수 없습니다.");
		history.go(-1);
	</script>
			
<%
				}
					
					
					//결과적으로 아무런 문제가 없다면 데이터 저장후 결과 페이지 보여주기
					//아이디 값이 빈클래스에 없기에
					rbean.setId(id);
					
					//데이터 베이스에 빈클래스 저장
					RentcarDAO rdao =new RentcarDAO();
					rdao.setReserveCar(rbean);	
					//차량 정보 얻어오기
					CarBean cbean = rdao.getOneCar(rbean.getNo());
				
					//차량 총 금액
					int totalcar=cbean.getPrice()*rbean.getQty()*rbean.getDday();
				
					//옵션금액
					int usein=0;
					if(rbean.getUserin()==1)usein=10000;
					int usewifi =0;
					if(rbean.getUsewifi()==1)usewifi=10000;
					int useseate=0;
					if(rbean.getUseseat()==1)useseate=10000;
					
				 	int totaloption =(rbean.getQty()*rbean.getDday())*(usein+usewifi+useseate);
			%>		

	  <div class="col-sm-12"> 	
			<h2></h2>
			<div class="table-responsive">
			<table class="table">
				<caption></caption>
				<thead><tr><td colspan="2" class="text-center"><h2>차량 예약 완료 화면</h2></td></tr></thead>
				<tbody>
				 <tr>
				 	<td colspan="2" class="text-right">
				 	 <img src="img/<%= cbean.getImg() %>" class="img-responsive img-rounded" id="resultImg">
				 	</td>
				 </tr>			 
				
				 <tr>
				  <th>차량 총예약금액</th>
				  <td><%= totalcar %>원</td>
				 </tr>
				 
				<tr>
				  <th>차량 총옵션 금액</th>
				  <td><%= totaloption %>원</td>
				</tr>
				 
				<tr>
				 <th>차량 총금액</th>
				 <td><%= totaloption+totalcar %>원  </td>	
				 </tr>
			 </tbody>
			</table>
			</div>
	  </div>


<%
	}
%>
	  
 </div>
 
</div>
 
  <hr class="divider">
 
 
 
 
    
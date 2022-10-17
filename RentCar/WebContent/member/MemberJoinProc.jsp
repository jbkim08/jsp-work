<%@page import="model.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../Header.jsp" />
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<div class="col-sm-3"></div>

				<div class="col-sm-6">

					<%
						request.setCharacterEncoding("UTF-8"); //post 전달 방식일 경우 한글 처리

						//취미 부분은 별도로 읽어들어 다시 빈 클래스에 저장
						String[] hobby = request.getParameterValues("hobby");
						//배열의 있는 내용을 하나의 스트림으로 찾아
						String texthobby = "";

						for (int i = 0; i < hobby.length; i++) {
							texthobby += hobby[i] + " ";
						}
					%>
					<!--  useBean 을 이용하여 한꺼번에 데이터를 받아옴 -->
					<jsp:useBean id="mbean" class="model.MemberBean">
						<jsp:setProperty name="mbean" property="*" />
						<!--  맵핑 시키시오 -->
					</jsp:useBean>


		<%
					texthobby=new String(texthobby.getBytes("ISO_8859_1"),"UTF-8");
					mbean.setHobby(texthobby); //기존 취미는 주소번지가 저장되기에 위에 배열의 
													//내용을 하나의 스트림으로 저장한 변수를 다시입력				
			
					String job =request.getParameter("job");
					job=new String(job.getBytes("ISO_8859_1"),"UTF-8");
					mbean.setJob(job);
					
					//데이터 베이스클래스 객체 생성
					MemberDAO dao=new MemberDAO();
					dao.insertMember(mbean);
													
					
					//회원 가입이 되었다면 회원 정보를 보여주는 페이지로 이동시켜				
		
		%>
		
		<script>
				location.href="RentCarMain.jsp?center=member/MemberList.jsp";
			</script>

				</div>
			</div>
		</div>
	</div>


</body>
</html>







			
<%@page import="model.MemberBean"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- 1.데이터 베이스에서 한회원의 정보를 가져옴 2. table태그를 이용하며 화면에 회원의 정보를 출력 -->
<%
	String id =request.getParameter("id");	//memberlist id 를 받아줌

	MemberDAO mdao =new MemberDAO();
	MemberBean mbean = mdao.oneSelectMember(id); //해당하는 id의 화원정보를 리턴

%>
<div class="container marketing" id="marketing2">
<div class="container-fluid">
          <div class="navbar-header">
            <a class="navbar-brand" href="#">Macaronics.net</a>
        </div>     
</div>

<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="col-sm-2"></div>
				<div class="col-sm-9">
					<h2 class="text-center">회원 정보 수정하기</h2>
					
					<form action="MemberUpdateProc.jsp" method="post">
					
					<table class="table table-striped">
					  <tr>
						<td>아이디</td>
						<td><%= mbean.getId() %></td>
					  </tr>
					  
					  <tr>
						<td>이메일</td>
						<td>
						<input type="email" value="<%= mbean.getEmail() %>" name="email" class="form-control">
						</td>
					  </tr>
					  
					  <tr>
						<td>전화</td>
						<td>
						<input type="tel" value="<%= mbean.getTel() %>" name="tel" class="form-control">
						</td>
					  </tr>
					  
					  <tr>
						<td>패스워드</td>
						<td>
						<input type="password" value="<%= mbean.getPass1() %>" name="pass1" class="form-control">
						</td>
					  </tr>
					  
					<tr>
						<td colspan="2" class="text-center">
						 <input type="hidden" name="id" value="<%= mbean.getId() %>">
						 <input type="submit" value="회원 수정하기" class="btn btn-success">
 <button type="button"  class="btn btn-warning" onclick="location.href='RentCarMain.jsp?center=member/MemberList.jsp'">회원 전체 보기</button>
						 </td>	
					</tr>
						  
					</table>
				
				</form>	
					
				</div>
		</div> <!-- col-sm-12 -->
	</div><!-- row -->
</div> <!-- container end-->
<div>	

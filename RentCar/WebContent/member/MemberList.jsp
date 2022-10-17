<%@page import="model.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
</head>

	<!--  1.데이터 베이스에서 모든회원의 정보를 가져옴. 2. table 태그를 이용하여 화면에 정보를 출력 -->
	<%
		 MemberDAO mdao =new MemberDAO();
		 //회원들의 정보가 얼마나 저장되어있는지 모르기에 가변길이인 ArrayList를 이용하여 데이터를 저장해줌
		 ArrayList<MemberBean> list =mdao.allSelectMember();	
	%>
   
<div class="container marketing" id="marketing2">
   <!-- Three columns of text below the carousel -->
      <div class="row">
        <div class="col-sm-2"></div>
	  <div class="col-sm-8"> 	
			<h2></h2>
			
				<div class="table-responsive text-center">
			
					<table class="table table-hover">
					<thead>
					 <tr><td colspan="4">
						<h2>회원 목록</h2>
						</td></tr>
					</thead>	
						<tr class="success">
							<td>아이디</td>
							<td>이메일</td>
							<td>전화번호</td>
							<td>직업</td>
						</tr>
						
					<%
						for(int i=0; i<list.size(); i++){
							MemberBean bean =list.get(i);// 벡터에 담긴 클래스를 하나씩 추출
						
					%>	
						<tr>
							<td>
							
							<a href="RentCarMain.jsp?center=member/MemberInfo.jsp&id=<%=bean.getId() %>">
							<%= bean.getId()%>
							</a>
							</td>
							
							<td><%= bean.getEmail()%></td>
							<td><%= bean.getTel()%></td>
							<td><%= bean.getJob()%></td>
						</tr>
					<% 
			
						} 
					
					%>
						
					</table>
				
				</div>			
		
				</div>
			</div>
		</div>


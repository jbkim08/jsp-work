<%@page import="model.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.BoardBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.BoardDAO"%>    
<!-- 게시글 보기에 카운터링을 설정하기위한 변수들을 선언  -->
<%

 	//현재 카운터를 클릭한 번호값을 읽어옴
	String pageNum =request.getParameter("pageNum");
	if(pageNum==null){
		pageNum="1";
	}
	//전체 게시글의 내용을 jsp 쪽으로 가져와야 함
	BoardDAO bdao =new BoardDAO();
	
	
	Paging paging=new Paging(pageNum);
	//전체 게시글의 갯수를 읽어드린 메소드 호출
	paging.setTotalCount(bdao.getAllCount());

	
	//최신글 10개를 기준으로 게시글을 리턴 받아주는 메소드 호출
	ArrayList<BoardBean> vec =bdao.getAllBoard(paging.getStartRow(), paging.getEndRow());
	
	
%>

<div class="row">
<div class="container marketing" id="marketing">
	<div class="col-xs-2"></div>
	<div class="col-xs-8 col-md-8">
		<h2 class="text-center">전체 게시글 보기</h2>	
	  
		
		<p class="text-right">
		<input type="button" value="글쓰기"  onclick="location.href='RentCarMain.jsp?center=BoardWrite.jsp'"  class="btn btn-warning">
		</p>
		<div class="table-responsive">
		<table class="table table-bordered table-striped" >
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
<%-- 			<%
				int k=0;
				for(BoardBean bean : vec){
				 	
			%>
			<tr>		
			<td><%= k+1%></td>
			<td><a href="BoardInfo.jsp?num=<%= bean.getNum() %>" ><%= bean.getSubject()  %></a></td>
			<td><%=bean.getWriter() %></td>
			<td><%= bean.getReg_date() %></td>
			<td><%= bean.getReadcount() %></td>
			</tr>
			<%	k++;} %>		
			 --%>
			<%
				for(int i=0; i<vec.size(); i++){
					BoardBean bean =vec.get(i); //벡터에 저장되어 있는 빈클래스를 하나씩 추출
			%>		
							<tr>		
			<td><%= paging.getNumber() -i %></td>
			
			<td><a href="RentCarMain.jsp?center=BoardInfo.jsp?num=<%= bean.getNum() %>" >
			<%
				if(bean.getRe_step() >1){
					for(int j =0; j<(bean.getRe_step()*5); j++){
			%>
					&nbsp;
			<%						
					}
				}		
			%>
			<%= bean.getSubject()  %></a></td>
			
			
			<td><%=bean.getWriter() %></td>
			<td><%= bean.getReg_date() %></td>
			<td><%= bean.getReadcount() %></td>
			</tr> 	
			<%	}%>
			
			<tr>
				<td colspan="5" class="text-center">

				
<!-- 페이지 카우터링 소스를 작성 -->
<nav>
  <ul class="pagination">				
<%
		//이전이라는 링크를 만들건지 파악
		if(paging.getStartPage() >10){		
%>
 <li><a href="RentCarMain.jsp?center=BoardList.jsp&pageNum=<%=paging.getPrev() %>" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
 <%	
		}
 	 //페이징 처리
 	 for(int i=paging.getStartPage(); i<=paging.getEndPage(); i++){
%>
	<li <% if(i==Integer.parseInt(pageNum))
			out.print("class='active'");
		%>><a href="RentCarMain.jsp?center=BoardList.jsp&pageNum=<%=i %>"><%=i %><span class="sr-only">(current)</span></a></li>
	
<% 		 
 	 }    
     //다음 이라는 링크를 만들건지 파악
  	 if( paging.getEndPage() < paging.getPageCount()){
  %>		 
  
<li><a href="RentCarMain.jsp?center=BoardList.jsp&pageNum=<%=paging.getNext() %>" aria-label="next"><span aria-hidden="true">&raquo;</span></a></li>
<%		
			
	}
%>
  </ul>
</nav>	
 	 

			
				
				</td>
			</tr>
		</table>
		</div>
	
	</div>
	 </div>	  
</div>




<jsp:include page="Bottom.jsp"/>
</body>
</html>






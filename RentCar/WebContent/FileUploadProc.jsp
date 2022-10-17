<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");
	//프로젝트내에 만들어질 폴더를 저장할 이름 변수선언
	String realfolder="";
	//실제 만들어질 폴더명을 설정
	String savefolder="/upload";
	//한글
	String encType="UTF-8";
	//저장될 파일 사이즈를 설정
	int maxSize =1024*1024*5;//5m
	
	//파일이 저장될 경로값을 읽어오는 객체
	ServletContext context =getServletContext();
	realfolder =context.getRealPath(savefolder);
	
	
	
	try{
		//클라이언트로 부터 넘어온 데이터를 저장해 주는 객체
		MultipartRequest multi=new MultipartRequest(request,realfolder, 
				maxSize, encType, new DefaultFileRenamePolicy());
		
		String fileName =multi.getFilesystemName("filedata");//파일 파라미터 값
		if(fileName==null){//파일이 업로드 되지 않았을 때
			%>
			<script>alert('파일을 선택해주세요'); history.go(-1);</script>"
<%			
		}
		
%>
	 당신의 이름은 <%= multi.getParameter("name") %>
<%
		out.println(realfolder +"<p>");
	

	}catch(Exception e){
		e.printStackTrace();
	}

%>    
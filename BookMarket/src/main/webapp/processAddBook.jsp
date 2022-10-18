<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<%
	//한글로 입력받기 위해
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	String realFolder = "D:\\JAVA\\upload"; // 웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; // 인코딩 타입
	int maxSize = 5 * 1024 * 1024; // 최대 업로드될 파일의 크기5MB
	//파일을 받을때는 라이브러리의 MultipartReauest로 파라메터들을 받는다.
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, 
			encType, new DefaultFileRenamePolicy());

	String bookId = multi.getParameter("bookId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String author = multi.getParameter("author");
	String publisher = multi.getParameter("publisher");
	String releaseDate = multi.getParameter("releaseDate");
	String totalPages = multi.getParameter("totalPages");
	String description = multi.getParameter("description");	
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;
	//가격이 없으면 0 있으면 정수변환
	if(unitPrice.isEmpty()) price = 0;
	else price = Integer.valueOf(unitPrice);

	long stock;
	//도서재고수 없으면 0 있으면 정수변환(Long타입)
	if (unitsInStock.isEmpty()) stock = 0;
	else stock = Long.valueOf(unitsInStock);
	
	long pages;
	//도서총페이지수 없으면 0 있으면 정수변환(Long타입)
	if (totalPages.isEmpty()) pages = 0;
	else pages = Long.valueOf(totalPages);
	
	//파일의 이름 얻기
	Enumeration files = multi.getFileNames();//파라메터 중에 file인 것들의 이름을 순서대로 files 객체에 입력
	String fname = (String) files.nextElement();
	filename = multi.getFilesystemName(fname); //실제 업로드 된 파일의 전체이름
	
	Book newBook = new Book();
	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setReleaseDate(releaseDate);
	newBook.setTotalPages(pages);
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setCondition(condition);
	newBook.setFilename(filename);

    bookDAO.addBook(newBook);

	response.sendRedirect("books.jsp");
%>
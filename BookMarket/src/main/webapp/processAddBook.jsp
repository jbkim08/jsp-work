<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<%
	//한글로 입력받기 위해
	request.setCharacterEncoding("UTF-8");

	String bookId = request.getParameter("bookId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String releaseDate = request.getParameter("releaseDate");
	String totalPages = request.getParameter("totalPages");
	String description = request.getParameter("description");	
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	
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

    bookDAO.addBook(newBook);

	response.sendRedirect("books.jsp");
%>
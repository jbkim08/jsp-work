package dao;

import java.util.ArrayList;

import dto.Book;

public class BookRepository {
	
	private ArrayList<Book> listOfBooks = new ArrayList<>();
	
	//생성자에 3권의 책을 생성해서 리스트에 입력
	public BookRepository() {
		
		Book html = new Book("ISBN1234", "HTML5+CSS3", 15000);
		html.setAuthor("황재호");
		html.setCategory("Hello Coding");
		html.setCondition("New");
		html.setDescription(
				"워드나 PPT 문서를 만들 수 있나요? 그러면 문제 없습니다. 지금 바로 웹페이지 제작에 도전해보세요. 지금 당장 컴퓨터가 없어도 괜찮습니다. 코드와 실행 화면이 바로 보여서 눈으로만 읽어도 어떻게 작동하는지 쉽게 파악할 수 있는 것은 기본이고, 중간중간 퀴즈를 추가하여 재미있게 게임하듯 복습할 수 있습니다.");
		html.setPublisher("한빛미디어");
		html.setReleaseDate("2018/03/02");
		html.setTotalPages(288);
		html.setUnitsInStock(1000);
		html.setFilename("ISBN1234.jsp");

		Book java = new Book("ISBN1235", "쉽게 배우는 자바 프로그래밍", 27000);
		java.setAuthor("우종정");
		java.setCategory("IT모바일");
		java.setCondition("New");
		java.setDescription(
				"객체 지향의 핵심과 자바의 현대적 기능을 충실히 다루면서도초보자가 쉽게 학습할 수 있게 구성했습니다. 시각화 도구를 활용한 개념 설명과 군더더기 없는 핵심 코드를 통해 개념과 구현을 한 흐름으로 학습할 수 있습니다. 또한 ‘기초 체력을 다지는 예제 → 셀프 테스트 → 생각을 논리적으로 정리하며 한 단계씩 풀어 가는 도전 과제 → 스토리가 가미된 흥미로운 프로그래밍 문제’ 등을 통해 프로그래밍 실력을 차근차근 끌어올릴 수 있습니다.");
		java.setPublisher("한빛아카데미");
		java.setReleaseDate("2017/08/02");
		java.setTotalPages(692);
		java.setUnitsInStock(1000);
		java.setFilename("ISBN1235.jsp");

		Book spring = new Book("ISBN1236", "스프링4 입문", 27000);
		spring.setAuthor("하세가와 유이치, 오오노 와타루, 토키 코헤이(권은철, 전민수)");
		spring.setCategory("IT모바일");
		spring.setCondition("New");
		spring.setDescription(
				"스프링은 단순히 사용 방법만 익히는 것보다 아키텍처를 어떻게 이해하고 설계하는지가 더 중요합니다. 예제를 복사해 붙여넣는 식으로는 실제 개발에서 스프링을 제대로 활용할 수 없습니다. 이 책에서는 웹 애플리케이션의 기초를 다지고 스프링 코어를 살펴보며 클라우드 네이티브 입문까지 다룹니다. 이제 막 실무에 뛰어든 웹 애플리케이션 초급자나 개발 경험은 있지만 스프링은 사용해본 적 없는 분을 대상으로 가능한 한 쉽게 설명합니다.");
		spring.setPublisher("한빛미디어");
		spring.setReleaseDate("2017/11/01");
		spring.setTotalPages(520);
		spring.setUnitsInStock(1000);
		spring.setFilename("ISBN1236.jsp");

		listOfBooks.add(html);
		listOfBooks.add(java);
		listOfBooks.add(spring);
	}
	
	// 리스트의 모든 책을 리턴하는 메소드
	public ArrayList<Book> getAllBooks(){
		return listOfBooks;
	}
	
	// 책ID에 해당하는 한권의 책 객체를 리턴
	public Book getBookById(String bookId) {
		Book bookById = null; //id로 찾은 책
				
		for(Book b: listOfBooks) {
			if(b.getBookId().equals(bookId)) {
				bookById = b;
				break;
			}
		}
				
		return bookById;
	}
	
	// 새 책을 추가하는 메서드
	public void addBook(Book book) {
		listOfBooks.add(book);
	}
}








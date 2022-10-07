package webapp.todo;

import java.util.ArrayList;
import java.util.List;

public class TodoService {

	private static List<Todo> todos = new ArrayList<>();
	// static은 미리 실행됨 (아직 DB가 없어서 일단 테스트용)
	static { 
		todos.add(new Todo("JSP 공부하기", "공부"));
		todos.add(new Todo("서블릿 공부하기", "공부"));
		todos.add(new Todo("휴식하기", "휴식"));
	}
	
	public List<Todo> getTodos(){
		return todos;
	}

	public void addTodo(Todo todo) {
		todos.add(todo);	
	}
	
	public void deleteTodo(Todo todo) {
		//삭제할때 리스트의 todo객체와 입력한 toto객체가 같은지(equals메서드로) 비교해서 같으면 삭제
		todos.remove(todo);
	}
}



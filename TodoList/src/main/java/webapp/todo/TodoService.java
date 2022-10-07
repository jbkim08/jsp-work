package webapp.todo;

import java.util.ArrayList;
import java.util.List;

public class TodoService {

	private static List<Todo> todos = new ArrayList<>();
	// static은 미리 실행됨 (아직 DB가 없어서 일단 테스트용)
	static { 
		todos.add(new Todo("Study JSP"));
		todos.add(new Todo("Study Servlet"));
		todos.add(new Todo("Study Spring"));
	}
	
	public List<Todo> getTodos(){
		return todos;
	}
}

package webapp.todo;

import java.util.Objects;

public class Todo {
	
	private String name; //할일
	private String category; //할일종류
	
	public Todo(String name, String category) {
		this.name = name;
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Todo [name=" + name + ", category=" + category + "]";
	}

	//오른쪽마우스 소스 => hashCode와 equals메소드를 새로 만든다. 이때 이름으로 같음 판별
	@Override
	public int hashCode() {
		return Objects.hash(name);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Todo other = (Todo) obj;
		return Objects.equals(name, other.name);
	}
	
	
	
}

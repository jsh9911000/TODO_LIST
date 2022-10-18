package todoDto;

public class TodoDto {
	private int num;
	private String userID;
	private String todoTitle;
	private String todoContent;
	private String todoDate;
	
	public TodoDto() {}

	public TodoDto(int num, String userID, String todoTitle, String todoContent, String todoDate) {
		super();
		this.num = num;
		this.userID = userID;
		this.todoTitle = todoTitle;
		this.todoContent = todoContent;
		this.todoDate = todoDate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getTodoTitle() {
		return todoTitle;
	}

	public void setTodoTitle(String todoTitle) {
		this.todoTitle = todoTitle;
	}

	public String getTodoContent() {
		return todoContent;
	}

	public void setTodoContent(String todoContent) {
		this.todoContent = todoContent;
	}

	public String getTodoDate() {
		return todoDate;
	}

	public void setTodoDate(String todoDate) {
		this.todoDate = todoDate;
	}


}

package todoService;

import java.util.List;

import todoDao.TodoDao;
import todoDto.TodoDto;

public class TodoService {
	
	private TodoDao todoDao;
	
	public TodoService(TodoDao dao) {
		this.todoDao = dao;
	};
	
	//할 일 추가하는 메소드.
	public boolean insert(TodoDto dto) {
		return todoDao.insert(dto);
	};
	//할 일 전체 목록 조회 메소드.
	public List<TodoDto> selectAll(){
		return todoDao.selectAll();
	};
	//할 일 수정하는 메소드.
	public boolean update(TodoDto dto) {
		return todoDao.update(dto);
	};
	//할 일 삭제하는 메소드.
	public boolean delete(int num) {
		return todoDao.delete(num);
	};
	//할 일 조회하는 메소드.
	public List<TodoDto> selectOne(String id){
		return todoDao.selectOne(id);
	}
}

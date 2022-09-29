package usersService;

import java.util.List;

import usersDao.UsersDao;
import usersDto.UsersDto;

//Service: Dao를 통해서 작업한 데이터를 활용하기 위한 Class.
public class UsersService {
	//필드.
	private UsersDao usersDao;
	
	//생성자.
	public UsersService(UsersDao usersDao) {
		this.usersDao = usersDao;
	}
	
	//메소드.
	//(1)회원 한명 조회 메소드.
	public UsersDto selectOne(int num) {
		return usersDao.selectOne(num);
	}
	//(2)회원 전체 조회 메소드.
	public List<UsersDto> selectAll(){
		return usersDao.selectAll();
	}
}

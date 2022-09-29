package usersDto;

public class UsersDto {
	private int num;
	private String users_id;
	private String users_pwd;
	private String users_name;
	private int users_age;
	private String users_addr;
	private String users_email;
	
	public UsersDto() {}

	public UsersDto(int num, String users_id, String users_pwd, String users_name, int users_age, String users_addr,
			String users_email) {
		super();
		this.num = num;
		this.users_id = users_id;
		this.users_pwd = users_pwd;
		this.users_name = users_name;
		this.users_age = users_age;
		this.users_addr = users_addr;
		this.users_email = users_email;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getUsers_id() {
		return users_id;
	}

	public void setUsers_id(String users_id) {
		this.users_id = users_id;
	}

	public String getUsers_pwd() {
		return users_pwd;
	}

	public void setUsers_pwd(String users_pwd) {
		this.users_pwd = users_pwd;
	}

	public String getUsers_name() {
		return users_name;
	}

	public void setUsers_name(String users_name) {
		this.users_name = users_name;
	}

	public int getUsers_age() {
		return users_age;
	}

	public void setUsers_age(int users_age) {
		this.users_age = users_age;
	}

	public String getUsers_addr() {
		return users_addr;
	}

	public void setUsers_addr(String users_addr) {
		this.users_addr = users_addr;
	}

	public String getUsers_email() {
		return users_email;
	}

	public void setUsers_email(String users_email) {
		this.users_email = users_email;
	}
	
	
	
}

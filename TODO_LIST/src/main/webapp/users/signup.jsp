<%@page import="usersService.UsersService"%>
<%@page import="usersDao.UsersDao"%>
<%@page import="usersDto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String addr = request.getParameter("addr");
	String email = request.getParameter("email");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	UsersDto dto = new UsersDto();
	dto.setUsers_name(name);
	dto.setUsers_age(age);
	dto.setUsers_addr(addr);
	dto.setUsers_email(email);
	dto.setUsers_id(id);
	dto.setUsers_pwd(pwd);
	
	UsersDao dao = new UsersDao();
	UsersService us = new UsersService(dao);
	us.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<h1>회원 가입 성공</h1>
	<button type="button" id="goHome">홈으로</button>
<script>
	document.getElementById("goHome").addEventListener("click", () => {
		location.href = "<%= request.getContextPath() %>";
	})
</script>
</body>
</html>
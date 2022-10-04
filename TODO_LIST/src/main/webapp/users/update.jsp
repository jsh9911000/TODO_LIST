<%@page import="usersService.UsersService"%>
<%@page import="usersDao.UsersDao"%>
<%@page import="usersDto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = (String)session.getAttribute("id");
	
	String pwd = request.getParameter("pwd");
	int age = Integer.parseInt(request.getParameter("age"));
	String addr = request.getParameter("addr");
	String email = request.getParameter("email");
	
	UsersDto dto = new UsersDto();
	dto.setUsers_id(id);
	dto.setUsers_pwd(pwd);
	dto.setUsers_age(age);
	dto.setUsers_addr(addr);
	dto.setUsers_email(email);
	
	UsersDao dao = new UsersDao();
	UsersService us = new UsersService(dao);
	
	boolean isUpdate = us.update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트 성공 페이지입니다.</title>
</head>
<body>
	<h1>${id }님의 정보가 수정되었습니다.</h1>
	<ul>
		<li><a href="info.jsp">회원 정보 페이지</a></li>
		<li><a href="<%= request.getContextPath() %>">홈으로</a></li>
	</ul>
</body>
</html>
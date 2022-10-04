<%@page import="usersDao.UsersDao"%>
<%@page import="usersService.UsersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	session.removeAttribute("id");
	UsersDao dao = new UsersDao();
	UsersService us = new UsersService(dao);
	us.delete(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 탈퇴 성공 페이지</h1>
	<ul>
		<li><a href="<%= request.getContextPath() %>">홈으로</a></li>
	</ul>
</body>
</html>
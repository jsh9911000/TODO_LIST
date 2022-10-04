<%@page import="usersDto.UsersDto"%>
<%@page import="usersService.UsersService"%>
<%@page import="usersDao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	UsersDao dao = new UsersDao();
	UsersService us = new UsersService(dao);
	
	boolean isExist = us.search(id, pwd);
	
	request.setAttribute("id", id);
	request.setAttribute("isExist", isExist);
	
	if(isExist == true){
		session.setAttribute("id", id);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지입니다.</title>
</head>
<body>
	<c:choose>
		<c:when test="${isExist == true }">
			<p>${id }님 반갑습니다.</p>
		</c:when>
		<c:otherwise>
			<p>가입된 회원이 아닙니다. 가입부터 하세요.</p>
		</c:otherwise>
	</c:choose>
	<ul>
		<li><a href="<%= request.getContextPath() %>">홈으로</a></li>
		<c:choose>
			<c:when test="${isExist == true}">
				<li><a href="logout.jsp">로그아웃</a></li>
				<li><a href="updateForm.jsp">회원 정보 수정</a></li>
				<li><a href="deleteForm.jsp">회원 탈퇴 페이지</a></li>
			</c:when>
		</c:choose>
	</ul>
</body>
</html>
<%@page import="usersDto.UsersDto"%>
<%@page import="java.util.List"%>
<%@page import="usersDao.UsersDao"%>
<%@page import="usersService.UsersService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	UsersDao dao = new UsersDao();
	UsersService us = new UsersService(dao);
	List<UsersDto> list = us.selectAll();
	
	//EL로 추출하려면 반드시 request영역에 저장해야 한다.
	request.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 목록 페이지</title>
</head>
<body>
	<h3>멤버 목록 페이지</h3>
	<table border="1">
		<c:choose>
			<c:when test="list.size() == 0">
				<td>회원 목록이 없습니다.</td>
			</c:when>
			<c:otherwise>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<c:forEach var="tmp" items="${list}">
					<td>${tmp.num}</td>
					<td>${tmp.users_name}</td>
					<td>${tmp.users_addr}</td>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>
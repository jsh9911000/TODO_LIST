<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="todoService.TodoService"%>
<%@page import="todoDao.TodoDao"%>
<%@page import="todoDto.TodoDto"%>
<%@page import="usersService.UsersService"%>
<%@page import="usersDao.UsersDao"%>
<%@page import="usersDto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
	String id = (String)session.getAttribute("id");
	
	UsersDao dao = new UsersDao();
	UsersService us = new UsersService(dao);
	
	UsersDto dto = us.selectOne(id);
	
	request.setAttribute("dto", dto);
	
	TodoDto tdto = new TodoDto();
	TodoDao tdao = new TodoDao();
	TodoService ts = new TodoService(tdao);
	
	List<TodoDto> list = new ArrayList<>();
	list = ts.selectOne(id);
	
	request.setAttribute("list", list);
%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 페이지입니다.</title>
</head>
<body>
	<h1>${id}님의 정보입니다.</h1>
		<ul>
		<li><a href="<%= request.getContextPath() %>">홈으로</a></li>
		<li><a href="updateForm.jsp">회원 정보 수정</a></li>
		<li><a href="logout.jsp">로그아웃</a></li>
		<li><a href="deleteForm.jsp">회원 탈퇴</a></li>
		<li><a href="<%= request.getContextPath() %>/todo/list.jsp">전체 목록</a></li>
	</ul>
	<table>
		<thead>
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>주소</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${dto.users_name}</td>
				<td>${dto.users_age}</td>
				<td>${dto.users_addr}</td>
				<td>${dto.users_email}</td>
			</tr>
		</tbody>
	</table>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>날짜</th>
				<th>수정하기</th>
				<th>삭제하기</th>
			</tr>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td>${tmp.num }</td>
						<td>${tmp.todoTitle }</td>
						<td>${tmp.todoContent }</td>
						<td>${tmp.todoDate }</td>
						<td><a href="<%= request.getContextPath() %>/todo/updateForm.jsp?num=${tmp.num}">수정</a></td>
						<td><a href="<%= request.getContextPath() %>/todo/deleteForm.jsp?num=${tmp.num}">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</thead>
	</table>
</body>
</html>
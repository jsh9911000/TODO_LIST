<%@page import="todoDao.TodoDao"%>
<%@page import="todoService.TodoService"%>
<%@page import="todoDto.TodoDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = (String)session.getAttribute("id");

	TodoDao dao = new TodoDao();
	TodoService ts = new TodoService(dao);
	
	List<TodoDto> list = ts.selectAll();
	
	request.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할 일 전체 목록페이지입니다.</title>
</head>
<body>
	<div class="container">
		<ul>
			<li><a href="<%= request.getContextPath() %>/users/info.jsp">${id }</a></li>
		</ul>
		<h1>전체 목록</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>아이디</th>
					<th>제목</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td>${tmp.num }</td>
						<td>${tmp.todoDate }</td>
						<td>${tmp.userID }</td>
						<td>${tmp.todoTitle }</td>
						<td>${tmp.todoContent }</td>
					</tr>				
				</c:forEach>
			</tbody>
		</table>
		<ul>
			<li><a href="<%= request.getContextPath() %>">홈으로</a></li>
		</ul>
	</div>
<script>
	
</script>
</body>
</html>
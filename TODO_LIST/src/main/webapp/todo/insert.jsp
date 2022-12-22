<%@page import="todoService.TodoService"%>
<%@page import="todoDao.TodoDao"%>
<%@page import="todoDto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String date = request.getParameter("date");
	
	TodoDto dto = new TodoDto();
	dto.setUserID(id);
	dto.setTodoTitle(title);
	dto.setTodoContent(content);
	dto.setTodoDate(date);
	
	TodoDao dao = new TodoDao();
	
	TodoService ts = new TodoService(dao);
	
	boolean isSuccess = ts.insert(dto);
	
	request.setAttribute("dto", dto); //html 및 JS에서 dto를 사용하려면 반드시 해야 한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert.jsp</title>
</head>
<body>
	<div class="container">
		<h1>입력하신 내용</h1>
		<table>
			<thead>
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${isSuccess = true }">
					<tr>
						<td>${dto.todoTitle}</td>
						<td>${dto.userID}</td>
						<td>${dto.todoDate}</td>
						<td>${dto.todoContent}</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>내용이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		<ul>
			<li><a href="list.jsp">전체 목록 보기</a></li>
		</ul>
	</div>
</body>
</html>

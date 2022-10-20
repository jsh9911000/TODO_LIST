<%@page import="todoService.TodoService"%>
<%@page import="todoDao.TodoDao"%>
<%@page import="todoDto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 페이지 입니다.</title>
</head>
<body>
	<main>
		<ul>
			<li><a href="<%= request.getContextPath() %>/users/info.jsp">${id }</a></li>
		</ul>
		<h1>할 일 삭제 플랫폼입니다.</h1>
		<h3>번호를 입력하세요.</h3>
		<div class="container">
			<form action="delete.jsp" method="post">
				<label for="number">번호</label>
				<input type="text" name="number" id="number"/>
				<button type="submit">삭제</button>
			</form>
		</div>
	</main>
<script>
	
</script>
</body>
</html>
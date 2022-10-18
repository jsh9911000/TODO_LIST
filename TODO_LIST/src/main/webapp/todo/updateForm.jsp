<%@page import="todoDto.TodoDto"%>
<%@page import="todoService.TodoService"%>
<%@page import="todoDao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 폼입니다.</title>
</head>
<body>
	<main>
		<div class="container">
			<h1>수정</h1>
				<form action="update.jsp" method="post">
					<label for="title">제목</label>
					<input type="text" name="title" id="title" placeholder="제목을 입력하세요"/>
					<label for="content">내용</label>
					<textarea name="content" id="content" cols="30" rows="10"></textarea>
					<label for="date">날짜</label>
					<input type="date" name="date" id="date"/>
					<button type="submit">수정</button>
				</form>
		</div>
	</main>
</body>
</html>
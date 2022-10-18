<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할 일 작성페이지입니다.</title>
</head>
<body>
	<main class="main_container">
		<div class="container">
			<h1>작성 페이지입니다.</h1>
			<form action="insert.jsp" method="post">
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" value="${id }" readonly/>
				<label for="title">제목</label>
				<input type="text" name="title" id="title"/>
				<label for="content">내용</label>
				<textarea name="content" id="content" cols="30" rows="10"></textarea>
				<label for="date">날짜</label>
				<input type="date" name="date" id="date"/>
				<button type="submit" id="addBtn">추가</button>
			</form>
		</div>
	</main>
</body>
</html>
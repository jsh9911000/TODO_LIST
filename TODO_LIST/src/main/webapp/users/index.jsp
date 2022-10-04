<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 관리 페이지</title>
</head>
<body>
	<h3>멤버 관리 페이지</h3>
	<ul>
		<li><a href="<%= request.getContextPath() %>">홈으로</a></li>
		<li><a href="list.jsp">목록보기</a></li>
		<li><a href="signupForm.jsp">회원가입</a></li>
		<li><a href="loginForm.jsp">로그인</a></li>
	</ul>
</body>
</html>
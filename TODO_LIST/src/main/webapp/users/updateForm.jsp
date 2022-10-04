<%@page import="usersDto.UsersDto"%>
<%@page import="usersService.UsersService"%>
<%@page import="usersDao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 페이지입니다.</title>
</head>
<body>
	<h1>회원 정보 수정 페이지</h1>
	<div class=container">
		<form action="update.jsp" method = "post">
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" value="${id }" disabled />
			<label for="pwd">비밀번호</label>
			<input type="text" name="pwd" id="pwd" placeholder="새로운 비밀번호 입력하세요."/>
			<label for="age">나이</label>
			<input type="text" name="age" id="age" placeholder="나이를 입력하세요."/>
			<label for="addr">주소</label>
			<input type="text" name="addr" id="addr" placeholder="새로운 주소를 입력하세요."/>
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" placeholder="새로운 이메일을 입력하세요." />
			<button type="submit">수정</button>
		</form>
	</div>
</body>
</html>
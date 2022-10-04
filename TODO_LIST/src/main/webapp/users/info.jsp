<%@page import="usersService.UsersService"%>
<%@page import="usersDao.UsersDao"%>
<%@page import="usersDto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = (String)session.getAttribute("id");
	
	UsersDao dao = new UsersDao();
	UsersService us = new UsersService(dao);
	
	UsersDto dto = us.selectOne(id);
	
	request.setAttribute("dto", dto);
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
</body>
</html>
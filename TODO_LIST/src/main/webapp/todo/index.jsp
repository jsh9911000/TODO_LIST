<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인덱스 페이지입니다.</title>
</head>
<body>
	<div class="container">
		<ul>
			<li><a href="<%= request.getContextPath() %>/users/info.jsp">${id }</a></li>
		</ul>
		<h1>TODO INDEX</h1>
		<ul>
			<li><a href="list.jsp">전체 목록</a></li>
			<li><a href="insertForm.jsp">할 일 작성</a></li>
			<li><a href="<%= request.getContextPath() %>">홈으로</a></li>
		</ul>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	session.removeAttribute("id");
%>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 폼입니다.</title>
</head>
<body>

<script>
	alert("로그아웃 했습니다.");
	location.href = "<%= request.getContextPath() %>"
</script>
</body>
</html>
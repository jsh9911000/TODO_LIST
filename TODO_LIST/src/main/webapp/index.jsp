<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<ul>
		<li><a href="<%= request.getContextPath()%>/users/index.jsp">멤버 조회 페이지</a></li>
	</ul>
</body>
</html>
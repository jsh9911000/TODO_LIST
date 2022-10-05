<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
	String id = (String)session.getAttribute("id");
%>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지.</title>
<style>
	body{
		background-color: white;	
	}
	.container{
		width: 30%;
		height: 500px;
		margin-top: 200px;
		margin-left: 580px;
		background-color: gray;
		border: 1px solid orange;
		border-radius: 8px;
	}
	#main{
		color: tomato;
		text-align: center;
	}
	#menu{
		list-style: none;
	}
	#userID{
		color: tomato;
	}
</style>
</head>
<body>
	<header>
		<nav class="info">
			<ul>
				<li id="userID"><a href="users/info.jsp">${id}</a></li>
			</ul>
		</nav>
	</header>
	<div class="container">
		<h1 id="main">Welcome to TODO-LIST</h1>
		<ul id="menu">
			<li><a href="<%= request.getContextPath()%>/users/index.jsp" style="text-decoration: none;">MemberShip</a></li>
			<li><a href="<%= request.getContextPath()%>/todo/index.jsp" style="text-decoration:none;">Todo</a></li>
		</ul>
	</div>
</body>
</html>
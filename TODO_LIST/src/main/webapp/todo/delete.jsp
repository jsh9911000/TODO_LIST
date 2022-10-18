<%@page import="todoService.TodoService"%>
<%@page import="todoDao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int number = Integer.parseInt(request.getParameter("number"));
	
	TodoDao dao = new TodoDao();
	TodoService ts = new TodoService(dao);
	
	boolean isDelete = ts.delete(number);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할 일 삭제 폼입니다.</title>
</head>
<body>
	<main>
		<div class="container">
			<c:choose>
				<c:when test="${isDelete = true }">
					<h3>해당 게시글은 삭제되었습니다.</h3>
					<ul>
						<li><a href="<%= request.getContextPath() %>">홈으로</a></li>
						<li><a href="list.jsp">전체 목록</a></li>
						<li><a href="<%= request.getContextPath() %>/users/info.jsp">할 일 목록</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul>
						<li>실패하였습니다. 다시 확인해주세요.</li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</main>
</body>
</html>
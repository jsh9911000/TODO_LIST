<%@page import="todoService.TodoService"%>
<%@page import="todoDao.TodoDao"%>
<%@page import="todoDto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	TodoDto dto = new TodoDto();
	TodoDao dao = new TodoDao();
	TodoService ts = new TodoService(dao);
	
	int number = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String date = request.getParameter("date");
	
	dto.setNum(number);
	dto.setTodoTitle(title);
	dto.setTodoContent(content);
	dto.setTodoDate(date);
	
	boolean isUpdate = ts.update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 완료 페이지입니다.</title>
</head>
<body>

<script>
 	alert("수정되었습니다.");
 	location.href = "<%= request.getContextPath() %>/users/info.jsp";
</script>
</body>
</html>
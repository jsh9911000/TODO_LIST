<%@page import="todoService.TodoService"%>
<%@page import="todoDao.TodoDao"%>
<%@page import="todoDto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	TodoDto dto = new TodoDto();
	TodoDao dao = new TodoDao();
	TodoService ts = new TodoService(dao);
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String date = request.getParameter("date");
	
	dto.setTodoTitle(title);
	dto.setTodoContent(content);
	dto.setTodoDate(date);
	
	boolean isSuccess = ts.update(dto);
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
	location.href = "list.jsp";
</script>
</body>
</html>
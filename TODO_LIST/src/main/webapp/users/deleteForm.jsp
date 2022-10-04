<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 페이지입니다.</title>
</head>
<body>
	<h1>회원 탈퇴 페이지입니다.</h1>
	<h3>탈퇴하시겠습니까?</h3>
	<ul>
		<li><button type="button" id="deleteBtn">예</button></li>
		<li><button type="button" id="notDeleteBtn">아니오</button></li>
	</ul>
<script>
	deleteBtn.addEventListener("click", () => {
		alert("탈퇴되었습니다.");
		location.href = "<%= request.getContextPath() %>/users/delete.jsp";
	})
</script>
</body>
</html>
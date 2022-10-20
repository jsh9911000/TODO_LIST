<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 폼입니다.</title>
</head>
<body>
	<main>
		<div class="container">
			<form action="update.jsp" method="post">
				<label for="num">번호</label>
				<input type="text" name="num" id="num"/>
				<label for="title">제목</label>
				<input type="text" name="title" id="title"/>
				<label for="content">내용</label>
				<textarea name="content" id="content" cols="30" rows="10"></textarea>
				<label for="date">날짜</label>
				<input type="date" name="date" id="date"/>
				<button type="submit">수정</button>
			</form>
		</div>
	</main>
</body>
</html>
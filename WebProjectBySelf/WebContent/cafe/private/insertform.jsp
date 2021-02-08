<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insertform.jsp</title>
</head>
<body>
<div class="container">
	<h1>질문 등록 하기</h1>
	<%-- 스마트 에디터 적용하기 --%>
	<form action="insert.jsp" method="post">
		<label for="">제목</label>
		<input type="text" />
		<br />
		<label for="">내용</label>
		<input type="text" />		
	</form>
</div>
</body>
</html>
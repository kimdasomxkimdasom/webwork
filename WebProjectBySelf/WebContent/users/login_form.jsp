<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/resource.jsp"></jsp:include>
<title>/users/login_form</title>
</head>
<body>
<jsp:include page="/include/navbar.jsp"></jsp:include>
<%-- 로그인 페이지 --%>
<%-- 쿠키  --%>
<div class="container">
	<form action="login.jsp">
		<h1>Please Sign in</h1>
		<div class="form-group">
			<label for="id">아이디</label>
			<input class="form-control" type="text" id="id" name="id"/>
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호</label>
			<input class="form-control" type="password" id="pwd" name="pwd"/>
		</div>
		<button class="btn btn-dark" type="submit">로그인</button>
	</form>
</div>
</body>
</html>
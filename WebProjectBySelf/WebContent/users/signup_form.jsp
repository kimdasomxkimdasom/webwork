<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/resource.jsp"></jsp:include>
<title>/users/signup_form</title>
</head>
<%-- 글자 가운데 정렬 --%>
<body>
<jsp:include page="/include/navbar.jsp"></jsp:include>
<%-- 회원가입 페이지 --%>
<%-- 유효성 여부 추가하기 --%>
<div class="container">
	<h1>Signup Page. Please enter.</h1>
	<br />
	<form action="signup.jsp" method="post">
		<div class="form-group">
			<label for="id">아이디</label>
			<input class="form-control" type="text" id="id" name="id" />
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호</label>
			<input class="form-control" type="password" id="pwd" name="pwd"/>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input class="form-control" type="email" id="email" name="email" />
		</div>
		<br />
		<button class="btn btn-dark" type="submit">가입</button>
		<button class="btn btn-warning" type="reset">입력취소</button>
	</form>
</div>
</body>
</html>
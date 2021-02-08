<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션에 저장된 아이디를 읽어온다
	String id=(String)session.getAttribute("id");
	//DB에 저장된 가입정보를 읽어온다.
	UsersDto dto=UsersDao.getInstance().getDate(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../include/resource.jsp"></jsp:include>
<title>users/private/update_form.jsp</title>
</head>
<body>
<jsp:include page="/include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>Edit Information</h1>
	<form action="update.jsp" method="post">
		<div class="form-group">
			<label for="id">아이디</label>
			<input class="form-control" type="text" id="id" name="id" value="<%=dto.getId() %>" disabled />
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호 <a class="btn btn-dark btn-sm" href="pwdupdate_form.jsp">비밀번호 수정하러가기</a> </label>
			<input class="form-control" type="password" id="pwd" name="pwd" value="<%=dto.getPwd() %>" disabled/>
			
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input class="form-control" type="email" id="email" name="email" value="<%=dto.getEmail() %>"/>
		</div>
		<button class="btn btn-dark" type="submit">수정 완료</button>
		<button class="btn btn-warning" type="reset">수정 취소</button>
	</form>
</div>
</body>
</html>
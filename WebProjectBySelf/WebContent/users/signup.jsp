<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 기입할 회원의 정보를 읽어온다.
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	
	//UsersDto객체에 회원정보를 담고
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	
	//UsersDao객체를 이용해서 DB에 저장한다.
	boolean isSuccess=UsersDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/resource.jsp"></jsp:include>
<title>/users/signup.jsp</title>
</head>
<body>
<div class="container">
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
		<h2>알림</h2>
		<%if(isSuccess) {%>
		<p>
			<strong><%=id %>님 회원가입이 완료 되었습니다.</strong>
			<a href="login_form.jsp">로그인하러 가기</a>
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</p>
		<%}else{ %>
		<p>가입을 실패 했습니다.
			<a href="signup_form.jsp">다시 회원가입하러 가기</a></p>
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		<%} %>
	</div>
</div>
</body>
</html>
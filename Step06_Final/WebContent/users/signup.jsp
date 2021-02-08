<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 가입할 회원의 정보를 읽어온다.
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	//UsersDto 객체에 회원정보를 담고
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	//UsersDao 객체를 이용해서 DB에 저장한다.
	boolean isSuccess=UsersDao.getInstance().insert(dto);
	//결과 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../include/resource.jsp"></jsp:include>
<title>users/singup.jsp</title>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../include/navbar.jsp"></jsp:include>

<div class="container">
	<br />
	<%if(isSuccess){ %>
		<div class="alert alert-success" role="alert">
			<h4 class="alert-heading">Congratulation ! </h4>
			<p>
				<strong><%=id %></strong>회원님 가입 되었습니다.<br />
		  		가입을 축하 드립니다 ! <br />
			</p>
		    <hr>
		    <p class="mb-0"><a href="loginform.jsp">로그인 하러 가기</a></p>
		</div>
	<%}else{ %>
		<div class="alert alert-danger" role="alert">
			<h4 class="alert-heading">Fail ! </h4>
			<p>
				가입을 실패했습니다.
			</p>
		    <hr>
		    <p class="mb-0">
		    	<a href="signup_form.jsp">다시 가입하러 가기</a>
		    </p>
		</div>
	<%} %>
</div>

</body>
</html>
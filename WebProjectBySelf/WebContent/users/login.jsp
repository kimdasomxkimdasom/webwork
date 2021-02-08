<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 아이디와 비밀번호를 읽어온다.
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	//UsersDto 객체에 로그인 정보 담고
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	
	//Dao에 select문 추가
	//DB에 실제로 존재하는지 확인 (유효한 정보인지) 
	boolean isValid=UsersDao.getInstance().isValid(dto);
	
	//유효한 회원정보이면 로그인 처리를 하고 응답
	//그렇지 않으면 틀렸다고 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../include/resource.jsp"></jsp:include>
<title>/users/login.jsp</title>
</head>
<body>
<div class="container">
	<br />
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
		<h2>Alert</h2>
		<%if(isValid){ 
			//로그인완료 session scipe에 "id"라는 키값으로 로그인된 아이디 담기
			session.setAttribute("id", id);%>
			<p>
				<strong><%=id %></strong>님이 로그인 되었습니다.
				<a href="${pageContext.request.contextPath }/index.jsp">확인</a>
			</p>
		<%}else{ %>
			<p>
				아이디 또는 비밀번호가 틀립니다.
				<a href="${pageContext.request.contextPath }/users/login_form.jsp">다시시도</a>
			</p>
		<%} %>
	</div>
</div>
</body>
</html>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인된 아이디를 읽어온다
	String id=(String)session.getAttribute("id");
	//해당 아이디를 이용해서 DB에서 삭제한다
	UsersDao.getInstance().delete(id);
	//로그아웃 처리를 하고 응답한다.
	session.removeAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../include/resource.jsp"></jsp:include>
<title>/users/private/delete.jsp</title>
</head>
<body>
<div class="container">
	<div class="alert alert-danger" role="alert">
		<h2>알림</h2>
		<p>
			<strong><%=id %></strong>님 탈퇴처리가 완료되었습니다.
			<a href="${pageContext.request.contextPath}/">홈페이지로 돌아가기</a>
		</p>
	</div>
</div>
</body>
</html>
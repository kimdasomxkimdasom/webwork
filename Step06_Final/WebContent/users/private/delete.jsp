<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.로그인된 아이디를 읽어온다.
	String id=(String)session.getAttribute("id");
	//2.해당 아이디를 이용해서 DB에서 삭제한다.
	UsersDao.getInstance().delete(id);
	//3.로그아웃 처리를 하고 응답한다.
	session.removeAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<title>/users/private/delete.jsp</title>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../../include/navbar.jsp"></jsp:include>

<div class="container">
	<h1>알림</h1>
	<p>
		<strong><%=id %></strong>님 탈퇴처리가 되었습니다.
		<a href="${pageContext.request.contextPath }/">인덱스로 가기</a>
	</p>
</div>
</body>
</html>
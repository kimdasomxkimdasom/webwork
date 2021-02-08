<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//수정할 회원 정보를 읽어와서
	String id=(String)session.getAttribute("id");
	//파라미터 읽어오기
	String email=request.getParameter("email");
	//DB에 수정 반영하기
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setEmail(email);
	//결과
	boolean isSuccess=UsersDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../include/resource.jsp"></jsp:include>
<title>/users/private/update.jsp</title>
</head>
<body>
<div class="container">
	<div class="alert alert-warning" role="alert">
		<h2>알림</h2>
		<%if(isSuccess){ %>
		<p>
			수정을 완료 했습니다 !
			<a href="${pageContext.request.contextPath}">메인홈페이지로 가기</a>
		</p>
		<%}else{ %>
		<p>
			수정을 실패하였습니다 !
			<a href="${pageContext.request.contextPath}/users/private/update_form.jsp">회원수정페이지로 돌아가기</a>
		</p>
		<%} %>
	</div>
</div>
</body>
</html>
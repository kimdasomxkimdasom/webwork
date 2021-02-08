<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션에서 수정할 아이디를 가져온다
	String id=(String)session.getAttribute("id");
	//파라미터 읽어오기
	String pwd=request.getParameter("pwd");
	String newPwd=request.getParameter("newPwd");
	//DB에 수정반영하기
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setNewPwd(newPwd);
	//결과
	boolean isSuccess=UsersDao.getInstance().pwdUpdate(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../include/resource.jsp"></jsp:include>
<title>/users/private/pwdupdate.jsp</title>
</head>
<body>
<div class="container">
	<div class="alert alert-warning" role="alert">
		<h2>알림</h2>
		<%if(isSuccess){ //만일 비밀번호 수정 성공이면
		//다시 로그인하도록 로그아웃 처리를 한다.
		session.removeAttribute("id");%>
		<p>
			<strong><%=id %></strong>님 비밀번호 수정을 완료 했습니다 !
			<a href="${pageContext.request.contextPath}/users/login_form.jsp">로그인 하러 가기</a>
		</p>
		<%}else{ %>
		<p>
			비밀번호 수정을 실패하였습니다 !
			<a href="${pageContext.request.contextPath}/users/private/pwdupdate_form.jsp">회원수정페이지로 돌아가기</a>
		</p>
		<%} %>
	</div>
</div>
</body>
</html>
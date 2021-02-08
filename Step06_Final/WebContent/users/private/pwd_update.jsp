<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope에서 수정할 회원의 아이디
	String id=(String)session.getAttribute("id");
	//폼 전송되는 파라미터에서 구 비밀번호, 새 비밀번호 읽어오기
	String pwd=request.getParameter("pwd");
	String newPwd=request.getParameter("newPwd");
	//DB에 수정 반영하고 작업 성공여부를 리턴한다.
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setNewPwd(newPwd);
	boolean isSuccess=UsersDao.getInstance().updatePwd(dto);
	//응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<title>/users/private/pwd_update.jsp</title>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../../include/navbar.jsp"></jsp:include>

<div class="container">
	<%if(isSuccess){ //만일 비밀번호 수정 성공이면
		//다시 로그인하도록 로그아웃 처리를 한다.
		session.removeAttribute("id");%>
		<p>
			<strong><%=id %></strong>님의 비밀번호를 수정했습니다.
			<a href="${pageContext.request.contextPath }/users/loginform.jsp">다시 로그인 하세요!</a>
		</p>
	<%} else{ %>
		<p>
			이전 비밀번호가 일치하지 않습니다.
			<a href="pwd_updateform.jsp">다시 시도</a>
		</p>
	<%} %>
</div>
</body>
</html>
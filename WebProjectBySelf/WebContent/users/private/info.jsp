<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	filter 
	1. web.xml 인코딩 필터 정의하기
	2. filter 패키지 생성 : EncodingFilter.java LoginFilter.java
--%>
<%
	//session scope에서 로그인된 아이디 불러오기
	String id=(String)session.getAttribute("id");
	//로그인된 아이디를 이용해서 DB에서 회원가입정보 불러오기
	UsersDto dto=UsersDao.getInstance().getDate(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../include/resource.jsp"></jsp:include>
<title>/users/private/info.jsp</title>
</head>
<body>
<jsp:include page="/include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>information</h1>
	<table class="table">
		<colgroup>
			<col width="200"/>
			<col />
		</colgroup>
		<tr>
			<th>아이디</th>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<th>프로필 이미지</th>
			<td></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><a href="pwdupdate_form.jsp">수정하기</a></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<a href="${pageContext.request.contextPath}/users/private/update_form.jsp" class="btn btn-warning">
		정보 수정</a>
	<a href="javascript:deleteConfirm()" class="btn btn-danger">
		회원 탈퇴</a>
</div>

<script>
	function deleteConfirm(){
		let isDelete=confirm("<%=id %>회원님 정말 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp"
		}
	}
</script>
</body>
</html>
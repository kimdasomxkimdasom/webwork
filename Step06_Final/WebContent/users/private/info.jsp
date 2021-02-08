<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.session scope에서 로그인된 아이디 불러오기
	String id=(String)session.getAttribute("id");
	//2.로그인된 아이디를 이용해서 DB에서 가입정보를 불러온다.
	UsersDto dto=UsersDao.getInstance().getData(id);
	
	//3.가입정보를 입력한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<title>users/info.jsp</title>
<style>
	/* 프로필 이미지를 작은 원형으로 만든다 */
	#profileImage{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
</style>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<nav>
	<ul class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath }/">HOME</a>
		</li>
		<li class="breadcrumb-item active">My Info</li>
	</ul>
</nav>	
<div class="row">
    <div class="col-md-6 offset-md-3">
		<br />
		<h1>Information</h1>
		<table class="table">
			<colgroup> <!-- 칼럼의 숫자만큼 col이 있어야함 -->
				<col width="200"/>
				<col />
			</colgroup>
			<tr>
				<th>아이디</th>
				<td><%=dto.getId() %></td>	
			</tr>
			<tr>
				<th>프로필 이미지</th>
				<td> <!-- 조건부 출력 -->
				<%if(dto.getProfile() == null){ %>
				<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
		  			<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
				</svg>
				<%}else{%>
					<img src="${pageContext.request.contextPath}<%=dto.getProfile() %>"
						id="profileImage"/>
				<%} %>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><a href="pwd_updateform.jsp">수정하기</a></td>
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
		<button type="button" class="btn btn-outline-info"><a href="updateform.jsp">정보 수정</a></button>
		<button type="button" class="btn btn-outline-danger"><a href="javascript:deleteConfirm()">탈퇴</a></button>
																<%-- 자바스크립트로 컨펌 후 삭제 --%>
	</div>
</div>
<script>
	function deleteConfirm(){
		let isDelete=confirm("<%=id %>회원님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp"
		}
	}
</script>
</body>
</html>
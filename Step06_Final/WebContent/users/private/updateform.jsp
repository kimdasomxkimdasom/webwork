<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<title>users/private/updateform.jsp</title>
<style>
	/* 프로필 이미지를 작은 원형으로 만든다 */
	#profileImage{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	/* 프로필 업로드 폼을 화면에 안보이게 숨긴다*/
	#profileForm{
		display : none;
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
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/users/private/info.jsp">My Info</a>
		</li>
		<li class="breadcrumb-item active">Edit Info</li>
	</ul>
</nav>	
<%
	//1. 세션에 저장된 아이디를 이용해서
	String id=(String)session.getAttribute("id");
	//2. DB에 저장된 가입정보를 읽어온다.
	UsersDto dto=UsersDao.getInstance().getData(id);
%>
<div class="row">
    <div class="col-md-6 offset-md-3">
    	<br />
		<h1>Edit Information</h1>
		<p>프로필 이미지
			<a id="profileLink" href="javascript:">
				<%if(dto.getProfile() == null){ %>
					<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
			  			<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
					</svg>
				<%}else{%>
					<img src="${pageContext.request.contextPath}<%=dto.getProfile() %>"
						id="profileImage"/>
				<%} %>
			</a>
		</p>
		<form action="update.jsp" method="post">
			<div class="form-group">
				<label for="id">아이디</label>
				<input class="form-control" type="text" id="id" value="<%=dto.getId() %>" disabled />
			</div class="form-group">
			<div>
				<label for="email">이메일</label>
				<input class="form-control" type="text" id="email" name="email" value="<%=dto.getEmail() %>" />
			</div><br />
			<button type="submit" class="btn btn-outline-dark">수정확인</button>
			<button type="reset" class="btn btn-outline-warning">취소</button>
		</form><br />
		<!-- 웹화면에 안보이게 숨겨놨음  -->
		<!-- 프로필 이미지 업로드 및 수정 테스트 -->
		<form action="profile_upload.jsp" method="post" 
			enctype="multipart/form-data" id="profileForm">
			<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG" />
			<button type="submit" class="btn btn-outline-dark" >업로드</button>
		</form>
	</div>
</div>
<script>
	//프로필 링크를 클릭했을때 실행할 함수 등록
	$("#profileImage").on("click",function(){
		//아이디가 image인 요소를 강제 클릭하기
		$("#image").click();
	});
	//이미지를 선택했을때 실행할 함수 등록
	$("#image").on("change",function(){
		//폼을 강제 제출해서 선택된 이미지가 업로드 되도록 한다.
		$("#profileForm").submit();
	});
</script>
</body>
</html>
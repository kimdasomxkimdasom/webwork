<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope에 "id"라는 키값으로 저장된 문자열이 있는지 확인
	String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="include/resource.jsp"></jsp:include>
<title>index.jsp</title>
</head>
<body>
<jsp:include page="/include/navbar.jsp"></jsp:include>
<div class="container">
	<br />
	<div class="jumbotron jumbotron-fluid">
	  <div class="container">
	    <h1 class="display-4">WELCOME TO SOMU</h1>
	    <p class="lead">This is a test webPage created using JSP. coding by somu</p>
	  </div>
	</div>
	<br />
	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="${pageContext.request.contextPath}/img/003.JPG" class="d-block w-100">
	    </div>
	</div>
	<br />
	<div class="card-deck">
	  <div class="card">
	    <img src="${pageContext.request.contextPath}/img/03.JPG" class="card-img-top" alt="...">
	    <div class="card-body">
	      <h5 class="card-title">Card title</h5>
	      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	    </div>
	  </div>
	  <div class="card">
	    <img src="${pageContext.request.contextPath}/img/05.JPG" class="card-img-top" alt="...">
	    <div class="card-body">
	      <h5 class="card-title">Card title</h5>
	      <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
	    </div>
	  </div>
	  <div class="card">
	    <img src="${pageContext.request.contextPath}/img/04.JPG" class="card-img-top" alt="...">
	    <div class="card-body">
	      <h5 class="card-title">Card title</h5>
	      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
	    </div>
	  </div>
	</div>
	<br />
	<ul class="list-group list-group-flush">
		<li class="list-group-item"><strong><%=id %></strong>님 로그인중...</li>
		<li class="list-group-item"><a href="users/login_form.jsp">로그인 하러가기</a></li>
		<li class="list-group-item"><a href="users/logout.jsp">로그아웃 하러가기<a></li>
		<li class="list-group-item"><a href="users/signup_form.jsp">회원가입 하러가기</a></li>
		<li class="list-group-item"><a href="users/private/info.jsp">회원정보 확인</a></li>
		<li class="list-group-item"><a href="users/private/update_form.jsp">회원정보 수정</a></li>
		<li class="list-group-item"><a href="cafe/list.jsp">Q&A</a></li>
		<li class="list-group-item"><a href="https://www.notion.so/ECLIPSE-b0ddb0ad8f454be3855ddee1013f99f5">Dasom's Notion</a></li>
	</ul>
	
</div>
	
</body>
</html>
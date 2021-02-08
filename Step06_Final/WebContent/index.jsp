<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope에 "id"라는 키값으로 저장된 문자열이 있는지 읽어와 본다.
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
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="include/navbar.jsp"></jsp:include>

<div class="container">
	<br />
	<div class="jumbotron jumbotron-fluid">
	  <div class="container">
	    <h1 class="display-4">WELCOME TO SOMU WEB</h1>
	    <p class="lead">This is test website. coding by somu</p>
	  </div>
	</div>
	
	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  		<div class="carousel-inner">
    		<div class="carousel-item active">
      			<img src="${pageContext.request.contextPath }/img/2022.jpg" 
      				class="d-block w-100" alt="...">
    		</div>
    		<div class="carousel-item">
      			<img src="${pageContext.request.contextPath }/img/2021.jpg" 
      				class="d-block w-100" alt="...">
    		</div>
    		<div class="carousel-item">
      			<img src="${pageContext.request.contextPath }/img/2023.jpg" 
      				class="d-block w-100" alt="...">
    		</div>
  		</div>
  		<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    		<span class="sr-only">Previous</span>
  		</a>
  		<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    		<span class="carousel-control-next-icon" aria-hidden="true"></span>
    		<span class="sr-only">Next</span>
  		</a>
	</div>
	<br />
	<ul class="list-group list-group-flush">
	  <li class="list-group-item"><a href="users/signup_form.jsp">회원가입 하러 가기</a></li>
	  <li class="list-group-item"><a href="users/loginform.jsp">로그인 하러 가기</a></li>
	  <li class="list-group-item"><a href="users/private/info.jsp">회원정보 확인 하러 가기</a></li>
	  <li class="list-group-item"><a href="cafe/list.jsp">카페 글 목록 보러가기</a></li>
	  <li class="list-group-item"><a href="file/list.jsp">자료실 목록 보러가기</a></li>
	  <li class="list-group-item"><a href="file/list2.jsp">자료실 목록 보러가기(MVC패턴)</a></li>
	  <li class="list-group-item"><a href="file/list3">자료실 목록 보러가기(MVC패턴)_Servlet</a></li>
	  <li class="list-group-item"><a href="gallery/list.jsp">갤러리 목록 보러가기(페이징)</a></li>
	  <li class="list-group-item"><a href="gallery/list2.jsp">갤러리 목록 보러가기(스크롤)</a></li>
	  <li class="list-group-item"><a href="gallery/private/upload_form.jsp">사진 업로드</a></li>
	  <li class="list-group-item"><a href="gallery/private/ajax_form.jsp">사진 업로드(ajax/미리보기)</a></li>
	  <li class="list-group-item">
	  	<%-- 만일, id가 null이 아니면 로그인을 한 상태 --%>
	  	<%if(id != null) {%>
		<p>
			현재<a href="users/private/info.jsp"><strong><%=id %></strong></a>님 로그인중
			<a href="users/logout.jsp">로그아웃</a>
		</p>
		<%} %>	
	  </li>
	</ul>
	
</div>
</body>
</html>
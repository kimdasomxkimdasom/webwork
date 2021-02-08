<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<ul>
		<li><a href="member/list.jsp" class="link-dark">회원목록 보기</a></li>
		 <li><a href="todo/todolist.jsp" class="link-dark">할일목록 보기</a></li>
		 <li><a href="test/signup_form.jsp">회원가입 폼 입력하기 </a></li>
	</ul>
	<div class="jumbotron jumbotron-fluid">
	  <div class="container">
	    <h1 class="display-4">WELCOME TO OUR WEB</h1>
	    <p class="lead">memberlist, todolist, signupform</p>
	    <p class="lead">this is index.jsp page</p>
	  </div>
	</div>
	<div class="card-group">
		  <div class="card">
			    <img src="${pageContext.request.contextPath }/img/blake-carpenter-jAtcDTvM6aA-unsplash.jpg" 
					class="card-img-top" alt="...">
			    <div class="card-body">
			      <h5 class="card-title">Card title</h5>
			      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      <p class="card-text"><small class="text-muted">This is bootstrap_card1 </small></p>
			    </div>
		  </div>
		  <div class="card">
			    <img src="${pageContext.request.contextPath }/img/photo-1606931463495-4b700691e88d.jpg"
			    	class="card-img-top" alt="...">
			    <div class="card-body">
			      <h5 class="card-title">Card title</h5>
			      <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
			      <p class="card-text"><small class="text-muted">This is bootstrap_card2</small></p>
		    </div>
		  </div>
		  <div class="card">
			    <img src="${pageContext.request.contextPath }/img/stefano-zocca-ilPRarNlpVE-unsplash.jpg"
			    	class="card-img-top" alt="...">
			    <div class="card-body">
			      <h5 class="card-title">Card title</h5>
			      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
			      <p class="card-text"><small class="text-muted">This is bootstrap_card3</small></p>
			    </div>
		  </div>
	</div>
	<br />
</div>
</body>
</html>
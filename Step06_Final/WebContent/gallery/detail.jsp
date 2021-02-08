<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="test.gallery.dao.GalleryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET 방식 파라미터로 전달되는 자세히 보여줄 글 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. 글번호를 이용해서 DB 에서 글정보를 읽어온다.
	GalleryDto dto=GalleryDao.getInstance().getData(num);
	//3. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../include/resource.jsp"></jsp:include>
<title>/gallery/detail.jsp</title>
<style>
	.card{
		text-align: center;
	}
</style>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<nav>
	<ul class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath }/">HOME</a>
		</li>
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/cafe/list.jsp">Gallery</a>
		</li>
		<li class="breadcrumb-item active">Detail Page</li>
	</ul>
</nav>
<%
	//session scope에서 로그인된 아이디를 읽어와 본다. (null일 수도 있음)
	String id=(String)session.getAttribute("id");
%>
<div class="row">
    <div class="col-md-8 offset-md-2">
		<div class="card" >
			<img src="${pageContext.request.contextPath}<%=dto.getImagePath() %>" class="card-img-top">
			<div class="card-body">
			    <h5 class="card-title"><%=dto.getCaption() %></h5>
			    <p class="card-text">by <strong><%=dto.getWriter() %></strong></p>
			    <p class="card-text"><%=dto.getRegdate() %></p>
			</div>
			<ul class="list-group list-group-flush">
				<li class="list-group-item">
					<a class="btn btn-outline-dark" href="detail.jsp?num=<%=dto.getPrevNum()%>">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
						</svg>
					</a>
			    	<a class="btn btn-outline-dark" href="detail.jsp?num=<%=dto.getNextNum()%>">
			    		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
						</svg>
			    	</a>
		    	</li>
		  	</ul>
		</div>
	</div>
</div>
<br />

</body>
</html>
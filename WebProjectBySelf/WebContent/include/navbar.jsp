<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% %>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #white;">
	<a class="navbar-brand" href="${pageContext.request.contextPath}">SOMU</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	
	<div class="collapse navbar-collapse" id="topNav">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
	      		<a class="nav-link" href="${pageContext.request.contextPath}/gallery/list.jsp">WOMEN</a>
	    	</li>
	    	<li class="nav-item">
	      		<a class="nav-link" href="${pageContext.request.contextPath}/gallery/list.jsp">MEN</a>
	    	</li>
			<li class="nav-item">
	      		<a class="nav-link" href="${pageContext.request.contextPath}/file/list.jsp">Collection</a>
	    	</li>
	    	<li class="nav-item">
	      		<a class="nav-link" href="${pageContext.request.contextPath}/cafe/list.jsp">Q&A</a>
	   		</li>
	    	<li class="nav-item">
	      		<a class="nav-link" href="${pageContext.request.contextPath}/users/about.jsp">About</a>
	    	</li>
	  </ul>
	  	<%
			//로그인된 아이디가 있는지 읽어와 본다.
			String id=(String)session.getAttribute("id");
		%>
		<%if(id==null){ %>
			<a class="btn btn-dark btn-sm" 
			href="${pageContext.request.contextPath }/users/login_form.jsp">Login</a>
			<a class="btn btn-secondary btn-sm ml-1" 
			href="${pageContext.request.contextPath}/users/signup_form.jsp">Signup</a>
		<%}else{ %>
			<span class="navbar-text">
				<a href="${pageContext.request.contextPath }/users/private/info.jsp"><%=id %></a>
				<a class="btn btn-dark btn-sm" href="${pageContext.request.contextPath }/users/logout.jsp">Logout</a>
			</span>
		<%} %>	
	</div>
</nav>
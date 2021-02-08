<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	jsp페이지 안에서의 주석 입니다. 
	여기 작성한 내용은 jsp페이지가 해석하지 않습니다.
	클라이언트 웹브라우저에 출력되지 않습니다.
	
	jsp문법 안에 주석 작성하면 오류날 확률이 높다 
--%>

<%--
	nav 요소는 div요소에 의미를 더한 요소이다.
	-navigation 요소를 포함하고 있다고 알려준다.

 	배경색이 어두운 계열이면 navbar-dark
 	배경색이 밝은 계열이면 navbar-light 클래스를 추가해야한다.
--%>

<%-- 특정 jsp 페이지에 포함 시킬 내용을 jsp페이지에 작성 할 수 있습니다. --%>

<%
	// UI에서 선택한 목록을 색을 조금 다르게 표현하는 방법
	
	// "thisPage" 라는 파라미터 명으로 전달된 문자열 읽어오기
	String thisPage=request.getParameter("thisPage");
	//NullPiontException방지 (500번 버스 안타기)
	if(thisPage==null){
		thisPage="";
	}
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="${pageContext.request.contextPath}">
  	<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-emoji-neutral-fill" viewBox="0 0 16 16">
  		<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm-3 4a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zM10 8c-.552 0-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5S10.552 8 10 8z"/>
	</svg>
  SOMU</a>
  <button class="navbar-toggler"  data-toggle="collapse" data-target="#topNav">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="topNav">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/cafe/list.jsp">Post List</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/file/list.jsp">File List</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/gallery/list.jsp">Gallery</a>
      </li>
	</ul>
		<%
			//로그인된 아이디가 있는지 읽어와 본다.
			String id=(String)session.getAttribute("id");
		%>
		<%if(id==null){ %>
			<a class="btn btn-success btn-sm" 
			href="${pageContext.request.contextPath }/users/loginform.jsp">Login</a>
			<a class="btn btn-secondary btn-sm ml-1" 
			href="${pageContext.request.contextPath}/users/signup_form.jsp">Signup</a>
		<%}else{ %>
			<span class="navbar-text">
				<a href="${pageContext.request.contextPath }/users/private/info.jsp"><%=id %></a>
				<a class="btn btn-warning btn-sm" href="${pageContext.request.contextPath }/users/logout.jsp">Logout</a>
			</span>
		<%} %>	
	</div>
</nav>
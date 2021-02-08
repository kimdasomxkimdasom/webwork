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
<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-expand-sm">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath}">
			<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16">
			  <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"/>
			</svg> ACORN </a>
		<button class="navbar-toggler" data-toggle="collapse" data-target="#topNav">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="topNav">
			<ul class="navbar-nav">
				<li class="nav-item <%=thisPage.equals("member") ? "active" : "" %> ">
					<a class="nav-link" href="${pageContext.request.contextPath}/member/list.jsp">회원 목록</a>
				</li>
				<li class="nav-item <%=thisPage.equals("todo") ? "active" : "" %> ">
					<a class="nav-link" href="${pageContext.request.contextPath}/todo/todolist.jsp">할일 목록</a>
				</li>
		</ul>
		</div>
	</div>
</nav>
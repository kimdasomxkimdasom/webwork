<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 수정할 글의 번호, 제목, 내용을 읽어와서
	int num=Integer.parseInt(request.getParameter("num"));
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	//2. DB에 수정 반영하고
	CafeDto dto=new CafeDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	boolean isSuccess=CafeDao.getInstance().update(dto);
	//3. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<title>/cafe/private/update.jsp</title>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../../include/navbar.jsp"></jsp:include>

	<%if(isSuccess) {%>
		<script>
			alert("수정했습니다.");
			location.href="${pageContext.request.contextPath}/cafe/detail.jsp?num=<%=num%>";
		</script>
	<%}else{ %>
		<br />
		<div class="alert alert-danger" role="alert">
			<h4 class="alert-heading">Fail ! </h4>
			<p>글 수정 실패 !</p>
			<hr />
			<a href="updateform.jsp?num=<%=num%>">다시 시도</a>
		</div>
		
	<%} %>
</body>
</html>
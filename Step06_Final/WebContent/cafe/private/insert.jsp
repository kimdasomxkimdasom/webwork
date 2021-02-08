<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 된 상태기 때문에 글 작성자는 session scope에서 얻어낸다.
	String writer=(String)session.getAttribute("id");
	//1.폼 전송되는 글 제목과 내용을 읽어와서
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	//2.DB에 저장하고
	CafeDto dto=new CafeDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	boolean isSuccess=CafeDao.getInstance().insert(dto);
	//응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<title>/cafe/private/insert.jsp</title>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../../include/navbar.jsp"></jsp:include>

	<%if(isSuccess) { %>
		<script>
			alert("새글이 추가 되었습니다.")
			location.href="${pageContext.request.contextPath}/cafe/list.jsp"
		</script>
	<%}else{ %>
		<script>
			alert("글 작성 실패!")
			location.href="insertform.jsp"
		</script>
	<%} %>
</body>
</html>
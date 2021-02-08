<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET 방식 파라미터로 전달되는 자세히 보여줄 글 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. 글번호를 이용해서 DB 에서 글정보를 읽어온다.
	CafeDto dto=CafeDao.getInstance().getData(num);
	//3. 글 조회수를 올린다. 
	CafeDao.getInstance().addViewCount(num);
	//3. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../include/resource.jsp"></jsp:include>
<title>/cafe/detail.jsp</title>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="cafe" name="thisPage"/>
</jsp:include>
<nav>
	<ul class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath }/">HOME</a>
		</li>
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/cafe/list.jsp">List</a>
		</li>
		<li class="breadcrumb-item active">Detail Page</li>
	</ul>
</nav>
<%
	//session scope에서 로그인된 아이디를 읽어와 본다. (null일 수도 있음)
	String id=(String)session.getAttribute("id");
%>
<div class="container">
	<h2>Detail Page</h2>
	<br />
	<table class="table">
		<colgroup> <!-- 칼럼의 숫자만큼 col이 있어야함 -->
			<col width="300"/>
			<col />
			<col />
			<col />
			<col />
			<col />
		</colgroup>
		<tr>
			<th>글 번호</th>
			<td><%=dto.getNum() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=dto.getViewCount() %></td>
		</tr>
		<tr>
			<th>등록일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<div><%=dto.getContent() %></div>
			</td>
		</tr>
	</table>
	<%if(dto.getWriter().equals(id)) { %>
		<button type="submit" class="btn btn-outline-dark">
			<a href="private/updateform.jsp?num=<%=dto.getNum()%>">글 수정</a>
		</button>
		<button type="reset" class="btn btn-outline-danger">
			<a href="javascript:deleteConfirm()">글 삭제</a>
		</button>
	<%} %>
</div>

<script>
	function deleteConfirm(){
		let isDelete=confirm("글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="private/delete.jsp?num=<%=dto.getNum()%>";
		}
	}
</script>
</body>
</html>
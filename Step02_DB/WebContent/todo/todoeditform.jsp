 <%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 수정할 번호 불러오기
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB에서 해당 번호 불러오기
	TodoDto dto=TodoDao.getInstance().getData(num);
	//3. todoeditform에 기본값으로 넣어주면서 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todo/todoeditform.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
</head>
<body>

<div class="container">
	<h1>할일 수정 하기</h1>
	<form action="todoedit.jsp" method="post">
		
		<!-- 회원정보를 수정 반영 할 때 번호도 필요하기 때문에 폼 제출될때 같이 제출되도록 한다. -->
		<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
		<label for="num">NUM</label>
		<!-- NUM 수정 못하게  -->
		<input type="text" value="<%=dto.getNum() %>" disabled /><br />
		
		<label for="content">CONTENT</label>
		<input type="text" name="content" id="content" value="<%=dto.getContent() %>" /><br />
		<label for="regdate">등록일</label>
		<input type="text" id="regdate" value="<%=dto.getRegdate() %>" disabled /><br />
		
		<button type="submit" class="btn btn-outline-dark">확인</button>
		<button type="reset" class="btn btn-outline-dark">취소</button>
	</form>
</div>

</body>
</html>
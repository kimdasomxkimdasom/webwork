<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.한글이 깨지지 않도록 인코딩 설정
	request.setCharacterEncoding("utf-8");

	//2.폼 전송된 파라미터 읽기 (content)
	String content=request.getParameter("content");
	
	//3.DB에 저장할 내용을 TodoDto에 담기
	TodoDto dto=new TodoDto();
	dto.setContent(content);
	
	//4.TodoDao에 insert만들기
	
	//5.TodoDao객체 이용해서 DB에 저장하기
	//TodoDao dao=TodoDao.getInstance();
	//boolean isSuccess=dao.insert(dto);
	boolean isSuccess=TodoDao.getInstance().insert(dto);
	
	//6.클라이언트에게 결과 응답하기
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todo/todoinsert.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
</head>
<body>
	<%if(isSuccess){ %>
		<!-- 성공하면 자동으로 페이지 이동 -->
		<script>
			//javascript를 클라이언트에게 로딩시켜서 페이지 이동 시키기
			location.href="todolist.jsp" //<- 페이지 이동시켜주는 기능
		</script>
	<%} else{ %>
		<p>할 일 추가 실패! <a href="insertform.jsp">다시 작성</a></p>
	<%} %>
</body>
</html>
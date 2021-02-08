<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.폼 전송된 파라미터를 읽어낼 때 한글이 깨지지 않도록 인코딩 설정
	request.setCharacterEncoding("utf-8");
	
	//2.수정할 num,content 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));
	String content=request.getParameter("content");
	
	//3.ToDto 객체에 수정할 회원의 정보를 담는다
	TodoDto dto=new TodoDto(); 
	dto.setNum(num);
	dto.setContent(content);
	
	//4.DB에 수정 반영하기
	//TodoDao dao=new TodoDao();
	//boolean isSuccess=dao.update(dto);
	boolean isSuccess=TodoDao.getInstance().update(dto);
	
	//5.응답
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="continer">
	<%if(isSuccess){ %>
		<p>
			<strong><%=num %></strong>번 할일을 수정 했습니다.
			<a href="todolist.jsp">목록보기</a>			
		</p>
	<%}else{ %>
		<p>
			수정 실패 !
			<a href="todoeditform.jsp?num"><%=num %>다시 작성</a>
		</p>
	<%} %>
</div>

</body>
</html>
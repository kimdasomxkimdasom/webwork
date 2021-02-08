<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	/*
		/test/buy.jsp?num=999&type=ABC
		
		위와 같은 GET방식 요청 파라미터 추출하기
		
		num이라는 파라미터명으로 999라는 문자열과
		type이라는 파라미터명으로 ABC라는 문자열이 전송된다.
	*/
	
	//String num=request.getParameter("num");
	//읽어온 파라미터를 실제 숫자로 바꾸고 싶으면 아래와 같이 바꾸면 된다.
	int num=Integer.parseInt(request.getParameter("num"));
	String type=request.getParameter("type");
	System.out.println(num+" | "+type);
%>
<p>
	고객님이 선택하신 <strong><%=num %></strong>번 상품
	<strong><%=type %></strong>유형을 주문 완료 했습니다.
</p>
</body>
</html>
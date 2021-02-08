<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/member.jsp</title>
</head>
<body>
<% 
	//MemberServlet 에서 "dto" 라는 키값으로 담은 MemberDto 얻어오기
	//.getAttribute는 object타입이므로, 원래 타입으로 캐스팅을 해줘야한다 ! 
	MemberDto dto=(MemberDto)request.getAttribute("dto");
%>
<h3>회원</h3>
<p>번호 : <%=dto.getNum() %></p>
<p>이름 : <%=dto.getName() %></p>
<p>주소 : <%=dto.getAddr() %></p>
</body>
</html>
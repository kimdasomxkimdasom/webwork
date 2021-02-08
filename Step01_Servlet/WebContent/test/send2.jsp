<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/send2.jsp</title>
</head>
<body>
<%
	//한글 깨지지 않게
	request.setCharacterEncoding("utf-8");
	//클라이언트가 폼 전송한 파라미터를 읽어와서
	String sendMsg=request.getParameter("msg");
	//콘솔창에 출력하기
	System.out.println("msg2:" +sendMsg);
%>
	<p>클라이언트님 test/send2.jsp 메세지를 받았습니다.</p>
</body>
</html>
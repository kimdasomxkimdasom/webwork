<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/error/404.jsp</title>
</head>
<body>
	<h2>해당 요청 페이지는 존재 하지 않습니다.</h2>
	<p>${pageContext.errorData.requestURI }</p>
	<p>${pageContext.errorData.statusCode}</p>
	
	<p><strong>에러 메세지</strong> : ${requestScope['javax.servlet.error.message'] }</p>
	<p><strong>상태 코드</strong> : ${requestScope['javax.servlet.error.status_code'] }</p>
	<p><strong>요청한 위치</strong> : ${requestScope['javax.servlet.error.request_uri'] }</p>
	<p>${requestScope['javax.servlet.error.exception'] }</p>
	<p>${requestScope['javax.servlet.error.exception_type'] }</p>
</body>
</html>
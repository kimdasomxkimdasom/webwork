<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>인덱스 페이지 입니다.</h1>
	<ul>
		<li><a href="fortune">오늘의 운세</a></li>
		<li><a href="member">MEMBER</a></li>
		<li><a href="test/fortune.jsp">서블릿을 거치지 않고 fortune.jsp</a></li>
		<li><a href="test/member.jsp">서블릿을 거치지 않고 member.jsp</a></li>
		<li><a href="test/play.jsp">저장된 닉네임 확인하러 가기</a></li>		
	</ul>
	<h3>폼을 jsp 페이지에 전송</h3>
	<form action="test/save.jsp" method="post">
		<input type="text" name="nick" placeholder="닉네임 입력..."/>
		<button type="submit">닉네임 기억 시키기</button>
	</form>
	<br/>
	<h3>폼을 Servlet 에 전송</h3>
	<form action="test/save" method="post">
		<input type="text" name="nick" placeholder="닉네임 입력..."/>
		<button type="submit">닉네임 기억 시키기</button>
	</form>
</body>
</html>
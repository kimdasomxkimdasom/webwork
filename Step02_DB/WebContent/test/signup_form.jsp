<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/signup_form.jsp</title>
</head>
<body>
	<!-- 
		singup.jsp페이지에서 폼 전송되는 내용을 아래의 테이블에 저장되는 기능을 구현해보세요.
		
		language 칼럼에는 선택하지 않으면  NULL을 넣고
		Java를 선택하면 Java
		Java,Python을 선택하면 Java/Python
		Jaba,Python,C++을 선택하면 Java/Python/C++
		
		CREATE TABLE form_test(
			nick VARCHAR2(20) PRIMARY KEY,
			email CHAR(3),
			concern VARCHAR2(10),
			lan VARCHAR2(10),
			comm CLOB
		);
			
	 -->
	<h3>폼 안에 있는 여러 input 요소 테스트</h3>
	<h1>회원가입 폼 입니다</h1>	
	<form action="signup.jsp" method="post">
		닉네임<input type="text" name="nick"/><br />
		이메일 수신 여부
		<label>
			<input type="radio" name="email" value="yes" checked="checked" />네
		</label>
		<label>
			<input type="radio" name="email" value="no" />아니요
		</label>
		<br />
		관심사
		<select name="concern">
			<option value="">선택</option>
			<option value="game">게임</option>
			<option value="movie">영화</option>
			<option value="etc">기타</option>
		</select>
		<br />
		<!--
			만일 get방식으로 중복체크를 한다면 
			?language=Java&language=Python&language=C++
		-->
		배우고 싶은 컴퓨터 언어 
		<label>
			<input type="checkbox" name="language" value="Java"/>자바
		</label>
			<label>
			<input type="checkbox" name="language" value="Python"/>파이선
		</label>
			<label>
			<input type="checkbox" name="language" value="C++"/>C++
		</label>
		<br />
		하고싶은말 <!-- 이너텍스트가 value가 된다  -->
		<textarea name="comment" cols="35" rows="7"></textarea>
		<br />
		<button type="submit">가입 </button>
	</form>
</body>
</html>
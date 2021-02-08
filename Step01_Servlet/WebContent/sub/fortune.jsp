<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		String[] list= {
				"동쪽으로 가면 김구라를 만나요",
				"서쪽으로 가면 똥을 밟아요",
				"남쪽으로 가면 귀인을 만나요",
				"북쪽으로 가면 돈을 주워요",
				"로또를 사면 1등이 당첨되요"
		};
	%>
	<% 
		//여기는 java coding영역 입니다. 서블릿의 servic() 메소드 안쪽이라고 생각하면 됩니다.
		Random ran=new Random();
		int index=ran.nextInt(5);
		String fortuneToday=list[index];
	%>
	<p>오늘의 운세 : <%=fortuneToday %></p>
</body>
</html>
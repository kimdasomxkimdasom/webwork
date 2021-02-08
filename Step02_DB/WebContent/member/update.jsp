<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.폼 전송된 파라미터를 읽어낼 때 한글이 깨지지 않도록 인코딩 설정
	request.setCharacterEncoding("utf-8");
	
	//2.수정할 회원의 번호,이름,주소 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	
	//3.MemberDto 객체에 수정할 회원의 정보를 담는다
	MemberDto dto=new MemberDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setAddr(addr);
	//MemberDto dto=new MemberDto(num, name, addr);
	//이거 이해가 안댐...
	
	//4.DB에 수정 반영하기
	boolean isSuccess=MemberDao.getInstance().update(dto);
	
	//5.응답하기

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess){%>
		<script>
			alert("<%=num%> 번 회원의 정보를 수정 했습니다.")
			location.href="list.jsp"
		</script>
	<%}else{ %>
		<script>
			alert("회원 정보 수정을 실패 했습니다.")
			location.href="updateform.jsp?num=<%=num%>";
			//다시 돌아가기
		</script>
	<%} %>
</body>
</html>
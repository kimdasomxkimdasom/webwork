<%@page import="test.util.DbcpBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//회원가입폼에 입력한 내용을 하나하나 모두 추출해서 콘솔창에 출력해 보세요.

	request.setCharacterEncoding("utf-8");
	
	// <input type="text" name="nick" /> 에 입력한 문자열
	String nick=request.getParameter("nick");
	
	// <input type="radio" name="email" value="yes or no" /> 에 선택값 값
	String email=request.getParameter("email");
	
	// <select name="concern" > 에  선택된 option 값
	String concern=request.getParameter("concern");
	
	// <input type="checkbox" name="language" value="Java or Python or C++"/>
	// 아무것도 check 하지 않았으면 null 이 리턴된다.
	String[] language=request.getParameterValues("language");
	
	// <textarea name="comment" > 에 입력한 문자열
	String comment=request.getParameter("comment");
	
	//콘솔창에 출력 
	System.out.println("---------------------------");
	System.out.println("닉네임 : " + nick);
	System.out.println("이메일 수신여부 : " + email);
	System.out.println("관심사 : " + concern);
	System.out.println("배우고 싶은 컴퓨터 언어 : ");
	
	//체크박스의 value를 저장할 ArrayList객체 생성
	List<String> languageList=new ArrayList<>();
	
	//만일 체크박스 하나라도 체크 했다면
	if(language != null){
		for(String tmp:language){ //String 배열이니까 반복문 
			System.out.println(tmp);
			//ArrayList객체에 value를 담는다.
			languageList.add(tmp);
		}
	}
	
	System.out.println("하고싶은 말 : " + comment);
	System.out.println("---------------------------");
	
	//DB에 저장하기
	//체크박스에 체크된 내용을 DB에 저장하기 위해서 가공하기
	
	String lan=null;
	if(language != null){
		lan="";//일단 빈 문자열을 넣어주고 
		for(int i=0; i<language.length; i++){
			if(i != language.length-1){ //만일 i 가 배열의 마지막 인덱스가 아니라면  
				// lan에 문자열을 이어 붙이고 뒤에 , 를 붙인다.
				lan += language[i]+",";
			}else{ //마지막 인덱스이면, lan에 문자열을 이어 붙이고 뒤에 , 는 붙이지 않는다. 
				lan += language[i];
			}
		}
			
	//1. 원래는 전송된 정보를 dto 에 넣은다음
	//2. Dao 를 이용해서 DB 에 저장
	Connection conn=null;
	PreparedStatement pstmt=null;
	int flag=0;
	try {
		conn = new DbcpBean().getConn();
		//실행할 insert문 구성
		String sql="INSERT INTO form_test"
				+ " (nick, email, concern, lan, comm) "
				+ " VALUES(?, ?, ?, ? ,?)";
		pstmt=conn.prepareStatement(sql);
		//?에 바인딩할 내용이 있으면 바인딩을 한다.
		pstmt.setString(1, nick);
		pstmt.setString(2, email);
		pstmt.setString(3, concern);
		pstmt.setString(4, lan);
		pstmt.setString(5, comment);
		//sql문 실행하고 변화된 row갯수 리턴 받기
		flag=pstmt.executeUpdate();
	}catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="info.jsp?nick=<%=nick%>">DB 에 저장된 내용 불러오기</a>

	<!-- 폼에 입력한 내용을 그대로 읽어오게하기 -->
	<h1>폼에 입력한 내용</h1>
	<form action="signup.jsp" method="post" >
	닉네임<input type="text" name="nick" value="<%=nick %>"/><br />
	
	이메일 수신 여부 1 
	<!-- 첫번째 방법 / 코드가 길지만 명확하다 -->
	<%if(email.equals("yes")){ %>
	<label>
		<input type="radio" name="email" value="yes" checked />네
	</label>
	<label>
		<input type="radio" name="email" value="no" />아니요
	</label>
	<%}else{ %>
	<label>
		<input type="radio" name="email" value="yes" />네
	</label>
	<label>
		<input type="radio" name="email" value="no" checked />아니요
	</label>
	<%} %>
	<br />
	
	이메일 수신 여부 2
	<!-- 두번째 방법 / 코드가 좀 더 간결해졌지만 읽기가 조금 복잡하다  -->
	<label>
		<input type="radio" name="email2" value="yes" 
			<%if(email.equals("yes")){ %>checked<%} %>/>네
	</label>
	<label>
		<input type="radio" name="email2" value="no" 
			<%if(email.equals("no")){ %>checked<%} %>/>아니요
	</label>
	<br />
	
	이메일 수신 여부 3
	<!-- 세번째 방법 / 삼항연산자 --> 
	<label>
		<input type="radio" name="email3" value="yes" 
			<%=email.equals("yes")?"checked":"" %>/>네
	</label>
	<label>
		<input type="radio" name="email3" value="no" 
			<%=email.equals("no") ? "checked" : "" %>/>아니요
	</label>
	<br />
	
	관심사 
	<!-- 삼항연산자 이용 -->
	<select name="concern">
		<option value="">선택</option>
		<option value="game" <%=concern.equals("game") ? "selected" : "" %>>
			게임</option>
		<option value="movie" <%=concern.equals("movie") ? "selected" : "" %>>
			영화</option>
		<option value="etc" <%=concern.equals("etx") ? "selected" : "" %>>
			기타</option>
	</select>
	<br />
	
	배우고 싶은 컴퓨터 언어 
	<!-- 배열이니까(Array) List객체를 생성해서 담고(add)
		contains를 이용해서 삼항연산자로 출력  -->
	<label> 
		<input type="checkbox" name="language" value="Java"
			<%= languageList.contains("Java") ? "checked" : "" %>/>자바
	</label>
		<label>
		<input type="checkbox" name="language" value="Python"
			<%= languageList.contains("Python") ? "checked" : "" %>/>파이선
	</label>
		<label>
		<input type="checkbox" name="language" value="C++"
			<%= languageList.contains("C++") ? "checked" : "" %>/>C++
	</label>
	<br />
	
	하고싶은말 
	<textarea name="comment" cols="35" rows="7" ><%=comment %></textarea>
	<br />
	<button type="submit">가입 </button>
</form>
</body>
</html>
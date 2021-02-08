<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../include/resource.jsp"></jsp:include>
<title>users/loginfrom.jsp</title>
</head>
<body>
<%
	//GET 방식 파라미터 url 이라는 이름으로 전달되는 값이 있는지 읽어와보기
	String url=request.getParameter("url");
	//만일 넘어오는 값이 없다면
	if(url==null){
		//로그인후에 index.jsp 페이지로 가도록 절대경로를 구성한다.
		String cPath=request.getContextPath();
		url=cPath+"/index.jsp";
	}
	
	//쿠키에 저장된 아이디와 비밀번호를 담을 변수
		String savedId="";
		String savedPwd="";
		//쿠키에 저장된 값을 위의 변수에 저장하는 코드를 작성해 보세요.
		Cookie[] cooks=request.getCookies();
		if(cooks!=null){
			//반복문 돌면서 쿠키객체를 하나씩 참조해서 
			for(Cookie tmp: cooks){
				//저장된 키값을 읽어온다.
				String key=tmp.getName();
				//만일 키값이 savedId 라면 
				if(key.equals("savedId")){
					//쿠키 value 값을 savedId 라는 지역변수에 저장
					savedId=tmp.getValue();
				}
				if(key.equals("savedPwd")){
					savedPwd=tmp.getValue();
				}
				
			}
		}
		
%>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<br />
<div class="row">
    <div class="col-md-6 offset-md-3">
	    <h1>Login Form Page 
			<a class="btn btn-success btn-sm" 
				href="${pageContext.request.contextPath}/users/signup_form.jsp">Go to Signup</a>
		</h1>
		<br />
		<form action="login.jsp" method="post">
			<%-- 원래 가려던 목적지 정보를 url이라는 파라미터 명으로 전송될 수 있도록 한다.--%>
			<input type="hidden" name="url" value="<%=url %>" />
			<div class="form-group">
		    	<label for="id">아이디</label>
		    	<input type="text" class="form-control" name="id" id="id" value="<%=savedId %>"/>
		  	</div>
		  	<div class="form-group">
		    	<label for="pwd">비밀번호</label>
		    	<input type="password" class="form-control" name="pwd" id="pwd" value="<%=savedId %>"/>
		  	</div>
		  	<div>
		  		<label>
					<input type="checkbox" name="isSave" value="yes"/>로그인 정보 저장
				</label>
		  	</div>
		  	<button type="submit" class="btn btn-outline-dark">로그인</button>
		  	<button type="reset" class="btn btn-outline-warning">입력취소</button>
		</form>
    </div>
 </div>

</body>
</html>
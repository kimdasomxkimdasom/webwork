<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<title>/users/private/pwd_updateform.jsp</title>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<nav>
	<ul class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath }/">HOME</a>
		</li>
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/users/private/info.jsp">My Info</a>
		</li>
		<li class="breadcrumb-item active">Change Pwd</li>
	</ul>
</nav>	

<div class="row">
    <div class="col-md-6 offset-md-3">
    	<br />
		<h1>Change Password</h1>
		<form action="pwd_update.jsp" method="post" id="myForm">
			<div class="form-group">
				<label for="pwd">기존 비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd" />
			</div>
			<div class="form-group">
				<label for="newPwd">새 비밀번호</label>
				<input class="form-control" type="password" name="newPwd" id="newPwd"/>
				<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
	  			<div class="valid-feedback">비밀번호를 맞게 입력했습니다.</div>
			</div>
			<div class="form-group">
				<label for="newPwd2">새 비밀번호 확인</label>
				<input class="form-control" type="password" name="newPwd2" id="newPwd2" />
			</div>
			<button type="submit" class="btn btn-outline-dark">수정하기</button>
			<button type="reset" class="btn btn-outline-warning">취소</butto>
		</form>
	</div>
</div>
<script>
	//비밀번호 유효성 여부를 관리할 변수를 만들고 초기값 부여하기
	let isNewPwdValid=false;

	//폼에 submit 이벤트가 일어났을떄 실행할 함수를 등록하고
	document.querySelector("#myForm").addEventListener("submit",function(event){
		let pwd1=document.querySelector("#newPwd").value;
		let pwd2=document.querySelector("#newPwd2").value;
		//새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
		if(pwd1 != pwd2){
			alert("비밀번호를 확인 하세요!")
			event.preventDefault();//폼 전송 막기
		}
	});
	
	//id가 newPwd와 newPwd2인 요소에 input(입력)이벤트가 일어났을때 실행할 함수 등록
	$("#newPwd, #newPwd2").on("input",function(){
		//input 이벤트가 언제 일어나는지 확인 요망 
		//consol.log("input!!")
		
		//입력한 두 비밀번호를 읽어온다.
		let newPwd=$("#newPwd").val();
		let newPwd2=$("#newPwd2").val();

		//일단 모든 검증 클래스를 제거하고
		$("#newPwd").removeClass("is-valid is-invalid")
		
		//만일 비밀번호를 4글자 이상 입력하지 않았다면
		if(newPwd.length<4){
			//비밀번호가 유효하지 않다고 표시하고
			$("#newPwd").addClass("is-invalid");
			isPwdValid=false;
			//함수를 여기서 종료
			return;
		}
		
		//두 비밀번호가 같은지 확인해서
		if(newPwd==newPwd2){//만일 같으면
			//유효하다는 클래스를 추가
			$("#newPwd").addClass("is-valid");
			//비밀번호 4글자 이상 입력하면 폼전송 가능
			isNewPwdValid=true;
		}else{//다르면
			//유효하지 않다는 클래스 추가
			$("#newPwd").addClass("is-invalid");
			//비밀번호 4글자 미만으로 입력하면 폼 전송 불가
			isNewPwdValid=false;
		}
	});
	
</script>
</body>
</html>
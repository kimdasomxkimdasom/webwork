<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../include/resource.jsp"></jsp:include>
<title>users/signup_form.jsp</title>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<br />

<div class="row">
    <div class="col-md-6 offset-md-3">
	    <h1>Sign-up Form Page
			<a class="btn btn-success btn-sm" 
				href="${pageContext.request.contextPath}/users/loginform.jsp">Go to Login</a>
		</h1>
		<!-- 
			[ novalidate는 웹브라우저 자체의 검증기능 사용하지 않기 ]
			<input type="email"/> 같은 경우 웹브라우저가 직접 개입하기도 한다.
			해당기능을 사용하지 않기 위해서는 novalidate를 form에 명시해야한다.
		 -->
		<br />
		<form action="signup.jsp" method="post" id="myForm" novalidate>
		  	<div class="form-group">
		    	<label for="id">아이디</label>
		    	<input type="text" class="form-control" name="id" id="id" aria-describedby="idHelp">
		    	<small id="idHelp" class="form-text text-muted">영문자 소문자로 시작하고 문자열을 5자리 이상,10자리 이하로 구성해주세요.</small>
		    	<div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>
		    	<div class="valid-feedback">사용할 수 있는 아이디 입니다.</div>
		  	</div>
		  	<div class="form-group">
		    	<label for="pwd">비밀번호</label>
		    	<input type="password" class="form-control" name="pwd" id="pwd" aria-describedby="pwdHelp">
		   		<small id="idHelp" class="form-text text-muted">문자열을 5자리 이상,10자리 이하로 구성해주세요.</small>
		  		<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
		  		<div class="valid-feedback">비밀번호를 맞게 입력했습니다.</div>
		  	</div>
		  	<div class="form-group">
		    	<label for="pwd2">비밀번호 확인</label>
		    	<input type="password" class="form-control" id="pwd2" aria-describedby="pwd2Help">
		   		<small id="idHelp" class="form-text text-muted">똑같이 한번 더 입력해 주세요.</small>
		  	</div>
		  	<div class="form-group">
		    	<label for="email">이메일</label>
		    	<input type="email" class="form-control" name="email" id="email">
		    	<div class="invalid-feedback">이메일 형식을 확인 하세요.</div>
		  	</div>
		  	<button type="submit" class="btn btn-outline-dark">가입</button>
		  	<button type="reset" class="btn btn-outline-warning">입력취소</button>
		</form>
    </div>
</div>

<script>
	//아이디를 검증할 정규 표현식 
	//영문자 소문자로 시작하고 5~10글자 이내인지 검증
	let reg_id=/^[a-z].{4,9}$/;
	
	//비밀번호를 검증할 정규 표현식
	//5~10글자 이내인지 검증
	let reg_pwd=/^.{5,10}$/;
	
	//이메일을 검증할 정규 표현식 (정확하게 검증하려면 javascript 이메일 정규 표현식을 검색해서 사용!)
	//@가 포함 되어있는지 검증
	let reg_email=/@/;
	
	//아이디 유효성 여부를 관리할 변수 만들고 초기값 부여하기
	let isIdValid=false;
	//비밀번호 유효성 여부를 관리할 변수 만들고 초기값 부여하기
	let isPwdValid=false;
	//이메일 유효성 여부를 관리할 변수 만들고 초기값 부여하기
	let isEmailValid=false;
	//폼 전체의 유효성 여부를 관리할 변수 만들고 초기값 부여하기
	let isFormValid=false;
	
	//폼에 submit 이벤트가 일어 났을때 jquery 를 활용해서 폼에 입력한 내용 검증하기
	// id 가 myForm 인 요소에 submit 이벤트가 일어 났을때 실행할 함수 등록 
	$("#myForm").on("submit", function(){
		//폼 전체의 유효성 여부를 얻어낸다.
		isFormValid = isIdValid && isPwdValid && isEmailValid;
		//만일 폼이 유효하지 않는다면
		if(!isFormValid){
			return false; ///폼 전송 막기 
		}
	});
	
	//이메일을 입력했을때 실행할 함수 등록
	$("#email").on("input", function(){
		let inputEmail=$("#email").val();
		//일단 모든 검증 클래스를 제거하고
		$("#email").removeClass("is-valid is-invalid");
		//만일 이메일이 정규표현식에 매칭되지 않는다면
		if(!reg_email.test(inputEmail)){
			isEmailValid=false;
			$("#email").addClass("is-invalid");
		}else{
			isEmailValid=true;
			$("#email").addClass("is-valid");
		}
	});
		
	//id가 pwd와 pwd2인 요소에 input(입력)이벤트가 일어났을때 실행할 함수 등록
	$("#pwd, #pwd2").on("input",function(){
		//input 이벤트가 언제 일어나는지 확인 요망 
		//consol.log("input!!")
		
		//입력한 두 비밀번호를 읽어온다.
		let pwd=$("#pwd").val();
		let pwd2=$("#pwd2").val();

		//일단 모든 검증 클래스를 제거하고
		$("#pwd").removeClass("is-valid is-invalid")
		
		//만일 비밀번호를 맞게 입력하지 않았다면
		if(!reg_pwd.test(pwd)){
			//비밀번호가 유효하지 않다고 표시하고
			$("#pwd").addClass("is-invalid");
			isPwdValid=false;
			//함수를 여기서 종료
			return;
		}
		
		//두 비밀번호가 같은지 확인해서
		if(pwd==pwd2){//만일 같으면
			//유효하다는 클래스를 추가
			$("#pwd").addClass("is-valid");
			//비밀번호 4글자 이상 입력하면 폼전송 가능
			isPwdValid=true;
		}else{//다르면
			//유효하지 않다는 클래스 추가
			$("#pwd").addClass("is-invalid");
			//비밀번호 4글자 미만으로 입력하면 폼 전송 불가
			isPwdValid=false;
		}
	});
	
	//document.querySelector("#myForm").addEventListener("submit",function(){});
	//이 문자열을 jQuery형식으로 적은게 아래 코드 
	// id가 myForm인 요소에 submit 이벤트가 일어났을때 실행할 함수 등록
	//$("#myForm").on("submit",function(){
		//입력한 두 비밀번호를 읽어와서 다르게 입력했으면 폼 전송 막기
		//let pwd1=$("#pwd").val();
		//let pwd2=$("#pwd2").val();
		//if(pwd1 != pwd2){
			//alert("비밀번호를 확인하세요!");
			//return false; //폼 전송 막기 (jquery)
		//}
	//});
	
	//아이디 입력란에 입력했을때 실행함 함수 등록
	$("#id").on("input",function(){
		//1. 입력한 아이디를 읽어와서
		let inputId=$("#id").val();
		
		//2. 서버에 ajax 요청으로 보내서 사용 가능 여부를 응답 받아서 반응을 보여준다.
		//일단 모든 검증 클래스를 제거하고
		$("#id").removeClass("is-valid is-invalid");
		
		//입력한 문자열이 정규표현식과 매칭되는지 테스트
		if(!reg_id.test(inputId)){//만일 매칭되지 않으면
			//아이디가 유효하지 않다고 표시하고	
			$("#id").addClass("is-invalid");
			isIdValid=false;
			//함수를 여기서 종료한다.
			return;
		}
		
		$.ajax({
			url:"checkid.jsp",
			method:"GET",
			data:"inputId="+inputId,
			success:function(responseData){
					/*
					checkid.jsp 페이지에서 응답할때 
					contentType="application/json" 이라고 설정하면
					함수의 인자로 전달되는 responseData 는 object 이다.
					{isExist:true} or {isExist:false} 
					형식의 object 이기 때문에 바로 사용할수 있다. 
				*/
				console.log(responseData);
					
				if(responseData.isExist){//이미 존재하는 아이디인 경우
					$("#id").addClass("is-invalid");
					//폼 전송 불가 
					idIdValid=false;
				}else{//존재하지 않는 아이디 즉 사용가능한 아이디인 경우 
					$("#id").addClass("is-valid");
					//아이디가 유효하다고 표시한다.
					//무조건 true로 리턴해줘야지만 폼 전송 가능 
					isIdValid=true;
				}
			}
		});
	});
</script>
</body>
</html>
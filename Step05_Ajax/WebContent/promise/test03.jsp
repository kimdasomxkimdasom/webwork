<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>promise/test03.jsp</title>
</head>
<body>
<h1>promise 테스트</h1>
<script>
	/*test01,02 코드를 좀 더 간략하게*/
	new Promise(function(resolve,reject){
		resolve();
		console.log("resolve() 호출 됨");
	})
	.then(function(){
		console.log("then() 안에 있는 함수 호출됨");
	})
	.catch(function(){
		console.log("catch() 안에 있는 함수 호출됨");
	});
	
	console.log("bye !");
</script>
</body>
</html>
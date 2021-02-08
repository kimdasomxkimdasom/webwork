<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>promise/test10.jsp</title>
</head>
<body>
<h1>Promise 테스트</h1>
<script>
	function openDoor(){
		return new Promise(function(resolve){
			setTimeout(function(){
				console.log("1초를 소모하면서 문을 열었습니다.");
				resolve();
			}, 1000);
		});
	}
	function putElephant(){
		return new Promise(function(resolve, reject){
			setTimeout(function(){
				//테스트로 랜덤하게 실패 되도록 한다.
				let ranNum=parseInt(Math.random()*2); //0 또는 1 랜덤한 정수 발생
				
				//코끼리를 넣다가 떄로는 집어 넣을 수 없는 상황이라고 가정
				if(ranNum==1){ //1이 나오면 성공 
					console.log("3초를 소모하면서 코끼리를 집어 넣었습니다.")
					resolve();
				}else{//아니면 실패
					//reject 함수 호출하면서 전달한 데이터는 .catch()안에 있는 함수의
					//인자로 전달된다.
					reject("코끼리가 너무 커유...")
				}
			},3000);
		});
	}
	function closeDoor(){
		return new Promise(function(resolve){
			setTimeout(function(){
				console.log("2초를 소모하면서 문을 닫았습니다.")
				resolve();
			},2000);
		});
	}
	
	openDoor()
	.then(function(){
		return putElephant();
	})
	.then(function(){
		return closeDoor();
	})
	.catch(function(err){
		console.log(err);
	});

</script>
</body>
</html>
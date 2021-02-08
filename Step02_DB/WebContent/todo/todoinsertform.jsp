<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todo/todoinsertform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
	<br />
	<nav>
	<ul class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}">HOME</a>
		</li>
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/member/list.jsp">할일목록</a>
		</li>
		<li class="breadcrumb-item active">할일 추가하기 폼</li>
	</ul>
	</nav>
	<br />
	<form action="${pageContext.request.contextPath}/todo/todoinsert.jsp" method="post" >
		<label for="content">TODO CONTENT</label>
		<input type="text" name="content" id="content" placeholder="할일을 입력하세요..."/>
		<button class="btn btn-outline-dark" type="submit">추가</button>
	</form>
</div>

</body>
</html>
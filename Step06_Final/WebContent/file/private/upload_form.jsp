<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<title>/file/private/upload_form.jsp</title>
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
			<a href="${pageContext.request.contextPath }/file/list.jsp">File List</a>
		</li>
		<li class="breadcrumb-item active">Upload</li>
	</ul>
</nav>

<div class="row">
    
    <div class="col-md-6 offset-md-3">
	    <h1>File Upload Form</h1>
		<br />
		<!-- 
			파일 업로드 폼 작성법
			1. method="post"
			2. enctype="multipart/form-data"
			3. <input type="file" />
				-enctype="multipart/form-data"가 설정된 폼을 전송하면
				폼 전송된 내용을 추출할때 HttpServletRequest 객체로 추출을 할 수 없다!
				MultipartRequest객체를 이용해서 추출해야 한다.
		 -->
		<form action="upload.jsp" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="title">제목</label>
				<input type="text" class="form-control" name="title" id="title" />
			</div>
			<div class="form-group">
				<label for="myFile">첨부파일</label><br />
				<input type="file" class="form-control-file" name="myFile" id="myFile"/>
			</div>
			<br />
			<button type="submit" class="btn btn-dark">업로드 하기</button>
		</form>
    </div>
    
</div>
</body>
</html>
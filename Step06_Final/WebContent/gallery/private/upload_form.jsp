<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//업로드된 이미지 정보를 DB에 저장하고
	
	// /gallery/list.jsp 페이지로 리다이렉트 이동해서 업로드된 이미지 목록을
	// 보여주는 프로그래밍을 해보세요
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<title>/gallery/private/upload_form.jsp</title>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>Photo Upload Form</h1>
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<div>
			<label for="image">Photo</label>
			<input type="text" name="caption" id="caption" />	
		</div>
		<div>
			<label for="image">Photo</label>
			<input type="file" name="image" id="image"
				accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
		</div>
		<button type="submit">Upload</button>
	</form>
</div>
</body>
</html>
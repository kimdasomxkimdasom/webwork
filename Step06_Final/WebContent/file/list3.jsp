<%@page import="java.net.URLEncoder"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 추가하기 --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../include/resource.jsp"></jsp:include>
<title>/file/list3.jsp</title>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="file" name="thisPage"/>
</jsp:include>
<nav>
	<ul class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath }/">HOME</a>
		</li>
		<li class="breadcrumb-item active">File List</li>
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath }/file/private/upload_form.jsp">Upload</a>
		</li>
	</ul>
</nav>	

<div class="container">
	<h1>File List3 (Servlet)
		<a class="btn btn-success btn-sm" 
			href="private/upload_form.jsp">Upload New File</a>
	</h1>
	
	<table class="table table-borderless">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">작성자</th>
				<th scope="col">제목</th>
				<th scope="col">파일명</th>
				<th scope="col">파일크기</th>
				<th scope="col">등록일</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>
		<tbody>
		
		<!-- 반복문(forEach) 돌면서 파일 목록을 불러온다 -->
		<c:forEach var="tmp" items="${requestScope.list }">
			<tr>
				<td>${tmp.num }</td>
				<td>${tmp.writer }</td>
				<td>${tmp.title }</td>
				<td><a href="download.jsp?num=${tmp.num }">${tmp.orgFileName }</a></td>
				<td>${tmp.fileSize }</td>
				<td>${tmp.regdate }</td>
				<td>
					<c:if test="${tmp.writer eq sessionScope.id }"> 
						<a href="javascript:deleteConfirm(${tmp.num });">삭제</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		
		</tbody>
	</table>
	
	<!-- 하단 페이징 버튼 처리 -->
	<nav>
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${startPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link"                                     <%-- &옆에 공백 X --%>
							href="list3?pageNum=${startPageNum -1 }&condition=${condition }&keyword=${encodedK }">Prev</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link" href="javascript:">Prev</a>
					</li>
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<c:choose>
					<c:when test="${i eq pageNum }">
						<li class="page-item active">
							<a class="page-link" href="list3?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
						</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="list3?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
					</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:choose>
				<c:when test="${endPageNum lt startPageNum }">
					<li class="page-item">
						<a class="page-link" href="list3?pageNum=${endPageNum+1}&condition=${condition }&keyword=${encodedK }">Next</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled">
						<a class="page-link" href="javascript:">Next</a>
					</li>
				</c:otherwise>
			</c:choose>
			
		</ul>
	
	</nav>
	
	<!-- 검색 키워드 폼 -->
	<form action="${pageContext.request.contextPath}/file/list3" method="get">
		<label for="condition"><strong>검색 조건</strong></label>
		<select name="condition" id="condition">
			<option value="title_filename" ${condition eq 'title_filename' ? 'selected' : ''}>제목+파일명</option>
			<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
			<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어..." value="${keyword }"/>
		<button class="btn btn-dark btn-sm" type="submit">검색</button>
	</form>

	<%-- 만일 검색 키워드가 존재한다면 몇개의 글이 검색 되었는지 알려준다. --%>
	<c:if test="${not empty keyword }">
		<div class="alert alert-success">
			<strong>${totalRow }</strong> 개의 자료가 검색되었습니다.
		</div>
	</c:if>
</div>
<script>
	function deleteConfirm(num){
		let isDelete=confirm(num+"번 파일을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="private/delete.jsp?num="+num;
		}
	}
</script>
</body>
</html>
<%@page import="java.net.URLEncoder"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=7;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=7;
	
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum=1;
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면
	if(strPageNum != null){
		//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		pageNum=Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	
	//[검색 키워드에 관련된 처리]
	String keyword=request.getParameter("keyword");
	String condition=request.getParameter("condition");
	//만일 키워드가 넘어오지 않는 다면,
	if(keyword==null){
		//키워드와 검색 조건에 빈 문자열을 넣어준다.
		//클라이언트 웹브라우저 출력할때 "null"이 출력되지 않게 하기 위해서
		keyword="";
		condition="";
	}

	//특수기호를 인코딩한 키워드를 미리 준비한다.
	String encodedK=URLEncoder.encode(keyword);

	//startRowNum 과 endRowNum을 CafeDto 객체에 담고
	CafeDto dto=new CafeDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//ArrayList 객체의 참조값을 담을 지역변수를 미리 만든다.
	List<CafeDto> list=null;
	//전체 row 의 갯수를 담을 지역변수를 미리 만든다.
	int totalRow=0;
	//만일 검색 키워드가 넘어온다면
	if(!keyword.equals("")){
		//검색 조건이 무엇이냐에 따라 분기하기
		if(condition.equals("title_content")){//제목+파일명 검색 
			//검색 키워드를 FileDto에 담아서 전달한다.
			dto.setTitle(keyword);
			dto.setContent(keyword);
			//제목+내용 검색일때 호출하는 메소드를 이용해서 목록 얻어오기
			list=CafeDao.getInstance().getListTC(dto);
			//제목+내용 검색일떄 호출하는 메소드를 이용해서 row의 갯수 얻어오기
			totalRow=CafeDao.getInstance().getCountTC(dto);
		}else if(condition.equals("title")){//제목 검색
			dto.setTitle(keyword);
			list=CafeDao.getInstance().getListT(dto);
			totalRow=CafeDao.getInstance().getCountT(dto);
		}else if(condition.equals("writer")){//작성자 검색
			dto.setWriter(keyword);
			list=CafeDao.getInstance().getListW(dto);
			totalRow=CafeDao.getInstance().getCountW(dto);
		}//다른 검색 조건을 추가하고 싶다면 else if()를 계속 추가하면 된다.
	}else{//검색키워드가 넘어오지 않는다면 (검색 조건이 없으면)
		//키워드가 없을때 호출하는 메소드를 이용해서 파일목록을 얻어온다.
		list=CafeDao.getInstance().getList(dto);
		//키워드가 없을때 호출하는 메소드를 이용해서 전체row의 갯수를 얻어온다.
		totalRow=CafeDao.getInstance().getCount();
	}
	
	//하단 시작 페이지 번호 
	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum=totalPageCount; //보정해 준다. 
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../include/resource.jsp"></jsp:include>
<title>/cafe/list.jsp</title>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="cafe" name="thisPage"/>
</jsp:include>
<nav>
	<ul class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath }/">HOME</a>
		</li>
		<li class="breadcrumb-item active">Post List</li>
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath }/cafe/private/insertform.jsp">New Post</a>
		</li>
	</ul>
</nav>

<div class="container">
	<h1>Post List
		<a class="btn btn-success btn-sm" 
			href="private/insertform.jsp">New Post</a>
	</h1>
	
	<table class="table table-borderless">
	  	<thead>
		    <tr>
		      <th scope="col">번호</th>
		      <th scope="col">작성자</th>
		      <th scope="col">제목</th>
		      <th scope="col">조회수</th>
		      <th scope="col">작성일</th>
		    </tr>
	  	</thead>
		<tbody>
		<!-- 반복문 돌면서 글 목록을 불러온다 -->
		<%for(CafeDto tmp:list) {%>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<!-- 제목에 링크 걸기 -->
				<td><a href="detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle() %></a></td>
				<td><%=tmp.getViewCount() %></td>
				<td><%=tmp.getRegdate() %></td>
			</tr>
		<%} %>
		</tbody>
	</table>
	
	<!-- 하단 페이징 버튼 처리 -->
	<nav>
		<ul class="pagination justify-content-center">
			<%if(startPageNum != 1){ %>
				<li class="page-item">
					<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1 %>&condition=<%=condition%>&keyword=<%=encodedK%>">Prev</a>
				</li>
			<%}else{ %>
				<li class="page-item disabled">
					<a class="page-link" href="javascript:">Prev</a>
				</li>
			<%} %>
			<%for(int i=startPageNum; i<=endPageNum; i++) {%>
				<%if(i==pageNum){ %>
					<li class="page-item active">
						<a class="page-link" href="list.jsp?pageNum=<%=i %>&condition=<%=condition%>&keyword=<%=encodedK%>"><%=i %></a>
					</li>
				<%}else{ %>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=i %>&condition=<%=condition%>&keyword=<%=encodedK%>"><%=i %></a>
					</li>
				<%} %>
			<%} %>
			<%if(endPageNum < totalPageCount){ %>
				<li class="page-item">
					<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1 %>&condition=<%=condition%>&keyword=<%=encodedK%>">Next</a>
				</li>
			<%}else{ %>
				<li class="page-item disabled">
					<a class="page-link" href="javascript:">Next</a>
				</li>
			<%} %>
		</ul>
	</nav>
	
	<!-- 검색 키워드 폼 -->
	<form action="list.jsp" method="get">
		<label for="condition"><strong>검색 조건</strong></label>
		<select name="condition" id="condition">
			<option value="title_content" <%=condition.equals("title_content") ? "selected" : "" %>>제목+내용</option>
			<option value="title" <%=condition.equals("title") ? "selected" : "" %>>제목</option>
			<option value="writer" <%=condition.equals("writer") ? "selected" : "" %>>작성자</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어..." />
		<button class="btn btn-dark btn-sm" type="submit">검색</button>
	</form>
	
	<%-- 만일 검색 키워드가 존재한다면 몇개의 글이 검색 되었는지 알려준다. --%>
	<%if(!keyword.equals("")){ %>
		<div class="alert alert-secondary">
			<strong><%=totalRow %></strong> 개의 자료가 검색되었습니다.
		</div>
	<%} %>
</div>
</body>
</html>
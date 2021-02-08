<%@page import="test.todo.dao.TodoDao"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//한페이지에 몇개씩 표시할 것인지
	//int pageRowCount=5;
	final int PAGE_ROW_COUNT=5;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정하기
	int pageNum=1;
	//페이지 번호가 파라미터로 전달되는지 읽어와본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어온다면
	if(strPageNum != null){
		//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		pageNum=Integer.parseInt(strPageNum);	
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;

	//startRowNum과 endRowNum을 MemberDto객체에 담고
	TodoDto dto=new TodoDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);

	//MemberDao 객체를 이용해서 회원목록을 얻어온다.
	List<TodoDto> list=TodoDao.getInstance().getList(dto); //위의dto를 여기로 전달
	
	//5가 들어가는 부분을 유동적으로 바꿀 수 있기 위해서 변수명 지정
	//하단 페이지 이동 UI를 최대 몇개씩 표시할지에 대한 값 
	//int pageDisplayCount=5;
	
	//하단 시작 페이지 번호
	int startPageNum =  1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum = startPageNum+PAGE_DISPLAY_COUNT-1;
	
	//전체 row의 갯수 
	int totalRow=TodoDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);		
	//endPageNum이 이미 전체 페이지 갯수보다 크게 계산이 되었다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum=totalPageCount; //보정해준다.
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todo/todolist.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대경로로 page의 value로 명시해야한다. --%>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="todo" name="thisPage"/>
</jsp:include>
<!-- div로 묶어주기 -->
<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}">HOME</a>
			</li>
			<li class="breadcrumb-item active">할일목록</li>
		
		</ul>
	</nav>
	<h4>
		<a href="${pageContext.request.contextPath}/todo/todoinsertform.jsp" class="link-dark">ADD TODO</a>
	</h4>
	<!-- 제목 -->
	<h1>TODO LIST</h1>
	<table class="table">
		<!-- 테이블의 상단 -->
		<thead class="table-dark">
			<tr>
				<!-- 테이블의 상단 명 -->
				<th>NUM</th>
				<th>CONTENT</th>
				<th>DATE</th>
				<th>EDIT</th>
				<th>DELETE</th>
			</tr>
		</thead>
	<%
		//TodoDao객체를 이용해서 할일목록(getList)불러오기
		//List<TodoDto> list=TodoDao.getInstance().getList();
	%>
		<!-- 테이블의 내용 -->
		<tbody>
			<%for(TodoDto tmp:list) {%>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getContent() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td><a href="todoeditform.jsp?num=<%=tmp.getNum() %>">수정</a></td>
				<td><a href="tododelete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
			</tr>
			<%} %>
		</tbody>
	</table>
	<nav>
		<ul class="pagination">
			<%if(startPageNum != 1) {%> <%-- 시작페이지가 1이 아닐때 Prev를 보여라! --%>
				<li class="page-item">
					<a class="page-link" href="todolist.jsp?pageNum=<%=startPageNum-1 %>">Prev</a>
				</li>
			<%} %>
			<%for(int i=startPageNum; i<=endPageNum; i++) {%>
				<%if (i==pageNum) {%>
					<li class="page-item active">
						<a class="page-link" href="todolist.jsp?pageNum=<%=i%>"><%=i%></a>
					</li>
				<%}else{ %>
					<li class="page-item">
						<a class="page-link" href="todolist.jsp?pageNum=<%=i%>"><%=i%></a>
					</li>
				<%} %>
			<%} %>
			<%if(endPageNum < totalPageCount) { %> <%-- 마지막페이지가 총페이지갯수보다 작을때 Next를 보여라 ! --%>
				<li class="page-item">
					<a class="page-link" href="todolist.jsp?pageNum=<%=endPageNum+1 %>">Next</a>
				</li>
			<%} %>
		</ul>
	</nav>
</div>
</body>
</html>
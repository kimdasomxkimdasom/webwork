<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1.삭제하고싶은 번호 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));
	//2.DB에서 실제로 삭제
	TodoDao.getInstance().delete(num);
	/*
		웹브라우저에게 특정 경로로 요청을 다시 하라고 응답한다.(리다이렉트 응답)
		결과적으로
		<script>
			location.href="list.jsp";
		<script>
		를 로딩한것과 같게 동작된다. (이동이 더 빠르다)
		요청을 다시 하라고 강요하는거 자체가 응답이다.
	*/
	String cPath=request.getContextPath(); //context path 읽어오기
	response.sendRedirect(cPath+"/todo/todolist.jsp"); //절대경로를 전달한다.
%>
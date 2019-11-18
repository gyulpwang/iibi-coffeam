<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- error.jsp 페이지에는 page 지시어에 반드시 isErrorPage라는 속성값으로 
true를 주어야 한다. 그래야 exception이라는 내장 객체를 사용할 수 있다. --%>
<%@ page isErrorPage="true"%>

<%-- IE에서 동작시키기 위한 설정 --%> 
<% response.setStatus(response.SC_OK); %>

<%@ include file="/include/function.jsp" %>

<%	// 예외 메시지
	String msg=exception.getMessage();
	goBack(msg, out);	%>
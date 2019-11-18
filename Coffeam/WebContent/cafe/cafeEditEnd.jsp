<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/function.jsp" %>	<!-- 지시어는 /를 하면 현재 실행되고 있는 곳을 찾는다. -->

<!-- cafeEditEnd.jsp -->

<jsp:useBean id="scvo" class="search.cafe.CafeVO" />
<jsp:useBean id="scdao" class="search.cafe.CafeDAO" scope="page" />

<% if(!request.getMethod().equalsIgnoreCase("post")){
	goUrl("잘못된 요청입니다.", request.getContextPath()+"/coffeam/coffeam_adminHome.jsp", out);
	return;
}
request.setCharacterEncoding("UTF-8"); %>
<jsp:setProperty name="scvo" property="*"/>

<% int n = scdao.updateCafe(scvo);
String msg = (n>0) ? "카페정보 수정완료" : "카페정보 수정실패";
String loc = (n>0) ? request.getContextPath()+"/cafe/coffeam_adminCafe.jsp" : "javascript:history.back()";
goUrl(msg, loc, out); %>
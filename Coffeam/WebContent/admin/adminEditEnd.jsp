<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/function.jsp" %>	<!-- 지시어는 /를 하면 현재 실행되고 있는 곳을 찾는다. -->

<!-- memberEditEnd.jsp -->

<jsp:useBean id="avo" class="user.admin.AdminVO" />
<!-- 다른 회원 정보를 가지고 있으면 안되므로 scope는 session이 아닌 반드시 page로! -->
<jsp:useBean id="adao" class="user.admin.AdminDAO" scope="page" />

<% if(!request.getMethod().equalsIgnoreCase("post")){
	goUrl("잘못된 요청입니다.", request.getContextPath()+"/coffeam/coffeam_adminHome.jsp", out);
	return;
}

request.setCharacterEncoding("UTF-8"); %>
<jsp:setProperty name="avo" property="*"/>

<% int n = adao.updateAdmin(avo);

String msg = (n>0) ? "회원정보 수정완료" : "회원정보 수정실패";
String loc = (n>0) ? request.getContextPath()+"/coffeam/coffeam_adminHome.jsp" : "javascript:history.back()";
goUrl(msg, loc, out); %>
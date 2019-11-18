<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.member.*" %>
<%@ include file="/include/function.jsp" %>
<!-- loginCheckModule.jsp -->
<%
	// 로그인 여부를 체크하는 모듈
	// => 회원 인증이 필요한 페이지에서는 이 모듈을 include 하여 사용한다.
	MemberVO member = (MemberVO)session.getAttribute("loginUser");
	
	if(member == null){	// 로그인 안 한 경우
		goUrl("로그인이 필요합니다.", "javascript:history.back()", out);			
		return;
	}
%>
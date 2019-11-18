<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- adminlogOut.jsp -->
<%
	// 로그아웃 처리 방법
	// [1] 세션에 저장된 특정 변수를 삭제한다.
	/* session.removeAttribute("loginUser");
	session.removeAttribute("loginTime"); */
	
	// ★★★★★ 시험에 나와요! ★★★★★
	// [2] 세션의 모든 변수를 삭제(무효화시킴)
	// 개발자가 예측하지 못해 남아있는 변수들까지 모두 삭제
	session.invalidate();
	response.sendRedirect(request.getContextPath()+"/coffeam/coffeam_Home.jsp");
%>
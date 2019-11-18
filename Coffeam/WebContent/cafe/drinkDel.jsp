<%@page import="search.drink.DrinkDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="search.drink.*" %>

<%-- 사용자 정의 메소드를 모아두는 function.jsp의 소스를 포함시킨다. --%>
<%@ include file="/include/function.jsp" %>

<!-- cafeDel.jsp -->
<%
	// 1. 삭제할 회원의 회원번호 값을 받는다.
	String drinkCodeStr =request.getParameter("drinkCode");

	// 2. 유효성 체크
	if(drinkCodeStr == null || drinkCodeStr.trim().isEmpty()){
		//response.sendRedirect("memberList.jsp");
		goUrl("잘못 들어온 경로입니다.", "coffeam_adminCafe.jsp", out);
		return;
	}
	
	// 3. MemberDAO 빈을 생성한다.(useBean 액션으로)
	%><jsp:useBean id="sddao" class="search.drink.DrinkDAO" scope="session"/><%

	// 4. dao의 삭제 처리 메소드를 호출한다.
	int drinkCode = Integer.parseInt(drinkCodeStr);
	int n = sddao.deleteDrink(drinkCode);
	
	// 5. 결과 메시지 처리 후 회원 목록 페이지로 이동한다.
	String msg = (n>0) ? "음료 삭제 성공" : "음료 삭제 실패";
	String loc = (n>0) ? "coffeam_adminCafe.jsp" : "javascript:history.back()";
	
	goUrl(msg, loc, out);
%>
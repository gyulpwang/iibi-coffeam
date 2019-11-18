<%@page import="user.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.member.*" %>

<%-- 사용자 정의 메소드를 모아두는 function.jsp의 소스를 포함시킨다. --%>
<%@ include file="/include/function.jsp" %>

<!-- memberDel.jsp -->
<%
	// 1. 삭제할 회원의 회원번호 값을 받는다.
	String idxStr =request.getParameter("idx");

	// 2. 유효성 체크
	if(idxStr == null || idxStr.trim().isEmpty()){
		//response.sendRedirect("memberList.jsp");
		goUrl("잘못 들어온 경로입니다.", "memberList.jsp", out);
		return;
	}
	
	// 3. MemberDAO 빈을 생성한다.(useBean 액션으로)
	%><jsp:useBean id="cdao" class="user.member.MemberDAO" scope="session"/><%

	// 4. dao의 삭제 처리 메소드를 호출한다.
	Integer idx = Integer.parseInt(idxStr);
	int n = cdao.deleteMember(idx);
	
	// 5. 결과 메시지 처리 후 회원 목록 페이지로 이동한다.
	String msg = (n>0) ? "회원정보 삭제 성공" : "회원정보 삭제 실패";
	String loc = (n>0) ? request.getContextPath()+"/coffeam/coffeam_adminHome.jsp" : "javascript:history.back()";
	
	goUrl(msg, loc, out);
%>
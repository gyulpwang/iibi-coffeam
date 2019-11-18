<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ include file="/include/function.jsp" %>

<!-- adminloginEnd.jsp -->
<%
	// 1. 관리자가 입력한 값 - 아이디, 비번 받기
	String adminId = request.getParameter("adminId");
	String adminPwd = request.getParameter("adminPwd");
	
	// 아이디 저장에 체크했는지 받아보자.
	String saveUid=request.getParameter("saveAid");
	System.out.println("saveAid ==> "+saveUid);
	
	// 2. 유효성 체크
	if(adminId==null || adminPwd==null
		|| adminId.trim().isEmpty() || adminPwd.trim().isEmpty()){
		goUrl("잘못 들어온 경로입니다.", request.getContextPath()+"/coffeam/coffeam_Home.jsp", out);
		return;
	}
	
	// 3. 아이디와 비번이 db의 member 테이블의 것과 일치하는지 여부를 체크
	// MemberDAO 빈 생성 => loginCheck(userid, pwd)
	%><jsp:useBean id="adao" class="user.admin.AdminDAO" scope="session" /><%
	
	user.admin.AdminVO loginAdmin = adao.loginCheck(adminId.trim(), adminPwd.trim());
	if(loginAdmin!=null){
		/* 회원이 맞다면 회원 정보를 session에 저장하자.
		(HTTP 프로토콜의 특징 => 상태 정보를 저장하기 어려움)
		=> stateless
		상태 정보 유지를 위해 [1] session [2] cookie 등을 사용 */
		/* session : 내장 객체 HttpSession 타입. (Key, Value) */		
		session.setAttribute("loginAdmin", loginAdmin);
		
		// 로그인한 시간도 세션에 저장해보자.
		String logATime = new java.util.Date().toString();
		session.setAttribute("loginATime", logATime);
		
		// 아이디 저장에 체크했다면
		// 1) 쿠키 생성(키값 : saveId, 사용자 아이디)
		// 2) 유효시간(일주일)
		// 3) 쿠키 전송

		// 쿠키 꺼내오기 : 
		// saveId 쿠키 키값이 있다면 value(userid) 값을 꺼내와 로그인 폼에 출력한다.
		Cookie ck = new Cookie("saveId", adminId);
		if(saveUid != null)	{ck.setMaxAge(7*24*60*60);}
		else				{ck.setMaxAge(0);}
		ck.setPath("/");	// path 설정. MyWeb의 어느 곳에서 들어와도 가능하도록.
							// 이렇게 해주지 않으면 저장한 경로로만 접근해야 나온다.
							// => /login/login.jsp에서만 나오게 된다는 것.
		response.addCookie(ck);
		response.sendRedirect(request.getContextPath()+"/coffeam/coffeam_adminHome.jsp");
		return;
	}
	
	/*	[1] 아이디와 비번이 일치하는 경우 => 로그인 인증 처리
		[2] 아이디가 존재하지 않는 경우 => 사용자 정의 예외 발생
		[3] 아이디는 존재하지만 비번이 일치하지 않는 경우 => 사용자 정의 예외 발생	*/
%>
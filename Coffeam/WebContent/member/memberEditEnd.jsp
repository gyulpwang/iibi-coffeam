<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/function.jsp" %>	<!-- 지시어는 /를 하면 현재 실행되고 있는 곳을 찾는다. -->

<!-- memberEditEnd.jsp -->

<%--
[0] POST 방식일 경우 한글 처리
[1] MemberVO 빈을 생성(useBean)
[2] 사용자가 입력한 값(수정값)을 vo에 setting(setProperty)
[3] MemberDAO빈 생성 후 dao의 updateMember(vo) 호출
[4] 그 결과 메시지 처리 후 이동 경로로 이동
--%>

<jsp:useBean id="cvo" class="user.member.MemberVO" />
<!-- 다른 회원 정보를 가지고 있으면 안되므로 scope는 session이 아닌 반드시 page로! -->
<jsp:useBean id="cdao" class="user.member.MemberDAO" scope="page" />

<% if(!request.getMethod().equalsIgnoreCase("post")){
	goUrl("잘못된 요청입니다.", request.getContextPath()+"/coffeam/coffeam_Home.jsp", out);
	return;
}

request.setCharacterEncoding("UTF-8"); %>
<jsp:setProperty name="cvo" property="*"/>

<% int n = cdao.updateMember(cvo);
String msg = (n>0) ? "회원정보 수정완료" : "회원정보 수정실패";
String loc = (n>0) ? request.getContextPath()+"/coffeam/coffeam_Home.jsp" : "javascript:history.back()";
goUrl(msg, loc, out); %>
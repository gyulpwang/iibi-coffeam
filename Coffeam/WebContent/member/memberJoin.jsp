<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.member.*" %>

<%-- MemberVO user = new MemberVO()와 동일. Bean = 객체 생성
Bean을 통해 생성할 때는 기본생성자가 있어야 한다. --%>
<jsp:useBean id="cvo" class="user.member.MemberVO"/>

<%-- setProperty 해주기 전에 인코딩 해줘야 함! 값 넣기 전에 
변환해서 정상적으로 변환된 값이 들어가야 하니까. --%>
<% 
	// POST 방식일 경우 한글 처리
	request.setCharacterEncoding("UTF-8");
%>

<%--user.setName(request.getParameter("name"))과 동일. --%>
<%-- html의 input name명과 빈 객체의 property명이 같으면 "*로 
사용자가 입력한 모든 값을 setter를 통해 넣어주도록 할 수 있다." --%>
<jsp:setProperty name="cvo" property="*"/>	<!-- useBean과 동일하게 cvo로 맞춰줘야함! -->

<!-- MemberDAO 객체를 빈을 사용하여 생성해보세요. -->
<jsp:useBean id="cdao" class="user.member.MemberDAO"/>
<%
	// 유효성 체크(name, userid)
	if(cvo.getName()==null || cvo.getUserid()==null){
		response.sendRedirect("member.jsp");
		return;
	}

	int n = cdao.insertMember(cvo);
	String msg = (n>0) ? "회원가입 성공" : "회원가입 실패";
	String loc = (n>0) ? request.getContextPath()+"/coffeam/coffeam_Home.jsp" : "javascript:history.back()";
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=loc%>";
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="search.cafe.*" %>

<jsp:useBean id="scvo" class="search.cafe.CafeVO"/>
<jsp:setProperty name="scvo" property="*"/>	<!-- useBean과 동일하게 cvo로 맞춰줘야함! -->
<jsp:useBean id="scdao" class="search.cafe.CafeDAO"/>
<%
	// 유효성 체크
	if(scvo.getCafeName()==null){
		response.sendRedirect("cafeInsert.jsp");
		return;
	}

	int n = scdao.insertCafe(scvo);
	String msg = (n>0) ? "카페등록 성공" : "카페등록 실패";
	String loc = (n>0) ? request.getContextPath()+"/cafe/coffeam_adminCafe.jsp" : "javascript:history.back()";
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=loc%>";
</script>
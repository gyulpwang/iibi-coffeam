<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="search.drink.*" %>

<jsp:useBean id="sdvo" class="search.drink.DrinkVO"/>
<jsp:setProperty name="sdvo" property="*"/>	<!-- useBean과 동일하게 cvo로 맞춰줘야함! -->

<jsp:useBean id="sddao" class="search.drink.DrinkDAO"/>
<%
	// 유효성 체크
	if(sdvo.getDrinkName()==null){
		response.sendRedirect("coffeam_adminCafe.jsp");
		return;
	}

	int n = sddao.insertDrink(sdvo);
	String msg = (n>0) ? "음료등록 성공" : "음료등록 실패";
	String loc = (n>0) ? request.getContextPath()+"/cafe/coffeam_adminCafe.jsp" : "javascript:history.back()";
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=loc%>";
</script>
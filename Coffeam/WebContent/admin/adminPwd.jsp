<!-- coffeam_MyPage.jsp -> memberPwd.jsp -> memberEdit.jsp 
비밀번호는 쿠키로 넘겨주면 안되기 때문에 비밀번호가 DAO에서 찾아서 일치하면
memberPwd.jsp를 통해 memberEdit.jsp로 넘겨주고
비밀번호를 틀리면 history.back -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/function.jsp" %>

<jsp:useBean id="adao" class="user.admin.AdminDAO" scope="session"/>
<jsp:useBean id="avo" class="user.admin.AdminVO" scope="session"/>


<script type="text/javascript">
	var goEdit = function(adminNo){
		goEditF.adminNo.value=adminNo;
		goEditF.method="POST";
		goEditF.action="<%=request.getContextPath()%>/admin/adminEdit.jsp";
		goEditF.submit();
	}
</script>
<form name="goEditF">
	<input type="hidden" name="adminNo" id="adminNo" value="<%=request.getParameter("adminNo")%>">
</form>
<%
	// 회원 번호 받기
	String adminNoStr=request.getParameter("adminNo");
	avo = adao.findAdminByAdminNo(Integer.parseInt(adminNoStr));
	String adminPwdStr=avo.getAdminPwd();
	
	goUrl("관리자 인증되었습니다.", "javascript:goEdit("+Integer.parseInt(adminNoStr)+")", out);
%>
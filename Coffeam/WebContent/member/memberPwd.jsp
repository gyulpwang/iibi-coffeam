<!-- coffeam_MyPage.jsp -> memberPwd.jsp -> memberEdit.jsp 
비밀번호는 쿠키로 넘겨주면 안되기 때문에 비밀번호가 DAO에서 찾아서 일치하면
memberPwd.jsp를 통해 memberEdit.jsp로 넘겨주고
비밀번호를 틀리면 history.back -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/function.jsp" %>

<jsp:useBean id="cdao" class="user.member.MemberDAO" scope="session"/>
<jsp:useBean id="cvo" class="user.member.MemberVO" scope="session"/>

<!-- 해야할 일 : coffeam_MyPage에서 입력한 비밀번호와 유저의 원래 비밀번호가 일치하는지 판별하는 코드 작성 -->

<script type="text/javascript">
	var goEdit = function(idx){
		goEditF.idx.value=idx;
		goEditF.method="POST";
		goEditF.action="<%=request.getContextPath()%>/member/memberEdit.jsp";
		goEditF.submit();
	}
</script>
<form name="goEditF">
	<input type="hidden" name="idx" id="idx" value="<%=request.getParameter("idx")%>">
</form>
<%
	// 회원 번호 받기
	String idxStr=request.getParameter("idx");
	cvo = cdao.findMemberByIdx(Integer.parseInt(idxStr));
	String pwdStr=cvo.getPwd();
	
	goUrl("회원 인증되었습니다.", "javascript:goEdit("+Integer.parseInt(idxStr)+")", out);
%>
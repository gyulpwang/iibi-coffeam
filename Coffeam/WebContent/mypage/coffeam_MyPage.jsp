<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, user.member.*" %>
<!DOCTYPE html>
<%@ include file="/login/loginCheckModule.jsp" %>

<jsp:useBean id="dao" class="user.member.MemberDAO" scope="session"/>
<jsp:useBean id="user" class="user.member.MemberVO" scope="session"/>
<jsp:include page="/coffeam_top.jsp"/>
<script type="text/javascript">$('#mypage').addClass('active');</script>
<jsp:include page="/coffeam_noticeAside.jsp"/>
<%	// 세션에 저장된 객체를 꺼낸다.(loginUser, loginTime)
	MemberVO loginUser=(MemberVO)session.getAttribute("loginUser");

	if(loginUser == null){
		Cookie[] cks = request.getCookies();
		String key = "", val = ""; int val2=0;
		if(cks != null){
			for(Cookie c : cks){
				key=c.getName();
				if(key.equals("idx")){
					val = c.getValue();
					val2=Integer.parseInt(val);
					break;
				}
			}
		}
	}
%>

<script type="text/javascript">
 	var confirmUser = function(pwd){
		// 비밀번호 창에 입력한 것과 회원의 기존 비밀번호가 일치하면 수정화면으로
		if(f.pwd2.value == <%=loginUser.getPwd()%>){
			confirmF.method="POST";
			
			// memberList를 거치지 않고 회원번호를 통해 바로 memberEdit으로 가도록
			confirmF.action="javascript:editUser(<%=loginUser.getIdx()%>)";
		}else{
			alert('비밀번호가 틀렸습니다. 다시 확인해주세요.');
			return;
		}
		confirmF.action="javascript:editUser(<%=loginUser.getIdx()%>)";
		confirmF.submit();
	}
	
	var editUser = function(idx){
		// GET 방식이므로 idx가 url에 노출. 보안에 취약
		//location.href="memberEdit.jsp?idx="+idx;
		editF.idx.value=idx;
		editF.method="POST";
		editF.action="<%=request.getContextPath()%>/member/memberPwd.jsp";
		editF.submit();
	}
</script>
	
<div class="col-md-12">
<form name="f" id="f" method="post" action="memberPwd.jsp">	
    <div class="row box">
		<table class="table table-responsive">
			<thead>
				<tr class="tableTitle">
					<th colspan="3"><h3><b>회원확인</b></h3></th>
				</tr>
			</thead>
			<tbody>
				<tr><th colspan="3"><b>본인 확인을 위해 비밀번호를 다시 한 번 입력해주세요.</b></th></tr>
				<tr>
					<td width="30%">비밀번호</td>
					<td><input type="password" name="pwd2" id="pwd2" class="form-control" size="20"></td>
					<td  width="30%"align="right">
						<a href="javascript:confirmUser('<%=loginUser.getIdx()%>')">
							<button type="button" class="btn btn-default">확인</button>
						</a>
					</td>
				</tr>
			</tbody>
		</table><p>
	</div>
</form>
<form name="confirmF">
	<p><input type="hidden" name="pwd" id="pwd">
</form>
<form name="editF">
	<input type="hidden" name="idx" id="idx" value="<%=loginUser.getIdx()%>">
</form>
</div>
<jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_foot.jsp"/>
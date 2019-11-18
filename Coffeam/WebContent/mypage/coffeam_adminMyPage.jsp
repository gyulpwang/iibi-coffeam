<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, user.admin.*" %>
<!DOCTYPE html>
<%@ include file="/login/adminloginCheckModule.jsp" %>

<jsp:useBean id="dao" class="user.admin.AdminDAO" scope="session"/>
<jsp:useBean id="user" class="user.admin.AdminVO" scope="session"/>
<jsp:include page="/coffeam_adminTop.jsp"/>
<script type="text/javascript">$('#amypage').addClass('active');</script>

<script type="text/javascript">
	$('#asvcAside').hide();
	$('#aBest').show();
	$('#aFooter').show();
</script>

<%	// 세션에 저장된 객체를 꺼낸다.(loginAdmin, loginTime)
	AdminVO loginAdmin=(AdminVO)session.getAttribute("loginAdmin");

	if(loginAdmin == null){
		Cookie[] cks = request.getCookies();
		String key = "", val = ""; int val2=0;
		if(cks != null){
			for(Cookie c : cks){
				key=c.getName();
				if(key.equals("adminNo")){
					val = c.getValue();
					val2=Integer.parseInt(val);
					break;
				}
			}
		}
	}
%>

<script type="text/javascript">
 	var confirmAdmin = function(adminPwd){
		// 비밀번호 창에 입력한 것과 회원의 기존 비밀번호가 일치하면 수정화면으로
		if(f.pwd2.value == <%=loginAdmin.getAdminPwd()%>){
			confirmF.method="POST";
			
			// adminList를 거치지 않고 회원번호를 통해 바로 editAdmin으로 가도록
			confirmF.action="javascript:editAdmin(<%=loginAdmin.getAdminNo()%>)";
		}else{
			alert('비밀번호가 틀렸습니다. 다시 확인해주세요.');
			return;
		}
		confirmF.action="javascript:editAdmin(<%=loginAdmin.getAdminNo()%>)";
		confirmF.submit();
	}
	
	var editAdmin = function(adminNo){
		// GET 방식이므로 idx가 url에 노출. 보안에 취약
		//location.href="adminEdit.jsp?idx="+idx;
		editF.adminNo.value=adminNo;
		editF.method="POST";
		editF.action="<%=request.getContextPath()%>/admin/adminPwd.jsp";
		editF.submit();
	}
</script>
	
<div class="col-md-12">
<form name="f" id="f" method="post" action="adminPwd.jsp">	
    <div class="row box">
		<table class="table table-responsive">
			<thead>
				<tr class="tableTitle">
					<th colspan="3"><h3><b>관리자확인</b></h3></th>
				</tr>
			</thead>
			<tbody>
				<tr><th colspan="3"><b>본인 확인을 위해 비밀번호를 다시 한 번 입력해주세요.</b></th></tr>
				<tr>
					<td width="30%">비밀번호</td>
					<td><input type="password" name="pwd2" id="pwd2" class="form-control" size="20"></td>
					<td  width="30%"align="right">
						<a href="javascript:confirmAdmin('<%=loginAdmin.getAdminNo()%>')">
							<button type="button" class="btn btn-default">확인</button>
						</a>
					</td>
				</tr>
			</tbody>
		</table><p>
	</div>
</form>
<form name="confirmF">
	<p><input type="hidden" name="adminPwd" id="adminPwd">
</form>
<form name="editF">
	<input type="hidden" name="adminNo" id="adminNo" value="<%=loginAdmin.getAdminNo()%>">
</form>
</div>
</div>
<%-- <jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_adminFoot.jsp"/> --%>
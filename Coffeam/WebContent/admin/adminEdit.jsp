<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.admin.*" %>
<%@ include file="/include/function.jsp" %>
    
<script type="text/javascript">
	/* 아이디 중복 체크 ========== */
	var idCheck=function(){
		var url = "idCheck.jsp";
		// widow.open(url, "제목", "속성들");
		win = window.open(url, "idCheck", "width=400, height=200, left=100, top=100");
	}

	/* 입력값 유효성 체크 ========== */
	var check=function(){
		if(!f.adminName.value){
			alert('이름을 입력하세요.');
			f.adminName.focus();
			return;
		}
		if(!f.adminId.value){
			alert('아이디를 입력하세요.');
			f.adminId.focus();
			return;
		}
		if(!f.adminPwd.value){
			alert('비밀번호를 입력하세요.');
			f.adminPwd.focus();
			return;
		}
		if(f.adminPwd.value != f.pwd2.value){
			alert('비밀번호와 비밀번호 확인이 달라요.');
			f.pwd2.select();
			return;
		}
		
		f.submit();	// 서버에 전송
	}
</script>
    
<!-- 액션 안에 스페이스가 들어가면 오류 나기 때문에 바로 닫아버림. -->
<jsp:include page="/coffeam_adminTop.jsp"/>
<script type="text/javascript">$('#amypage').addClass('active');</script>

<script type="text/javascript">
	$('#asvcAside').hide();
	$('#aBest').show();
	$('#aFooter').show();
</script>

<jsp:useBean id="adao" class="user.admin.AdminDAO" scope="session" />
<%
	// 회원 번호 받기
	String adminNoStr=request.getParameter("adminNo");
	if(adminNoStr == null || adminNoStr.trim().isEmpty()){
		response.sendRedirect(request.getContextPath()+"/coffeam/coffeam_adminHome.jsp");
		return;
	}
	AdminVO avo=adao.findAdminByAdminNo(new Integer(adminNoStr.trim()));
	if(avo == null){
		goBack("존재하지 않는 관리자입니다.", out);
		return;
	}
%>
<div class="col-md-12" align="center">
	<div class="row box">
	<form name="f" id="f" method="post" action="adminEditEnd.jsp">
	<table class="table">
		<thead>
			<tr class="tableTitle">
				<th colspan="2"><h3><b>관리자정보수정</b></h3></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width="30%">관리자번호</th>
				<td width="80%">
					<input type="text" name="adminNo" id="adminNo" value="<%=adminNoStr%>" class="form-control" readonly style="background-color:silver">
				</td>
			</tr>
			<tr>
				<th width="30%">이름</th>
				<td width="80%">
					<input type="text" name="adminName" id="adminName" value="<%=avo.getAdminName()%>" size="25" class="form-control">
				</td>
			</tr>
			<tr>
				<th width="30%">아이디</th>
				<td width="80%">
					<!-- readonly -->
					<input type="text" name="adminId" id="adminId"
					readonly style='background-color:silver' value="<%=avo.getAdminId()%>" size="25" class="form-control">
					<!-- <button type="button" class="btn btn-default" onclick="idCheck()">아이디 중복 체크</button> -->
				</td>
			</tr>
			<tr>
				<th width="30%">비밀번호</th>
				<td width="80%">
					<input type="password" name="adminPwd" id="adminPwd" value="<%=avo.getAdminPwd()%>" size="25" class="form-control">
				</td>
			</tr>
			<tr>
				<th width="30%">비밀번호 확인</th>
				<td width="80%">
					<input type="password" name="pwd2" id="pwd2" value="<%=avo.getAdminPwd()%>" size="25" class="form-control">
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">
					<button type="button" onclick="check()" class="btn btn-danger">정보수정</button>
					<button type="reset" class="btn btn-default">다시쓰기</button>
				</td>
			</tr>
		</tbody>
	</table>
	</form>
	</div>
</div>
</div>
<%-- <jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_adminFoot.jsp"/> --%>
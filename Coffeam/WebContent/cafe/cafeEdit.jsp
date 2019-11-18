<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="search.cafe.*" %>
<%@ include file="/include/function.jsp" %>
<script type="text/javascript">
	/* 입력값 유효성 체크 ========== */
	var check=function(){
		if(!cef.cafeName.value){
			alert('카페명을 입력하세요.');
			cef.cafeName.focus();
			return;
		}
		if(!cef.info.value){
			alert('카페정보를 입력하세요.');
			cef.info.focus();
			return;
		}
		if(!cef.site.value){
			alert('카페사이트를 입력하세요.');
			cef.site.focus();
			return;
		}
		if(!cef.logo.value){
			alert('로고이미지를 입력하세요.');
			cef.logo.focus();
			return;
		}
		if(!cef.img.value){
			alert('메인이미지를 입력하세요.');
			cef.img.focus();
			return;
		}
	
		cef.submit();	// 서버에 전송
}
</script>
    
<!-- 액션 안에 스페이스가 들어가면 오류 나기 때문에 바로 닫아버림. -->
<jsp:include page="/coffeam_adminTop.jsp"/>
<script type="text/javascript">$('#acafe').addClass('active');</script>
<script type="text/javascript">
	$('#asvcAside').hide();
	$('#aBest').show();
	$('#aFooter').show();
</script>
<jsp:useBean id="scdao" class="search.cafe.CafeDAO" scope="session" />
<%
	// 카페코드 받기
	String cafeCodeStr=request.getParameter("cafeCode");
	if(cafeCodeStr == null || cafeCodeStr.trim().isEmpty()){
		response.sendRedirect(request.getContextPath()+"/coffeam/coffeam_adminHome.jsp");
		return;
	}
	CafeVO scvo=scdao.findCafeByCode(Integer.parseInt(cafeCodeStr.trim()));
	if(scvo == null){
		goBack("존재하지 않는 카페입니다.", out);
		return;
	}
%>
<div class="col-md-12" align="center">
	<div class="row box">
	<form name="cef" id="cef" method="post" action="cafeEditEnd.jsp">
	<table class="table table-responsive">
		<thead>
			<tr class="tableTitle">
				<th colspan="2"><h3><b>카페수정</b></h3></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width="20%">카페명</th>
				<td width="80%">
					<!-- 카페번호 숨겨서 보내기 -->
					<input type="hidden" name="cafeCode" id="cafeCode" value="<%=scvo.getCafeCode()%>" class="form-control">
					<input type="text" name="cafeName" id="cafeName" value="<%=scvo.getCafeName()%>" class="form-control">
				</td>
			</tr>
			<tr>
				<th width="20%">카페정보</th>
				<td width="80%">
					<textarea name="info" id="info" rows="10" class="form-control"><%=scvo.getInfo()%></textarea>
					<%-- <input type="text" name="info" id="info" value="<%=scvo.getInfo()%>" size="25" class="form-control"> --%>
				</td>
			</tr>
			<tr>
				<th width="20%">카페사이트</th>
				<td width="80%">
					<input type="text" name="site" id="site" value="<%=scvo.getSite()%>" size="25" class="form-control">
				</td>
			</tr>
			<tr>
				<th width="20%">로고이미지</th>
				<td width="80%">
					<input type="text" name="logo" id="logo" value="<%=scvo.getLogo()%>" size="25" class="form-control">
				</td>
			</tr>
			<tr>
				<th width="20%">메인이미지</th>
				<td width="80%">
					<input type="text" name="img" id="img" value="<%=scvo.getImg()%>" size="25" class="form-control">
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
<%-- <jsp:include page="/coffeam_basket.jsp"/> --%>
<%-- <jsp:include page="/coffeam_adminFoot.jsp"/> --%>
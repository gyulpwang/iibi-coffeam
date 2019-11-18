<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, search.cafe.*"%>

<jsp:useBean id="adao" class="user.admin.AdminDAO" scope="session"/>
<jsp:useBean id="scdao" class="search.cafe.CafeDAO" scope="session"/>

<jsp:include page="/coffeam_adminTop.jsp"/>
<script type="text/javascript">$('#acafe').addClass('active');</script>
<script type="text/javascript">
	$('#asvcAside').hide();
	$('#aBest').show();
	$('#aFooter').show();
</script>

<script type="text/javascript">
	var check=function(){
		if(!cif.cafeName.value){
			alert('카페명을 입력하세요.');
			cif.cafeName.focus();
			return;
		}
		if(!cif.info.value){
			alert('카페정보를 입력하세요.');
			cif.info.focus();
			return;
		}
		if(!cif.site.value){
			alert('카페사이트를 입력하세요.');
			cif.site.focus();
			return;
		}
		if(!cif.logo.value){
			alert('로고이미지를 입력하세요.');
			cif.logo.focus();
			return;
		}
		if(!cif.img.value){
			alert('메인이미지를 입력하세요.');
			cif.img.focus();
			return;
		}
	
		cif.submit();	// 서버에 전송
}
</script>
<div class="box">
	<form name="cif" id="cif" method="post" action="cafeInsertEnd.jsp">
	<table class="table table-responsive">
		<thead>
			<tr class="tableTitle">
				<th colspan="3"><h3><b>카페추가</b></h3></th>
			</tr>
		</thead>
		<tbody>
			<!-- <tr>
				<th width="30%">카페코드</th>
				<td><input type="text" name="cafeCode" id="cafeCode" size="20" class="form-control" readonly style="background-color:silver"></td>
			</tr> -->
			<tr>
				<th width="30%">카페명</th>
				<td><input type="text" name="cafeName" id="cafeName" size="20" class="form-control" placeholder="카페명을 입력해주세요."></td>
			</tr>
			<tr>
				<th>카페정보</th>
				<td>
					<textarea name="info" id="info" rows="5" class="form-control" placeholder="카페정보를 입력해주세요."></textarea>
				</td>
			</tr>
			<tr>
				<th>카페사이트</th>
				<td><input type="text" name="site" id="site" size="20" class="form-control" placeholder="카페 사이트를 입력해주세요."></td>
			</tr>
			<tr>
				<th>로고</th>
				<td><input type="text" name="logo" id="logo" size="20" class="form-control" placeholder="카페 로고로 사용할 이미지를 입력해주세요."></td>
			</tr>
			<tr>
				<th>메인이미지</th>
				<td><input type="text" name="img" id="img" size="20"class="form-control" placeholder="카페 메인이미지를 입력해주세요."></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">
					<button type="button" class="btn btn-danger" onclick="check()">카페등록</button>
					<button type="reset" class="btn btn-default">다시쓰기</button>
				</td>
			</tr>
		</tbody>
	</table>
	</form>
</div>
</div>
</div>
<div class="col-md-3">
<%-- <jsp:include page="/coffeam_basket.jsp"/> --%>
<%-- <jsp:include page="/coffeam_adminFoot.jsp"/> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, search.cafe.*"%>

<jsp:useBean id="adao" class="user.admin.AdminDAO" scope="session"/>
<jsp:useBean id="scdao" class="search.cafe.CafeDAO" scope="session"/>
<jsp:useBean id="sddao" class="search.drink.DrinkDAO" scope="session"/>

<jsp:include page="/coffeam_adminTop.jsp"/>
<script type="text/javascript">$('#acafe').addClass('active');</script>

<script type="text/javascript">
	$('#asvcAside').hide();
	$('#aBest').show();
	$('#aFooter').show();
</script>

<script type="text/javascript">
	var check=function(){
		if(!dif.drinkName.value){
			alert('음료명을 입력하세요.');
			dif.drinkName.focus();
			return;
		}
		if(!dif.img.value){
			alert('음료이미지를 입력하세요.');
			dif.img.focus();
			return;
		}
		if(!dif.price.value){
			alert('가격을 입력하세요.');
			dif.price.focus();
			return;
		}
		if(!dif.mileage.value){
			alert('마일리지를 입력하세요.');
			dif.mileage.focus();
			return;
		}
		/* if(!dif.spec.value){
			alert('스펙 입력하세요.');
			dif.spec.focus();
			return;
		} */
		if(!dif.price.value){
			alert('가격을 입력하세요.');
			dif.site.focus();
			return;
		}
		if(!dif.price.value){
			alert('마일리지를 입력하세요.');
			dif.logo.focus();
			return;
		}
		/* if(!dif.num.value){
			alert('수량을 입력하세요.');
			dif.num.focus();
			return;
		} */
		if(!dif.beanType.value){
			alert('원두종류를 입력하세요.');
			dif.beanType.focus();
			return;
		}
		/* if(!dif.rdate.value){
			alert('로스팅날짜 입력하세요.');
			dif.rdate.focus();
			return;
		} */
		if(!dif.updir.value){
			alert('상위디렉토리를 입력하세요.');
			dif.updir.focus();
			return;
		}
	
		dif.submit();	// 서버에 전송
}
</script>

<%
	int cafeCode=Integer.parseInt(request.getParameter("cafeCode"));
%>
<div class="box">
	<form name="dif" id="dif" method="post" action="drinkInsertEnd.jsp">
	<table class="table table-responsive">
		<thead>
			<tr class="tableTitle">
				<th colspan="3"><h3><b>음료추가</b></h3></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width="30%">카페코드</th>
				<td><input type="text" name="cafeCode" id="cafeCode" value="<%=cafeCode%>" readonly style="background-color:silver" size="20" class="form-control"></td>
			</tr>
			<tr>
				<th width="30%">음료명</th>
				<td><input type="text" name="drinkName" id="drinkName" size="20" class="form-control" placeholder="음료명을 입력하세요."></td>
			</tr>
			<tr>
				<th>음료이미지</th>
				<td><input type="text" name="img" id="img" size="20" class="form-control" placeholder="음료 이미지를 등록하세요."></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="price" id="price" size="20" class="form-control" placeholder="음료 가격을 입력하세요."></td>
			</tr>
			<tr>
				<th>마일리지</th>
				<td><input type="text" name="mileage" id="mileage" size="20" class="form-control" placeholder="음료 구입 시 적용될 마일리지를 입력하세요."></td>
			</tr>
			<tr>
				<th>스펙</th>
				<td><input type="text" name="spec" id="spec" size="20" class="form-control" placeholder="음료의 스펙을 입력하세요."></td>
			</tr>
			<tr>
				<th>수량</th>
				<td><input type="text" name="num" id="num" size="20" class="form-control" placeholder="음료의 수량을 입력하세요."></td>
			</tr>
			<tr>
				<th>원두종류</th>
				<td><input type="text" name="beanType" id="beanType" size="20" class="form-control" placeholder="원두종류를 입력하세요."></td>
			</tr>
			<tr>
				<th>로스팅날짜</th>
				<td><input type="text" name="rdate" id="rdate" size="20" class="form-control" placeholder="로스팅 날짜를 입력하세요."></td>
			</tr>
			<tr>
				<th>상위디렉토리</th>
				<td><input type="text" name="updir" id="updir" size="20" class="form-control" placeholder="등록할 음료 이미지의 상위 디렉토리를 입력하세요."></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">
					<button type="button" class="btn btn-danger" onclick="check()">음료등록</button>
					<button type="reset" class="btn btn-default">다시쓰기</button>
				</td>
			</tr>
		</tbody>
	</table>
	</form>
</div>
</div>
<%-- <jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_adminFoot.jsp"/> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="search.drink.*" %>
<%@ include file="/include/function.jsp" %>
    
<script type="text/javascript">
	/* 입력값 유효성 체크 ========== */
	var check=function(){
		if(!def.drinkName.value){
			alert('음료명을 입력하세요.');
			def.drinkName.focus();
			return;
		}
		if(!def.img.value){
			alert('음료이미지를 입력하세요.');
			def.img.focus();
			return;
		}
		if(!def.price.value){
			alert('가격을 입력하세요.');
			def.price.focus();
			return;
		}
		if(!def.mileage.value){
			alert('마일리지를 입력하세요.');
			def.mileage.focus();
			return;
		}
		/* if(!def.spec.value){
			alert('스펙 입력하세요.');
			def.spec.focus();
			return;
		} */
		if(!def.price.value){
			alert('가격을 입력하세요.');
			def.site.focus();
			return;
		}
		if(!def.price.value){
			alert('마일리지를 입력하세요.');
			def.logo.focus();
			return;
		}
		/* if(!def.num.value){
			alert('수량을 입력하세요.');
			def.num.focus();
			return;
		} */
		if(!def.beanType.value){
			alert('원두종류를 입력하세요.');
			def.beanType.focus();
			return;
		}
		/* if(!def.rdate.value){
			alert('로스팅날짜 입력하세요.');
			def.rdate.focus();
			return;
		} */
		if(!def.updir.value){
			alert('상위디렉토리를 입력하세요.');
			def.updir.focus();
			return;
		}
	
		def.submit();	// 서버에 전송
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

<jsp:useBean id="sddao" class="search.drink.DrinkDAO" scope="session" />
<%
	// 음료코드 받기
	String drinkCodeStr=request.getParameter("drinkCodeEdit");
	if(drinkCodeStr == null || drinkCodeStr.trim().isEmpty()){
		response.sendRedirect(request.getContextPath()+"/coffeam/coffeam_adminHome.jsp");
		return;
	}
	int drinkCode = Integer.parseInt(drinkCodeStr.trim());
	DrinkVO sdvo=sddao.findDrinkByCode(drinkCode);
	if(sdvo == null){
		goBack("존재하지 않는 음료입니다.", out);
		return;
	}
%>
<div class="col-md-12" align="center">
	<div class="row box">
	<form name="def" id="def" method="post" action="drinkEditEnd.jsp">
	<table class="table table-responsive">
		<thead>
			<tr class="tableTitle">
				<th colspan="3"><h3><b>음료수정</b></h3></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width="30%">카페코드</th>
				<td>
					<input type="text" name="cafeCode" id="cafeCode" value="<%=sdvo.getCafeCode()%>" readonly style="background-color:silver" size="20" class="form-control">
					<!-- 음료번호 숨겨서 보내기 -->
					<input type="hidden" name="drinkCode" id="drinkCode" value="<%=sdvo.getDrinkCode()%>" class="form-control">
				</td>
			</tr>
			<tr>
				<th width="30%">음료명</th>
				<td><input type="text" name="drinkName" id="drinkName" size="20" value="<%=sdvo.getDrinkName()%>" class="form-control"></td>
			</tr>
			<tr>
				<th>음료이미지</th>
				<td><input type="text" name="img" id="img" size="20" value="<%=sdvo.getImg()%>" class="form-control"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="price" id="price" size="20" value="<%=sdvo.getPrice()%>"class="form-control"></td>
			</tr>
			<tr>
				<th>마일리지</th>
				<td><input type="text" name="mileage" id="mileage" size="20" value="<%=sdvo.getMileage()%>" class="form-control"></td>
			</tr>
			<tr>
				<th>스펙</th>
				<td><input type="text" name="spec" id="spec" size="20" value="<%=sdvo.getSpec()%>" class="form-control"></td>
			</tr>
			<tr>
				<th>수량</th>
				<td><input type="text" name="num" id="num" size="20" value="<%=sdvo.getPrice()%>" class="form-control"></td>
			</tr>
			<tr>
				<th>원두종류</th>
				<td><input type="text" name="beanType" id="beanType" size="20" value="<%=sdvo.getBeanType()%>" class="form-control"></td>
			</tr>
			<tr>
				<th>로스팅날짜</th>
				<td><input type="text" name="rdate" id="rdate" size="20" value="<%=sdvo.getRdate()%>" class="form-control"></td>
			</tr>
			<tr>
				<th>상위디렉토리</th>
				<td><input type="text" name="updir" id="updir" size="20" value="<%=sdvo.getUpdir()%>" class="form-control"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">
					<button type="button" class="btn btn-danger" onclick="check()">음료수정</button>
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
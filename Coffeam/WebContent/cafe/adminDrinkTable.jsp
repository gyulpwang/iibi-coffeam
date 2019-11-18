<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.text.*" %>
<%@ page import="java.util.*, search.drink.*" %>
<!DOCTYPE html>

<jsp:useBean id="ddao" class="search.drink.DrinkDAO" scope="session"/>
<% 
	// POST 방식일 경우 한글 처리
	request.setCharacterEncoding("UTF-8");

	DecimalFormat df = new DecimalFormat("###,###");
	SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");

	//int drinkCode = Integer.parseInt(request.getParameter("dc"));
	int cafeCode = Integer.parseInt(request.getParameter("cc"));
	String cafeName = request.getParameter("cn");
	DrinkVO drink = new DrinkVO();
%>

	<div>
	<table class="table table-responsive">
		<thead>
			<tr class="tableTitle">
				<th colspan="4"><h3><b>음료관리</b></h3></th>
				<th colspan="2" style="text-align:right; vertical-align: text-top;">
					<div>
						<i class="fa fa-3x fa-fw fa-plus" style="font-size: 18px; color:#fff"></i>
						<a style="color:#fff" href="javascript:insertDrink('<%=cafeCode%>')"> 음료 추가</a>
					</div>
				</th>
			</tr>
			<%-- <% String cafeName = request.getParameter("cn"); %> --%>
			<tr>
				<th colspan="4" style="font-size:20px;">
					<span style="font-weight: bold; font-size:32px; color:#af1817;"><%=cafeName%></span>의 상품 정보
				</th>
			</tr>
			<tr style="font-weight:bold; text-align: center">
				<td width="20%">음료사진</td>
				<td width="20%">음료명</td>
				<td width="15%">가격<br>마일리지</td>
				<td width="15%">스펙</td>
				<td width="20%">원두종류<br>로스팅 날짜</td>
				<td width="10%">조회·수정·삭제</td>
    		</tr>
		</thead>
		<tbody>
			<% 
			ArrayList<DrinkVO> arr = ddao.listAllDrink(cafeCode);

			if(arr == null || arr.size() == 0){
				%><tr><td colspan = '4'>서버 오류이거나 데이터가 없습니다.</td></tr><%
			}else{
					// 반복문 돌 부분 ---------------------------
					Iterator<DrinkVO> it = arr.iterator();
					while(it.hasNext()){
						drink = it.next();
						%>
						<tr style="font-weight:bold;text-align: center;">
							<td><img src="<%=request.getContextPath()%>/images/drink<%=drink.getUpdir()%><%=drink.getImg()%>" width="60%"></td>
							<td><%=drink.getDrinkName()%></td>
							<td><%=df.format(drink.getPrice())%>원<br><%=df.format(drink.getMileage())%>pt</td>
							<td>
								<% if((drink.getSpec().trim()).equals("HIT")){
									%><span class="label label-danger"><%=drink.getSpec()%></span><%
								}
								if((drink.getSpec().trim()).equals("NEW")){
									%><span class="label label-info"><%=drink.getSpec()%></span><%
								}
								if((drink.getSpec().trim()).equals("BEST")){
									%><span class="label label-success"><%=drink.getSpec()%></span><%
								}
								if((drink.getSpec().trim()).equals("none")){
									%><span class="label label-warning"><%=drink.getSpec()%></span><%
								}%>
							</td>
							<td><%=drink.getBeanType()%><br><%=drink.getRdate()%></td>
							<td>
								<a href="javascript:editDrink('<%=drink.getDrinkCode()%>', '<%=drink.getCafeCode()%>')">
									<button type="button" class="btn btn-warning" style="margin-bottom: 0.5em;">수정</button>
								</a>
								<a href="javascript:delDrink('<%=drink.getDrinkCode()%>', '<%=drink.getDrinkName()%>')">
									<button type="button" class="btn btn-danger">삭제</button>
								</a>
							</td>
				    	</tr>
	    			<%}%>
	    	<%}%>
		</tbody>
	</table>
	</div>
	
<!-- 삽입 처리 관련 폼 ========================================= -->
<form name="insertDF" action="drinkInsert.jsp" method="POST">
	<input type="hidden" name="drinkCode" id="drinkCode">
	<input type="hidden" name="cafeCode" id="cafeCode">
</form>
<!-- =========================================================== -->	
<!-- 수정 처리 관련 폼 ========================================= -->
<form name="editDF" action="drinkEdit.jsp" method="POST">
	<input type="hidden" name="drinkCodeEdit" id="drinkCodeEdit">
	<input type="hidden" name="cafeCodeEdit" id="cafeCodeEdit">
</form>
<!-- =========================================================== -->
	
<!-- 음료 코드를 넘겨줄 form 작성 -->
<form name="dcF" id="dcF" method="get">
	<input type="hidden" name="dc" id="dc">
</form>
<!-- 음료 이름을 넘겨줄 form 작성 -->
<form name="dnF" id="dnF" method="get">
	<input type="hidden" name="dn" id="dn">
</form>
	
<script type="text/javascript">
	var insertDrink = function(cafeCode){
		insertDF.cafeCode.value=cafeCode;
		insertDF.submit();
	}
	
	var editDrink = function(drinkCode, cafeCode){
		editDF.drinkCodeEdit.value=drinkCode;
		editDF.cafeCodeEdit.value=cafeCode;
		editDF.submit();
	}

	var delDrink = function(drinkCode, drinkName){
		var yn = confirm('['+drinkCode+'] '+drinkName+' 음료정보를 정말 삭제합니까?');
		if(yn){
			location.href = "drinkDel.jsp?drinkCode="+drinkCode;
		}
	}
</script>
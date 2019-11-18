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
%>

<!-- <h4><b>000 카페의 메뉴</b></h4> -->
	<div>
	<table class="table table-responsive">
		<thead>
			<% String cafeName = request.getParameter("cn"); %>
			<tr>
				<th colspan="6" style="font-size:20px;">
					<span style="font-weight: bold; font-size:32px; color:#af1817;"><%=cafeName%></span>의 상품 정보
				</th>
			</tr>
			<tr style="font-weight:bold; text-align: center">
				<td width="20%">음료사진</td>
				<td width="20%">음료명</td>
				<td width="15%">가격<br>마일리지</td>
				<td width="15%">스펙</td>
				<td width="20%">원두종류<br>로스팅 날짜</td>
				<td width="10%">담기</td>
    		</tr>
		</thead>
		<tbody>
			<% 
			int cafeCode = Integer.parseInt(request.getParameter("cc"));
			ArrayList<DrinkVO> arr = ddao.listAllDrink(cafeCode);

			if(arr == null || arr.size() == 0){
				%><tr><td colspan = '4'>서버 오류이거나 데이터가 없습니다.</td></tr><%
			}else{
					// 반복문 돌 부분 ---------------------------
					Iterator<DrinkVO> it = arr.iterator();
					while(it.hasNext()){
						DrinkVO drink = it.next();
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
								<button type="button" class="btn btn-default"><i class="fa fa-3x fa-fw fa-shopping-cart" style="color:#af1817; font-size:medium;"></i></button>
								<button type="button" class="btn btn-default"><i class="fa fa-3x fa-fw fa-paypal" style="color:#af1817; font-size:medium;"></i></button>
							</td>
				    	</tr>
	    			<%}%>
	    	<%}%>
		</tbody>
	</table>
	</div>
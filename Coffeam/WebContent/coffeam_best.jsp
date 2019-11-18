<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, search.drink.*, java.text.*" %>

<% DecimalFormat df = new DecimalFormat("###,###");
SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd"); %>

<jsp:useBean id="ddao" class="search.drink.DrinkDAO" scope="session"/>
			</div>
			<div class="col-md-3">
				<div class="row box">
				<table class="table table-responsive">
					<thead>
		          		<tr class="tableTitle">
		          			<td colspan="4"><h3><b>베스트 메뉴</b></h3></td>
		          		</tr>
		          		<tr>
		          			<th width="16%" style="text-align: center">순위</th>
		          			<th width="24%" style="text-align: center">사진</th>
		          			<th width="60%" style="text-align: center">음료정보</th>
		          		</tr>
		          	</thead>
					<tbody>
			          	<!-- drink 테이블에서 spec='best'인 메뉴만 가져와서 차례로 나열 
			          	select * from drink where spec='HIT' OR spec='BEST' order by price; -->
			          	<% ArrayList<DrinkVO> arr = ddao.listBHDrink();
			
						if(arr == null || arr.size() == 0){
							%><tr><td colspan = '4'>서버 오류이거나 데이터가 없습니다.</td></tr><%
						}else{
							// 반복문 돌 부분 ---------------------------
							Iterator<DrinkVO> it = arr.iterator();
							int i=0;
							while(it.hasNext()){
								DrinkVO drink = it.next();
								if(i<10){%>
				          		<tr>
				          			<td align="center"><%=i+1%></td>
				          			<td><img src="<%=request.getContextPath()%>/images/drink<%=drink.getUpdir()%><%=drink.getImg()%>" 
				          			class="img-thumbnail img-responsive" width="100%"></td>
				          			<td><b><%=drink.getDrinkName()%></b>
				          				<br><%=df.format(drink.getPrice())%>원 / <%=df.format(drink.getMileage())%>포인트
				          			</td>
				          		</tr>
			          			<% i++;
								}else{break;}
			          		} 
			          	}%>
					</tbody>
					</table>
					</div>
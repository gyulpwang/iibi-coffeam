<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	</div>
	<!-- 장바구니에 담을 수 있는 음료 수는 5로 제한 -->
	<div class="col-md-3">
		<div class="row box">
			<table class="table table-responsive">
				<thead>
					<tr class="tableTitle"><td colspan="4"><h3><b>장바구니</b></h3></td></tr>
					<tr>
						<th width="80%" style="text-align: center">음료정보</th><th width="20%" style="text-align: center">수량</th>
					</tr>
				</thead>
				<tbody>
		          	<tr>
		          		<td>ex1) 카페베네 아메리카노</td>
		          		<td style="text-align: right">5</td>
	          		</tr>
	          		<tr>
	          			<td>ex2) 이디야 화이트모카</td>
	          			<td style="text-align: right">4</td>
	          		</tr>
	          		<tr>
	          			<td>ex3) 커피빈 카라멜마끼아또</td>
	          			<td style="text-align: right">1</td>
	          		</tr>
	          		<tr>
	          			<td>ex4) 스타벅스 악마의음료</td>
	          			<td style="text-align: right">2</td>
	          		</tr>
	          		<tr>
	          			<td>ex5) 더착한커피 히비스커스</td>
	          			<td style="text-align: right">3</td>
	          		</tr>
	          		<tr>
	          			<th colspan="2" style="text-align:center;">
	          				<a href="<%=request.getContextPath()%>/mypage/coffeam_MainBasket.jsp"><button type="button" class="btn btn-default">장바구니</button></a>&ensp;
	          				<button type="button" class="btn btn-default">예약구매</button>
						</th>		          			
	          		</tr>
				</tbody>
			</table>
		</div>
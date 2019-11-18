<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
</div>
	<!-- 장바구니에 담을 수 있는 음료 수는 5로 제한 -->
	<div class="col-md-3">
		<div class="row box">
			<table class="table">
	          	<thead>
	          		<tr style="background-color:#fad3ca; color:#af1817"><td colspan="4"><h3><b>베스트 메뉴</b></h3></td></tr>
	          		<tr>
	          			<th width="10%">순위</th><th width="40%">사진</th><th width="50%">음료정보</th><th></th>
	          		</tr>
	          	</thead>
	          	<!-- style="overflow-x:visible; overflow-y: unset" -->
	          	<tbody>
	          		<tr>
	          			<td width="20%">1</td>
	          			<td width="30%"><img src="<%=request.getContextPath()%>/images/drink/americano.PNG" width="80px" height="100px"></td>
	          			<td width="50%"><b>아메리카노</b>
	          				<br>에스프레소에 물을 넣어 연하게 마시는 커피이다. 
	          			</td>
	          		</tr>
	          		<tr>
	          			<td>2</td>
	          			<td><img src="<%=request.getContextPath()%>/images/drink/caffelatte.PNG" width="80px" height="100px"></td>
	          			<td><b>카페라떼</b>
	          				<br>카페라떼는 뜨거운 우유를 곁들인 커피 중 하나이다. 
	          			</td>
	          		</tr>
	          		<tr>
	          			<td>3</td>
	          			<td><img src="<%=request.getContextPath()%>/images/drink/caffemocha.PNG" width="80px" height="100px"></td>
	          			<td><b>카페모카</b>
	          				<br>에스프레소에 우유와 초콜릿을 넣고 휘핑크림을 올린 커피이다. 
	          			</td>
	          		</tr>
	          	</tbody>
			</table>
		</div>
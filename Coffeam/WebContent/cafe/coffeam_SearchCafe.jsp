<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, search.cafe.*"%>
    
<jsp:useBean id="cdao" class="user.member.MemberDAO" scope="session"/>
<jsp:useBean id="scdao" class="search.cafe.CafeDAO" scope="session"/>
<jsp:include page="/coffeam_top.jsp"/>
<script type="text/javascript">$('#search').addClass('active');</script>
<jsp:include page="/coffeam_noticeAside.jsp"/>
<div class="box">
	<table class="table">
		<thead>
			<tr class="tableTitle"><td colspan="3"><h3><b>카페 조회</b></h3></td></tr>
		</thead>
		<tbody>
		</tbody>
	</table>

	<span style="color:#af1817"><b>※ 해당 카페의 이미지 배너를 클릭하시면 음료를 확인하실 수 있습니다.</b></span><p>

	<table class="table table-responsive" id="tableTop">
		<thead>
			<tr style="font-weight:bold; text-align: center">
				<td width="5%">번호</td><td width="20%">배너</td><td width="50%">정보</td><td width="10%">상품조회</td>
    		</tr>
		</thead>
	</table>
	<div style="overflow-y:scroll; height:382px">
	<form name="cf" id="cf" method="post" action="drinkTable.jsp">
	<table class="table " id="cafeTable">
		<tbody>
			<% ArrayList<CafeVO> arr = scdao.listAllCafe();
			//System.out.println("arr="+arr);
			if(arr == null || arr.size() == 0){
				%><tr><td colspan = '4'>서버 오류이거나 데이터가 없습니다.</td></tr><%
			}else{
				// 반복문 돌 부분 ---------------------------
				Iterator<CafeVO> it = arr.iterator();
				CafeVO cafe = new CafeVO();
				int i=0;
				while(it.hasNext()){
					cafe = it.next(); %>
				<tr id="tr<%=i++%>">
					<td width="5%"><%=cafe.getCafeCode()%></td>
					<td width="20%" style="font-weight:bold; text-align:center">
						<a href="<%=cafe.getSite()%>">
							<img src="<%=request.getContextPath()%>/images/cafe/logo/logo_<%=cafe.getImg()%>" width="110px">
						</a>
					</td>
					<td width="50%"><%=cafe.getInfo()%></td>
					<td width="10%">
						<button type="button" id="btn" class="btn btn-default" 
						onclick="searchDrink('<%=cafe.getCafeCode()%>', '<%=cafe.getCafeName()%>','<%=i%>')">상품<br>조회</button><%-- <%=cafe.getCafeCode()%> --%>
					</td>
				</tr>
				<%
				
				}%>
			<%}%>
    	</tbody>    	
	</table>
	</form>
	</div><br><br>
		
	<!-- 카페 코드를 넘겨줄 form 작성 -->
	<form name="ccF" id="ccF" action="drinkTable.jsp" method="get">
		<input type="hidden" name="cc" id="cc">
	</form>
	<!-- 카페 이름을 넘겨줄 form 작성 -->
	<form name="cnF" id="cnF" action="drinkTable.jsp" method="get">
		<input type="hidden" name="cn" id="cn">
	</form>
	
	<script type="text/javascript">
	 	function searchDrink(cafeCode, cafeName, i){
	 		$('tr').removeClass('active');
	 		$('#tr'+(i-1)).addClass('active');
	 		
	 		$.ajax({
	 			url: "drinkTable.jsp?cc="+cafeCode+"&cn="+cafeName,
	 			type:'get',
	 			dataType:"text",
	 			success:function(data){
	 				//alert(data);
	 				/* $('000 카페의 메뉴').css({'font-size':'20pt', 'font-weight':'bold'}); */
	 				$('#showDrink').html(data);
	 				
	 			},
	 			error:function(){
	 				alert('error');
	 			}
	 		});
		}	 	
	</script>
<%-- <jsp:include page="/cafe/drinkTable.jsp"/> --%>
<div id="showDrink"></div>
</div>
<jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_foot.jsp"/>
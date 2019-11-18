<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, search.cafe.*"%>
<%@ include file="/login/adminloginCheckModule.jsp" %>

<jsp:useBean id="adao" class="user.admin.AdminDAO" scope="session"/>
<jsp:useBean id="scdao" class="search.cafe.CafeDAO" scope="session"/>

<jsp:include page="/coffeam_adminTop.jsp"/>
<script type="text/javascript">$('#acafe').addClass('active');</script>

<script type="text/javascript">
	$('#asvcAside').hide();
	$('#aBest').show();
	$('#aFooter').show();
</script>

<div class="box">
	<table class="table table-responsive">
		<thead>
			<tr class="tableTitle">
				<th colspan="3"><h3><b>카페관리</b></h3></th>
				<th style="text-align:right; vertical-align: text-top;">
					<div>
						<i class="fa fa-3x fa-fw fa-plus" style="font-size: 18px"></i>
						<a style="color:#fff" href="cafeInsert.jsp"> 카페 추가</a>
					</div>
				</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	
	<span style="color:#af1817"><b>※ 해당 카페의 이미지 배너를 클릭하시면 음료를 확인하실 수 있습니다.</b></span><p>

	<table class="table table-responsive" id="tableTop">
		<thead>
			<tr style="font-weight:bold; text-align: center">
				<td width="5%">번호</td><td width="20%">배너</td><td width="45%">정보</td><td width="15%">조회·수정·삭제</td>
    		</tr>
		</thead>
	</table>
	<div style="overflow-y:scroll; height:382px">
	<form name="cf" id="cf" method="post" action="adminDrinkTable.jsp">
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
					<td width="45%"><%=cafe.getInfo()%></td>
					<td width="15%">
						<button type="button" id="btn" class="btn btn-success" style="margin-bottom: 0.5em;"
						onclick="searchDrink('<%=cafe.getCafeCode()%>', '<%=cafe.getCafeName()%>','<%=i%>')">상품조회</button><%-- <%=cafe.getCafeCode()%> --%>
						<br>	
						<a href="javascript:editCafe('<%=cafe.getCafeCode()%>')">
						<button type="button" id="btn_edit" class="btn btn-warning" style="margin-bottom: 0.5em">카페수정</button>
						</a>
						<br>
						<a href="javascript:delCafe('<%=cafe.getCafeCode()%>', '<%=cafe.getCafeName()%>')">
						<button type="button" id="btn_del" class="btn btn-danger" style="margin-bottom: 0.5em">카페삭제</button>
						</a>
					</td>
				</tr>
				<%}%>
			<%}%>
    	</tbody>    	
	</table>
	</form>
	</div><br><br>
		
	<!-- 수정 처리 관련 폼 ========================================= -->
	<form name="editF" action="cafeEdit.jsp" method="POST">
		<p><input type="hidden" name="cafeCode" id="cafeCode">
	</form>
	<!-- =========================================================== -->
		
	<!-- 카페 코드를 넘겨줄 form 작성 -->
	<form name="ccF" id="ccF" method="get">
		<input type="hidden" name="cc" id="cc">
	</form>
	<!-- 카페 이름을 넘겨줄 form 작성 -->
	<form name="cnF" id="cnF" method="get">
		<input type="hidden" name="cn" id="cn">
	</form>
	
	<script type="text/javascript">
	 	function searchDrink(cafeCode, cafeName, i){
	 		$('tr').removeClass('active');
	 		$('#tr'+(i-1)).addClass('active');
	 		
	 		$.ajax({
	 			url: "adminDrinkTable.jsp?cc="+cafeCode+"&cn="+cafeName,
	 			type:'get',
	 			dataType:"text",
	 			success:function(data){
	 				$('#showDrink').html(data);
	 			},
	 			error:function(){
	 				alert('error');
	 			}
	 		});
		}
	 	
		var editCafe = function(cafeCode){
			editF.cafeCode.value=cafeCode;
			editF.submit();
		}

		var delCafe = function(cafeCode, cafeName){
			var yn = confirm('['+cafeCode+'] '+cafeName+' 카페정보를 정말 삭제합니까?');
			if(yn){
				// 삭제 페이지로 이동. 파라미터로 idx를 달고 가야 삭제 가능
				location.href = "cafeDel.jsp?cafeCode="+cafeCode;
			}
		}
	</script>
	
<div id="showDrink"></div>
</div>

</div>
<%-- <jsp:include page="/coffeam_basket.jsp"/> --%>
<%-- <jsp:include page="/coffeam_adminFoot.jsp"/> --%>
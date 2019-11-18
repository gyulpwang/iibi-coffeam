<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.admin.*, user.member.*, java.util.*, java.text.*" %>

<%@ include file="/login/adminloginCheckModule.jsp" %>
<%-- <%@ include file="/include/function.jsp" %> --%>

<!-- 액션 안에 스페이스가 들어가면 오류 나기 때문에 바로 닫아버림. -->
<jsp:include page="/coffeam_adminTop.jsp"/>
<script type="text/javascript">$('#ausers').addClass('active');</script>

<script type="text/javascript">
	$('#asvcAside').hide();
	$('#aBest').show();
	$('#aFooter').show();
</script>

<jsp:useBean id="adao" class="user.admin.AdminDAO" scope="session" />
<%-- <jsp:useBean id="cdao" class="user.member.MemberDAO" scope="session" /> --%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-md-12" align="center">
	<div class="row box">
	<form name="f" id="f" method="post" action="adminEditEnd.jsp">
	<table class="table table-responsive" style="text-align: center;">
		<thead>
			<tr class="tableTitle">
				<th colspan="11"><h3><b>회원정보관리</b></h3></th>
			</tr>
		</thead>
		<tbody id="uListBody">
			<tr>
				<th style="text-align: center;">회원<br>번호</th>
				<th style="text-align: center;">이름</th>
				<th style="text-align: center;">아이디<br>비밀번호</th>
				<th style="text-align: center;">이메일<br>연락처</th>
				<th style="text-align: center;">가입일<br>마일리지</th>
				<th style="text-align: center;">선호메뉴</th>
				<th style="text-align: center;">삭제</th>
			</tr>
			<% 
			ArrayList<MemberVO> arr = adao.listAllMember();
			
			if(arr==null || arr.size()==0){
				%><tr><td colspan='7'>서버 오류이거나 데이터가 없습니다.</td></tr><%
			}else{
				// 반복문 돌 부분 ---------------------------
				Iterator<MemberVO> it = arr.iterator();
				while(it.hasNext()){
					MemberVO cvo = it.next();%>
					<tr>
						<td><%=cvo.getIdx()%></td>
						<td>
							<span style="font-weight: bold"><%=cvo.getName()%></span>
						</td>
						<td>
							<span style="color:olive;"><%=cvo.getUserid()%></span><br>
							<span style="color:gray;"><%=cvo.getPwd()%></span></td>
						<td><%=cvo.getEmail()%><br><%=cvo.getHp1()%>-<%=cvo.getHp2()%>-<%=cvo.getHp3()%></td>
						<td><%=cvo.getIndate()%><br><%=cvo.getMileage()%>빈즈</td>
						<td><%=cvo.getFavorite()%></td>
						<td>
							<a href="javascript:delUser('<%=cvo.getIdx()%>')">
								<button type="button" class="btn btn-danger" style="margin-bottom: 0.5em">삭제</button>
							</a>
						</td>
					</tr>
				<%} 
			}%>
		</tbody>
	</table>
	</form>
<!-- 	</div> -->
	
	<!-- 검색 관련 폼 ========================================= -->
	<div style="text-align: center;">
	<form name="findF" action="memberFind.jsp" style="margin-top:20px">
		<p><br>
		<select name="findType" id="findType">
			<optgroup label="검색 유형">
				<!-- value에 컬럼명을 쓰면 get방식이라 컬럼명이 노출됨.
				컬럼명으로 해킹과 같은 위험성이 있기 때문에 숫자로 주었다. -->
				<option value="0">이름</option>
				<option value="1">아이디</option>
				<option value="2">이메일</option>
				<option value="3">선호메뉴</option>
			</optgroup>
		</select>
		<input type="text" name="findString" id="findString" size="40">
		<button class="btn btn-default">검색</button>
	</form>
	</div>
	<!-- =========================================================== -->	
	</div>
</div>
<!-- 회원번호를 넘겨줄 form 작성 -->
<form name="idxF" id="idxF" action="userEdit.jsp" method="get">
	<input type="hidden" name="idx" id="idx">
</form>

<script type="text/javascript">
	function delUser(idx){
 		$.ajax({
 			url: "memberDel.jsp?idx="+idx,
 			type:'get',
 			dataType:"text",
 			success:function(data){
 				alert('회원삭제 성공');
 				history.go("coffeam_adminUsers.jsp");
 			},
 			error:function(){
 				alert('Error : 회원삭제 실패');
 			}
 		});
	 }
/* 	var delUser = function(idx){
		var yn = confirm(idx+'번 회원정보를 정말 삭제합니까?');
		if(yn){
			// 삭제 페이지로 이동. 파라미터로 idx를 달고 가야 삭제 가능
			location.href = "memberDel.jsp?idx="+idx;
		}
	} */
</script>	 	
</div>
<%-- <jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_adminFoot.jsp"/> --%>
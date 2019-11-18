<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, qna.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:useBean id="cdao" class="user.member.MemberDAO" scope="session"/>
<jsp:useBean id="qdao" class="qna.model.QnADAO" scope="session"/>
<%@ include file="/login/adminloginCheckModule.jsp" %>
<jsp:include page="/coffeam_adminTop.jsp"/>
<script type="text/javascript">$('#service').addClass('active');</script>
<script type="text/javascript">$('#asvc_qna').addClass('active');</script>	

<script type="text/javascript">
	$('#asvcAside').show();
	$('#aBest').hide();
	$('#aFooter').show();
</script>

<%
	// 검색 관련 파라미터 받기(findType, findString)
	String findType=request.getParameter("findType");
	String findString=request.getParameter("findString");
	
	if(findType==null || findType.trim().isEmpty()){
		response.sendRedirect("admin-qna-list.do");
		return;
	}
%>

<div class="col-md-12">
	<div class="row box">
	<table class="table table-responsive">
		<thead id="qnaList">
			<tr class="tableTitle">
				<td colspan="4">
					<h3><b>질문 검색결과</b></h3>
				</td>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	<div class="col-md-12">
	<table class="table table-responsive" id="qnaListBody">
		<thead>
			<tr>
				<th width="10%" style="text-align: center">번호</th>
				<th width="20%" style="text-align: center">등록일</th>
				<th width="25%" style="text-align: center">제목</th>
				<th width="15%" style="text-align: center">작성자</th>
				<th width="10%" style="text-align: center">답변여부</th>
				<th width="20%" style="text-align: center">조회·삭제</th>
			</tr>
		</thead>
		<tbody>
			<% List<QnAVO> arr = qdao.findQ(findType, findString);
	
			if(arr==null || arr.size()==0){
				%><tr><td colspan='5'>서버 오류이거나 데이터가 없습니다.</td></tr><%
			}else{
				// 반복문 돌 부분 ---------------------------
				Iterator<QnAVO> it = arr.iterator();
				while(it.hasNext()){
					QnAVO qvo = it.next();	int i=0; %>
				<tr id="tr<%=i%>">
					<td width="10%" align="center"><%=qvo.getNum()%></td>
					<td width="20%" align="center"><%=qvo.getWdate()%></td>
					<td width="25%"><%=qvo.getTitle()%></td>
					<td width="15%" align="center"><%=qvo.getWriter()%></td>
					<td width="10%" align="center"><%=qvo.getYn()%></td>
					<td width="20%" align="center">
						<button type="button" class="btn btn-success" style="margin-bottom: 0.5em" onclick="showQnAPlus(<%=qvo.getNum()%>, '<%=qvo.getYn()%>', <%=i%>)">조회</button>
						<button type="button" class="btn btn-danger"  style="margin-bottom: 0.5em" onclick="qnaDel('<%=qvo.getNum()%>')">삭제</button>
					</td>
				</tr>
				<%} %>
				<%-- <tr>
					<td colspan="6" class="text-center">
						<ul class="pagination">
							<c:forEach var="i" begin="1" end="${pageCount}">
								<li <c:if test="${cpage eq i}">class='active'</c:if>>
									<a href="admin-qna-list.do?cpage=${i}#qnaListBody">${i}</a>
								</li>
						  	</c:forEach>
						</ul>
					</td>
				</tr> --%>
			<%} %>
		</tbody>
	</table>
	
	<!-- 검색 관련 폼 ========================================= -->
	<div style="text-align: center;">
	<form name="findF" action="coffeam_adminFindQ.jsp" style="margin-top:20px">
		<p><br>
		<select name="findType" id="findType">
			<optgroup label="검색 유형">
				<!-- value에 컬럼명을 쓰면 get방식이라 컬럼명이 노출됨.
				컬럼명으로 해킹과 같은 위험성이 있기 때문에 숫자로 주었다. -->
				<option value="0">제목</option>
				<option value="1">작성자</option>
				<option value="2">작성일</option>
				<option value="3">답변여부</option>
			</optgroup>
		</select>
		<input type="text" name="findString" id="findString" size="40" placeholder="<%=findString%>">
		<button class="btn btn-default">검색</button>
		<a href="<%=request.getContextPath()%>/service/admin-qna-list.do">
			<button type="button" class="btn btn-default">목록으로</button>
		</a>
	</form>
	</div>
	<!-- =========================================================== -->	
</div>


<!-- ----------------------------------------------------------------------- -->
<!-- QnA 삭제 폼 ------------------------------------------- -->
<form name="qnaDelF" id="qnaDelF" action="admin-q-delete.do" method="POST">
	<input type="hidden" name="num_del" id="num_del">
</form>
<!-- ----------------------------------------------------------- -->

<!-- QnA 조회 폼 ------------------------------------------- -->
<form name="qnaSeeF" id="qnaSeeF" action="qPlus.jsp" method="POST">
	<input type="hidden" name="num_see" id="num_see">
</form>
<!-- ----------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------- -->

</div><!-- div class="row" -->

<script type="text/javascript">
 	function showQnAPlus(num, yn, i){
 		$('tr').removeClass('active');
 		$('#tr'+(i)).addClass('active');
 		
 		$.ajax({
 			url: "qPlus.jsp?qn="+num,
 			type:'get',
 			dataType:"text",
 			success:function(data){
 				$('#showQ').html(data);
 			},
 			error:function(){
 				alert('error');
 			}
 		});
 		
 		$.ajax({
 			url: "aPlus.jsp?qn="+num+"&yn="+yn,
 			type:'get',
 			dataType:"text",
 			success:function(data){
 				$('#showA').html(data);
 			},
 			error:function(){
 				alert('error');
 			}
 		});
	}	 

	var qnaDel = function(vnum){
		$('#num_del').val(vnum);
		var yn = window.confirm(vnum+"번 질문을 정말 삭제하시겠습니까?");
		if(yn){
			$('#qnaDelF').submit();
		}else{
			
		}
	}
</script>
	
	<div id="showQ"></div>
	<div id="showA"></div>
	
	<!-- QnA 번호를 넘겨줄 form 작성 -->
	<form name="qnF" id="qnF" method="get"><!-- action="qPlus.jsp"  -->
		<input type="hidden" name="qn" id="qn">
	</form>
		
</div><!-- div class="col-md-12" -->
</div>      
<%-- <jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_adminFoot.jsp"/> --%>
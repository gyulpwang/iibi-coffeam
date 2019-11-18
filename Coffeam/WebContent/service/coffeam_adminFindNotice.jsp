<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, notice.model.*, java.text.*"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/login/adminloginCheckModule.jsp" %>
<jsp:useBean id="adao" class="user.admin.AdminDAO" scope="session"/>
<jsp:useBean id="ndao" class="notice.model.NoticeDAO" scope="session"/>

<jsp:include page="/coffeam_adminTop.jsp"/>
<script type="text/javascript">$('#service').addClass('active');</script>
<script type="text/javascript">$('#asvc_notice').addClass('active');</script>

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
		response.sendRedirect("admin-ntc-list.do");
		return;
	}
%>


<div class="col-md-12">
	<div class="row box">
	<table class="table">
		<thead id="ntcList">
		<tr class="tableTitle">
			<td colspan="2">
				<h3><b>공지사항 검색결과</b></h3>
			</td>
			<td align="right">
				<a href="admin-ntc-form.do" style="color: #fff">
					<i class="fa fa-3x fa-pencil fa-fw" style="color: #fff; font-size: 10px"></i>
					작성하기
				</a>
			</td>
		</tr>
		</thead>
		<tbody></tbody>
	</table>
	
		<div class="col-md-12">
	 	<table class="table table-responsive" id="ntcListBody">
			<thead>
				<tr style="font-weight:bold; text-align: center; width: 105%">
					<td width="10%">번호</td>
					<td width="20%">작성일</td>
					<td width="30%">제목</td>
					<td width="15%">작성자</td>
					<td width="25%">조회·수정·삭제</td>
	    		</tr>
			</thead>
			<tbody>
				<% List<NoticeVO> arr = ndao.findNotice(findType, findString);
	
				if(arr==null || arr.size()==0){
					%><tr><td colspan='5'>서버 오류이거나 데이터가 없습니다.</td></tr><%
				}else{
					// 반복문 돌 부분 ---------------------------
					Iterator<NoticeVO> it = arr.iterator();
					while(it.hasNext()){
						NoticeVO nvo = it.next();	int i=0; %>
						<tr id="tr<%=i%>">
							<td width="10%" align="center"><%=nvo.getNum()%></td>
							<td width="20%" align="center"><%=nvo.getWdate()%></td>
							<td width="30%"><%=nvo.getTitle()%></td>
							<td width="15%" align="center"><%=nvo.getWriter()%></td>
							<td width="25%" align="center">
								<button type="button" class="btn btn-success" style="margin-bottom: 0.5em" onclick="showNoticePlus(<%=nvo.getNum()%>, <%=i%>)">조회</button>
								<button type="button" class="btn btn-warning" style="margin-bottom: 0.5em" onclick="ntcEdit(<%=nvo.getNum()%>)">수정</button>
								<button type="button" class="btn btn-danger"  style="margin-bottom: 0.5em"onclick="ntcDel(<%=nvo.getNum()%>)">삭제</button>
							</td>
						</tr>
					<%} %>
					<%-- <tr>
						<td colspan="5" class="text-center">
							<ul class="pagination">
								<c:forEach var="i" begin="1" end="${pageCount}">
									<li <c:if test="${cpage eq i}">class='active'</c:if>>
										<a href="admin-ntc-list.do?cpage=${i}#ntcListBody">${i}</a>
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
	<form name="findF" action="coffeam_adminFindNotice.jsp" style="margin-top:20px">
		<p><br>
		<select name="findType" id="findType">
			<optgroup label="검색 유형">
				<!-- value에 컬럼명을 쓰면 get방식이라 컬럼명이 노출됨.
				컬럼명으로 해킹과 같은 위험성이 있기 때문에 숫자로 주었다. -->
				<option value="0">제목</option>
				<option value="1">작성일</option>
			</optgroup>
		</select>
		<input type="text" name="findString" id="findString" size="40" placeholder="<%=findString%>">
		<button class="btn btn-default">검색</button>
		<a href="<%=request.getContextPath()%>/service/admin-ntc-list.do">
			<button type="button" class="btn btn-default">목록으로</button>
		</a>
	</form>
	</div>
	<!-- =========================================================== -->	
			
			
		</div>
	
<!-- ----------------------------------------------------------------------- -->
<!-- 공지사항 삭제 폼 ------------------------------------------- -->
<form name="ntcDelF" id="ntcDelF" action="admin-ntc-delete.do" method="POST">
	<input type="hidden" name="num" id="num">
</form>
<!-- ----------------------------------------------------------- -->
<!-- 공지사항 수정 폼 ------------------------------------------- -->
<form name="ntcEditF" id="ntcEditF" action="admin-ntc-edit-form.do" method="POST">
	<input type="hidden" name="num" id="num_edit">
</form>
<!-- ----------------------------------------------------------- -->
<!-- 공지사항 조회 폼 ------------------------------------------- -->
<form name="ntcSeeF" id="ntcSeeF" action="noticePlus.jsp" method="POST">
	<input type="hidden" name="num_see" id="num_see">
</form>
<!-- ----------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------- -->

	</div>
	
	<script type="text/javascript">
	 	function showNoticePlus(num, i){
 	 		$('tr').removeClass('active');
	 		$('#tr'+(i)).addClass('active');
	 		
	 		$.ajax({
	 			url: "noticePlus.jsp?nn="+num,
	 			type:'get',
	 			dataType:"text",
	 			success:function(data){
	 				$('#showNotice').html(data);
	 			},
	 			error:function(){
	 				alert('error');
	 			}
	 		});
		}	 
	 	
		var ntcEdit = function(vnum){
			$('#num_edit').val(vnum);
			$('#ntcEditF').submit();
		}
		
		/* var ntcSee = function(vnum){
		 	$('#num_see').val(vnum);
			$('#ntcSeeF').submit();
		} */
		
		var ntcDel = function(vnum){
			$('#num').val(vnum);
			var yn = window.confirm("이 공지사항을 정말 삭제하시겠습니까?");
			if(yn){
				$('#ntcDelF').submit();
			}else{
				
			}
		}
	</script>
	
	<div id="showNotice"></div>
	
	<!-- 공지사항 번호를 넘겨줄 form 작성 -->
	<form name="nnF" id="nnF" action="noticePlus.jsp" method="get">
		<input type="hidden" name="nn" id="nn">
	</form>
</div>
</div>
<%-- <jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_adminFoot.jsp"/> --%>
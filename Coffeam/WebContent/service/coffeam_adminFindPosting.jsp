<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, freeboard.model.*, java.text.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/login/adminloginCheckModule.jsp" %>
<jsp:useBean id="cdao" class="user.member.MemberDAO" scope="session"/>
<jsp:useBean id="fdao" class="freeboard.model.FreeBoardDAO" scope="session"/>
<!DOCTYPE html>

<jsp:include page="/coffeam_adminTop.jsp"/>
<script type="text/javascript">$('#service').addClass('active');</script>
<script type="text/javascript">$('#asvc_freeboard').addClass('active');</script>	

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
		response.sendRedirect("admin-fb-list.do");
		return;
	}
	int ftype=Integer.parseInt(findType);
	
%>

<div class="col-md-12">
	<div class="row box">
<!-- ---------------------테이블  ------------------------------------------------------------ -->
<!-- 파일 업로드 시 post 방식. enctype="multipart/form-data" -->
<form name="ff" id="ff" role="form" method="POST" enctype="multipart/form-data">
<input type="hidden" name="idx" id="idx" value="${loginAdmin.adminNo}">
<input type="hidden" name="writer" id="writer" value="${loginAdmin.adminName}">
<!-- ------------------------------------------------------------- -->

<!-- 조회 폼 ------------------------------------------------------------------------------------ -->
<table class="table table-responsive">
	<thead id="fbList">
		<tr class="tableTitle">
			<td colspan="5">
				<h3><b>자유게시판 검색</b></h3>
			</td>
			<!-- <td align="right">
				<a href="admin-fb-form.do" style="color: #fff">
					<i class="fa fa-3x fa-pencil fa-fw" style="color: #fff; font-size: 10px"></i>
					작성하기
				</a>
			</td> -->
		</tr>
	</thead>
	<tbody id="fbListBody">
		<tr>
			<th width="10%" style="text-align: center;">번호</th>
			<th width="15%" style="text-align: center;">업로드<br>이미지</th>
			<th width="30%" style="text-align: center;">제목</th>
			<th width="20%" style="text-align: center;">작성자<br>작성일</th>
			<th width="25%" style="text-align: center;">조회·삭제</th>
		</tr>
	<!-- ---------------------------------------- -->
	<% List<FreeBoardVO> arr = fdao.findPosting(findType, findString);
	
		if(arr==null || arr.size()==0){
			%><tr><td colspan='5'>서버 오류이거나 데이터가 없습니다.</td></tr><%
		}else{
			// 반복문 돌 부분 ---------------------------
			Iterator<FreeBoardVO> it = arr.iterator();
			while(it.hasNext()){
				FreeBoardVO fvo = it.next();	int i=0; %>
				<tr id="tr<%=i++%>">
					<td width="10%">
						${fvo.num}
						<%=fvo.getNum()%>
					</td>
					<td width="15%">
						<%if(fvo.getUpfile() == null){ %>
							<img src="<%=request.getContextPath()%>/images/person.PNG"  class="img img-thumbnail img-responsive" width="100px">
						<%}else{ %>
							<img src="Upload/<%=fvo.getUpfile()%>" class="img img-thumbnail img-responsive" width="100px">
						<%} %>
					</td>
					<td width="30%">
						<span style="font-weight:bold; font-size:large;"><%=fvo.getTitle()%></span><br>
					</td>
					<td width="20">
						<!-- <div align="right"> -->
							<span style="font-weight:bold; font-size: small;">작성자 : <%=fvo.getWriter()%></span><br>
							<span style="font-weight:bold;">작성일 : <fmt:formatDate pattern="yy/MM/dd" value="<%=fvo.getWdate()%>"/></span>
						<!-- </div> -->
					</td>
					<td width="25%"><div align="center">
						<button type="button" class="btn btn-success" style="margin-bottom: 0.5em" onclick="fbSee(<%=fvo.getNum()%>)">조회</button>
						<button type="button" class="btn btn-danger" style="margin-bottom: 0.5em" onclick="fbDel(<%=fvo.getNum()%>)">삭제</button>
					</div></td>
				</tr>
			<%} %>
		<%-- <tr>
			<td colspan="5" class="text-center">
				<ul class="pagination">
					<c:forEach var="i" begin="1" end="${pageCount}">
						<li <c:if test="${cpage eq i}">class='active'</c:if>>
							<a href="admin-fb-list.do?cpage=${i}#fbListBody">${i}</a>
						</li>
				  	</c:forEach>
				</ul>
			</td>
		</tr> --%>
	<%} %>
	</tbody>
</table>
</form>

<!-- 검색 관련 폼 ========================================= -->
<script type="text/javascript">
<%
	if(ftype==0){
		%>$('#opt0').attr('selected', 'selected');<%
	}else if(ftype==1){
		%>$('#opt1').addClass('selected', 'selected');<%
	}else if(ftype==2){
		%>$('#opt2').attr('selected', 'selected');<%
	}else{
		%>$('#opt0').attr('selected', 'selected');<%
	}%>
</script>

	<div style="text-align: center;">
	<form name="findF" action="coffeam_adminFindPosting.jsp" style="margin-top:20px">
		<p><br>
		<select name="findType" id="findType">
			<optgroup label="검색 유형">
				<!-- value에 컬럼명을 쓰면 get방식이라 컬럼명이 노출됨.
				컬럼명으로 해킹과 같은 위험성이 있기 때문에 숫자로 주었다. -->
				<option id="opt0" value="0">제목</option>
				<option id="opt1" value="1">작성자</option>
				<option id="opt2" value="2">작성일</option>
			</optgroup>
		</select>
		<input type="text" name="findString" id="findString" size="40" placeholder="<%=findString%>">
		<button class="btn btn-default">검색</button>
		<a href="<%=request.getContextPath()%>/service/admin-fb-list.do">
			<button type="button" class="btn btn-default">목록으로</button>
		</a>
	</form>
	</div>
	<!-- =========================================================== -->	

</div><!-- div row box end -->

<!-- 자유게시글 삭제 폼 ------------------------------------------- -->
<form name="fbDelF" id="fbDelF" action="admin-fb-delete.do" method="POST">
	<input type="hidden" name="num" id="num">
</form>
<!-- ----------------------------------------------------------- -->
<!-- 자유게시글 수정 폼 ------------------------------------------- -->
<!-- <form name="fbEditF" id="fbEditF" action="adminfb-edit-form.do" method="POST">
	<input type="hidden" name="num" id="num_edit">
</form> -->
<!-- ----------------------------------------------------------- -->
<!-- 자유게시글 조회 폼 ------------------------------------------- -->
<form name="fbSeeF" id="fbSeeF" action="adminFbSeePlus.jsp" method="POST">
	<input type="hidden" name="num_see" id="num_see">
</form>
<!-- ----------------------------------------------------------- -->

<!-- 리뷰글 수정처리 -->
<script type="text/javascript">
/* 	var fbEdit = function(vnum){
		$('#num_edit').val(vnum);
		$('#fbEditF').submit();
	} */
	
	var fbDel = function(vnum){
		$('#num').val(vnum);
		var yn = window.confirm("게시글을 정말 삭제하시겠습니까?");
		if(yn){
			$('#fbDelF').submit();
		}else{}
	}
	
	var fbSee = function(vnum, i){
		$('tr').removeClass('active');
 		$('#tr'+(i-1)).addClass('active');

 		$('#num_see').val(vnum);
		$('#fbSeeF').submit();
	}
</script>
<!-- ------------------------------------------------------------------------------------------------- -->
	<div id="fbPlusLoc"></div>
</div>
</div>
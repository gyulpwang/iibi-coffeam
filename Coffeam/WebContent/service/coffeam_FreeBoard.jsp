<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, freeboard.model.*, java.text.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/login/loginCheckModule.jsp" %>
<jsp:useBean id="cdao" class="user.member.MemberDAO" scope="session"/>
<jsp:useBean id="fdao" class="freeboard.model.FreeBoardDAO" scope="session"/>
<!DOCTYPE html>

<jsp:include page="/coffeam_top.jsp"/>
<script type="text/javascript">$('#service').addClass('active');</script>
<script type="text/javascript">$('#svc_freeboard').addClass('active');</script>	
<jsp:include page="/coffeam_svcAside.jsp"/>


<div class="col-md-12">
	<div class="row box">
<!-- ---------------------테이블  ------------------------------------------------------------ -->
<!-- 파일 업로드 시 post 방식. enctype="multipart/form-data" -->
<form name="ff" id="ff" role="form" method="POST" enctype="multipart/form-data">
<input type="hidden" name="idx" id="idx" value="${loginUser.idx}">
<input type="hidden" name="writer" id="writer" value="${loginUser.name}">
<!-- ------------------------------------------------------------- -->

<!-- 조회 폼 ------------------------------------------------------------------------------------ -->
<table class="table table-responsive">
	<thead id="fbList">
		<tr class="tableTitle">
			<td colspan="3">
				<h3><b>자유게시판</b></h3>
			</td>
			<td align="right">
				<a href="fb-insert.do" style="color: #fff">
					<i class="fa fa-3x fa-pencil fa-fw" style="color: #fff; font-size: 10px"></i>
					작성하기
				</a>
			</td>
		</tr>
	</thead>
	<tbody id="fbListBody">
		<tr>
			<th width="10%" style="text-align: center;">번호</th>
			<th width="15%" style="text-align: center;">업로드<br>이미지</th>
			<th width="55%" style="text-align: center;">제목<br>작성자 및 작성일</th>
			<th width="20%" style="text-align: center;">조회·수정·삭제</th>
		</tr>
	<!-- ---------------------------------------- -->
	<c:if test="${FBList eq null or empty FBList}">
		<tr><td colspan="3" class="text-center">
			<b>게시글이 없거나 서버 오류입니다.</b></td>
		</tr>
	</c:if>
	<c:if test="${FBList ne null and not empty FBList}">
		<c:forEach var="fvo" items="${FBList}">
			<tr id="tr${i.count}">
				<td width="10%">
					${fvo.num}
				</td>
				<td width="15%">
					<c:if test="${fvo.upfile eq null}">
						<img src="<%=request.getContextPath()%>/images/person.PNG"  class="img img-thumbnail img-responsive" width="100px">
					</c:if>
					<c:if test="${fvo.upfile ne null}">
						<img src="Upload/${fvo.upfile}" class="img img-thumbnail img-responsive" width="100px">
					</c:if>
				</td>
				<td width="50%">
					<h3>${fvo.title}</h3>
					<span style="font-weight:bold;">작성자 : ${fvo.writer}</span>
					&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
					<span style="font-weight:bold;">작성일 : <fmt:formatDate pattern="yy/MM/dd" value="${fvo.wdate}"/></span>
					<%-- <p>${fvo.contents}</p> --%>
				</td>
				<td width="25%">
					<%-- <b>${fvo.writer}</b><br>[<fmt:formatDate pattern="yy/MM/dd" value="${fvo.wdate}"/>]
					<br> --%>
					<c:if test="${loginUser.idx eq fvo.idx}">
						<button type="button" class="btn btn-success" style="margin-bottom: 0.5em" onclick="fbSee('${fvo.num}', '${i.count}')">조회</button><br>
						<button type="button" class="btn btn-warning" style="margin-bottom: 0.5em" onclick="fbEdit('${fvo.num}')">수정</button><br>
						<button type="button" class="btn btn-danger" onclick="fbDel('${fvo.num}')">삭제</button>
					</c:if>
					<c:if test="${loginUser.idx ne fvo.idx}">
						<button type="button" class="btn btn-success" onclick="fbSee('${fvo.num}', '${i.count}')">조회</button>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4" class="text-center">
				<ul class="pagination">
					<c:forEach var="i" begin="1" end="${pageCount}">
						<li <c:if test="${cpage eq i}">class='active'</c:if>>
							<a href="fb-list.do?cpage=${i}#fbListBody">${i}</a>
						</li>
				  	</c:forEach>
				</ul>
			</td>
		</tr>
	</c:if>
	</tbody>
</table>
</form>

<!-- 검색 관련 폼 ========================================= -->
	<div style="text-align: center;">
	<form name="findF" action="coffeam_FindPosting.jsp" style="margin-top:20px">
		<p><br>
		<select name="findType" id="findType">
			<optgroup label="검색 유형">
				<!-- value에 컬럼명을 쓰면 get방식이라 컬럼명이 노출됨.
				컬럼명으로 해킹과 같은 위험성이 있기 때문에 숫자로 주었다. -->
				<option value="0">제목</option>
				<option value="1">작성자</option>
				<option value="2">작성일</option>
			</optgroup>
		</select>
		<input type="text" name="findString" id="findString" size="40">
		<button class="btn btn-default">검색</button>
	</form>
	</div>
<!-- =========================================================== -->

</div><!-- div row box end -->
<!-- ----------------------------------------------------------------------- -->
<!-- 리뷰 글 삭제 폼 ------------------------------------------- -->
<form name="fbDelF" id="fbDelF" action="fb-delete.do" method="POST">
	<input type="hidden" name="num" id="num">
</form>
<!-- ----------------------------------------------------------- -->
<!-- 리뷰 글 수정 폼 ------------------------------------------- -->
<form name="fbEditF" id="fbEditF" action="fb-edit-form.do" method="POST">
	<input type="hidden" name="num" id="num_edit">
</form>
<!-- ----------------------------------------------------------- -->
<!-- 리뷰 글 조회 폼 ------------------------------------------- -->
<form name="fbSeeF" id="fbSeeF" action="fbSeePlus.jsp" method="POST">
	<input type="hidden" name="num_see" id="num_see">
</form>
<!-- ----------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------- -->

<!-- 리뷰글 수정처리 -->
<script type="text/javascript">
	var fbEdit = function(vnum){
		$('#num_edit').val(vnum);
		$('#fbEditF').submit();
	}
	
	var fbDel = function(vnum){
		$('#num').val(vnum);
		var yn = window.confirm("게시글을 정말 삭제하시겠습니까?");
		if(yn){
			$('#fbDelF').submit();
		}else{
			
		}
	}
	
	var fbSee = function(vnum, i){
		$('tr').removeClass('active');
 		$('#tr'+(i)).addClass('active');

 		$('#num_see').val(vnum);
		$('#fbSeeF').submit();
	}
</script>
<!-- ------------------------------------------------------------------------------------------------- -->
	<div id="fbPlusLoc"></div>
</div>

<jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_foot.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, freeboard.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="cdao" class="user.member.MemberDAO" scope="session"/>
<jsp:useBean id="fdao" class="freeboard.model.FreeBoardDAO" scope="session"/>

<jsp:include page="/coffeam_top.jsp"/>
<script type="text/javascript">$('#service').addClass('active');</script>
<script type="text/javascript">$('#svc_freeboard').addClass('active');</script>	
<jsp:include page="/coffeam_svcAside.jsp"/>
<div class="col-md-12">
	<div class="row box">
	<!-- ---------------------테이블  ------------------------------------------------------------ -->
	<form name="ff" id="ff" role="form" method="POST" enctype="multipart/form-data">
	<!-- 파일 업로드 시 post 방식. enctype="multipart/form-data" -->
	<input type="hidden" name="idx" id="idx" value="${loginUser.idx}">
	<input type="hidden" name="writer" id="writer" value="${loginUser.name}">
	<!-- ------------------------------------------------------------- -->
		
		<table class="table table-bordered table-responsive">
			<thead>
				<tr>
					<td colspan="4" class="tableTitle">
						<h3><b>자유게시판 작성</b></h3>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" id="title" placeholder="제목을 입력해주세요." class="form-control"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${loginUser.name}[${loginUser.userid}]</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="contents" id="contents" rows="10" placeholder="내용을 입력해주세요." class="form-control"></textarea></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="upfile" id="upfile" accept="image/*" class="form-control"></td>
				</tr>
				<tr align="center">
					<td colspan="2"><button type="button" class="btn btn-danger" onclick="send()">등록하기</button>
					<button type="reset" class="btn btn-default">다시쓰기</button></td>
				</tr>
			</tbody>
		</table>
	</form>	
		
	<script type="text/javascript">
		var send=function(){
			if(!$('#title').val()){
				alert('제목을 입력하세요.');
				$('#title').focus();
				return;
			}
			if(!$('#contents').val()){
				alert('내용을 입력하세요.');
				$('#contents').focus();
				return;
			}
			$('#ff').attr("action", "fb-insert.do");
			$('#ff').submit();
		}
	</script>
	</div>
</div>
<jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_foot.jsp"/>
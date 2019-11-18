<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, notice.model.*"%>
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

<div class="col-md-12">
	<div class="row box">
	<!-- ---------------------테이블  ------------------------------------------------------------ -->
	<form name="nf" id="nf" role="form" method="POST" enctype="multipart/form-data">
	<!-- 파일 업로드 시 post 방식. enctype="multipart/form-data" -->
	<input type="hidden" name="adminNo" id="adminNo" value="${loginAdmin.adminNo}">
	<input type="hidden" name="writer" id="writer" value="${loginAdmin.adminName}">
	<!-- ------------------------------------------------------------- -->
		
		<table class="table table-bordered table-responsive">
			<thead>
				<tr>
					<td colspan="4" class="tableTitle">
						<h3><b>공지사항 작성</b></h3>
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
					<td>${loginAdmin.adminName}</td>
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
			$('#nf').attr("action", "admin-ntc-insert.do");
			$('#nf').submit();
		}
	</script>
	</div>
</div>
</div>
<%-- <jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_adminFoot.jsp"/> --%>
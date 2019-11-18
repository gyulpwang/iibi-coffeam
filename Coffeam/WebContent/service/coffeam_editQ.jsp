<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
<fmt:formatDate value="${board.write_dt}" pattern="yyyy-MM-dd" var="write_dt"/>    
    
<jsp:useBean id="qdao" class="qna.model.QnADAO" scope="session"/>
<jsp:useBean id="qvo" class="qna.model.QnAVO" scope="session"/>
   
<%@ include file="/login/loginCheckModule.jsp" %>
<jsp:include page="/coffeam_top.jsp"/>
<script type="text/javascript">$('#service').addClass('active');</script>
<script type="text/javascript">$('#svc_qna').addClass('active');</script>
<jsp:include page="/coffeam_svcAside.jsp"/>

<div class="col-md-12">
	<div class="row box">
		<form name="qf" id="qf" role="form" method="POST" action="q-edit.do">
		<!-- hidden data[글번호, 회원번호, 작성자] ----------------------------- -->
		<input type="hidden" name="num" id="num" value="${myQAList.num}">
		<input type="hidden" name="idx" id="idx" value="${loginUser.idx}">
		<input type="hidden" name="writer" id="writer" value="${loginUser.name}">
		<!-- ------------------------------------------------------------- -->
	<table class="table">
		<thead>
			<tr>
				<td colspan="4" class="tableTitle">
					<h3><b>질문(Q) 수정</b></h3>
				</td>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${myQAList eq null}">
					<tr><td colspan='2'>존재하지 않는 글입니다.</td></tr>
				</c:when>
				<c:otherwise>
					<tr>
						<th width="20%">제목</th>
						<td><input type="text" style="width:90%;" name="title"	id="title" placeholder="질문 제목을 입력하세요" class="form-control" value="${myQAList.title}"></td>
					</tr>
					<tr>
						<th>작성자</th><td>${loginUser.userid}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea style="width:90%" name="contents" id="contents" class="form-control" 
							rows="10" placeholder="질문 내용을 입력하세요">${myQAList.contents}</textarea>
						</td>
					</tr>
					<tr>
						<td style="text-align:center;" colspan="2">
							<button type="button" class="btn btn-danger" onclick="send()">등록하기</button>&ensp;
							<button type="reset" class="btn btn-default">다시쓰기</button>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	</form>
	<script type="text/javascript">
		var send=function(){
			if(!$('#title').val()){
				alert('질문 제목을 입력하세요.');
				$('#title').focus();
				return;
			}
			if(!$('#contents').val()){
				alert('질문 내용을 입력하세요.');
				$('#contents').focus();
				return;
			}
			
			$('#qf').submit();
		}
	</script>

	</div><!-- div class="row" -->
</div><!-- div class="col-md-12" -->
      
<jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_foot.jsp"/>


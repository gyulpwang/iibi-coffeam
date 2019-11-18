<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- jstl 다운로드 및 배치
http://tomcat.apache.org/download-taglibs.cgi로 들어가서

•Impl: ◦ taglibs-standard-impl-1.2.5.jar (pgp, md5) 
•Spec: ◦ taglibs-standard-spec-1.2.5.jar (pgp, md5) 
•EL: ◦ taglibs-standard-jstlel-1.2.5.jar (pgp, md5) 
•Compat: ◦ taglibs-standard-compat-1.2.5.jar (pgp, md5) 

모두 다운로드 후, 
자신의 프로젝트 > WebContent > WEB-INF > lib 안에 jar 파일 모두 넣어놓기. 
 -->

<jsp:include page="/coffeam_top.jsp"/>
<div class="container">
<!-- 메모 등록 폼 -->
<div class="row">
	<div class="col-md-10 col-md-offset-1">
		<jsp:include page="/memo/memo_include.jsp"/>
	</div>
</div>

<div class="row" id="mList">
<div class="col-md-10 col-md-offset-1">
	<!-- <h1>::: 한줄 메모장 :::</h1> -->
	<%-- ${memoArr} --%>
	<table class="table table-striped table-bordered">
		<tr class="success">
			<th width="10%">글번호</th>
			<th width="50%">메모내용</th>
			<th width="15%">작성자</th>
			<th width="15%">작성일</th>
			<th width="10%">삭제</th>
		</tr>
		<!-- ------------------------- -->
		<c:if test="${memoArr==null || empty memoArr}">
		<tr>
			<td colspan='4'>
				서버오류이거나 데이터가 없습니다.
			</td>
		</tr>
		</c:if>
		<c:if test="${memoArr !=null && not empty memoArr}">
		<!-- 확장 for 루프와 유사. 자료구조를 넣어준다. -->
		<c:forEach var="memo" items="${memoArr}">
		<tr>
			<!-- jsp에서는 출력식 안에 memo.getIdx()와 같이 불렀다면
			jstl에서는 get을 생략하고 바로 프로퍼티명을 붙인다. -->
			<td>${memo.idx}</td>
			<td>${memo.msg}</td>
			<td>${memo.name}</td>
			<td>${memo.wdate}</td>
			<td><a href="javascript:del('${memo.idx}')">삭제</a></td>
		</tr>
		</c:forEach>
		</c:if>
		<!-- ------------------------- -->
		<tr>
			<td colspan="3" class="text-center">
				<ul class="pagination pagination-sm">
				<c:forEach var="i" begin="1" end="${pageCount}">
					<c:if test="${i==cpage}">
						<li class="active"><a href="#mList">${i}</a></li>
					</c:if>
					<c:if test="${i!=cpage}">
						<li><a href="memo-list.do?cpage=${i}#mList">${i}</a></li>						
					</c:if>
				</c:forEach>
				</ul>
			</td>
			<td colspan="2">
				총 게시글 수 : <span style="color:red; font-weight:bold;">${totalCount}</span>개<br>
				<span style="color:blue; font-weight:bold;">${cpage}</span>
				/<b>${pageCount}</b>장
			</td>
		</tr>
	</table>
</div>
</div>
</div>
<!-- 삭제를 위한 form --------------------------------- -->
<form name="delF">
	<input type="hidden" name="idx" id="idx">
</form>
<!-- -------------------------------------------------- -->
<script type="text/javascript">
	var del=function(vidx){
		var yn=confirm(vidx+"번 글을 정말 삭제합니까?");
		//memo-delete.do
		if(yn){
			delF.idx.value=vidx;
			delF.action="memo-delete.do";
			delF.method="POST";
			delF.submit();
		}
	}
</script>
<jsp:include page="/coffeam_foot.jsp"/>
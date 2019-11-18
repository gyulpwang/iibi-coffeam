<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, qna.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<jsp:useBean id="cdao" class="user.member.MemberDAO" scope="session"/>
<jsp:useBean id="qdao" class="qna.model.QnADAO" scope="session"/>

<jsp:include page="/coffeam_top.jsp"/>
<script type="text/javascript">$('#service').addClass('active');</script>
<script type="text/javascript">$('#svc_qna').addClass('active');</script>	
<jsp:include page="/coffeam_svcAside.jsp"/>

<div class="col-md-12">
	<div class="row box">
	<table class="table table-responsive">
		<thead id="qnaList">
			<tr class="tableTitle">
				<td colspan="3">
					<h3><b>Q&amp;A</b></h3>
				</td>
				<td align="right">
				<a href="q-form.do" style="color: #fff">
					<i class="fa fa-3x fa-pencil fa-fw" style="color: #fff; font-size: 10px"></i>
					질문하기
				</a>
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
				<th width="30%" style="text-align: center">제목</th>
				<th width="20%" style="text-align: center">작성자</th>
				<th width="10%" style="text-align: center">답변여부</th>
				<th width="10%" style="text-align: center">조회·수정·삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${QAList eq null or empty QAList}">
				<tr><td colspan="5" class="text-center">
					<b>게시글이 없거나 서버 오류입니다.</b></td>
				</tr>
			</c:if>
			<c:if test="${QAList ne null and not empty QAList}">
				<c:forEach var="qvo" items="${QAList}" varStatus="i">
				<tr id="tr${i.count}">
					<td width="10%" align="center">${qvo.num}</td>
					<td width="20%" align="center">${qvo.wdate}</td>
					<td width="30%">${qvo.title}</td>
					<td width="20%" align="center">${qvo.writer}</td>
					<td width="10%" align="center">${qvo.yn}</td>
					<td width="10%" align="center">
						<c:if test="${loginUser.idx eq qvo.idx}">						
							<button type="button" class="btn btn-success" style="margin-bottom: 0.5em" onclick="showQnAPlus(${qvo.num}, '${qvo.yn}', ${i.count})">조회</button><br>
							<button type="button" class="btn btn-warning" style="margin-bottom: 0.5em" onclick="qnaEdit('${qvo.num}')">수정</button><br>
							<button type="button" class="btn btn-danger"  style="margin-bottom: 0.5em" onclick="qnaDel('${qvo.num}')">삭제</button>
						</c:if>
						<c:if test="${loginUser.idx ne qvo.idx}">
							<button type="button" class="btn btn-success" style="margin-bottom: 0.5em" onclick="showQnAPlus(${qvo.num}, '${qvo.yn}', ${i.count})">조회</button><br>
						</c:if>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="6" class="text-center">
						<ul class="pagination">
							<c:forEach var="i" begin="1" end="${pageCount}">
								<li <c:if test="${cpage eq i}">class='active'</c:if>>
									<a href="qna-list.do?cpage=${i}#qnaListBody">${i}</a>
								</li>
						  	</c:forEach>
						</ul>
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	
	<!-- 검색 관련 폼 ========================================= -->
	<div style="text-align: center;">
	<form name="findF" action="coffeam_FindQ.jsp" style="margin-top:20px">
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
		<input type="text" name="findString" id="findString" size="40">
		<button class="btn btn-default">검색</button>
	</form>
	</div>
	<!-- =========================================================== -->	
</div>


<!-- ----------------------------------------------------------------------- -->
<!-- QnA 삭제 폼 ------------------------------------------- -->
<form name="qnaDelF" id="qnaDelF" action="q-delete.do" method="POST">
	<input type="hidden" name="num_del" id="num_del">
</form>
<!-- ----------------------------------------------------------- -->
<!-- QnA 수정 폼 ------------------------------------------- -->
<form name="qnaEditF" id="qnaEditF" action="q-edit-form.do" method="POST">
	<input type="hidden" name="num_edit" id="num_edit">
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
 			url: "aPlus_forMember.jsp?qn="+num+"&yn="+yn,
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
	var qnaEdit = function(vnum){
		$('#num_edit').val(vnum);
		$('#qnaEditF').submit();
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
      
      
<jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_foot.jsp"/>
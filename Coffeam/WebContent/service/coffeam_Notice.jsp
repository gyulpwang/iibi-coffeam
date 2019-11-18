<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, notice.model.*, java.text.*"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:useBean id="cdao" class="user.member.MemberDAO" scope="session"/>
<jsp:useBean id="ndao" class="notice.model.NoticeDAO" scope="session"/>

<jsp:include page="/coffeam_top.jsp"/>
<script type="text/javascript">$('#service').addClass('active');</script>
<script type="text/javascript">$('#svc_notice').addClass('active');</script>
<jsp:include page="/coffeam_svcAside.jsp"/>
<% 	DecimalFormat df = new DecimalFormat("###,###");
	SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd"); %>
	

<div class="col-md-12">
	<div class="row box">
	<table class="table">
		<thead id="ntcList">
			<tr>
				<td class="tableTitle">
					<h3><b>공지사항</b></h3>
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
					<td width="45%">제목</td>
					<td width="15%">작성자</td>
					<td width="10%">조회</td>
					<td width="2%"></td>
	    		</tr>
			</thead>
			<tbody>
				<c:if test="${NTCList eq null or empty NTCList}">
					<tr>
						<td colspan="5" class="text-center"><b>게시글이 없거나 서버 오류입니다.</b></td>
					</tr>
				</c:if>
				<c:if test="${NTCList ne null and not empty NTCList}">
					<c:forEach var="nvo" items="${NTCList}" varStatus="i">
						<tr id="tr${i.count}">
							<td width="10%" align="center">${nvo.num}</td>
							<td width="20%" align="center">${nvo.wdate}</td>
							<td width="30%">${nvo.title}</td>
							<td width="15%" align="center">${nvo.writer}</td>
							<td width="25%" align="center">
								<button type="button" class="btn btn-success" style="margin-bottom: 0.5em" onclick="showNoticePlus(${nvo.num}, ${i.count})">조회</button>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5" class="text-center">
							<ul class="pagination">
								<c:forEach var="i" begin="1" end="${pageCount}">
									<li <c:if test="${cpage eq i}">class='active'</c:if>>
										<a href="ntc-list.do?cpage=${i}#ntcListBody">${i}</a>
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
				<form name="findF" action="coffeam_FindNotice.jsp" style="margin-top:20px">
					<p><br>
					<select name="findType" id="findType">
						<optgroup label="검색 유형">
							<!-- value에 컬럼명을 쓰면 get방식이라 컬럼명이 노출됨.
							컬럼명으로 해킹과 같은 위험성이 있기 때문에 숫자로 주었다. -->
							<option value="0">제목</option>
							<option value="1">작성일</option>
						</optgroup>
					</select>
					<input type="text" name="findString" id="findString" size="40">
					<button class="btn btn-default">검색</button>
				</form>
				</div>
				<!-- =========================================================== -->	
		</div>
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
	</script>
	
	<div id="showNotice"></div>
	
	<!-- 공지사항 번호를 넘겨줄 form 작성 -->
	<form name="nnF" id="nnF" action="noticePlus.jsp" method="get">
		<input type="hidden" name="nn" id="nn">
	</form>
</div>
<jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_foot.jsp"/>
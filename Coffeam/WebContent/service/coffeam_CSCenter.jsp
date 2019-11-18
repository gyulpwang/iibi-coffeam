<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/coffeam_top.jsp"/>
<script type="text/javascript">$('#service').addClass('active');</script>
<%-- <jsp:include page="/coffeam_svcAside.jsp"/> --%>
<jsp:include page="/coffeam_noticeAside.jsp"/>
<!-- <div></div>row
</div>col-md-12
</div>row
</div>col-md-3
<div class="col-md-6">
 -->          
          
<div class="col-md-12">
	<div class="row box">
	<table class="table">
		<thead>
			<tr>
				<td colspan="4" class="tableTitle">
					<h3><b>고객 센터</b></h3>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="color:#af1817; font-size:16px; font-weight:bold">
					<br>고객센터에서는 공지사항과 Q&amp;A, 자유게시판 기능을 제공합니다.<br>
					다음 중 이용하실 메뉴를 선택하여 이동하세요!<br><br>
				</td> 
			</tr>
			<tr>
				<td style="color:#af1817; font-size:16px;">
				<a href="<%=request.getContextPath()%>/service/ntc-list.do">
				<i class="fa fa-3x fa-fw fa-bullhorn" style="font-size:20px"></i>&ensp;<span>공지사항</span></a></td>
			</tr>
			<tr>
				<td style="color:#af1817; font-size:16px;">
				<a href="<%=request.getContextPath()%>/service/qna-list.do">
				<i class="fa fa-3x fa-fw fa-question" style="font-size:20px"></i>&ensp;Q&amp;A</a></td>
			</tr>
			<tr>
				<td style="color:#af1817; font-size:16px;">
				<a href="<%=request.getContextPath()%>/service/fb-list.do">
				<i class="fa fa-3x fa-fw fa-pencil" style="font-size:20px"></i>&ensp;자유게시판</a></td>
			</tr>
		</tbody>
	</table>
	</div>
</div>
<jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_foot.jsp"/>
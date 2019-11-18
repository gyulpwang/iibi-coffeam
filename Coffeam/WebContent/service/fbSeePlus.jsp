<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, freeboard.model.*, java.text.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="cdao" class="user.member.MemberDAO" scope="session"/>
<jsp:useBean id="fdao" class="freeboard.model.FreeBoardDAO" scope="session"/>

<!DOCTYPE html>
<jsp:include page="/coffeam_top.jsp"/>

<script type="text/javascript">$('#service').addClass('active');</script>
<script type="text/javascript">$('#svc_freeboard').addClass('active');</script>	

<jsp:include page="/coffeam_svcAside.jsp"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.magnifier.js"></script>

<div class="col-md-12">
	<div class="row box">
		<table class="table table-bordered table-responsive">
			<thead id="fbList">
				<tr class="tableTitle">
					<td colspan="4">
						<h3><b>자유게시판 조회(상세보기)</b></h3>
					</td>
				</tr>
			</thead>
			<tbody>
				<% String fbNum = request.getParameter("num_see"); 
				int num = Integer.parseInt(fbNum);
				FreeBoardVO fb = fdao.getMyFBList(num);
				if(fb == null/*  || arr.size() == 0 */){
					%><tr><td colspan = '4'>서버 오류이거나 데이터가 없습니다.</td></tr><%
				}else{%>
					<tr>
						<th width="20%">제목</th>
						<td colspan="3" style="font-weight:bold; font-size:large;"><%=fb.getTitle()%></td>
					</tr>
					<tr>
						<th>글번호</th>
						<td><%=fb.getNum()%></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td><%=fb.getWdate()%></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%=fb.getWriter()%></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><%=fb.getContents()%></td>
					</tr>
					<tr>
						<th>업로드<br>이미지</th>
						<td>
							<img src="<%=request.getContextPath()%>/service/Upload/<%=fb.getUpfile()%>" 
							width="300" class="magnify" data-magnifyby="3" data-magnifyduration="500">
						</td>
					</tr>
				<%}%>
				<tr align="center">
					<td colspan="3">
						<a href="<%=request.getContextPath() %>/service/fb-list.do">
							<button type="button" class="btn btn-default">목록으로</button>
						</a>	
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_foot.jsp"/>
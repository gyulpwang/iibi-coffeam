<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, qna.model.*" %>

<jsp:useBean id="qdao" class="qna.model.QnADAO" scope="session"/>

<div class="row box">
	<table class="table">
		<tbody>
			<% String qnaNum = request.getParameter("qn"); 
			int num = Integer.parseInt(qnaNum);
			QnAVO qna = qdao.findQnAByNum(num);
			if(qna == null/*  || arr.size() == 0 */){
				%><tr><td colspan = '4'>서버 오류이거나 데이터가 없습니다.</td></tr><%
			}else{%>
			<tr>
				<td colspan="3" style="font-weight:bold; font-size:large;">
					<%=qna.getTitle()%>
				</td>
			</tr>
			<tr>
				<td width="20%">글번호 : <%=qna.getNum()%></td>
				<td width="40%">작성일 : <%=qna.getWdate()%></td>
				<td width="40%">작성자 : <%=qna.getWriter()%></td>
			</tr>
			<tr>
				<td colspan="3">
					<%= qna.getContents()%>
				</td>
			</tr>
			<%}%>
		</tbody>
	</table>
</div>
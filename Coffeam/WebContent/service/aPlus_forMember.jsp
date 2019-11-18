<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, qna.model.*" %>

<jsp:useBean id="qdao" class="qna.model.QnADAO" scope="session"/>

<div class="row box">
	<table class="table">
		<tbody>
			<% String qnaNum = request.getParameter("qn");
			String vyn = request.getParameter("yn");
			int num = Integer.parseInt(qnaNum);
			QnAVO qna = qdao.findQnAByNum(num);
			if(qna == null/*  || arr.size() == 0 */){
				%><tr><td colspan = '2'>서버 오류이거나 데이터가 없습니다.</td></tr><%
			}else if(vyn.equals("n")){
				%><tr>
					<td colspan='2' style="color:#af1817; font-size: medium; font-weight:bold;">아직 답변이 등록되지 않은 질문입니다.</td>
				</tr><%
			}else{%>
				<tr>
					<td style="font-weight:bold; font-size:large;" width="50%">
						<span style="color:#af1817"><%=qna.getTitle()%></span><span style="font-size: medium;">에 대한 답변</span>
					</td>
					<td style="font-weight:bold; font-size: small;" width="30%">
						질문번호 : <%=qna.getNum()%><br>
						답&ensp;변&ensp;인 : <%=qna.getAnswerer()%>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<%=qna.getAnswer()%>
					</td>
				</tr>
			<%}%>
		</tbody>
	</table>
</div>

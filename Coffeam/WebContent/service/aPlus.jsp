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
					<td colspan='3' style="color:#af1817; font-size: medium; font-weight:bold;">아직 답변이 등록되지 않은 질문입니다.</td>
					<td><button type="button" class="btn btn-warning" style="margin-bottom: 0.5em" onclick="qnaAns(<%=num%>)">답변하기</button><br></td>	
				</tr><%
			}else{%>
				<tr>
					<td style="font-weight:bold; font-size:large;" width="40%">
						<span style="color:#af1817"><%=qna.getTitle()%></span><span style="font-size: medium;">에 대한 답변</span>
					</td>
					<td style="font-weight:bold; font-size: small;" width="30%">
						질문번호 : <%=qna.getNum()%><br>
						답&ensp;변&ensp;인 : <%=qna.getAnswerer()%>
					</td>
					<!-- 관리자일 경우에만 보이도록(colspan 고려)--------------------------------- -->
					<td width="30%" style="text-align:right">
						<button type="button" class="btn btn-warning" style="margin-bottom: 0.5em" onclick="editAns(<%=num%>)">답변수정</button>
						<button type="button" class="btn btn-danger" style="margin-bottom: 0.5em"  onclick="delAns(<%=num%>)">답변삭제</button>
					</td>
					<!-- ----------------------------------------------------------- -->
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

<!-- 답변 삭제 폼 ------------------------------------------- -->
<form name="ansDelF" id="ansDelF" action="admin-a-delete.do" method="POST">
	<input type="hidden" name="num_ansDel" id="num_ansDel">
</form>
<!-- ----------------------------------------------------------- -->
<!-- 답변 수정 폼 ------------------------------------------- -->
<form name="ansEditF" id="ansEditF" action="admin-a-edit-form.do" method="POST">
	<input type="hidden" name="num_ansEdit" id="num_ansEdit">
</form>
<!-- ----------------------------------------------------------- -->

<script type="text/javascript">
	var qnaAns = function(vnum){
		$('#num_ans').val(vnum);
		$('#qnaAnsF').submit();
	}
	
	var editAns = function(vnum){
		$('#num_ansEdit').val(vnum);
		$('#ansEditF').submit();
	}
	
	var delAns = function(vnum){
		//alert(vnum);
		$('#num_ansDel').val(vnum);
		var question = window.confirm(vnum+"번 질문에 대한 답변을 정말 삭제하시겠습니까?");
		if(question){
			$('#ansDelF').submit();
		}else{}
	}
</script>

<!-- QnA 답변 폼 ------------------------------------------- -->
<form name="qnaAnsF" id="qnaAnsF" action="admin-qna-answer-form.do" method="POST">
	<input type="hidden" name="num_ans" id="num_ans">
	<input type="hidden" name="yn" id="yn">
</form>
<!-- ----------------------------------------------------------- -->
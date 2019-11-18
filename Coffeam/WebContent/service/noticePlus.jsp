<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, notice.model.*, java.io.*, java.text.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="adao" class="user.admin.AdminDAO" scope="session"/>
<jsp:useBean id="ndao" class="notice.model.NoticeDAO" scope="session"/>

<div class="row box">
	<table class="table">
		<tbody>
			<% String noticeNum = request.getParameter("nn"); 
			int num = Integer.parseInt(noticeNum);
			NoticeVO ntc = ndao.findNoticeByNum(num);
			/* NoticeVO ntc = ndao.getMyNTCList(num); */
			if(ntc == null){
				%><tr><td colspan='4'>서버 오류이거나 데이터가 없습니다.</td></tr><%
			}else{%>
	 			<tr>
					<td colspan="3" style="font-weight:bold; font-size:large;">
						<%=ntc.getTitle()%>
					</td>
				</tr>
				<tr>
					<td width="20%">글번호 : <%=ntc.getNum()%></td>
					<td width="40%">작성일 : <%=ntc.getWdate()%></td>
					<td width="40%">작성자 : <%=ntc.getWriter()%></td>
				</tr>
				<tr>
					<td colspan="3">
						<%=ntc.getContents()%>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<%-- 첨부파일 : <%=ntc.getUpfile()%> --%>
						<% String upDir=application.getRealPath("service/Upload");
						File dir = new File(upDir);
						if(dir.exists() && dir.isDirectory()){
							// 목록 가져와 출력하기
							File[] flist = dir.listFiles();
							if(flist != null){
								for(File f : flist){
									if(ntc.getUpfile().equals(f.getName())){
										String str = (f.isFile())?"file.PNG":"dir.PNG";
										%>첨부파일 : <%=f.getName()%>&ensp;&ensp;&ensp;<%
										// 다운로드
										String dstr = (f.isFile())?"다운로드" : ""; %>
										<a href="<%=request.getContextPath()%>/service/Download?upfile=<%=f.getName()%>">
										<button type="button" class="btn btn-default"><%=dstr%></button></a><%
										break;
									}
								}
							}else{
								%>첨부파일 없음<%
							}
						} %>
					</td>
				</tr>
			<%}%>
		</tbody>
	</table>
</div>
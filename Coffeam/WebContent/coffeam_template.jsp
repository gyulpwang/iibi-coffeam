<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, user.member.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/login/loginCheckModule.jsp" %>

<jsp:useBean id="cdao" class="user.member.MemberDAO" scope="session"/>
<jsp:useBean id="cvo" class="user.member.MemberVO" scope="session"/>

<jsp:include page="/coffeam_top.jsp"/>
<jsp:include page="/coffeam_noticeAside.jsp"/>
<div class="col-md-12">
	<div class="row">
	<table class="table">
		<thead>
			<tr>
				<td colspan="4" bgColor="#fad3ca" style="color: #af1817">
					<h3><b>주제 입력</b></h3>
				</td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	</div><!-- div class="row" -->
</div><!-- div class="col-md-12" -->
      
<jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_foot.jsp"/>
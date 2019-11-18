<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, user.member.*" %>
<!DOCTYPE html>
<%@ include file="/login/loginCheckModule.jsp" %>

<jsp:useBean id="dao" class="user.member.MemberDAO" scope="session"/>
<jsp:useBean id="user" class="user.member.MemberVO" scope="session"/>

<jsp:include page="/coffeam_top.jsp"/>
<script type="text/javascript">$('#mypage').addClass('active');</script>
<jsp:include page="/coffeam_noticeAside.jsp"/>

<div class="col-md-12">
	<div class="row box">
	<table class="table table-responsive">
		<thead>
			<tr class="tableTitle">
				<td colspan="6">
					<h3><b>장바구니</b></h3>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width="10%" style="text-align:center">번호</th>
				<th width="20%" style="text-align:center">카페명</th>
				<th width="30%" style="text-align:center">음료 정보</th>
				<th width="10%" style="text-align:center">수량</th>
				<th width="30%" style="text-align:center">수정·삭제</th>
			</tr>
			<tr>
				<td>1</td>
				<td>빈브라더스</td>
				<td>아메리카노</td>
				<td><input type="text" value="1" size="2"></td>
				<td style="text-align:center">
					<button type="button" class="btn btn-warning">수정</button>
					<button type="button" class="btn btn-danger">삭제</button>
				</td>
			</tr>
			<tr>
				<td>2</td>
				<td>커피빈</td>
				<td>라떼</td>
				<td><input type="text" value="4" size="2"></td>
				<td style="text-align:center">
					<button type="button" class="btn btn-warning">수정</button>
					<button type="button" class="btn btn-danger">삭제</button>
				</td>
			</tr>
			<tr>
				<td>3</td>
				<td>카페베네</td>
				<td>모카</td>
				<td><input type="text" value="5" size="2"></td>
				<td style="text-align:center">
					<button type="button" class="btn btn-warning">수정</button>
					<button type="button" class="btn btn-danger">삭제</button>
				</td>
			</tr>
			<tr>
				<td colspan="5" width="10%" style="text-align:center">
					<br>
					<button type="button" class="btn btn-default">이전으로</button>
					<button type="button" class="btn btn-danger">결제</button>
				</td>
			</tr>
		</tbody>
	</table>
	</div><!-- div class="row" -->
</div><!-- div class="col-md-12" -->
      
<jsp:include page="/coffeam_best.jsp"/>
<jsp:include page="/coffeam_foot.jsp"/>
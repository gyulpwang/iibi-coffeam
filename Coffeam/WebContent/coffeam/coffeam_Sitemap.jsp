<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/coffeam_top.jsp"/>
<script type="text/javascript">$('#sitemap').addClass('active');</script>
<jsp:include page="/coffeam_noticeAside.jsp"/>

<div class="col-md-12">
<div class="row box">
	<table class="table table-responsive">
		<thead align="center">
			<tr class="tableTitle">
				<th colspan="5"><h3><b>사이트맵</b></h3>
			</tr>
		</thead>
		<tbody align="center">
			<tr>
				<td colspan="5">
					<a href="<%=request.getContextPath()%>/coffeam/coffeam_Home.jsp">
						<i class="fa fa-3x fa-fw fa-home"></i><br>HOME
					</a>
				</td>
			</tr>
			<tr>
				<td>
					<a href="<%=request.getContextPath()%>/introduce/coffeam_Introduce.jsp">
						<i class="fa fa-3x fa-fw fa-coffee"></i><br>사이트소개
					</a>
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/cafe/coffeam_SearchCafe.jsp">
						<i class="fa fa-3x fa-fw fa-search"></i><br>카페조회
					</a>
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/mypage/coffeam_MyPage.jsp">
						<i class="fa fa-3x fa-fw fa-user"></i><br>마이페이지
					</a>
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/service/coffeam_CSCenter.jsp">
						<i class="fa fa-3x fa-fw fa-info-circle"></i><br>고객센터
					</a>
				</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>
					<a href="<%=request.getContextPath()%>/mypage/coffeam_MainBasket.jsp">
						<i class="fa fa-3x fa-shopping-cart fa-fw"></i><br>장바구니
					</a>
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/service/ntc-list.do">
						<i class="fa fa-3x fa-fw fa-bullhorn"></i><br>공지사항
					</a>
				</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>
					<a href="<%=request.getContextPath()%>/service/qna-list.do">
						<i class="fa fa-3x fa-fw fa-question"></i><br>Q&amp;A
					</a>
				</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>
					<a href="<%=request.getContextPath()%>/service/fb-list.do">
						<i class="fa fa-3x fa-pencil fa-fw"></i><br>자유게시판
					</a>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</div>
<jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_foot.jsp"/>
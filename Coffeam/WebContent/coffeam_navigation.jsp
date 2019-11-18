<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<ul class="nav nav-pills">
	<li>
		<a href="<%=request.getContextPath()%>/introduce/coffeam_Introduce.jsp">
		<i class="fa fa-3x fa-fw fa-coffee" style="font-size: 18px"></i>&ensp;사이트 소개</a>
	</li>
	<li>
		<a href="<%=request.getContextPath()%>/cafe/coffeam_SearchCafe.jsp">
		<i class="fa fa-3x fa-fw fa-search" style="font-size: 18px"></i>&ensp;카페 조회</a>
	</li>
	<li>
		<a href="<%=request.getContextPath()%>/mypage/coffeam_MyPage.jsp">
		<i class="fa fa-3x fa-fw fa-user" style="font-size: 18px"></i>&ensp;마이 페이지</a>
	</li>
	<li>
		<a href="<%=request.getContextPath()%>/service/coffeam_CSCenter.jsp">
		<i class="fa fa-3x fa-fw fa-info-circle" style="font-size: 18px"></i>&ensp;고객 센터</a>
	</li>
	<li>
		<a href="<%=request.getContextPath()%>/coffeam/coffeam_Sitemap.jsp">
		<i class="fa fa-3x fa-fw fa-th" style="font-size: 18px"></i>&ensp;사이트 맵</a>
	</li>
</ul>
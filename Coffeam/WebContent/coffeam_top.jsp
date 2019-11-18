<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

	<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/css/coffeam_template.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.min.css"	type="text/css">
	<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/creative.css" type="text/css"> --%>
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/coffeam_favicon.ico">
	<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
</head>
<body>
	<h1>
		<br>
		<br>
	</h1>
	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid"><!--  navbar-static-top -->
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
				<!-- <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> -->
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<div>
					<a class="navbar-brand page-scroll"	href="<%=request.getContextPath()%>/coffeam/coffeam_Home.jsp">
						<img src="<%=request.getContextPath()%>/images/coffeam_logo.png" class="img-responsive" style="width:10%"> <!-- 이미지 사이즈 줄인 로고 필요 -->
					</a>
				</div>
			</div>
			<!-- 네비게이션 -->
			<div class="collapse navbar-collapse" id="navbar-ex-collapse">

				<%
					String url[] = request.getRequestURI().split("/");
					String pageName = url[url.length - 1];
					String location = "";
				%>

				<ul class="nav navbar-nav navbar-right">
					<li id="intro">
						<a class="page-scroll" href="<%=request.getContextPath()%>/introduce/coffeam_Introduce.jsp">
							<i class="fa fa-3x fa-fw fa-coffee" style="font-size:18px;"></i>&ensp;사이트소개
						</a>
					</li>
					<li id="search"><a class="page-scroll"
						href="<%=request.getContextPath()%>/cafe/coffeam_SearchCafe.jsp">
							<i class="fa fa-3x fa-fw fa-search" style="font-size: 18px"></i>&ensp;카페조회
					</a></li>
					<li id="mypage"><a class="page-scroll"
						href="<%=request.getContextPath()%>/mypage/coffeam_MyPage.jsp">
							<i class="fa fa-3x fa-fw fa-user" style="font-size: 18px"></i>&ensp;마이페이지
					</a></li>
					<li class="dropdown" id="service"><a class="dropdown-toggle" data-toggle="dropdown"
						href="<%=request.getContextPath()%>/service/coffeam_CSCenter.jsp">
							<i class="fa fa-3x fa-fw fa-info-circle" style="font-size: 18px"></i>&ensp;고객센터<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li id="svc_notice"><a
								href="<%=request.getContextPath()%>/service/ntc-list.do">
									<i class="fa fa-3x fa-fw fa-bullhorn"
									style="color: #f05f40; font-size: 15px"></i>&ensp; <span
									style="color: #f05f40; font-weight: bold">공지사항</span>
							</a></li>
							<li id="svc_qna">
								<a href="<%=request.getContextPath()%>/service/qna-list.do">
									<i class="fa fa-3x fa-fw fa-question"
										style="color: #f05f40; font-size: 15px"></i>&ensp;
									<span	style="color: #f05f40; font-weight:bold">Q&amp;A</span>
								</a>
							</li>
							<li id="svc_freeboard"><a
								href="<%=request.getContextPath()%>/service/fb-list.do"> <i
									class="fa fa-3x fa-pencil fa-fw"
									style="color: #f05f40; font-size: 15px"></i>&ensp; <span
									style="color: #f05f40; font-weight: bold">자유게시판</span></a></li>
						</ul></li>
					<li id="sitemap"><a class="page-scroll"
						href="<%=request.getContextPath()%>/coffeam/coffeam_Sitemap.jsp">
							<i class="fa fa-3x fa-fw fa-th" style="font-size: 18px"></i>&ensp;사이트맵
					</a></li>
					<%-- </c:forEach> --%>
				</ul>
			</div>
		</div>
	</nav>

	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="row">
						<div class="col-md-12">
							<jsp:include page="login/login.jsp" />

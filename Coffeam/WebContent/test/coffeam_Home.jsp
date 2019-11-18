<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, search.cafe.*"%>
<!DOCTYPE html>
<!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="css/animate.min.css" type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/creative.css" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/jquery.fittext.js"></script>
    <script src="js/wow.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/creative.js"></script>
<!-- ----------------------------------------------------------- -->

<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/coffeam_template.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/animate.min.css"
	type="text/css">
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/creative.css" type="text/css"> --%>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/images/coffeam_favicon.ico">
<!-- 부트스트랩을 링크를 생략해야 coffeam_template.css 파일이 온전히 적용됨. --------------------------- -->
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
<!-- --------------------------------------------------------------------------------------------------- -->s

<body id="page-top">
<%-- <jsp:include page="coffeam_top.jsp" /> --%>
 <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Start Bootstrap</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="#about">About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#services">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#portfolio">Portfolio</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid navbar-static-top">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar-ex-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div style="width:10%">
				<!-- <table>
				<tr><td> -->
					<a class="navbar-brand page-scroll"	href="<%=request.getContextPath()%>/coffeam/coffeam_Home.jsp">
						<img src="<%=request.getContextPath()%>/images/coffeam_logo.png" class="img-responsive"> <!-- 이미지 사이즈 줄인 로고 필요 -->
					</a>
				<!-- </td></tr>
				</table> -->
				</div>
			</div>
				<!-- 네비게이션 -->
			<div class="collapse navbar-collapse" id="navbar-ex-collapse">

				<%
					String url[] = request.getRequestURI().split("/");
					String pageName = url[url.length - 1];
					String location = "";
				%>

				<script type="text/javascript">
					if (location.equals("coffeam_Introduce.jsp")) {
						$('#intro').addClass('active');
					}
				</script>
				<ul class="nav navbar-nav navbar-right">
					<%-- <c:forEach var="page" begin="0" end="10"><!-- 총 페이지가 몇개 있는지 어떻게 알지... --> --%>
					<li id="intro"><a class="page-scroll"
						href="<%=request.getContextPath()%>/introduce/coffeam_Introduce.jsp">
							<i class="fa fa-3x fa-fw fa-coffee" style="font-size: 18px"></i>&ensp;사이트
							소개
					</a></li>
					<li id="search"><a class="page-scroll"
						href="<%=request.getContextPath()%>/cafe/coffeam_SearchCafe.jsp">
							<i class="fa fa-3x fa-fw fa-search" style="font-size: 18px"></i>&ensp;카페
							조회
					</a></li>
					<li id="mypage"><a class="page-scroll"
						href="<%=request.getContextPath()%>/mypage/coffeam_MyPage.jsp">
							<i class="fa fa-3x fa-fw fa-user" style="font-size: 18px"></i>&ensp;마이
							페이지
					</a></li>
					<li class="dropdown" id="service"><a class="dropdown-toggle" data-toggle="dropdown"
						href="<%=request.getContextPath()%>/service/coffeam_CSCenter.jsp">
							<i class="fa fa-3x fa-fw fa-info-circle" style="font-size: 18px"></i>&ensp;고객
							센터<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li id="svc_notice"><a
								href="<%=request.getContextPath()%>/service/coffeam_Notice.jsp">
									<i class="fa fa-3x fa-fw fa-bullhorn"
									style="color: #f05f40; font-size: 15px"></i>&ensp; <span
									style="color: #f05f40; font-weight: bold">공지사항</span>
							</a></li>
							<li id="svc_qna"><a
								href="<%=request.getContextPath()%>/service/coffeam_QnA.jsp">
									<i class="fa fa-3x fa-fw fa-question"
									style="color: #f05f40; font-size: 15px"></i>&ensp; <span
									style="color: #f05f40; font-weight: bold">Q&A</span>
							</a></li>
							<li id="svc_freeboard"><a
								href="<%=request.getContextPath()%>/service/fb-list.do"> <i
									class="fa fa-3x fa-pencil fa-fw"
									style="color: #f05f40; font-size: 15px"></i>&ensp; <span
									style="color: #f05f40; font-weight: bold">자유게시판</span></a></li>
						</ul></li>
					<li id="sitemap"><a class="page-scroll"
						href="<%=request.getContextPath()%>/coffeam/coffeam_Sitemap.jsp">
							<i class="fa fa-3x fa-fw fa-th" style="font-size: 18px"></i>&ensp;사이트
							맵
					</a></li>
					<%-- </c:forEach> --%>
				</ul>
			</div>
		</div>
		</div>
		</div>
		</div>
		</div>
	</nav>
    <header>
        <div class="header-content">
            <div class="header-content-inner">
                <h1>Your Favorite Source of Free Bootstrap Themes</h1>
                <hr>
                <p>Start Bootstrap can help you build better websites using the Bootstrap CSS framework! Just download your template and start going, no strings attached!</p>
                <a href="#about" class="btn btn-primary btn-xl page-scroll">Find Out More</a>
            </div>
        </div>
    </header>

<div class="col-md-12">
	<div class="row box">
	<table class="table table-responsive">
		<thead>
			<tr>
				<td colspan="4" bgColor="#fad3ca" style="color: #af1817"><h3>
					<b>추천 카페 목록</b>
				</h3></td>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	<!-- 캐러셀 시작 ------------------------------------------------------------ -->
    <div id="home_carousel" class="carousel slide" data-ride="carousel" data-interval="3000">
		<div class="carousel-inner">
			sdfsdf
		</div>
		<a class="left carousel-control" href="#home_carousel" role="button" data-slide="prev">
			<i class="icon-prev  fa fa-angle-left"></i>
		</a>
		<a class="right carousel-control" href="#home_carousel" role="button" data-slide="next">
			<i class="icon-next fa fa-angle-right"></i>
		</a>
    </div>
	<!-- 캐러셀 끝 -------------------------------------------------------------- -->
	<!-- 테이블 시작 ------------------------------------------------------------ -->
	<div>
		<table class="table table-responsive">
			<tr>
				<td><a href="http://www.twosome.co.kr"> <img class="img-responsive"
						src="<%=request.getContextPath()%>/images/cafe/atwosomeplace.PNG">
				</a></td>
				<td><a href="http://www.beanbrothers.co.kr/"> <img class="img-responsive"
						src="<%=request.getContextPath()%>/images/cafe/beanbrothers.PNG">
				</a></td>
				<td><a href="http://www.caffebene.co.kr/"> <img class="img-responsive"
						src="<%=request.getContextPath()%>/images/cafe/caffebene.PNG">
				</a></td>
			</tr>
			<tr>
				<td><a href="http://www.coffeebeankorea.com"> <img class="img-responsive"
						src="<%=request.getContextPath()%>/images/cafe/coffeebean.PNG">
				</a></td>
				<td><a href="http://www.cafedroptop.com"> <img class="img-responsive"
						src="<%=request.getContextPath()%>/images/cafe/droptop.PNG">
				</a></td>
				<td><a href="http://www.ediya.com"> <img class="img-responsive"
						src="<%=request.getContextPath()%>/images/cafe/ediya.PNG">
				</a></td>
			</tr>	
			<tr>	
				<td><a href="http://www.hollys.co.kr"> <img class="img-responsive"
						src="<%=request.getContextPath()%>/images/cafe/hollys.PNG">
				</a></td>
				<td><a href="http://www.paikdabang.com/paiks/index.asp"> <img class="img-responsive"
						src="<%=request.getContextPath()%>/images/cafe/paiks.PNG">
				</a></td>
				<td><a href="http://www.caffe-pascucci.co.kr"> <img class="img-responsive"
						src="<%=request.getContextPath()%>/images/cafe/pascucci.PNG">
				</a></td>
			</tr>
			<tr>
				<th><a href="http://www.istarbucks.co.kr"> <img class="img-responsive"
						src="<%=request.getContextPath()%>/images/cafe/starbucks.PNG">
				</a></th>

				<td><a href="http://www.tomntoms.com"> <img class="img-responsive"
						src="<%=request.getContextPath()%>/images/cafe/tomntoms.PNG">
				</a></td>
				<td><a href="http://www.xn--9m1by48b62bvxjse.com/"> <img class="img-responsive"
						src="<%=request.getContextPath()%>/images/cafe/thekind.PNG">
				</a></td>
			</tr>
		</table>
	</div>
	<!-- 테이블 끝 -------------------------------------------------------------- -->
	<aside class="bg-dark">
        <div class="container text-center">
            <div class="call-to-action">
                <h2>Free Download at Start Bootstrap!</h2>
                <a href="#" class="btn btn-default btn-xl wow tada">Download Now!</a>
            </div>
        </div>
    </aside>
	
	</div>
	</div>
</body>
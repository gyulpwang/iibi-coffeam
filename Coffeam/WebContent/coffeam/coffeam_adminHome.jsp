<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, search.cafe.*"%>

<jsp:include page="/coffeam_adminTop.jsp" />

<script type="text/javascript">
	$('#asvcAside').hide();
	$('#aBest').show();
	$('#aFooter').show();
</script>

<jsp:useBean id="scdao" class="search.cafe.CafeDAO" scope="session"/>

<div class="col-md-12">
	<div class="row box">
	<table class="table table-responsive">
		<thead>
			<tr>
				<td colspan="4" class="tableTitle"><h3>
					<b>추천 카페 목록</b>
				</h3></td>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	<!-- 캐러셀 시작 ------------------------------------------------------------ -->
    <div id="home_carousel" class="carousel slide" data-ride="carousel" data-interval="3000">
		<div class="carousel-inner">
			<% ArrayList<CafeVO> arr = scdao.listAllCafe();
			System.out.println("arr="+arr);
			if(arr == null || arr.size() == 0){
				%><div>서버 오류이거나 데이터가 없습니다.</div><%
			}else{
				// 반복문 돌 부분 ---------------------------
				Iterator<CafeVO> it = arr.iterator();
				CafeVO cafe = new CafeVO();%>
			
				<div class="item active">
			      	<img src="<%=request.getContextPath()%>/images/cafe/main/home_main.png">
			    	<div class="carousel-caption">
				      	<h2>어서오세요,<br>커핌입니다.</h2>
				      	<p>당신이 원하는 시간에 원하는 커피를</p>
			    	</div>
				</div>	
			    <% while(it.hasNext()){
					cafe = it.next(); %>
				    <div class="item">
				      <img src="<%=request.getContextPath()%>/images/cafe/main/<%=cafe.getImg()%>">
				      <div class="carousel-caption">
				        <h2><%=cafe.getCafeName()%></h2>
				        <p><a href="<%=cafe.getSite()%>" style="color:white"><%=cafe.getSite()%></a></p>
				      </div>
				    </div>
			 	<%} 
			}%>
		</div>
		<a class="left carousel-control" href="#home_carousel" role="button" data-slide="prev">
			<i class="icon-prev  fa fa-angle-left"></i>
		</a>
		<a class="right carousel-control" href="#home_carousel" role="button" data-slide="next">
			<i class="icon-next fa fa-angle-right"></i>
		</a>
    </div>
	<!-- 캐러셀 끝 -------------------------------------------------------------- -->	
	  <br>
	  <section class="no-padding" id="portfolio">
      <div class="container-fluid">
        <div class="row no-gutter">
        <% ArrayList<CafeVO> arr2 = scdao.listAllCafe();
			//System.out.println("arr="+arr);
			if(arr2 == null || arr2.size() == 0){
				%><div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
					서버 오류이거나 데이터가 없습니다.
				</div><%
			}else{
				// 반복문 돌 부분 ---------------------------
				Iterator<CafeVO> it = arr.iterator();
				CafeVO cafe = new CafeVO();
				int i=0;
				while(it.hasNext()){
					cafe = it.next(); %>
			        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
			            <a href="<%=cafe.getSite()%>" class="portfolio-box" target='_blank'>
			                 <img src="<%=request.getContextPath()%>/images/cafe/<%=cafe.getImg()%>" class="img-responsive" alt="">
			                 <div class="portfolio-box-caption">
			                     <div class="portfolio-box-caption-content">
			                         <!-- <div class="project-category text-faded"></div> -->
			                         <div class="project-name"><%=cafe.getCafeName()%></div>
			                     </div>
			                 </div>
			             </a>
			        </div>
		        <%}
		     }%>
        </div>
      </div>
     </section> 
	</div>
	</div>
<%-- <jsp:include page="/coffeam_best.jsp" />
<jsp:include page="/coffeam_adminFoot.jsp" /> --%>
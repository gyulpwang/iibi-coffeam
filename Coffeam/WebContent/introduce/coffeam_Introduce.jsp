<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/coffeam_top.jsp"/>
<script type="text/javascript">$('#intro').addClass('active');</script>	
<jsp:include page="/coffeam_noticeAside.jsp"/>
    <div class="box">
	<table class="table">
		<thead>
			<tr class="tableTitle"><td><h3><b>프로젝트 커핌 소개</b></h3></td></tr>
		</thead>
		<tbody>
			<tr><td style="text-align: center;">		
    			<br><img src ="<%=request.getContextPath()%>/images/coffeam_logo.png" style="width:400px">
    		</td></tr>
    	</tbody>
	</table>
	<p>
	<div class="panel-group">
		<div id="tableTop">
		<div class="panel panel-danger">
			<div class="panel-heading">
				<h4 class="panel-title">
				<a data-toggle="collapse" href="#comment1"><b>프로젝트 명</b></a>
				</h4>
			</div>	
			<div id="comment1" class="panel-collapse collapse in">
				<div class="panel-body">
					커핌(Coffeam)<br><br>
					<div style="text-align:right;">
						<a href="#tableTop"><i class="fa fa-3x fa-fw fa-angle-up" style="font-size: 16px; color:#af1817; "></i><span style="color:#af1817;">TOP</span></a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="panel panel-danger">
			<div class="panel-heading">
				<h4 class="panel-title">
				<a data-toggle="collapse" href="#comment2"><b>제작자</b></a>
				</h4>
			</div>
			<div id="comment2" class="panel-collapse collapse in">
				<div class="panel-body">
					성규림<br><br>
					<div style="text-align:right;">
						<a href="#tableTop"><i class="fa fa-3x fa-fw fa-angle-up" style="font-size: 16px; color:#af1817; "></i><span style="color:#af1817;">TOP</span></a>
					</div>
				</div>
			</div>
		</div>
		<div class="panel panel-danger">
			<div class="panel-heading">
				<h4 class="panel-title">
					<!-- #은 아이디 지정자 -->
					<a href="#comment3"	data-toggle="collapse"><b>시스템 개발동기</b></a>
				</h4>
			</div>	
			<div id="comment3" class="panel-collapse collapse in">
				<div class="panel-body">
					시간에 쫓기고 카페를 자주 찾는 현대인들에게, 카페에서 음료를 주문하고 
	    	  		받기 위해 기다리는 시간 또한 상당한 비중을 차지한다고 생각하였다. 
	    	  		따라서 미리 사용자가 위치한 장소에서 주문을 하고, 나중에 방문하여 바로 
	    	  		수령함으로써 시간을 절약할 수 있게 도와주는 웹앱 프로젝트를 구상하게 되었다.<br><br>
					<div style="text-align:right;">
						<a href="#tableTop"><i class="fa fa-3x fa-fw fa-angle-up" style="font-size: 16px; color:#af1817; "></i><span style="color:#af1817;">TOP</span></a>
					</div> 
				</div>
			</div>
		</div>
		<div class="panel panel-danger">
			<div class="panel-heading">
				<h4 class="panel-title">
					<!-- #은 아이디 지정자 -->
					<a href="#comment4"	data-toggle="collapse"><b>시스템의 특징</b></a>
				</h4>
			</div>	
			<div id="comment4" class="panel-collapse collapse in">
				<div class="panel-body">
 					일반적인 카페 웹사이트들과는 달리 음료를 예약하고 수령하고자 하는 카페에 
	    	  		메시지를 전송하여 '선주문 선결제 후수령' 방식으로 시스템이 동작한다.<br><br>
					<div style="text-align:right;">
						<a href="#tableTop"><i class="fa fa-3x fa-fw fa-angle-up" style="font-size: 16px; color:#af1817; "></i><span style="color:#af1817;">TOP</span></a>
					</div>
				</div>
			</div>
		</div>	 
		<div class="panel panel-danger">
			<div class="panel-heading">
				<h4 class="panel-title">
					<!-- #은 아이디 지정자 -->
					<a href="#comment5"	data-toggle="collapse"><b>기획 단계의 Use case Diagram</b></a>
				</h4>
			</div>	
			<div id="comment5" class="panel-collapse collapse in">
				<div class="panel-body">
 					<img src ="<%=request.getContextPath()%>/images/coffeam_Usecase.bmp" width="500px"
 					class="img-responsive"><br><br>
					<div style="text-align:right;">
						<a href="#tableTop"><i class="fa fa-3x fa-fw fa-angle-up" style="font-size: 16px; color:#af1817; "></i><span style="color:#af1817;">TOP</span></a>
					</div>
				</div>
			</div>
		</div>	 
	</div>
	</div>
	</div>
<jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_foot.jsp"/>
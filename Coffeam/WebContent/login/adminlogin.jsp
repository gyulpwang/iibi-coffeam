<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.admin.*, java.util.*, java.text.*, search.drink.*" %>
<jsp:useBean id="ddao" class="search.drink.DrinkDAO" scope="session"/>
<%	DecimalFormat df = new DecimalFormat("###,###");
	SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd"); %>

<script type="text/javascript">
	var aloginCheck=function(){
		if(!aloginF.adminId.value){
			alert('아이디를 입력하세요.');
			aloginF.adminId.focus();
			return;
		}
		if(!aloginF.adminPwd.value){
			alert('비밀번호를 입력하세요.');
			aloginF.adminPwd.focus();
			return;
		}
		aloginF.submit();
	}	
</script>

<div class="row box">
<%	// 세션에 저장된 객체를 꺼낸다.(loginUser, loginTime)
	// Object getAttribute(String key)
	AdminVO loginAdmin=(AdminVO)session.getAttribute("loginAdmin");
	String loginATime=(String)session.getAttribute("loginATime");
	if(loginAdmin == null){
		Cookie[] cks = request.getCookies();
		String key = "", val = "";
		boolean isSaveId = false;
		
		if(cks != null){
			for(Cookie c : cks){
				key=c.getName();
				if(key.equals("saveId")){val=c.getValue();	break;}
				isSaveId = true;
			}
		}
%>

	<!-- 로그인 안했을 때는 폼을 보여준다. -->
	<form name="aloginF" action="<%=request.getContextPath()%>/login/adminloginEnd.jsp" method="post" class="form-horizontal" role="form">
	<div class="row box-parent">
		<table class="table">
			<thead>
				<tr class="tableTitle">
					<td width="45%"><h3><b>관리자 로그인</b></h3></td>
				</tr>
			</thead>
		</table>
	  <div class="form-group">
	    <div class="col-sm-2">
	      <label for="userid" class="control-label">ID</label>
	    </div>
	    <div class="col-sm-6">
	      <input type="text" class="form-control" name="adminId" id="adminId" value="<%=val%>" placeholder="Id">
	    </div>
	    <div class="col-sm-4 checkbox">
	        <label><input type="checkbox" name="saveAid" id="saveAid" <%if(isSaveId)	out.println("checked");%>> 아이디 저장</label>
	      </div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-2">
	      <label for="pwd" class="control-label">PW</label>
	    </div>
	    <div class="col-sm-6">
	      <input type="password" class="form-control" name="adminPwd" id="adminPwd" placeholder="Password">
	    </div>
	    <div class="col-sm-4">
	    	<span style="text-align:right;">
	    		<a href="javascript:aloginCheck()">
	    			<button type="button" class="btn btn-danger">로그인</button>
	    		</a>
	    	</span>
	    </div>
	  </div>
	  </div>
	</form>
	</div>
	<!-- 로그인 했을 경우 -->
	<%}else{%>
	
	<%
	session.removeAttribute("loginUser");
	session.removeAttribute("loginTime");
	
	System.out.println("유저 로그아웃"+session.getAttribute("loginUser"));
	%>
	
	<table class="table table-responsive">
		<thead>
			<tr class="tableTitle">
				<td colspan="2">
					<a href="<%=request.getContextPath()%>/mypage/coffeam_adminMyPage.jsp" style="color:#fff">
						<h3><b><%=loginAdmin.getAdminName()%>
						[<span style="color: yellow; text-decoration: underline;">
						<%=loginAdmin.getAdminId()%></span>]님</b></h3>
					</a>	
					<p>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width="40%"><span style="color:#af1817;">접속시간</span></th>
				<td><span style="color:#af1817;"><%=loginATime%></span></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">
					<a href="<%=request.getContextPath()%>/login/adminlogOut.jsp">
						<button type="button" class="btn btn-danger">로그아웃</button>
					</a>
				</td>
			</tr>
		</tbody>
	</table>
<%-- 	<%}%>
</div> --%>
</div>


<!-- Svc Aside -->
<div class="row box" id="asvcAside">
	<table class="table">
      	<thead>
      		<tr class="tableTitle">
      			<th><h3><b>고객센터 서브메뉴</b></h3></th>
      		</tr>
      	</thead>
      	<tbody>
			<tr>
				<td style="color:#af1817">
				<%-- <a href="<%=request.getContextPath()%>/service/coffeam_Notice.jsp"> --%>
				<a href="<%=request.getContextPath()%>/service/admin-ntc-list.do">
				<i class="fa fa-3x fa-fw fa-bullhorn" style="font-size: 18pt"></i>&ensp;<span>공지사항</span></a></td>
			</tr>
			<tr>
				<td style="color:#af1817">
				<a href="<%=request.getContextPath()%>/service/admin-qna-list.do">
				<i class="fa fa-3x fa-fw fa-question" style="font-size: 18pt"></i>&ensp;Q&A</a></td>
			</tr>
			<tr>
				<td style="color:#af1817">
					<a href="<%=request.getContextPath()%>/service/admin-fb-list.do">
					<i class="fa fa-3x fa-fw fa-pencil" style="font-size: 18pt"></i>&ensp;자유게시판</a></td>
			</tr>
        </tbody>
	</table>
</div><!-- row -->


<!-- Best -->
<div class="row box" id="aBest">
<table class="table table-responsive">
	<thead>
        		<tr class="tableTitle">
        			<td colspan="4"><h3><b>베스트 메뉴</b></h3></td>
        		</tr>
        		<tr>
        			<th width="16%" style="text-align: center">순위</th>
        			<th width="24%" style="text-align: center">사진</th>
        			<th width="60%" style="text-align: center">음료정보</th>
        		</tr>
        	</thead>
	<tbody>
         	<!-- drink 테이블에서 spec='best'인 메뉴만 가져와서 차례로 나열 
         	select * from drink where spec='HIT' OR spec='BEST' order by price; -->
         	<% ArrayList<DrinkVO> arr = ddao.listBHDrink();

		if(arr == null || arr.size() == 0){
			%><tr><td colspan = '4'>서버 오류이거나 데이터가 없습니다.</td></tr><%
		}else{
			// 반복문 돌 부분 ---------------------------
			Iterator<DrinkVO> it = arr.iterator();
			int i = 1;
			while(it.hasNext()){
				DrinkVO drink = it.next();
				if(i<10){%>
	          		<tr>
	          			<td align="center"><%=i%></td>
	          			<td><img src="<%=request.getContextPath()%>/images/drink<%=drink.getUpdir()%><%=drink.getImg()%>" 
	          			class="img-thumbnail img-responsive" width="100%"></td>
	          			<td><b><%=drink.getDrinkName()%></b>
	          				<br><%=df.format(drink.getPrice())%>원 / <%=df.format(drink.getMileage())%>포인트
	          			</td>
	          		</tr>
         			<% i++;
					}else{break;}
         		} 
         	}%>
	</tbody>
	</table>
</div><!-- row box -->

<!-- Footer -->
<div class="row box" id="aFooter">
<div class="col-md-12">
<footer class="section section-primary">
  <div class="container">
    <div class="row">
      <div class="col-sm-6" style="font-size:x-small;">
		<h3>Coffeam</h3>
		  <p>만든 이 / <a href="<%=request.getContextPath()%>/login/adminlogOut.jsp" style="color:#fff">성규림</a>
          <br>이메일 / rbfla927@hanmail.net
          <br>소속기관 / 방송정보국제교육원
          <br>과정명 / 자바기반웹애플리케이션개발자
        </p>
      </div>
    </div>
  </div>
</footer></div></div>

	<%}%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.admin.*, java.util.*, java.text.*"%>
          <div class="row box">
          <div class="col-md-12">
          <footer class="section section-primary">
            <div class="container">
              <div class="row">
                <div class="col-sm-6" style="font-size:x-small">
                  <h3>Coffeam</h3>
                  	<p>만든 이 / <a role="button" data-toggle="modal" data-target="#adminLogin" style="color:#fff" id="adminLoginKey">성규림</a>
                    <br>이메일 / rbfla927@hanmail.net
                    <br>소속기관 / 방송정보국제교육원
                    <br>과정명 / 자바기반웹애플리케이션개발자
                  </p>
                </div>
              </div>
            </div>
          </footer></div></div></div>
        </div>
      </div>
    </div>

	<!-- 관리자 로그인 모달 -->
 	<script type="text/javascript">
		var AloginCheck=function(){
			if(!AloginF.adminId.value){
				alert('아이디를 입력하세요.');
				AloginF.adminId.focus();
				return;
			}
			if(!AloginF.adminPwd.value){
				alert('비밀번호를 입력하세요.');
				AloginF.adminPwd.focus();
				return;
			}

			AloginF.submit();
		}	
	</script>
 	<%	// 세션에 저장된 객체를 꺼낸다.(loginUser, loginTime)
	// Object getAttribute(String key)
	AdminVO loginAdmin=(AdminVO)session.getAttribute("loginAdmin");
	String loginTime=(String)session.getAttribute("loginTime");
	if(loginAdmin == null){
		Cookie[] cookies = request.getCookies();
		String key = "", val = "";
		boolean isSaveId = false;
		
		if(cookies != null){	// 로그인 하지 않은 경우
			for(Cookie ck : cookies){
				key=ck.getName();
				if(key.equals("saveId")){val=ck.getValue();	break;}
				isSaveId = true;
			}
		}
	%>
	
	<div class="modal fade" role="dialog" id="adminLogin">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      
	      <div class="modal-header tableTitle">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title">관리자 로그인</h4>
	      </div>
	      
	      <div class="modal-body">
		    <!-- <form class="form-horizontal" role="form"> -->
	      	<form name="AloginF" action="<%=request.getContextPath()%>/login/adminloginEnd.jsp" method="post" class="form-horizontal" role="form">
	          <div class="form-group">
	            <div class="col-sm-2">
	              <label for="adminId" class="control-label">아이디</label>
	            </div>
	            <div class="col-sm-10">
	              <input type="text" class="form-control" name="adminId" id="adminId" placeholder="Id">
	            </div>
	          </div>
	          <div class="form-group">
	            <div class="col-sm-2">
	              <label for="adminPwd" class="control-label">비밀번호</label>
	            </div>
	            <div class="col-sm-10">
	              <input type="password" class="form-control" name="adminPwd" id="adminPwd" placeholder="Password">
	            </div>
	          </div>
	          <div class="form-group">
	            <div class="col-sm-offset-2 col-sm-10">
	              <div class="checkbox">
	                <label>
	                  <input type="checkbox" name="saveAId" id="saveAId" <%if(isSaveId)	out.println("checked");%>>아이디 저장</label>
	              </div>
	            </div>
	          </div>
	        <!-- </form> -->
	     	 </form>
	      </div>
	      
	      <div class="modal-footer">
	        <!-- <a class="btn btn-default" data-dismiss="modal">Close</a> -->
	        <a class="btn btn-danger" href="javascript:AloginCheck()">로그인</a>
	      </div>
	      
	    </div>
	  </div>
	</div>
	<%}else{}%>
	
	<!-- 모달 끝 ------------------------------ -->
</body>
</html>
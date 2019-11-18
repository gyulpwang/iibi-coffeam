<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- idCheck -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  	<link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/coffeam_favicon.ico">
    <link href="<%=request.getContextPath()%>/coffeam_template.css" rel="stylesheet" type="text/css">
	<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
</head>

<script type="text/javascript" src="../js/common.js"></script>

<script type="text/javascript">
	function setUserid(uid){
		// uid 값을 팝업창 띄워준 부모창의 userid 텍스트 박스에 넣어주자. 
		// window -> document -> form
		// opener : 윈도우 객체 => 팝업창을 띄워준 부모창
		opener.document.f.userid.value=uid;
		
		// 자기 창 => self로 참조
		self.close();	// 팝업창 닫기
	}//setUserid()-----------
	
    function checkId(){
		if(!frm.userid.value){
			alert('아이디를 입력해야 해요.');
			frm.userid.focus();
			return;
		}//if--------------
		// 아이디는 영문자, 숫자, _만 가능
		if(!isUserid(frm.userid)){
			alert('아이디는 영문자와 숫자, _, !만 가능해요.\n[4~16자리 이내]');
			frm.userid.select();
			return;
		}
		frm.submit();
	}//checkId()--------------	
</script>
<%
	// 링크 거는 방식은 무조건 디폴트가 GET방식.
	String method=request.getMethod();
	//out.println("<br>method="+method);
	
	// 1. 요청방식이 GET 방식인 경우.
	// => 아이디 입력 폼을 보여준다.
	if(method.equalsIgnoreCase("get")){%>
		<div align="center" style="font-size:18px">
			<div style="font-weight:bold; font-size: large; background-color:#af1817; color:#fff">
			<br>사용할 아이디를 입력해주세요.<br><br></div>
			<form name = "frm" action="idCheck.jsp" method="POST">
				<!-- action은 자기 페이지로, method는 post로 -->
				<br><br><label for="userid"><b>아이디</b></label>
				<input type="text" name="userid" id="userid">

				<!-- input text 박스가 1개면 엔터를 쳤을 때 submit 된다. 
				이걸 방지하기 위해 text 박스를 하나 추가하고 보이지 않게 하자. -->
				<input type="text" style="visibility:hidden; width:0px" class="form-control">
				<button type="button" onclick="checkId()" class="btn btn-default">확인</button>
			</form>
		</div>
		<%		
	}else{
		// 2. 요청방식이 POST 방식인 경우.
		// => 아이디 중복 여부 결과를 보여준다.
		
		// 사용자가 입력한 userid값 받기
		String userid=request.getParameter("userid");
		
		if(userid==null || userid.trim().isEmpty()){
			%>
			<script type="text/javascript">
				alert("아이디 값을 입력하세요.");
				history.back();
			</script>
			<%
			return;
		}
			
		%>
		<jsp:useBean id="cdao" class="user.member.MemberDAO" scope="session"/>
		<%
		boolean isUse = cdao.idCheck(userid.trim());
		if(isUse){	// 아이디가 중복되지 않는 경우
			%>
			<div align="center" style="font-size:18px">
				<div style="font-weight:bold; font-size: large; background-color:#af1817; color:#fff">
				<br>사용 가능<br><br></div><br>
				<label>ID로 [<span style="color:red"><b><%=userid %></b></span>]을 사용할 수 있습니다.</label>
				<br><br>
				<button type="button" onclick="setUserid('<%=userid%>')" class="btn btn-default">닫기</button>
			</div>
			<%
		}else{	// 아이디가 중복되는 경우
			%>
			<div align="center" style="font-size:18px">
				<br><span style="font-weight:bold; background-color:#fad3ca; color:#af1817">사용 불가</span><br><br>
				<label style="color:red; font-weight:bold"><%=userid %></label>는 이미 사용중입니다.<br>다른 아이디를 입력해주세요.<br><br>
				<form name = "frm" action="idCheck.jsp" method="POST">
					<!-- action은 자기 페이지로, method는 post로 -->
					<label for="userid"><b>아이디</b></label>
					<input type="text" name="userid" id="userid">
					<input type="text" style="visibility:hidden; width:0px">
					<button type="button" onclick="checkId()" class="btn btn-default">확인</button>
				</form>
			</div>
			<%
		}// else----------------------
	}
%>
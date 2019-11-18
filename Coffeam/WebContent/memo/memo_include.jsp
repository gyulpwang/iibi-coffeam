<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<script type = "text/javascript">

	function check(){
			// 사용자가 작성자를 입력 안 한 경우 유효성 체크
			if(f.name.value == ""){	// == 주의!
				alert('작성자를 입력해야 해요');
				f.name.focus();	// 입력 포커스 주기
				return;
			}
			
			if(f.msg.value.length > 100){
				alert('메모 내용은 100자 이내여야 해요');
				//f.msg.focus();
				f.msg.select();
				return;
			}
			
			// window.document.f.submit();	// 서버에 전송
			f.submit();	// window.document. 생략 가능
		}
	</script>
</head>
<body>
	<p>
	<form name = "f" action = "memo-insert.do" method = "POST">
		<table class="table">
			<tr class="warning">
				<!-- th : td와 같지만 테이블 헤더로 중앙 정렬되고 굵게 나옴. -->
				<th colspan="2"><h1><b>::: 한줄 메모장 :::</b></h1></th>
			</tr>
			<tr>
				<td width = "30%"><b>작성자</b></td>
				<td width = "70%">
					<input type = "text" name = "name" id = "name" size = "40" class = "box">
				</td>
			</tr>
			<tr>
				<td width = "30%"><b>메모 내용</b></td>
				<td width = "70%">
					<input type = "text" name = "msg" id = "msg" size = "72" class = "box">
				</td>
			</tr>
			<tr>
				<td colspan = "2" align = "center">
					<!-- input type을 "submit"으로 하면 무조건 전송하기 때문에
					전송기능이 본래 없는 "button"으로 변경한다. -->
					<input type ="button" onclick = "check()" value = "메모 남기기">
					<input type ="reset" value = "다시 쓰기">
				</td>
			</tr>
		</table>
		<p>
	</form>

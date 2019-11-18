<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- postCheck -->

<!-- <link rel="stylesheet" type="text/css" href="../css/layout.css"> -->

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function setPost(postcode){
		opener.document.f.post.value=postcode;
		self.close();
	}
	
	function setAddr(addr1, addr2){
		opener.document.f.addr1.value=addr1;	// 주소 1
		opener.document.f.addr2.value=addr2;	// 주소 2
		self.close();
	}
	
    function checkPost(){
		if(!frm.post.value){
			alert('우편번호 찾기를 통해 우편번호를 입력하세요.');
			frm.post.focus();
			return;
		}
		frm.submit();
		setPost(frm.post.value);
		setAddr(frm.addr1.value, frm.addr2.value);
	}	
	
    function findPost() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script>

<div align="center">
<form name = "frm" action="postCheck.jsp" method="POST">
	<!-- action은 자기 페이지로, method는 post로 -->
	<h2>::: 우편번호 검색 :::</h2>
	<input type="text" id="post" placeholder="우편번호" class="box">
	<input type="button" onclick="findPost()" value="우편번호 찾기"><br>
	<p><input type="text" id="addr1" placeholder="주소" class="box">
	<input type="text" id="addr2" placeholder="상세주소" class="box">
	<p><button type="button" onclick="checkPost()">확인</button>
</form>
</div>
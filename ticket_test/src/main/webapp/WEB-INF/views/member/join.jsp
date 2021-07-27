<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${path}/include/style.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("addr1").value = extraAddr;
                
                } else {
                    document.getElementById("addr2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }
    
</script>
<script type="text/javascript">
function insert() {
	var userid = document.getElementById("userid");
	if(userid.value == ""){
		alert("아이디는 필수 사항입니다.");
		userid.focus();
		return;
	}
	var passwd = document.getElementById("passwd");
	if(passwd.value == ""){
		alert("비밀번호는 필수 사항입니다.");
		passwd.focus();
		return;
	}
	var name = document.getElementById("name");
	if(name.value == ""){
		alert("이름은 필수 사항입니다.");
		name.focus();
		return;
	}
	var email = document.getElementById("email");
	if(email.value == ""){
		alert("이메일을 입력하세요.");
		email.focus();
		return;
	}
	var zipcode = document.getElementById("zipcode");
	if(zipcode.value == ""){
		alert("우편번호를 입력하세요.");
		zipcode.focus();
		return;
	}
	var addr1 = document.getElementById("addr1");
	if(addr1.value == ""){
		alert("도로명 주소를 입력하세요.");
		addr1.focus();
		return;
	}
	var addr2 = document.getElementById("addr2");
	if(addr2.value == ""){
		alert("상세주소를 입력하세요.");
		addr2.focus();
		return;
	}
	document.form1.action = "${path}/member/insert.do";
	document.form1.submit();
}
</script>

</head>
<body>
<div style="height: 150px;">
<%@ include file="../include/menu_1.jsp" %>
</div>
<h2>회원가입 페이지</h2>
  <div class="container">
    <form name="form1" method="post">
      <div id="userid" class="form-group">
        <input type="text" name="userid" id="userid" class="form-control input-lg" placeholder="아이디">
      </div>
      <div id="passwd" class="form-group">
        <input type="password" name="passwd" id="passwd" class="form-control input-lg" placeholder="비밀번호">
      </div>
      <div id="name" class="form-group">
        <input type="text" name="name" id="name" class="form-control input-lg" placeholder="이름">
      </div>
      <div id="email" class="form-group">
        <input type="text" name="email" id="email" class="form-control input-lg" placeholder="이메일">
      </div>
      <div class="form-group">
        <input type="text" style="width: 40%; display: inline;" readonly name="zipcode" id="zipcode"
         class="form-control input-lg" placeholder="우편번호">
        <button type="button" class="btn btn-default" onclick="execPostCode()">
          <i class="fa fa-search"></i>우편번호 찾기
        </button>  
      </div>
      <div class="form-group">
        <input type="text" name="addr1" id="addr1" class="form-control input-lg" 
        placeholder="도로명 주소" readonly>
      </div>
      <div class="form-group">
        <input name="addr2" id="addr2" class="form-control input-lg" 
        placeholder="상세주소" type="text">
      </div>
      <input type="button" class="btn btn-lg btn-success btn-block" onclick="insert()" value="회원가입">
    </form>
  </div>
</body>
</html>
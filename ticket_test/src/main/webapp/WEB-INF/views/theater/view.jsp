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
<!-- 주소 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
/* 지번 주소 */
function daumZipCode() {
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
                document.getElementById("address").value = extraAddr;
            
            } else {
                document.getElementById("address").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            
            document.getElementById("address").value = addr;
            
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address2").focus();
        }
    }).open();
}

/* 도로명 주소 */
function daumZipCode2() {
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
                document.getElementById("address2").value = extraAddr;
            
            } else {
                document.getElementById("address2").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            
            document.getElementById("address2").value = addr;
            
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("phone").focus();
        }
    }).open();
}


$(function() {
	$("#btn_list").click(function() {
		location.href="${path}/admin/insert_theater.do";
	});
	$("#btn_update").click(function() {
		var theater_id = $("#theater_id").val();
		var theater_name = $("#theater_name").val();
		var auditorium = $("#auditorium").val();
		var seat = $("#seat").val();
		var address = $("#address").val();
		var address2 = $("#address2").val();
		var phone = $("#phone").val();
		var img = $("#img").val();

		if (confirm("수정하시겠습니까?")) {
			document.form1.action="${path}/theater/update.do";
			document.form1.submit();
			alert("수정되었습니다.");
		}else{
			alert("취소되었습니다.");
			return;
		}
	});
	$("#btn_delete").click(function() {
		if (confirm("삭제하시겠습니까?")) {
			document.form1.action="${path}/theater/delete.do";
			document.form1.submit();
			alert("삭제되었습니다.");
		}else{
			alert("취소되었습니다.");
			return;
		}
	});
});

</script>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
<h2>극장정보 수정</h2>
<form name="form1" method="post">
  <table border="1" style="text-align: center; margin-left: auto; margin-right: auto;" >
    <tr>
      <td>id</td>
      <td>
        <input name="theater_id" id="theater_id" value="${dto.theater_id}" size="55" readonly>
      </td>
    </tr>
    <tr>
      <td>지점</td>
      <td>
        <input name="theater_name" id="theater_name" size="55" value="${dto.theater_name}">
      </td>
    </tr>
    <tr>
      <td>상영관</td>
      <td>
        <input name="auditorium" id="auditorium" size="55" value="${dto.auditorium}">
      </td>
    </tr>
    <tr>
      <td>좌석</td>
      <td>
        <input name="seat" id="seat" size="55" value="${dto.seat}">
      </td>
    </tr>
    <tr>
      <td>지번주소</td>
      <td>
        <input name="address" id="address" size="40" value="${dto.address}">
        <button type="button" onclick="daumZipCode()">지번주소</button>
      </td>
    </tr>
    <tr>
      <td>도로명주소</td>
      <td>
        <input name="address2" id="address2" size="40" value="${dto.address2}">
        <button type="button" onclick="daumZipCode2()">도로명주소</button>
      </td>
    </tr>
    <tr>
      <td>전화</td>
      <td>
        <input name="phone" id="phone" size="55" value="${dto.phone}">
      </td>
    </tr>
    <tr>
      <td>사진</td>
      <td>
        <p>${dto.img}</p>
        <input name="img" id="img" type="file">
      </td>
    </tr>
    <tr>
      <td colspan="3">
        <button type="button" id="btn_update">수정</button>
        <button type="button" id="btn_delete">삭제</button>
        <button type="button" id="btn_list">목록</button>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
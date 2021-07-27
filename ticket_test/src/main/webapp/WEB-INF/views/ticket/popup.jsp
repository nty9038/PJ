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

<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.7.js"></script>
<script type="text/javascript">
$(function() {
	$("#kakaopay").click(function() {
		$.ajax({
			url: "${path}/ticket/kakaopay.do",
			data: {'title': document.getElementById('title').value, 
				'amount': document.getElementById('amount').value} ,
			dataType: "json",
			success: function(data) {
				//alert(data.tid);
				//alert("성공");
				var box = data.next_redirect_pc_url;
				location.replace(box);
				console.log(data.tid);
			} ,
			error: function(error) {
				alert(error);
				alert("실패");
				console.log(error);
			}
		});
	});
});

function check() {
	var title = document.getElementById('title').value;
	var theater = document.getElementById('theater').value;
	var date = document.getElementById('date').value;
	var time = document.getElementById('time').value;
	var seat = document.getElementById('seat').value;
	var amount = document.getElementById('amount').value;
	
	console.log("최종"+title);
	console.log("최종"+theater);
	console.log("최종"+date);
	console.log("최종"+time);
	console.log("최종"+seat);
	console.log("최종"+amount);
	
	document.form1.action = "${path}/ticket/check.do";
	document.form1.submit();
}

/* var IMP = window.IMP;
IMP.init('imp08507917');

IMP.request_pay({
    pg : 'kakao', // version 1.1.0부터 지원.
    popup : true,
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : ${amount},
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456',
    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    alert(msg);
}); */


</script>
</head>
<body>
<div style="height: 100px;">
<%@ include file="../include/menu_1.jsp" %>
</div>
<h2>결제 화면</h2>
<h2>${title}, ${theater_name}, ${view_date}, ${view_time}, ${seat}, ${price}원</h2>
<form name="form1" method="post">
  <input type="hidden" id="title" name="title" value="${m}">
  <input type="hidden" id="theater" name="theater" value="${t}">
  <input type="hidden" id="date" name="date" value="${d}">
  <input type="hidden" id="time" name="time" value="${s}">
  <input type="hidden" id="seat" name="seat" value="${select_seat}">
  <input type="hidden" id="amount" name="amount" value="${amount}">
  <button type="button" id="kakaopay" name="kakaopay" value="카카오페이" style="border: none;">
    <img alt="카카오페이" src="../images/payment_icon_yellow_small.png">
  </button>
</form>


</body>
</html>

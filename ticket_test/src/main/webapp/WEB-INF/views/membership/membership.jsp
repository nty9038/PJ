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
</head>
<body>
	<%@ include file="../include/menu_1.jsp"%>
	<div align="center" style="border: 1px solid #48BAE4; height: 200px;">
		<img title="환영합니다." src="../images/welcomeicon.jpg" width="20%"
			height="80%">
		<div class="cont-area">
			<div class="login-before">
				<i class="iconset ico-question-circle-big"></i>
				<p class="txt">
					<strong>어서오세요. 환영합니다!</strong>
				</p>
			</div>
		</div>
	</div>
	<br>
	<br>

	<div align="center" style="border: 1px solid #48BAE4; height: 140px;">

		<a href="${path}/membership/check_ticket.do"><img src="../images/movieticketicon.jpg" width="10%"
			height="110%" /><br>예매내역</a>
	</div>
	<br>
	<br>

	<div align=center style="" class="box-slash mt40">
		<br>
		<p class="tit-pr">
			<strong>[MEGABOX MEMBERSHIP]</strong>
		</p>

		<p style="font-style: italic;">메가박스 멤버십 회원에게만 제공되는 다양한 혜택</p>
	</div>



	<div align=center
		style="border: 1px solid #48BAE4; float: left; width: 48%; padding: 10px;">
		<a href="${path}/membership/my_page"><img
			src="../images/mypage.png" width="6%" height="6%" /><br>마이 페이지</a>
	</div>

	<div align=center
		style="border: 1px solid #48BAE4; float: left; width: 47%; padding: 10px;">
		<a href="${path}/membership/vip"><img
			src="../images/viplounge.jpg" width="9%" height="20%" /><br>VIP
			LOUNGE</a>
	</div>

	<div id="result"></div>
</body>
<%@ include file="../include/footer.jsp"%>
</html>
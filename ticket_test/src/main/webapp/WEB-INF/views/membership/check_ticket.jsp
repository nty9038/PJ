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
<style type="text/css">
p {
	font-size: 25px;
	font-weight: bold;
}
span {
	font-size: 20px;
}
</style>
</head>
<body>
<%@ include file="../include/menu_1.jsp" %>
<h2>예매내역</h2>
<c:forEach var="row" items="${ticket_list}"> 
  <p>예매정보</p>
  <span>예매번호 : </span>
  <span>${row.ticket_id}</span>
  <br>
  <span>예매영화 : </span>
  <span>${row.title}</span>
  <br>
  <span>관람극장 : </span>
  <span>${row.theater_name}</span>
  <br>
  <span>관람날짜 : </span>
  <span>${row.view_date}</span>
  <br>
  <span>관람시간 : </span>
  <span>${row.view_date}</span>
  <br>
  <span>관람좌석 : </span>
  <span>${row.seat}</span>
  <br><br>
  <p>결제내역</p>
  <span>결제금액 : </span>
  <span>${row.price}</span>
  <br>
  <span>결제날짜 : </span>
  <span>
    <fmt:formatDate value="${row.reserv_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
  </span>
  <br>
</c:forEach>

</body>
</html>
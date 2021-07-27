<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp"%>
</head>
<body>
		<%
        String pageChange;
    %>
		<a href="?pageChange=membership_det.jsp"><img title="멤버십" src="../images/membership.png" width="90%" height="7%"></a> <br> 
		<a href="?pageChange=point_save.jsp"><img title="포인트 적립" src="../images/moneypoint.png" width="90%" height="7%"></a> <br>  
		<a href="?pageChange=point_gift.jsp"><img title="포인트 선물" src="../images/giftpoint.jpg" width="90%" height="7%"></a> <br>  
		<a href="?pageChange=point_use.jsp"><img title="포인트 사용" src="../images/usingpoint.png" width="90%" height="7%"></a> <br> 
		<a href="?pageChange=vip.jsp"><img title="VIP Lounge" src="../images/viplounge.jpg" width="90%" height="7%"></a> <br>
</body>
</html>
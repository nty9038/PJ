<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<html>
<head>
<meta charset="UTF-8">
	<title>my page</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="../include/menu_1.jsp"%>


	<%
	String select = request.getParameter("pageChange");

	if (select == null) {
		select = "membership_det.jsp";
	}
	%><br>
	<br>
	<br>
	<br>
	<br>
	<table border=1 width=1800>
		<tr>
			<td align="center" width=200><jsp:include page="menu.jsp"
					flush="false" /></td>
			<td height=600><jsp:include page="<%=select%>" flush="false" /></td>
		</tr>
	</table>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>
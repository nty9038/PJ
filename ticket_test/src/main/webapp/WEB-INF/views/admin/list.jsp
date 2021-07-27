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
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
<h2>회원목록</h2>
<table border="1" style="width: 100%; text-align: center;">
  <tr>
    <th>아이디</th>
    <th>비밀번호</th>
    <th>이름</th>
    <th>이메일</th>
    <th>우편번호</th>
    <th>도로명주소</th>
    <th>상세주소</th>
    <th>가입일자</th>
    <th>회원등급</th>
  </tr>
 <c:forEach var="row" items="${list}">
  <tr>
    <td>${row.userid}</td>
    <td>${row.passwd}</td>
    <td><a href="${path}/member/view.do?userid=${row.userid}">${row.name}</a></td>
    <td>${row.email}</td>
    <td>${row.zipcode}</td>
    <td>${row.addr1}</td>
    <td>${row.addr2}</td>
    <td><fmt:formatDate value="${row.join_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
    <td>${row.user_grade}</td>
  </tr>
 </c:forEach>
</table>
</body>
</html>

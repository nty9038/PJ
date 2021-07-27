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
<div style="height: 100px;">
<%@ include file="../include/menu_1.jsp" %>
</div>
<h2>영화 소개</h2>
<table border="1" style="width: 100%;">
 <tr>
 <th>순번</th>
  <th>&nbsp;</th>
 </tr>

 <c:forEach var="row" items="${list}">
 <td>${row.movie_id}</td>
  <td><img src="${path}/images/${row.imgpath}"
   width="100px" height="100px"></td>
   <td><a href="${path}/movie/detail.do?movie_id=${row.movie_id}">${row.title}</a></td>
   
</c:forEach> 
</table>

<br>


<%-- <c:forEach var="row" items="${list}">
<div style="width: 20%; float: left; margin-left: 5%;">
<table>
  <tr>
    <th>
      <br>
      <a href="${path}/movie/detail.do?movie_id=${row.movie_id}">
        <img src="${path}/images/${row.imgpath}" width="200px" height="270px">
      </a>
    </th>
  </tr>
  <tr>
    <td>${row.title}</td>
  </tr>
  <tr>
    <td>개봉일</td>
    <td></td>
  </tr>
  <tr>
    <td>
      <button>예매하기</button>
    </td>
  </tr>
</table>
</div>
</c:forEach> --%>
</body>
</html>
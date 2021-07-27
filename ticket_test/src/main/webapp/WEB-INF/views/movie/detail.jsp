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
<%@ include file="../include/menu_1.jsp" %>
<h2>영화소개</h2>
<table>
 <tr>
  <td><img src="${path}/images/${dto.imgpath}"
   width="300px" height="300px" > </td>
  <td align="center">
   <table>
    <tr>
     <td>제목</td>
     <td>${dto.title}</td>
    </tr>
    <tr>
     <td>감독</td>
     <td>${dto.director}</td>
    </tr>
    <tr>
     <td>출연</td>
     <td>${dto.cast} </td>
    </tr>
     <tr>
     <td>등급</td>
     <td>${dto.grade} </td>
    </tr>
    <tr>
     <td>줄거리</td>
     <td>${dto.info} </td>
    </tr>
    <tr>
     <td colspan="2">
       <input type="hidden" name="movie_id" value="${dto.movie_id}">
       <select name="amount">
        
		<c:forEach var="row" items="${movie_list}">
			<td>${row.movie_id}</td>
			<td><img src="${path}/images/${row.imgpath}" width="100px"
				height="100px"></td>
			<tr>
				<td>${row.movie_id}</td>
				<td>${row.title}</td>
				<td>${row.director}</td>
				<td>${row.cast}</td>
				<td>${row.grade}</td>
				<td>${row.info}</td>
			</tr>

		</c:forEach>
       </select>
       <input type="submit" value="예매하기">
     </td>
    </tr>
   </table>
  </td> 
 </tr>
</table>

</body>
</html>
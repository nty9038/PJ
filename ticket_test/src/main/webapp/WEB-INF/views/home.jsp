<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
<%@ include file="include/header.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<c:if test="${message == 'logout'}">
  <script>
    alert("로그아웃 되셨습니다.");
  </script>
</c:if>
<c:if test="${message == 'error'}">
  <script>
    alert("로그인 후 사용하십시오.");
  </script>
</c:if>
</head>
<div style="height: 100px;">
<%@ include file="include/menu_1.jsp" %>
</div>
<body>
<h2>일단은 영화 예매 사이트</h2>
<P>  The time on the server is ${serverTime}. </P>
${sessionScope.userid}
<div id="content1" style="color: red; text-align: center;">현재 상영작
		<c:forEach var="row" items="${list}">
			<div style="width: 20%; float: left; margin-left: 5%;">
				<table>
					<tr>
						<th><br> <a
							href="${path}/movie/detail.do?movie_id=${row.movie_id}"> <img
								src="${path}/images/${row.imgpath}" width="200px" height="270px">
						</a></th>
					</tr>
					<tr>
						<td>크루엘라</td>
					</tr>
					<tr>
						<td>개봉일</td>
					</tr>
					<tr>
						<td>
							<button>예매하기</button>
						</td>
					</tr>
				</table>
			</div>
		</c:forEach>
</div> <br><br>
<div id="content2" style="color: green; text-align: center;">개봉 예정작</div> <br><br>
<div id="content3" style="color: blue; text-align: center;">기타 정보</div> <br><br>
<div id="footer" style="text-align: center;">회사 정보</div>

</body>
</html>

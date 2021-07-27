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
<!-- 섬머노트 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script type="text/javascript">
$(function() {
	$("#info").summernote({
		width: "500",
		height: "200"
	});
});

function movie_insert() {
	var title = $("#title").val();
	var director = $("#director").val();
	var cast = $("#cast").val();
	var grade = $("#grade option:selected").val();
	var info = $("#info").val();
	document.form1.action="${path}/movie/insert.do";
	document.form1.submit();
}

</script>
</head>
<body>
<div style="height: 100px;">
<%@ include file="../include/admin_menu.jsp" %>
</div>
<h2>영화 등록</h2>
<form name="form1" method="post" enctype="multipart/form-data">
  <table border="1" style="margin-left: auto; margin-right: auto;">
    <tr>
      <td>제목</td>
      <td><input name="title" id="title"></td>
    </tr>
    <tr>
      <td>감독</td>
      <td><input name="director" id="director"></td>
    </tr>
    <tr>
      <td>출연</td>
      <td><input name="cast" id="cast"></td>
    </tr>
    <tr>
      <td>등급</td>
      <td>
        <select name="grade" id="grade">
    	  <option value="전체관람가">전체관람가</option>
    	  <option value="12세관람가">12세관람가</option>
    	  <option value="15세관람가">15세관람가</option>
    	  <option value="천소년관람불가">청소년관람불가</option>
  		</select>
      </td>
    </tr>
    <tr>
      <td>포스터</td>
      <td>
        <input name="file1" id="file1" type="file">
      </td>
    </tr>
    <tr>
      <td>영화정보</td>
      <td>
        <textarea rows="5" cols="60" name="info" id="info"></textarea>
      </td>
    </tr>
    <tr>
      <td colspan="2" style="text-align: center;">
        <input type="button" onclick="movie_insert()" value="등록">
      </td>
    </tr>
  </table>
<br>  
<div>
  <table border="1" style="width: 100%; text-align: center;">
    <tr>
      <th>id</th>
      <th>제목</th>
      <th>감독</th>
      <th>출연</th>
      <th>등급</th>
      <th>정보</th>
      <th>사진</th>
    </tr>
    <c:forEach var="row" items="${movie_list}">
      <tr>  
        <td>${row.movie_id}</td>
        <td><a href="${path}/movie/view.do?movie_id=${row.movie_id}">${row.title}</a></td>
        <td>${row.director}</td>
        <td>${row.cast}</td>
        <td>${row.grade}</td>
        <td>${row.info}</td>
        <td>
          <a href="${path}/images/${row.imgpath}" target="_blank">
            <%-- <img style="width: 70px; height: 100px;" src="${path}/images/${row.imgpath}"> --%>
            <p>${row.imgpath}</p>
          </a>
        </td>
      </tr>  
    </c:forEach>
  </table>
</div>
</form>
</body>
</html>
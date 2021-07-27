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
<script type="text/javascript">
$(function() {
	$("#btn_list").click(function() {
		location.href="${path}/admin/insert_movie.do";
	});
	$("#btn_update").click(function() {
		var movie_id = $("#movie_id").val();
		var title = $("#title").val();
		var director = $("#director").val();
		var cast = $("#cast").val();
		var grade = $("#grade option:selected").val();
		var info = $("#info").val();
		var imgpath = $("#imgpath").val();
		/* if(imgpath.value == null){
			alert("이미지를 선택하세요.");
			imgpath.focus();
			return;
		} */
		alert("수정하시겠습니까?");
		document.form1.action="${path}/movie/update.do";
		document.form1.submit();
	});
	$("#btn_delete").click(function() {
		alert("삭제하시겠습니까?");
		document.form1.action="${path}/movie/delete.do";
		document.form1.submit();
	});
});

</script>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
<h2>영화정보 수정</h2>
<form name="form1" method="post">
  <table border="1" style="text-align: center; margin-left: auto; margin-right: auto; width: 500px;" >
    <tr>
      <td>id</td>
      <td>
        <input name="movie_id" id="movie_id" value="${dto.movie_id}" readonly>
      </td>
    </tr>
    <tr>
      <td>제목</td>
      <td>
        <input name="title" id="title" value="${dto.title}">
      </td>
    </tr>
    <tr>
      <td>감독</td>
      <td>
        <input name="director" id="director" value="${dto.director}">
      </td>
    </tr>
    <tr>
      <td>출연</td>
      <td>
        <input name="cast" id="cast" value="${dto.cast}">
      </td>
    </tr>
    <tr>
      <td>등급</td>
      <td>
        <select name="grade" id="grade">
          <option value="전체관람가">전체관람가</option>
          <option value="12세관람가">12세관람가</option>
          <option value="15세관람가">15세관람가</option>
          <option value="청소년관람불가">청소년관람불가</option>
        </select>
        <%-- <input name="grade" id="grage" value="${dto.grade}"> --%>
      </td>
    </tr>
    <tr>
      <td>정보</td>
      <td>
        <input name="info" id="info" value="${dto.info}">
      </td>
    </tr>
    <tr>
      <td>사진</td>
      <td>
        <p>${dto.imgpath}</p>
        <input type="file" id="imgpath" name="imgpath">
      </td>
    </tr>
    <tr>
      <td colspan="3">
        <button type="button" id="btn_update">수정</button>
        <!-- <input type="button" onclick="movie_update()" value="수정"> -->
        <button type="button" id="btn_delete">삭제</button>
        <button type="button" id="btn_list">목록</button>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
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
	$("#btn_login").click(function() {
		var userid = $("#userid").val();
		var passwd = $("#passwd").val();
		if(userid == ""){
			alert("아이디를 입력하세요.")
			$("#userid").focus();
			return;
		}
		if(passwd == ""){
			alert("비밀번호를 입력하세요.")
			$("#passwd").focus();
			return;
		}
		document.form1.action = "${path}/admin/login_check.do";
		document.form1.submit();
	});
});
</script>
<c:if test="${message == 'error'}">
  <script>
    alert("아이디 또는 비밀번호가 일치하지 않습니다.");
  </script>
</c:if>
</head>
<body>
<div style="height: 100px;">
<%@ include file="../include/menu_1.jsp" %>
</div>
<h2>관리자 로그인 페이지</h2>
<form name="form1" method="post">
<table style="margin-left: auto; margin-right: auto; border-collapse: separate; border-spacing: 0 20px;" >
  <tr>
    <td>
      <input style="width: 250px; height: 40px;" 
      type="text" id="userid" name="userid" placeholder="아이디">
    </td>
  </tr>
  <tr>
    <td>
      <input style="width: 250px; height: 40px;" 
      type="password" id="passwd" name="passwd" placeholder="비밀번호">
    </td>  
  </tr>
  <tr>
    <td style="text-align: center;">
      <button type="button" id="btn_login">로그인</button>
    </td>
  </tr>
  <tr>
    <td style="text-align: center;">
      <button type="button" id="btn_searchID">ID찾기</button>
      <button type="button" id="btn_searchPW">PW찾기</button>
      <button type="button" id="btn_join">회원가입</button>
    </td>
  </tr>
</table>
</form>
</body>
</html>
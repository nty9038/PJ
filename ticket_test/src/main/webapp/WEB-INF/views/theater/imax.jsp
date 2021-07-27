<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>IMAX</title>
<%@ include file="../include/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${path}/include/style.css">


<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR&display=swap');
a:visited { color: navy; }
a:link { color: navy; }
.mySlides {display:none;}
.a{width:950px;
    height:600px;
    position:relative;
    margin:0 auto} 
.main{font-family: 'Noto Sans KR', sans-serif; font-size: 20px; list-style-type: none; padding-left: 25px; display: inline;}
.hr-sect { 	display: flex; flex-basis: 100%; align-items: center; 	color: blue; font-size: 40px; font-family: 'Do Hyeon', sans-serif; margin: 8px 0px; }
.hr-sect::before, .hr-sect::after { content: ""; flex-grow: 1; background: rgba(0, 0, 0, 0.35); height: 1px; font-size: 0px; line-height: 0px; margin: 0px 16px; }
</style>

</head>

<body>
<div style="height: 100px;">
<%@ include file="../include/menu_1.jsp" %>
</div>
<br>

<h2>특별관</h2><br>

<div style="float: left;">
            <ul>
                <li class="main"> <a href="${path}/theater/dx.do">4DX</a></li>   
                <li class="main"> <a href="${path}/theater/dxs.do">4DX SCREEN</a></li>
                <li class="main"> <a href="${path}/theater/imax.do">IMAX</a></li>
                <li class="main"> <a href="${path}/theater/gold.do">GOLD CLASS</a></li>
                <li class="main"> <a href="${path}/theater/sky.do">SKYBOX</a></li>
                <li class="main"> <a href="${path}/theater/sound.do">SOUNDX</a></li>
              </ul>
 </div>
 
 <div style="height: 10px;"></div>
<p><br></p>
<p><br></p>
<div class="hr-sect">IMAX</div>
<br>                 
<br>


<!--  슬라이드 -->
<div class="a">
  <img class="mySlides" src="..\images\im1.JPG" style="width:100%; height:100%">
  <img class="mySlides" src="..\images\im2.JPG" style="width:100%; height:100%">
  <img class="mySlides" src="..\images\im3.JPG" style="width:100%; height:100%">
</div>

	<br><br><br><br>	<br><br><br><br>	<br><br>
<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); 
}
</script>


 </body>
</html>


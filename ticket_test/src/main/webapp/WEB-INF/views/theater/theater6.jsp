<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>논산 영화관</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${path}/include/style.css">

</head>
	<!--논산 영화관 페이지-->
<body>
<div style="height: 100px;">
<%@ include file="../include/menu_1.jsp" %>
</div>
<br>

<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR&display=swap');

.main{	font-family: 'Noto Sans KR', sans-serif; font-size: 20px;  color: navy; list-style-type: none; }

.sub {    list-style: none;  padding-left: 0px;  font-family: 'Noto Sans KR', sans-serif;   font-size: 15px;  color: black;}

.li1 {list-style-type: none; display: inline;}

.hr-sect { 	display: flex; flex-basis: 100%; align-items: center; 	color: blue; font-size: 40px; font-family: 'Do Hyeon', sans-serif; margin: 8px 0px; }
	
.hr-sect::before, .hr-sect::after { content: ""; flex-grow: 1; background: rgba(0, 0, 0, 0.35); height: 1px; font-size: 0px; line-height: 0px; margin: 0px 16px; }

.con { 	font-size: 20px; font-family: 'Noto Sans KR', sans-serif;}
</style>

<h2>전체극장</h2><br>

<div style="float: left;">
            <ul>
                <li class="main">
                  서울
                  <ul class="sub" style="display:none">             
                   <li class="li1"><a href="${path}/theater/theater2.do">강남</a></li>                
					 <li class="li1">|  홍대  |  명동  |  송파</li>					
                  </ul>
                </li>
                </ul>
                </div>
              
 <div style="float: left;">
            	<ul>
                <li class="main">
                  경기
                  <ul class="sub" style="display:none">
                   <li class="li1"><a href="${path}/theater/theater3.do">고양</a></li>        
                     <li class="li1">|  수원  |  일산  |  평택</li>
   				 </ul>
                </li>
                </ul>
                </div>
                
<div style="float: left;">
            <ul>
                <li class="main">
                  인천
                  <ul class="sub" style="display:none">
                   <li class="li1"><a href="${path}/theater/theater4.do">부평</a></li>    
					 <li class="li1">|  송도  |  인천  |  주안 </li>
                  </ul>
                </li>
                </ul>
                </div>
                
 <div style="float: left;">
            	<ul>
                <li class="main">
                 강원
                  <ul class="sub" style="display:none">
                   <li class="li1"><a href="${path}/theater/theater5.do">속초</a></li>
                      <li class="li1">|  원주  |  인제  |  춘천</li>
   				 </ul>
                </li>
                </ul>
                </div>
                
<div style="float: left;">
            	<ul>
                <li class="main">
                 충청
                  <ul class="sub" style="display:none">
                   <li class="li1"><a href="${path}/theater/theater6.do">논산</a></li>
                      <li class="li1">|  세종  |  천안  |  청주</li>
   				 </ul>
                </li>
                </ul>
                </div>
                
<div style="float: left;">
            	<ul>
                <li class="main">
                 경상
                  <ul class="sub" style="display:none">
                   <li class="li1"><a href="${path}/theater/theater7.do">김해</a></li>
                      <li class="li1">|  거제  |  통영  |  포항</li>
   				 </ul>
                </li>
                </ul>
                </div>
                
<div style="float: left;">
            	<ul>
                <li class="main">
                 전라
                  <ul class="sub" style="display:none">
                   <li class="li1"><a href="${path}/theater/theater8.do">군산</a></li>
                      <li class="li1">|  나주  |  목포  |  순천</li>
   				 </ul>
                </li>
                </ul>
                </div>       
        
       	 <script>
            $(".main").click(function(){
                if($(this).find(".sub").is(":visible")){
                    $(this).find(".sub").slideUp();
                }
                else{
                    $(this).find(".sub").slideDown();
                }
            })
</script>

<div style="height: 10px;"></div>
<p><br></p>
<p><br></p>
<div class="hr-sect">논산</div>
<br>

<div class="theater" style="padding: 0px 500px  0px 500px ;">
	<!--논산-->	
	<div>
	<img src="..\images\non.JPG" alt="No Image" width="900" height="400" >
	</div>
	
	<br>
	<p class="con">충청남도 논산시 내동 중앙로 255</p>
	
	<a href="https://map.naver.com/v5/entry/place/1954460036?c=14141161.3879541,4326766.8097346,11,0,0,0,dh" target="_blank" 
	style="font-family: 'Noto Sans KR', sans-serif; font-size: 15px;">[위치보기]</a>
	<br><br>
	
	<p class="con">1544-1122<br>
	1관 / 20석</p>
	<br><br><br><br>	<br><br><br><br>	<br><br>
	</div>

</body>
</html>
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
<link rel="stylesheet" href="${path}/include/ticket.css?ver=1">
<script type="text/javascript">
$(function() {
	/* 영화 선택 */
	var btn_movie = document.getElementsByClassName("btn_movie");
	var btn_theater = document.getElementsByClassName("btn_theater");
	function handleClick(event) {
		 //console.log(event.target);
	     //console.log(event.target.classList);
  		if (event.target.classList[1] === "clicked") {
    		event.target.classList.remove("clicked");
  		} else {
    		for (var i = 0; i < btn_movie.length; i++) {
    			btn_movie[i].classList.remove("clicked");
    		}
  		  	event.target.classList.add("clicked");
  			}
  		$("#movie_print").html($(event.target).val());
		}
	
	function init() {
  		for (var i = 0; i < btn_movie.length; i++) {
	  		btn_movie[i].addEventListener("click", handleClick);
  }
  		
}

init();

	/* 극장선택 */
	var btn_theater = document.getElementsByClassName("btn_theater");
	function handleClick2(event) {
		 //console.log(event.target);
	     //console.log(event.target.classList);
  		if (event.target.classList[1] === "clicked") {
    		event.target.classList.remove("clicked");
  		} else {
    		for (var i = 0; i < btn_theater.length; i++) {
    			btn_theater[i].classList.remove("clicked");
    		}
  		  	event.target.classList.add("clicked");
  			}
  		$("#theater_print").html($(event.target).val());
		}
	
	function init2() {
  		for (var i = 0; i < btn_theater.length; i++) {
  			btn_theater[i].addEventListener("click", handleClick2);
  }
  		
}

init2();


/* 날짜 선택 */

var btn_date = document.getElementsByClassName("btn_date");
	function handleClick3(event) {
		 //console.log(event.target);
	     //console.log(event.target.classList);
  		if (event.target.classList[1] === "clicked") {
    		event.target.classList.remove("clicked");
  		} else {
    		for (var i = 0; i < btn_date.length; i++) {
    			btn_date[i].classList.remove("clicked");
    		}
  		  	event.target.classList.add("clicked");
  			}
  		$("#date_print").html($(event.target).val());
		}
	
	function init3() {
  		for (var i = 0; i < btn_date.length; i++) {
  			btn_date[i].addEventListener("click", handleClick3);
  }
  		
}

init3();

/* 시간 선택 */

var btn_time = document.getElementsByClassName("btn_time");
function handleClick4(event) {
	 //console.log(event.target);
     //console.log(event.target.classList);
		if (event.target.classList[1] === "clicked") {
		event.target.classList.remove("clicked");
		} else {
		for (var i = 0; i < btn_time.length; i++) {
			btn_time[i].classList.remove("clicked");
		}
		  	event.target.classList.add("clicked");
			}
		$("#time_print").html($(event.target).val());
	}

function init4() {
		for (var i = 0; i < btn_time.length; i++) {
			btn_time[i].addEventListener("click", handleClick4);
}
		
}

init4();

});

//선택값 히든 타입 인풋에 전달
function movie_select(val) {
	//alert(val);
	//console.log(val);
	document.getElementById('movie_form').value = val;
}
function theater_slect(val) {
	//alert(val);
	//console.log(val);
	document.getElementById('theater_form').value = val;
}
function date_select(val) {
	//alert(val);
	//console.log(val);
	document.getElementById('date_form').value = val;
}
function time_select(val) {
	//alert(val);
	//console.log(val);
	document.getElementById('time_form').value = val;
}

//선택값 전송
function ticketing() {
	if (${userid==null}) {
		alert("로그인후 사용하세요.")
		return;
	}
	var m = document.getElementById('movie_form').value;
	var t = document.getElementById('theater_form').value;
	var d = document.getElementById('date_form').value;
	var s = document.getElementById('time_form').value;
	
	if(m == ""){
		alert("영화를 선택하세요.");
		return;
	}
	if(t == ""){
		alert("극장을 선택하세요.");
		return;
	}
	if(d == ""){
		alert("날짜를 선택하세요.");
		return;
	}
	if(s == ""){
		alert("시간을 선택하세요.");
		return;
	}
	document.form1.action = "${path}/ticket/ticketing.do";
	document.form1.submit();
}
</script>
</head>
<body>
<div style="height: 150px;">
<%@ include file="../include/menu_1.jsp" %>
</div>
<h2>티켓팅</h2>
<!-- 티켓팅 테이블 -->
<table id="step">
  <tr>
    <td>step1 > </td>
    <td>step2 > </td>
    <td>step3 > </td>
    <td>step4 > </td>
  </tr>
</table>
<br>
<form name="form1" method="post">
  <table id="ticket" border="1">
    <tr>
      <th>영화</th>
      <th>극장</th>
      <th>날짜</th>
      <th>시간</th>
    </tr>
      <tr>
        <td>
    	    <ul>
    	 	  <c:forEach var="row" items="${movie_list}" varStatus="status">
    	        <li>
				  <button class="btn_movie" id="movie_${status.index}" name="movie" type="button" value="${row.title}" onclick="movie_select(this.value)">${row.title}</button>
    	        </li>
    	  	  </c:forEach>
    	    </ul>
        </td>
        <td>
            <ul>
          	  <c:forEach var="row" items="${theater_list}" varStatus="status">
                <li>
                  <button class="btn_theater" id="theater_${status.index}" type="button" value="${row.theater_name}" onclick="theater_slect(this.value)">${row.theater_name}</button>
                </li>
          	  </c:forEach>
            </ul>          
        </td>
        <td>
          <ul>
            <li>
              <button class="btn_date" id="date" type="button" value="8월1일" onclick="date_select(this.value)">8월1일</button>
            </li>
          </ul>
        </td>
        <td>
          <ul>
            <li>
              <button class="btn_time" id="time" type="button" value="13:00" onclick="time_select(this.value)">13:00</button>
            </li>
          </ul>
        </td>
      </tr>
  </table>
  <br><br>
<!-- 선택 사항 표시 영역 -->
<div id="div">
  <table id="selected">
    <tr>
      <td>
  		<span id="movie_print">영화선택</span>
  		<input type="hidden" id="movie_form" name="movie_form" value="">
      </td>
      <td>
 		 <span id="theater_print">극장선택</span>
 		 <input type="hidden" id="theater_form" name="theater_form" value="">
      </td>
      <td>
		  <span id="date_print">날짜선택</span>
		  <input type="hidden" id="date_form" name="date_form" value="">
      </td>
      <td>
 		 <span id="time_print">시간선택</span>
 		 <input type="hidden" id="time_form" name="time_form" value="">
      </td>
      <td>
        <button type="button" onclick="ticketing()">예매하기</button>      
      </td>
    </tr>   
  </table>
</div>
</form>

</body>
</html>
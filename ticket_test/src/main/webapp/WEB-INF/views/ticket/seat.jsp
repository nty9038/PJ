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
$(document).ready(function() {
	   $(":checkbox:not(:checked)").attr("disabled", "disabled");
	    $(":checkbox").change(function() {
	        var adult = $("#adult").val();
	        var kid = $("#kid").val();
	        var seat = Number($("#adult").val()) + Number($("#kid").val())
	        if( seat == $(":checkbox:checked").length ) {
	            $(":checkbox:not(:checked)").attr("disabled", "disabled");
	        }
	        else {
	            $(":checkbox").removeAttr("disabled");
	        }
	    });
	    $("#adult, #kid").change(function(){
	        $(":checkbox").removeAttr("disabled");
	        $(":checkbox").prop("checked", false);
	    });
	});


function test() {
    var select_seat = '';
    $("input:checkbox[name='seat']:checked").each(function (index) {
        if (index != 0) {
            select_seat += ', ';
        }
        select_seat += $(this).val();
    });
    var total = Number($("#adult").val())*14000 + Number($("#kid").val())*11000;
    if (window.confirm('선택하신 좌석은 '+select_seat+'이 맞으면 확인을 눌러주세요.'))
    {
        // 확인시 결제창
        popupOpen(select_seat, total);
    }
    else
    {
     return;
    }
}


function popupOpen(select_seat, total) {
	
	document.getElementById('seat_form').value = select_seat;
	document.getElementById('amount_form').value = total;
	
	
	$("#print").html(select_seat);
	$("#total").html(total);
	
}

function pay() {	
	/* var title = document.getElementById('m').value;
	var theater_name = document.getElementById('t').value;
	var view_date = document.getElementById('d').value;
	var view_time = document.getElementById('s').value;
	var seat = document.getElementById('seat_form').value;
	var price = document.getElementById('amount_form').value; */
	
	var title = $("#title").val();
	var theater_name = $("#theater_name").val();
	var view_date = $("#view_date").val();
	var view_time = $("#view_time").val();
	var seat = $("#seat").val();
	var price = $("#price").val();
	
	if (seat == "") {
		alert("좌석을 선택하세요.")
		return;
	}
	
	document.form1.action = "${path}/ticket/popup.do";
	document.form1.submit();
}

</script>
<style type="text/css">
#sel{
	margin-left: auto;
	margin-right: auto;
	width: 70%;
	text-align: center;
}
#button{
	width: 100px;
	height: 50px;
	font-size: 20px;
	margin-top: 2%;
	float: right;
	margin-right: 47%;
}
</style>
</head>
<body>
<%@ include file="../include/menu_1.jsp" %>
<h2>좌석선택</h2>

<form name="form1" method="post">

<table>

<tr height="30">

<%
	String[] column = {"A", "B", "C", "D", "E", "F", "G", "H", "I"};
	out.println("<td width='30'>&nbsp;</td>");
    for(int i=1; i<=9; i++) {
    	if(i!=1 && i%3==1)
    		out.println("<td width='20'>&nbsp;</td>");
    	out.println("<td width='30' align='center'>"+i+"</td>");
    }
%>

</tr>



<%
    String s;
	for(int i=1; i<=9; i++) {
		out.println("<tr height='25'>");
		out.println("<td align='center'>"+column[i-1]+"</td>");
		for(int j=1; j<=9; j++) {
			if(j!=1 && j%3==1)
				out.println("<td width='20' bgcolor='gray'>&nbsp;</td>");
			out.print("<td width='30' align='center'>");
			s=column[i-1]+j;
			System.out.println(s);
			out.print("<input type='checkbox' name='seat' id='seat_num' value='"+
			    s+"'>");
			out.println("</td>");
		}
		out.println("</tr>");
	}
%>
</table>

어른:
<select id="adult" name="adult">
   <option value="0">0</option>
   <option value="1">1</option>
   <option value="2">2</option>
   <option value="3">3</option>
   <option value="4">4</option>
   <option value="5">5</option>
</select>
어린이:
<select id="kid" name="kid">
   <option value="0">0</option>
   <option value="1">1</option>
   <option value="2">2</option>
   <option value="3">3</option>
   <option value="4">4</option>
   <option value="5">5</option>
</select>

<input id="focus" type="button" value="선택완료" onclick="test()">
<input type="hidden" value="${m}" id="m" name="title">
<input type="hidden" value="${t}" id="t" name="theater_name">
<input type="hidden" value="${d}" id="d" name="view_date">
<input type="hidden" value="${s}" id="s" name="view_time">
<input type="hidden" id="seat_form" name="seat_form" value="">
<input type="hidden" id="amount_form" name="amount_form" value="">
<br>
<table id="sel" border="1">
  <tr>
    <td>
      <h2>영화</h2>
    </td>
    <td>
      <h2>상영관</h2>
    </td>
    <td>
      <h2>날짜</h2>
    </td>
    <td>
      <h2>시간</h2>
    </td>
    <td>
      <h2>좌석</h2>
    </td>
    <td>
      <h2>가격</h2>
    </td>
  </tr>
  <tr>
    <td>
      <h2>${m}</h2>
    </td>
    <td>
      <h2>${t}</h2>
    </td>
    <td>
      <h2>${d}</h2>
    </td>
    <td>
      <h2>${s}</h2>
    </td>
    <td>
      <h2>
	    <span id="print"></span>        
      </h2>
    </td>
    <td>
      <h2>
	    <span id="total"></span>
      </h2>
    </td>
  </tr>
</table>

<button type="button" id="button" value="결제" onclick="pay()">결제하기</button>

</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/include/style.css">
<div style="height: 150px;">
<header>
  <div id="main_menu">
	<nav>
		<ul>
			<li>
			  <a href="${path}/movie/list.do">영화</a>
				<ul>
					<li><a href="${path}/movie/list.do">현재 상영작</a></li>
					<li><a href="#">상영 예정작</a></li>
					<c:if test="${userid == 'admin'}">
					  <li><a href="${path}/admin/insert_movie.do">영화 등록</a></li>
					</c:if>
				</ul>
			</li>
			<li>
			  <a href="${path}/theater/theater.do">극장</a>
				<ul>
					<li><a href="${path}/theater/theater.do">전체 극장</a></li>
					<li><a href="${path}/theater/special.do">특별관</a></li>
					<c:if test="${userid == 'admin'}">
					  <li><a href="${path}/admin/insert_theater.do">극장정보</a></li>
					</c:if>
				</ul>
			</li>
			<li>
			  <a id="menu_logo" href="${path}">
			    <img alt="로고" src="${pageContext.request.contextPath}/resources/${logo}">
			  </a>
			</li>
			<li>
			  <a href="${path}/ticket/ticket.do">예매</a>
				<ul>
					<li><a href="${path}/ticket/ticket.do">빠른 예매</a></li>
					<li><a href="${path}/ticket/time_table.do">상영 시간표</a></li>
				</ul>
			</li>
			<li>
			  <a href="${path}/membership/membership.do">맴버십</a>
				<ul>
					<li><a href="${path}/membership/membership.do">마이페이지</a></li>
					<li><a href="#">VIP LOUNGE</a></li>
					<c:if test="${userid == 'admin'}">
					  <li><a href="${path}/member/list.do">회원목록</a></li>
					</c:if>
				</ul>
			</li>
		</ul>
	</nav>
  </div>
  <div id="member">
	<nav>
	  <ul>
		<!-- <li><a href="#">고객센터</a></li> -->
		<c:if test="${userid==null}">
		  <li><a href="${path}/member/login.do">로그인</a></li>
  		  <li><a href="${path}/member/join.do">회원가입</a></li>
		</c:if>
		<c:if test="${userid != null}">
		  <li><a href="${path}/member/logout.do">로그아웃</a></li>
		</c:if>
		<c:if test="${userid == 'admin'}">
		  <li><a href="${path}/admin/logout.do">관리자<br>로그아웃</a></li>
		</c:if>
	  </ul>
	</nav>
  </div>
</header>
</div>
<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String mainMenu = request.getParameter("mainMenu");
%>
<div class="topArea">
	<div class="utilMenu">
		<div class="left flex_center_center">
			<h1><a href="../order_list/list_index.jsp">IDI</a></h1>
		</div>
		<ul class="right">
			<li><strong>회원명</strong>님 ( <strong>아이디</strong> ) 환영합니다.</li>
			<li><a href="/mngr/login/index">로그아웃</a></li>
		</ul>
	</div>
	<ul class="mainMenu clearFix">
		<li><a href="/mngr/order/list/index"<%= mainMenu.equals("mainMenu_01") ? " class=\"active\"" : "" %>>주문관리</a></li>
		<li><a href="/mngr/postoffice/invoice/index"<%= mainMenu.equals("mainMenu_02") ? " class=\"active\"" : "" %>>택배연동</a></li>
		<li><a href="/mngr/deposit/check/index"<%= mainMenu.equals("mainMenu_03") ? " class=\"active\"" : "" %>>자동입금확인</a></li>
		<li><a href="/mngr/receipt/inquiry/index"<%= mainMenu.equals("mainMenu_04") ? " class=\"active\"" : "" %>>현금영수증</a></li>
		<li><a href="/mngr/member/management/list/index"<%= mainMenu.equals("mainMenu_05") ? " class=\"active\"" : "" %>>회원</a></li>
		<li><a href="/mngr/product/management/list/index"<%= mainMenu.equals("mainMenu_06") ? " class=\"active\"" : "" %>>상품</a></li>
		<li><a href="/mngr/regular/discount/index"<%= mainMenu.equals("mainMenu_07") ? " class=\"active\"" : "" %>>정기구매관리</a></li>
		<li><a href="/mngr/board/notice/index"<%= mainMenu.equals("mainMenu_08") ? " class=\"active\"" : "" %>>게시판관리</a></li>
		<li><a href="/mngr/design/popup/index"<%= mainMenu.equals("mainMenu_09") ? " class=\"active\"" : "" %>>디자인관리</a></li>
		<!-- <li><a href="/mngr/coupon/setup/index"<%= mainMenu.equals("mainMenu_10") ? " class=\"active\"" : "" %>>쿠폰관리</a></li> -->
		<li><a href="/mngr/etc/notice/index"<%= mainMenu.equals("mainMenu_11") ? " class=\"active\"" : "" %>>기타관리</a></li>
		<li><a href="/mngr/setup/basics/index"<%= mainMenu.equals("mainMenu_12") ? " class=\"active\"" : "" %>>환경설정</a></li>
		<li><a href="/mngr/statistic/sale/index"<%= mainMenu.equals("mainMenu_13") ? " class=\"active\"" : "" %>>통계</a></li>
	</ul>
</div>
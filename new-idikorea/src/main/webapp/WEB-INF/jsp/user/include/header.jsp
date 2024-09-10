<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ page import="com.brighten.idi.util.SessionUtil" %>

<%
	request.setCharacterEncoding("UTF-8");
    String navId = request.getParameter("navId");
    String pagename = request.getParameter("pagename");

    Boolean isLogin = SessionUtil.isLogin(); 
    String userName = request.getParameter("userName");
%>



<a href="/user/basket/speed" id="speed_order">
	<img src="/images/user/common/fixed_menu.png">
	<span>스피드 주문</span>
</a>
<a href="" id="common_go_top">
	<img src="/images/user/common/common_top.png">
</a>

<header class="header">

    <div class="header-mymenu">
        <div class="layout">
            <div class="header-mymenu-alert">
                <a class="header-mymenu-bookmark">Bookmark</a>
                <% if(isLogin == true) { %>
                <span class="header-mymenu-welcome"><b><%=userName%></b>님 로그인 되었습니다.</span>
                <% } %>
            </div>
            <ul class="user-menu header-user-menu menu-list">
                <% if (isLogin == true) { %>
                    <li>
                        <!-- 로그인 되었습니다.</span> -->
                        <a href="/api/v1/logout" class="link">로그아웃</a>
                    </li>
                <%} else { %>
                    <li>
                        <a href="/user/login" class="link">로그인</a>
                    </li>
                    <li>
                        <a href="/user/join/agree" class="link">회원가입</a>
                    </li>
                    <li>
                        <a href="/user/basket/detail" class="link">주문 &middot; 배송조회</a>
                    </li>
                <%} %>
                <% if (isLogin == true) { %>
                    <!-- <li>
                        <a href="/my/myMain/index.do" class="link">마이페이지</a>
                    </li> -->
                    <li>
                        <a href="/user/mypages/order/history" class="link">주문 &middot; 배송조회</a>
                    </li>
                <% }  %>
                <li>
                    <!-- <a href="#" onclick="goGive(); return false;" class="link">기부금영수증</a> -->
                    <a href="javascript:let win = window.open('', '_blank', 'width=500,height=600');" class="link">기부금영수증</a>
                </li>
            </ul>
            <ul class="header-product-menu menu-list">
                <li>
                    <button type="button" class="btn btn-open-search">
                        <img src="/images/user/common/pc_top_search.png" alt="검색">
                    </button>
                </li>
                <li>
                    <a href="/user/basket/list" class="btn btn-cart"><img src="/images/user/common/cart.png" alt="장바구니"></a>
                </li>
                <li class="idi_top_cart">
                    <a href="/user/basket/list?regular=false"><span class="topCartCnt">0</span></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="header-nav">
        <div class="layout">
            <button type="button" class="btn-allmenu header-allmenu">
                <span class="bar"></span>
                <span class="bar"></span>
                <span class="bar"></span>
            </button>
    
            <div class="header-logo-wrap">
                <a href="/user/main" class="logo header-logo">
                    <span class="icon">
                        <img src="/images/user/common/logo.png" alt="IDIKorea">
                    </span>
                    <span class="txt">IDI</span>
                </a>
            </div>
    
            <jsp:include page="nav.jsp" flush="false" />
        </div>
    </div>
    <div class="header-search-container">
        <div class="header-search">
            <input type="text" class="header-search-input" name="" placeholder="검색어를 입력하세요" required autofocus>
            <button type="button" class="btn btn-search header-search-btn">
                <span class="icon">
                    <img src="/images/user/common/input_search.png" alt="검색">
                </span>
                <!-- <span class="txt"></span> -->
            </button>
        </div>
    </div>

</header>

<%
    // if(!navId.matches("00(.*)") || navId.matches("0003(.*)")) {
    if(!navId.matches("0001(.*)") && !navId.matches("01(.*)")) {
%>

<section class="sub-sect sect-subbanner" data-tit="<%=pagename%>">
    <div class="subbanner">
        <span class="subbanner-txt"><%=pagename%></span>
    </div>
</section>

<%
    }
    else if(navId.matches("01(.*)")) {
%>

<section class="sub-sect sect-subbanner" data-tit="<%=pagename%>">
    <div class="subbanner">
        <span class="subbanner-txt"><%=pagename%></span>
        <span class="subbanner-txt-sub">160년 피부의 사랑이 피부의 역사를 다시 씁니다.</span>
    </div>
</section>

<%
    }
%>



<script src="/js/user/common/header.js"></script>
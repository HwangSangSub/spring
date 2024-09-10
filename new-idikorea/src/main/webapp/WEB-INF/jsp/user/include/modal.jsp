<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    String navId = request.getParameter("navId");

    Boolean isLogin = Boolean.parseBoolean(request.getParameter("isLogin"));
    String userName = request.getParameter("userName");
%>

<div class="modal-wrap modal-nav-wrap">
	<div class="modal modal-nav">
        <div class="modal-top modal-nav-top">            
            <ul class="user-menu menu-list">
                <% if (isLogin == true) { %>
                    <li>
                        <!-- 로그인 되었습니다.</span> -->
                        <a href="/j_spring_security_logout" class="link">로그아웃</a>
                    </li>
                    <%} else { %>
                    <li>
                        <a href="/member/login/index.do" class="link">로그인</a>
                    </li>
                    <li>
                        <a href="/member/terms/index.do" class="link">회원가입</a>
                    </li>
                    <%} %>
                    <li>
                        <a href="/my/myOrderList/index.do" class="link">주문 &middot; 배송조회</a>
                    </li>
                    <li>
                        <a href="#" onclick="goGive(); return false;" class="link">기부금영수증</a>
                    </li>
                    <!-- 
                    <li>
                        <a href="/my/myMain/index.do" class="link">마이페이지</a>
                    </li> 
                    -->
            </ul>
            <button type="button" class="btn btn-close">
                <!-- <img src="/images/user/common/btn-close-mobile-black.svg" alt="닫기"> -->
                <span class="bar"></span>
                <span class="bar"></span>
            </button>
        </div>
        <div class="modal-main modal-nav-main">
            <nav class="nav">
                <ul class="nav-list"></ul>
            </nav>
        </div>
        <div class="modal-bottom modal-nav-bottom">

        </div>
	</div>
</div>
<div class="modal-wrap modal-post-wrap">
    <div class="modal modal-post">
        <div class="modal-top">
            <button type="button" class="btn btn-close">
                <img src="/images/user/common/top_close.png" alt="닫기">
            </button>
        </div>
        <div class="modal-main"></div>
        <div class="modal-bottom"></div>
    </div>
</div>

<%-- sample --%>
<%-- 
<div class="modal-wrap">
	<div class="modal">
        <div class="modal-top">
            <button type="button" class="btn btn-close">
                <img src="/images/user/common/btn-close-mobile-black.svg" alt="닫기">
            </button>
        </div>
        <div class="modal-main">
            <div class="">내용</div>

        </div>
        <div class="modal-bottom">

        </div>
	</div>
</div>
--%>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/user/common/modal.js"></script>
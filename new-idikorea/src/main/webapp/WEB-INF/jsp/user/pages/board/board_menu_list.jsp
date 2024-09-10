
<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
request.setCharacterEncoding("UTF-8");
Boolean isAccount = Boolean.parseBoolean(request.getParameter("isAccount"));
Boolean isGuide = Boolean.parseBoolean(request.getParameter("isGuide"));
%>


<div class="sub-menus-wrap">
    <!-- 
    <ul class="sub-menus">
        <li class="active">
            <a href="/user/faq" class="sub-menu">자주하는질문</a>
        </li> 
    </ul>
    -->
</div>

<%
if(isAccount) {
%>
<div class="sub-box sub-account-box">
    <div class="sub-box-tit sub-account-box-tit">계좌안내</div>
    <div class="sub-accounts-wrap">
        <ul class="sub-accounts">
        <!-- 
            <li>
                <div class="sub-account">
                    <div class="sub-account-info">
                        <p class="sub-account-bank"><b></b></p>
                        <span>-</span>
                        <p class="sub-account-holder"></p>
                    </div>
                    <div class="sub-account-num">
                        <p></p>
                    </div>
                </div>
            </li>
            -->
        </ul>
    </div>
</div>
<%
}
%>


<%
if(isGuide) {
%>
<div class="sub-box sub-guide-box">
    <div class="sub-box-tit sub-account-box-tit">쇼핑 가이드</div>
    <ul class="sub-guide-list">
        <li class="sub-guide-li">
            <a href="/user/mypages/activity/question" class="sub-guide">1:1 문의게시판</a>
        </li>
        <li class="sub-guide-li">
            <a href="/user/mypages/activity/qna" class="sub-guide">제품 문의게시판</a>
        </li>
        <li class="sub-guide-li">
            <a href="/user/faq" class="sub-guide">자주하는 질문</a>
        </li>
        <li class="sub-guide-li">
            <a href="/user/mypages/order/history" class="sub-guide">주문/배송 조회</a>
        </li>
        <li class="sub-guide-li">
            <a href="/user/mypages/activity/review" class="sub-guide">제품 후기보기</a>
        </li>
        <li class="sub-guide-li">
            <a href="/user/mypages/activity/wish" class="sub-guide">나의 쇼핑정보</a>
        </li>
    </ul>
</div>
<%
}
%>
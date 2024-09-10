<%@page import="com.brighten.idi.order.dto.OrderDto"%>
<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ page import="com.brighten.idi.util.SessionUtil" %>
<%
	request.setCharacterEncoding("UTF-8");
	String pagetype = "typeSub";
	String pagename = "basket";
	String pagetxt = "주문완료";
	String navId = "000303";

	// ex
    // Boolean isLogin = true; 
//     Boolean isLogin = false; 
	Boolean isLogin = SessionUtil.isLogin(); 
    String userName = "이디";
	// //ex

    //  완료 ex
    // String payMethod = "카드";
    String payMethod = ((OrderDto)request.getAttribute("order")).getSettleKind();
    String accountBank = "농협";
    String accountHolder = "김광수";
    String accountNum = "1076-12-090295";
    String accountClosed = "2024.10.09 23:59";
    // //완료 ex
    

%>

<jsp:include page="../../include/common.jsp" flush="false" >
    <jsp:param name="pagetype" value="<%=pagetype%>" />
	<jsp:param name="pagename" value="<%=pagename%>" />
	<jsp:param name="pagetxt" value="<%=pagetxt%>" />	
	<jsp:param name="navId" value="<%=navId%>" />
	<jsp:param name="cssLinks" value="vendors/line-awesome/line-awesome-font-awesome.min" />	
	<jsp:param name="cssLinks" value="vendors/line-awesome/line-awesome.min" />	
</jsp:include>


<%-- ex, css file 연결할 시 아래와 같이 적은 후 common.jsp include에 삽입 --%>
<%-- 
<jsp:param name="cssLinks" value="vendors/font-awesome/font-awesome.min" />	
--%>

<div class="wrap wrap-<%=pagetype%>">	
	<jsp:include page="../../include/header.jsp" flush="false" >
		<jsp:param name="navId" value="<%=navId%>" />	
		<jsp:param name="pagename" value="<%=pagename%>" />	
		<jsp:param name="isLogin" value="<%=isLogin%>" />
		<jsp:param name="userName" value="<%=userName%>" />
	</jsp:include>
	<jsp:include page="../../include/modal.jsp" flush="false" >		
		<jsp:param name="isLogin" value="<%=isLogin%>" />
		<jsp:param name="userName" value="<%=userName%>" />
	</jsp:include>

	<section class="basket-sect sect-subbanner">
		<img src="" alt="">
	</section>

    

    <section class="basket-sect sect-step">
        <div class="layout">
            <div class="basket-top">
                <h1><%=pagetxt%></h1>
                <div class="basket-top-list-wrap">
                    <ul class="basket-top-list clearfix">
                        <%
                            String isBasket = pagetxt.equals("장바구니") ? "active" : "";
                        %>
                        <li class="<%=isBasket%>">
                            <img src="/images/user/basket/cart1.png">
                            <img src="/images/user/basket/cart1_h.png">
                            <div class="basket-txt">
                                <h2>Step <span class="num">01</span></h2>
                                <h3>장바구니</h3>
                            </div>
                        </li>
                        <%
                            String isOrder = pagetxt.equals("주문서작성") ? "active" : "";
                        %>
                        <li class="<%=isOrder%>">
                            <img src="/images/user/basket/cart2.png">
                            <img src="/images/user/basket/cart2_h.png">
                            <div class="basket-txt">
                                <h2>Step <span class="num">02</span></h2>
                                <h3>배송정보</h3>
                            </div>
                        </li>

                        <%
                            String isComplete = pagetxt.equals("주문완료") ? "active" : "";
                        %>
                        <li class="<%=isComplete%>">
                            <img src="/images/user/basket/cart3.png">
                            <img src="/images/user/basket/cart3_h.png">
                            <div class="basket-txt">
                                <h2>Step <span class="num">03</span></h2>
                                <h3>주문완료</h3>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>


    <section class="basket-sect sect-complete">
        <div class="layout">
            <div class="basket-complete">
                <img src="/images/user/basket/complete2.png" alt="주문완료">
                <h3>
                    <p>주문이 정상적으로 </p>
                    <p><span class="point">완료</span>되었습니다<i>!</i></p>
                </h3>
                <h4>빠른 시일내에 받아보실 수 있도록 최선을 다하겠습니다.<br> 아래의 주문정보를 다시 한번 확인해주세요.</h4>
            </div>
        </div>
    </section>
    <section class="basket-sect sect-receipt">
        <div class="layout">
            <div class="basket-receipt-list-wrap">
                <ul class="basket-receipt-list">
                    <li class="basket-receipt-li order-num">
                        <div class="basket-receipt-tit">
                            <span><b>주문번호</b></span>
                            <% if(!isLogin){ %>
                            <div class="popovers-wrap">
                                <button type="button" class="btn btn-popovers basket-receipt-btn-popovers">
                                    <div class="icon"></div>
                                    <div class="txt"></div>
                                </button>
                                <div class="popovers">
                                    <div class="popovers-box">
                                        <button type="button" class="btn btn-close popovers-close"></button>
                                        <div class="popovers-main">
                                            <span><span class="c-red">비회원 구매</span>를 하신 고객님께서는 반드시 <span class="c-red">주문번호를 메모</span>해주셔야 <span class="c-red">배송조회</span>를 하실 수 있습니다.</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                        <div class="basket-receipt-info">
                            <span class="copy-target">1234567890</span>
                            <button type="button" class="btn btn-copy">
                                <i class="la la-clone"></i>
                            </button>
                        </div>
                    </li>
                    <% if(payMethod == "무통장"){ %>
                    <li class="basket-receipt-li">
                        <div class="basket-receipt-tit">
                            <!-- <img src="/images/user/mypage/idi_layer.png"> -->
                            <span><b>입금계좌정보</b></span>
                        </div>
                        <div class="basket-receipt-info">
                            <span class="copy-target"><b><%=accountBank%></b> <%=accountNum%> (<%=accountHolder%>)</span>
                            <button type="button" class="btn btn-copy">
                                <i class="la la-clone"></i>
                            </button>
                        </div>
                    </li>
                    <li class="basket-receipt-li">
                        <div class="basket-receipt-tit">
                            <span><b>기간</b></span>
                        </div>
                        <div class="basket-receipt-info">
                            <span>~ <%=accountClosed%></span>
                        </div>
                    </li>
                    <li>
                        <div class="basket-receipt-info">
                            <span>(해당 날짜까지 입금이 되지않으면 자동 취소됩니다)</span>
                        </div>
                    </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </section>
    
    <section class="basket-sect sect-bottom">
        <div class="layout">
            <div class="basket-bottom">
                <button type="button" class="btn btn-rounding-black" onclick="window.location.href='/user/backet/list'">
                    <div class="txt">장바구니</div>
                </button>
            </div>
        </div>
    </section>



    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>

<script src="/js/user/pages/basket/basket_complete.js"></script>


</body>
</html>
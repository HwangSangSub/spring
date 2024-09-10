<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ page import="com.brighten.idi.util.SessionUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	request.setCharacterEncoding("UTF-8");
	String pagetype = "typeSub";
	String pagename = "basket";
	String pagetxt = "주문서작성";
	String navId = "000302";

	// ex
    // Boolean isLogin = false; 
    Boolean isLogin = SessionUtil.isLogin(); 
    String userName = "이디";
    int hasFund = 912333;
    // Boolean isRegular = false; // 일반배송
    Boolean isRegular = true; // 정기배송일 시
    Boolean isModify = true; // 정기배송 > 정보수정일 시
	// //ex


    
    // 구입품목 ex
    class Product {
        String imgFileName;
        String name;
        String option;
        String prodId;
        String url;
        int sum;
        int price;

        public Product() {}
    }
    Product[] prods = new Product[3];
    for(int i=0; i < prods.length; i++) {
        prods[i] = new Product();
    }

    prods[0].imgFileName = "00f9447291374571b64a622503ed3cfc.png";
    prods[0].name = "디퓨져 선물세트";
    prods[0].option = "[치프리아 + 디퓨져(카사블랑카)]";
    prods[0].sum = 2;
    prods[0].price = 36000;
    prods[0].prodId = "000900010";
    prods[0].url = "/user/product/detail?no=000900010";
    
    prods[1].imgFileName = "00f9447291374571b64a622503ed3cfc.png";
    prods[1].name = "디퓨져 선물세트";
    prods[1].option = "[치프리아 + 디퓨져(리프 그린)]";
    prods[1].sum = 1;
    prods[1].price = 36000;
    prods[1].prodId = "000900011";
    prods[1].url = "/user/product/detail?no=000900011";
    
    prods[2].imgFileName = "5b0707a1607e49b5ab39c7ca50809a52.png";
    prods[2].name = "1>IDI SOAGEN LATTE - 클렌징 밀크";
    prods[2].option = "";
    prods[2].sum = 1;
    prods[2].price = 32500;
    prods[2].prodId = "000900012";
    prods[2].url = "/user/product/detail?no=000900012";

    int priceProduct = 0;
    int priceDelivery = priceProduct < 30000 ? 3000 : 0;
    int priceTotal = priceProduct + priceDelivery;
    // //구입품목 ex


    // 배송지 ex
    class Address {
        String nickname;
        String name;
        String tel;
        String phone;
        String post;
        String address;

        Address() {}
        Address(String nickname, String name, String tel, String phone, String post, String address) {
            this.nickname = nickname;
            this.name = name;
            this.tel = tel;
            this.phone = phone;
            this.post = post;
            this.address = address;
        }
    }
    Address[] adds = new Address[3];

    adds[0] = new Address("기본 주소", "이디코리아", "0312074983", "0312074983", "16200", "경기 수원시 장안구 이목동 23-5");
    adds[1] = new Address("1111", "이디", "0312074983", "0312074983", "16200", "경기 수원시 장안구 이목동 23-5");
    adds[2] = new Address("2222", "코리아", "0312074983", "0312074983", "16200", "경기 수원시 장안구 이목동 23-5");



    // //배송지 ex
%>

<jsp:include page="../../include/common.jsp" flush="false" >
    <jsp:param name="pagetype" value="<%=pagetype%>" />
	<jsp:param name="pagename" value="<%=pagename%>" />
	<jsp:param name="pagetxt" value="<%=pagetxt%>" />	
	<jsp:param name="navId" value="<%=navId%>" />
    <jsp:param name="cssLinks" value="vendors/font-awesome/font-awesome.min" />	
    <jsp:param name="cssLinks" value="user/compile/pages/basketOrder/style" />	
</jsp:include>
<!-- <script src="https://js.tosspayments.com/v2/standard"></script> -->
<%-- ex, css file 연결할 시 아래와 같이 적은 후 common.jsp include에 삽입 --%>
<%-- 
<jsp:param name="cssLinks" value="vendors/font-awesome/font-awesome.min" />	
--%>

${goodsList }
//////////////<br/>
${memberInfo }
//////////// <br/>
${isLogin }
//////////// <br/>

${memberInfo.dc }
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
    <div class="modal-wrap modal-address-wrap">
        <div class="modal modal-address">
            <div class="modal-top">
                <button type="button" class="btn btn-close">
                    <img src="/images/user/common/top_close_white.png" alt="닫기">
                </button>
            </div>
            <div class="modal-main">
                <div class="modal-address-bd-wrap">
                    <ul class="bdNormal-wrap bdModalAdd-wrap">
                        <li class="bdNormal-li bdNormal-head bdModalAdd-head">
                            <ul class="bdNormal-headlist bdNormal-rowlist bdModalAdd-headlist">
                                <li class="bdNormal-headli bdModalAdd-headli bdModalAdd-rowli col-nickname">
                                    <span>상호</span>
                                </li>
                                <li class="bdNormal-headli bdModalAdd-headli bdModalAdd-rowli col-name">
                                    <span>받으실분</span>
                                </li>
                                <li class="bdNormal-headli bdModalAdd-headli bdModalAdd-rowli col-tel">
                                    <span>전화번호</span>
                                </li>
                                <li class="bdNormal-headli bdModalAdd-headli bdModalAdd-rowli col-phone">
                                    <span>핸드폰번호</span>
                                </li>
                                <li class="bdNormal-headli bdModalAdd-headli bdModalAdd-rowli col-post">
                                    <span>우편번호</span>
                                </li>
                                <li class="bdNormal-headli bdModalAdd-headli bdModalAdd-rowli col-address">
                                    <span>주소</span>
                                </li>
                            </ul>
                        </li>
                        <% for(Address add : adds) { %>
                        <li class="bdNormal-li bdModalAdd-li btn">
                            <ul class="bdNormal-rowlist bdModalAdd-rowlist">
                                <li class="bdNormal-rowli bdModalAdd-rowli col-nickname">
                                    <span class="txt"><%=add.nickname%></span>
                                </li>
                                <li class="bdNormal-rowli bdModalAdd-rowli col-name">
                                    <span class="txt"><%=add.name%></span>
                                </li>
                                <li class="bdNormal-rowli bdModalAdd-rowli col-tel">
                                    <span class="txt"><%=add.tel%></span>
                                </li>
                                <li class="bdNormal-rowli bdModalAdd-rowli col-phone">
                                    <span class="txt"><%=add.phone%></span>
                                </li>
                                <li class="bdNormal-rowli bdModalAdd-rowli col-post">
                                    <span class="txt"><%=add.post%></span>
                                </li>
                                <li class="bdNormal-rowli bdModalAdd-rowli col-address">
                                    <span class="txt"><%=add.address%></span>
                                </li>
                            </ul>
                        </li>
                        <% } %>
                    </ul>
                </div>
    
            </div>
            <div class="modal-bottom">
    
            </div>
        </div>
    </div>


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

    <section class="basket-sect sect-board">
        <div class="layout">
            <div class="bdNormal-wrap basket-board">
                <div class="bdNormal">

                    <ul class="bdNormal-list">
                        <%-- board head --%>
                        <li class="bdNormal-li bdNormal-head">
                            <ul class="bdNormal-headlist bdOrder-headlist bdOrder-rowlist">
                                <li class="bdNormal-headli bdOrder-headli bdOrder-rowli col-img">
                                    <span class="txt">이미지</span>
                                </li>
                                <li class="bdNormal-headli bdOrder-headli bdOrder-rowli col-name">
                                    <span class="txt">상품명</span>
                                </li>
                                <li class="bdNormal-headli bdOrder-headli bdOrder-rowli col-sum">
                                    <span class="txt">수량</span>
                                </li>
                                <li class="bdNormal-headli bdOrder-headli bdOrder-rowli col-price">
                                    <span class="txt">가격</span>
                                </li>
                                <li class="bdNormal-headli bdOrder-headli bdOrder-rowli col-else">
                                    <span class="txt">등급할인</span>
                                </li>
                                <li class="bdNormal-headli bdOrder-headli bdOrder-rowli col-order-price">
                                    <span class="txt">주문가격</span>
                                </li>
                                
                                <c:if test="${fn:contains(currentUrl, 'regular')}">
                                    <% if(isModify == true) { %>
                                    <li class="bdNormal-headli bdOrder-headli bdOrder-rowli col-else">
                                        <span class="txt">삭제</span>
                                    </li>
                                    <% } %>
                                </c:if>
                            </ul>
                        </li>
                        <c:set var="totalPrice" value="0" />
                        <c:set var="totalMemberDc" value="0" />
                        <c:set var="totalOriginPrice" value="0" />
                        <c:forEach var="item" items="${goodsList }" varStatus="status"> 
                        ${item }
	                        <li class="bdNormal-li bdOrder-li btn goodsList" onclick="location.href='/user/product/${item.goodsNo}';">
	                            <ul class="bdOrder-rowlist">
	                                <li class="bdOrder-rowli col-img">
		                            	<input type="hidden" name="sno" value="${item.sno }">
	                                    <img src="/api/v1/file/${item.iconImage }" alt="">
	                                </li>
	                                <li class="bdOrder-rowli col-name">
	                                	<input type="hidden" name="goodsName" value="${item.goodsName }">
	                                    <span class="txt">${item.goodsName} ${item.opt1 } ${item.opt2 }</span>
	                                    <div class="laptop">
	                                        <div class="sum">
	                                            <span class="unit">수량 : </span>
	                                            <span class="txt">${item.ea }</span>
	                                        </div>
	                                    </div>
	                                    <div class="pad">
	                                        <div class="price">
	                                            <span class="unit">가격 : </span>
	                                           <%--  <span class="txt"><%=Integer.toString(p.price).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%>원</span> --%>
                                               <%--  <span class="txt"><fmt:formatNumber value="${item.price * item.ea }" type="number" pattern="#,##0.##" />원</span> --%>
	                                            <span class="txt"><fmt:formatNumber value="${item.price }" type="number" pattern="#,##0" />원</span>
	                                            <c:set var="totalOriginPrice" value="${totalOriginPrice + (item.price * item.ea ) }" />
	                                        </div>
	                                    </div>
                                        <div class="laptop">
                                            <div class="else">
                                                <span class="unit">등급할인 : </span>
                                                <%--  <span class="txt"><fmt:formatNumber value="${ item.price*(memberInfo.dc/100 ) * item.ea  }" type="number" pattern="#,##0.##" />원</span> --%>
                                                <%--  <c:set var="totalMemberDc" value="${totalMemberDc + (item.price*(memberInfo.dc/100 ) * item.ea ) }" /> --%>
                                                <c:set var="pages" value="${item.price * item.ea * (memberInfo.dc/100 )}" />
                                                <span class="txt"><fmt:formatNumber value="${pages + ((pages % 1 < 0.5 && 0 < pages % 1) ? (1 - (pages % 1)) : -(pages % 1))}" type="number" pattern="#,##0" />원</span>
                                                <c:set var="totalMemberDc" value="${totalMemberDc + ( pages + ( (pages % 1 < 0.5 && 0 < pages % 1) ? (1 - (pages % 1)) : -(pages % 1)) ) }" />
                                            </div>
                                        </div>
	                                    <div class="pad">
	                                        <div class="order-price">
	                                            <span class="unit">주문가격 : </span>
	                                            <span class="txt"><fmt:formatNumber value="${ (item.price * item.ea - (item.price* item.ea * (memberInfo.dc/100 ))) + (( (item.price * item.ea - (item.price* item.ea * (memberInfo.dc/100 ))) % 1 < 0.5 &&   0 < (item.price * item.ea - (item.price* item.ea * (memberInfo.dc/100 ))) % 1 ) ? (1 - ( (item.price * item.ea - (item.price* item.ea * (memberInfo.dc/100 ))) % 1)) : -( (item.price * item.ea - (item.price* item.ea * (memberInfo.dc/100 ))) % 1))} " type="number" pattern="#,##0" />원</span>
                                                <c:set var="totalPrice" value="${ totalOriginPrice - totalMemberDc }" />
	                                        </div>
	                                    </div>
                                        <c:if test="${fn:contains(currentUrl, 'regular')}">
                                            <% if(isModify == true) { %>
                                                <div class="laptop">
                                                    <div class="else">
                                                        <button type="button" class="btn btn-square-white btn-remove">삭제</button>
                                                    </div>
                                                </div>
                                            <% } %>
                                        </c:if>
	                                </li>
	                                <li class="bdOrder-rowli col-sum">
	                                    <span class="txt">${item.ea }</span>
	                                </li>
	                                <li class="bdOrder-rowli col-price">
	                                   <%--  <span class="txt"><%=Integer.toString(p.price).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%>원</span> --%>
	                                    <span class="txt"><fmt:formatNumber value="${ item.price }" type="number" pattern="#,##0.##" />원</span>
	                                </li>
	                                <li class="bdOrder-rowli col-else">
	                                   <%--  <span class="txt"><%=Integer.toString(p.price).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%>원</span> --%>
                                       <%--  <span class="txt"> <fmt:formatNumber value="${ item.price*(memberInfo.dc/100 ) * item.ea  }" type="number" pattern="#,##0.##" />원</span> --%>
										<%--  <c:set var="totalMemberDc" value="${totalMemberDc + (item.price*(memberInfo.dc/100 ) * item.ea ) }" /> --%>
	                                    <span class="txt"> <fmt:formatNumber value="${pages + ((pages % 1 < 0.5 && 0 < pages % 1) ? (1 - (pages % 1)) : -(pages % 1))}" type="number" pattern="#,##0" />원</span>
	                                </li>                               
	                                <li class="bdOrder-rowli col-order-price">
<%-- 	                                    <%-- <strong class="txt c-red"><%=Integer.toString(p.price * p.sum).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%>원</strong> --%>
<%-- 	                                    <%--  <% priceProduct += p.price * p.sum; %> --%>
	                                    <%--  <strong class="txt c-red"><fmt:formatNumber value="${item.price * item.ea - item.price*(memberInfo.dc/100 ) * item.ea }" type="number" pattern="#,##0.##" />원</strong> --%>
										<%--  <c:set var="totalPrice" value="${totalPrice + (item.price * item.ea - item.price*(memberInfo.dc/100 ) * item.ea ) }" /> --%>
	                                    <strong class="txt c-red"><fmt:formatNumber value="${ (item.price * item.ea - (item.price* item.ea * (memberInfo.dc/100 ))) + (( (item.price * item.ea - (item.price* item.ea * (memberInfo.dc/100 ))) % 1 < 0.5 &&   0 < (item.price * item.ea - (item.price* item.ea * (memberInfo.dc/100 ))) % 1 ) ? (1 - ( (item.price * item.ea - (item.price* item.ea * (memberInfo.dc/100 ))) % 1)) : -( (item.price * item.ea - (item.price* item.ea * (memberInfo.dc/100 ))) % 1))} " type="number" pattern="#,##0.##" />원</strong>
	                                </li>
                                    
                                    <c:if test="${fn:contains(currentUrl, 'regular')}">
                                        <% if(isModify == true) { %>
                                            <li class="bdOrder-rowli col-else">
                                                <button type="button" class="btn btn-square-white btn-remove">삭제</button>
                                            </li>
                                        <% } %>
                                    </c:if>
	                            </ul>
	                        </li>
                        </c:forEach>
                        <li class="bdNormal-li bdOrder-li bdOrder-li-alert">
                            <div class="basket-alert">
                         	   <p></p>
<!--                                 <p>※ 장바구니에서 표시되는 가격은 <span class="c-red">정상가격</span>입니다. 할인적용은 <span class="c-red">주문 및 결제시 일괄 적용</span>되어 나타납니다.</p> -->
                                <p>합계금액 <strong class="c-red"><fmt:formatNumber value="${totalPrice }" type="number" pattern="#,##0.##" /></strong> 원</p>
                            </div>
                        </li>
                       <%--  <li class="bdNormal-li bdOrder-li bdOrder-li-calc">
                            <div class="basket-calc">
                                <div class="basket-calc-price basket-product-sum">
                                    <span class="txt">상품합계</span>
                                    <span class="num"><%=Integer.toString(priceProduct).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%> 원</span>
                                </div>
                                <div class="basket-calc-symbol plus"></div>
                                <div class="basket-calc-price basket-product-delivery">
                                    <span class="txt">배송비</span>
                                    <% priceDelivery = priceProduct < 30000 ? 3000 : 0; %>
                                    <span class="num"><%=Integer.toString(priceDelivery).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%> 원</span>
                                </div>
                                <div class="basket-calc-symbol equal"></div>
                                <div class="basket-calc-price basket-total">
                                    <span class="txt">총금액</span>
                                    <% priceTotal = priceProduct + priceDelivery; %>
                                    <span class="num c-red"><%=Integer.toString(priceTotal).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%> 원</span>
                                </div>
                            </div>
                        </li> --%>
                    </ul>

                </div>
            </div>
        </div>
    </section>


    <form>

        <section class="basket-sect sect-consent">
            <div class="layout">
            <c:set var="currentUrl" value="${pageContext.request.requestURL}" />
			<c:if test="${fn:contains(currentUrl, 'regular')}">
                <% if(isModify == false) { %>
                <div class="basket-consent-wrap regular active">
                    <h4><span class="tit">정기구매 약관 동의</span></h4>
                    <div class="basket-consent">
                        <div class="basket-consent-box basket-consent-tit">
                            <h5>정기구매 이용 약관</span></h5>
                        </div>
                        <div class="basket-consent-box basket-consent-cont">
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>이용약관 요약</p>
                                </div>
                                <ol class="ordered-num-list circle">
                                    <li class="ordered-num-li">
                                        정기구매는 3회차 부터 이디코리아 제품 회원가의 10% 할인이 적용됩니다.  
                                    </li>
                                    <li class="ordered-num-li">
                                        정기구매 신청 후 첫 주문은 결제 후 당일 혹은 익일 발송되며, 익월부터는 매월 희망하는 날짜에 결제 후 당일 혹은 익일 발송됩니다. 단, 공휴일 또는 배송량이 많은 경우 평소보다 1-2일 정도 배송이 지연될 수 있습니다. 
                                    </li>
                                    <li class="ordered-num-li">
                                        제품의 결제는 신용카드 통해 가능하며, 결제일자는 이용자 본인이 선택할 수 있습니다. 결제는 선택한 날짜에 자동으로 이루어지며 결제 일자의 변경을 원하는 경우 결제 전일 자정까지 결제 일자를 변경해야 합니다.       
                                    </li>
                                </ol>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제1조(목적)</p>
                                </div>
                                <div class="cont">
                                    본 약관은 이디코리아의 온라인 사이트(이하 “이디코리아몰”라 함)에서 제공하는 정기구매의 이용조건 및 절차, 이용자와 당 사이트 사이의 권리, 의무 기타 필요한 사항을 규정함을 목적으로 합니다. 
                                </div>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제2조(용어의 정의)   </p>
                                </div>
                                <div class="cont">
                                    본 약관에서 사용하는 용어의 정의는 다음과 같습니다.  
                                </div>
                                <ol class="ordered-num-list basket-consent-cont-list num-point">
                                    <li>
                                        <div>정기구매: 정기구매 이용 기간에 따라 매월 할인된 가격으로 본인이 지정한 결제일에 자동으로 결제되어 편리하게 제품을 받아볼 수 있는 서비스로, 이디코리아 몰을 통하여 이용자 본인이 직접 신청 및 관리할 수 있는 서비스(이하 '정기구매 서비스' 혹은 '정기구매'라 함)</div> 
                                    </li>
                                    <li>
                                        <div>이용자: 본 약관에 따라 이디코리아몰이 제공하는 정기구매 프로그램을 이용하는 이디코리아 회원</div>
                                    </li>
                                    <li>
                                        <div>회원: 이디코리아에 가입된 멤버</div> 
                                    </li>
                                    <li>
                                        <div>해지: 정기구매 프로그램 이용 계약을 종료시키는 행위로 해지 혹은 철회라 함</div>
                                    </li>
                                </ol>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제3조(이용 자격) </p>
                                </div>
                                <ol class="ordered-num-list basket-consent-cont-list circle">
                                    <li>
                                        <div>정기구매는 이디코리아의 회원이면 누구나 신청함으로써 이용이 가능합니다.</div>
                                    </li>
                                    <li>
                                        <div>이디코리아의 방침 및 절차에 따라 비활동으로 인해 회원 자격이 상실되거나 방침 및 절차, 관련 법률 위반 등으로 이디코리아 회원 자격이 상실되는 경우 정기구매 이용이 제한됩니다. 또한, 이용자 본인이 이디코리아 회원에서 탈퇴하는 경우에도 정기구매 이용이 제한됩니다. </div>
                                    </li>
                                </ol>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제4조(약관의 효력과 변경) </p>
                                </div>
                                <ol class="ordered-num-list basket-consent-cont-list circle">
                                    <li> 
                                        <div>정기구매는 이용자가 본 약관 내용에 동의하는 것을 조건으로 이용자에게 정기구매 서비스를 제공하며, 이디코리아몰의 가입 및 이용 약관 등 다른 약관과 본 약관이 상충하는 경우 정기구매 서비스와 관련해서는 본 약관이 우선적으로 적용됩니다. 단, 본 약관에서 정하지 않은 사항은 이디코리아몰의 가입 및 이용 약관에 따릅니다.</div>
                                    </li>
                                    <li>
                                        <div>이디코리아는 본 약관을 변경할 수 있으며, 변경된 약관은 이디코리아몰 내에 공지함으로써 이용자가 직접 확인할 수 있으며, 약관을 변경할 경우에는 적용일자 및 변경사유를 명시하여 이디코리아몰 내에 그 적용일자 30일 전부터 공지합니다. 약관 변경 공지 후 그 적용일까지 이용자가 명시적으로 약관 변경에 대한 거부의사를 표시하지 아니하면, 이용자가 약관에 동의한 것으로 간주합니다. 변경된 약관에 동의하지 아니하는 경우, 이용자는 정기구매 이용을 해지할 수 있으며 해지 시에는 본 약관 제 15조에 따릅니다. </div>
                                    </li>
                                </ol>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제5조(회원정보의 통합관리)      </p>
                                </div>
                                <div class="cont">
                                    정기구매 이용자에 대한 개인정보는 이디코리아의 회원정보와 통합하여 관리됩니다.   
                                </div>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제6조(이용 계약의 성립)   </p>
                                </div>
                                <ol class="ordered-num-list basket-consent-cont-list circle">
                                    <li> 
                                        <div>정기구매 이용계약은 신청자가 이디코리아몰에서 제공하는 정기구매 이용 계약 신청 양식을 작성하고, 본 약관에 대한 동의를 완료한 경우에 성립됩니다.  </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            <div>이디코리아는 다음 각 호에 해당하는 이용계약에 대하여는 신청을 취소할 수 있습니다. </div>
                                            <div class="block">
                                                <p>다른 사람의 명의를 사용하여 신청하였을 때  </p>                                                            
                                                <p>이용 계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때  </p>                                                            
                                                <p>사회의 안녕과 질서 혹은 미풍양속을 저해할 목적으로 신청하였을 때</p>                                                              
                                                <p>이디코리아의 방침 및 절차, 방문판매등에관한법률, 화장품법, 건강기능식품등에 관한 법률 등 이디코리아 규정 및 관련 법률을 위반하는 행위를 하는 경우</p>                                                              
                                                <p>이디코리아몰을 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우</p>                                                              
                                                <p>기타 정기구매에서 정한 이용신청요건이 미비 되었을 때 </p>    
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            <div>정기구매는 다음 각 호에 해당하는 경우 그 사유가 해소될 때까지 이용계약 성립을 유보할 수 있습니다. </div>
                                            <div class="block">
                                                <p>기술상의 장애사유로 인한 이디코리아몰 서비스 중단의 경우(시스템관리자의 고의·과실 없는 디스크장애, 시스템 다운 등)</p>                                                              
                                                <p>전기통신사업법에 의한 기간통신사업자가 전기통신 서비스를 중지하는 경우 </p>                                                             
                                                <p>전시, 사변, 천재지변 또는 이에 준하는 국가 비상사태가 발생하거나 발생할 우려가 있는 경우</p>                                                              
                                                <p>긴급한 시스템 점검, 증설 및 교체설비의 보수 등을 위하여 부득이한 경우 </p>                                                             
                                                <p>서비스 설비의 장애 또는 서비스 이용의 폭주 등 기타 서비스를 제공할 수 없는 사유가 발생한 경우</p>   
                                            </div>
                                        </div>
                                    </li>
                                </ol>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제7조(회원정보 사용에 대한 동의)</p>
                                </div>
                                <ol class="ordered-num-list basket-consent-cont-list circle">
                                    <li> 
                                        <div>정기구매 서비스 제공에 있어 이디코리아이 처리하는 모든 개인정보는 개인정보 보호법 등 관련 법령상의 개인정보보호 규정을 준수하여 이용자의 개인정보 보호 및 권익을 보호합니다.</div>
                                    </li>
                                    <li>
                                        <div class="">
                                            다른 법령에 특별한 규정이 있는 경우를 제외하고 이용자가 정기구매 신청 시 동의하여 제공하는 정보에 한하여 최소한으로 수집합니다. 
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            회원이 본 약관에 따라 이용 신청을 하는 것은 정기구매 이용 시 본 약관에 따라 신청서에 기재된 정보를 수집, 이용하는 것에 동의하는 것으로 간주되며, 정기구매 이용자에 대한 개인정보에 대한 관리는 이디코리아몰의 개인정보처리방침을 준용합니다.
                                        </div>
                                    </li>
                                </ol>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제8조(사용자의 정보 보안)</p>
                                </div>
                                <ol class="ordered-num-list basket-consent-cont-list circle">
                                    <li> 
                                        <div>정기구매는 이디코리아몰 회원의 ID와 비밀번호를 사용하여 이용이 가능하며, 이용자는 이디코리아몰을 통해 개인정보를 관리할 수 있습니다.</div>
                                    </li>
                                    <li>
                                        <div class="">
                                            회원이 정기구매 신청 절차를 완료하는 순간부터 이용자는 입력한 정보의 비밀을 유지할 책임이 있으며, 이디코리아의 명백한 귀책사유가 없는 한 회원의 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다. 
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            ID와 비밀번호에 관한 모든 관리의 책임은 이용자 본인에게 있으며, 이용자의 ID나 비밀번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 이디코리아에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 이용자 본인에게 있습니다. 
                                        </div>
                                    </li>
                                </ol>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제9조(서비스 이용시간) </p>
                                </div>
                                <ol class="ordered-num-list basket-consent-cont-list circle">
                                    <li> 
                                        <div>
                                            정기구매 이용시간은 이디코리아몰의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다. 
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            단, 제1항의 이용시간은 이디코리아몰 정기점검 등의 필요로 인하여 일부 제한될 수 있습니다. 
                                        </div>
                                    </li>
                                </ol>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제10조(서비스의 중지 및 정보의 저장과 사용)</p>
                                </div>
                                <ol class="ordered-num-list basket-consent-cont-list circle">
                                    <li> 
                                        <div>
                                            정상적인 서비스 제공의 어려움 등으로 인하여 정기구매 서비스를 일시적으로 중지하여야 할 경우에는 서비스 중지 1주일 전의 이디코리아몰 고지 후 서비스를 중지할 수 있으며, 이 기간 동안 이용자가 고지내용을 인지하지 못한 데 대하여 이디코리아는 책임을 부담하지 아니합니다. 부득이한 사정이 있을 경우 위 사전 고지기간은 감축되거나 생략될 수 있습니다. 또한 위 서비스 중지에 의하여 정기구매 데이터가 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 대하여도 이디코리아는 책임을 부담하지 아니합니다.
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            이디코리아는 사전 고지 후 정기구매 서비스를 일시적으로 수정, 변경 및 중단할 수 있으며, 이에 대하여 귀하 또는 제3자에게 어떠한 책임도 부담하지 아니합니다. 
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            이디코리아는 이용자가 본 약관의 내용에 위반되는 행동을 한 경우, 이디코리아는 정기구매 서비스 사용을 제한 할 수 있습니다.
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            정기구매 페이지에 장기간 접속을 하지 아니하거나 이용하지 않는 이용자의 경우 이메일 또는 공지사항 등을 통한 안내 후 검토 기간을 거쳐 정기구매 서비스 이용을 중지할 수 있습니다. 
                                        </div>
                                    </li>
                                </ol>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제11조(이용 조건) </p>
                                </div>
                                <ol class="ordered-num-list basket-consent-cont-list circle">
                                    <li> 
                                        <div>
                                            기구매는 3회차 부터 이디코리아 제품 회원가의 10% 할인이 적용됩니다. 
                                        </div>
                                    </li>
                                </ol>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제12조(제품의 결제 등)  </p>
                                </div>
                                <ol class="ordered-num-list basket-consent-cont-list circle">
                                    <li> 
                                        <div>
                                            이디코리아는 이용자가 정기구매 이용 시 이디코리아 제품 회원가에서 장바구니별 이용 기간에 따라 혹은 약정에 따라 일정 할인 혜택을 제공합니다. 단, 정기구매 할인율 및 거래조건은 이디코리아의 정책에 따라 변경될 수 있으며, 정기구매 할인율 및 거래조건 변경 시 이디코리아는 본 약관 제 [4]조에 따라 공지합니다.  
                                        </div>
                                    </li>
                                    <li> 
                                        <div>
                                            이디코리아 제품 회원가는 회사의 가격 정책에 따라 변동될 수 있으며, 정기구매 할인 혜택이 적용된 최종 제품 가격도 변동될 수 있습니다.  
                                        </div>
                                    </li>
                                    <li> 
                                        <div>
                                            정기구매 이용 시 장바구니별 제품의 추가 또는 변경이 가능하며, 추가 또는 변경 시 최종 결제되는 총 금액도 변경될 수 있습니다. 
                                        </div>
                                    </li>
                                    <li> 
                                        <div>
                                            제품의 결제는 신용카드 또는 자동이체를 통해 가능하며, 결제일자는 이용자 본인이 선택할 수 있습니다. 결제는 선택한 날짜에 자동으로 이루어지며 결제 일자의 변경을 원하는 경우 결제 전일 자정까지 결제 일자를 변경해야 합니다.  
                                        </div>
                                    </li>
                                    <li> 
                                        <div>
                                            카드 승인 한도 초과, 사용 정지, 대금 연체, 분실 카드 등 이용자 본인의 사유로 정기구매 제품의 자동 결제일에 결제가 이루어 지지 않거나 해당월 말일까지 재결제가 이루어 지지 않을 경우 이디코리아는 정기구매를 해지할 수 있습니다.
                                        </div>
                                    </li>
                                </ol>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제13조(제품 수령 등)  </p>
                                </div>
                                <ol class="ordered-num-list basket-consent-cont-list circle">
                                    <li> 
                                        <div>
                                            정기구매 신청 후 첫 주문은 결제 후 당일 혹은 익일 발송되며, 익월부터는 매월 희망하는 날짜에 결제 후 당일 혹은 익일 발송됩니다. 단, 공휴일 또는 배송량이 많은 경우 평소보다 1-2일 정도 배송이 지연될 수 있습니다. 
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            제품 변경을 원할 경우, 본인이 지정한 자동 결제일 전날 자정까지 변경해야 당월부터 적용될 수 있습니다. 단, 제품을 변경하지 않은 경우에는 전월과 동일한 제품이 배송됩니다.
                                        </div>
                                    </li>
                                </ol>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제14조(정기구매 제품의 변동)  </p>
                                </div>
                                <div class="cont">
                                    이디코리아의 사정으로 정기구매 제품을 더 이상 정기구매로 가능 제품으로 제공할 수 없는 경우, 이디코리아는 해당 제품을 정기구매 가능 제품에서 제외할 수 있습니다.     
                                </div>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제15조(이용 계약의 해지) </p>
                                </div>
                                <ol class="ordered-num-list basket-consent-cont-list circle">
                                    <li> 
                                        <div>
                                            이용자는 이디코리아에게 별도로 통지함으로써 정기구매를 언제든지 철회할 수 있습니다. 단, 정기구매 최소 유지기간 이전에 철회 또는 해지되는 경우 할인 혜택(기 할인금액 회수)에 대해 추가 결제가 이루어집니다.
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            정기구매 최소 유지기간 이전의 철회 또는 해지의 경우 할인 혜택 반환(기 할인금액 회수)이 완료된 후 이용 계약 해지 절차가 완료됩니다.
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            이용자가 반환하여야 하는 할인 혜택은 이용자의 별도 통지가 없는 한 정기 구매 시 이용자 본인이 사용한 결제수단을 통하여 우선적으로 청구됩니다. 
                                        </div>
                                    </li>
                                </ol>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제16조(이용자의 행동규범 및 서비스 이용제한)</p>
                                </div>
                                <ol class="ordered-num-list basket-consent-cont-list circle">
                                    <li> 
                                        <div>
                                            이용자가 제공하는 정보의 내용이 허위인 것으로 판명되거나, 그러하다고 의심할 만한 합리적인 사유가 발생할 경우 이디코리아는 정기구매 서비스 사용을 일부 또는 전부 중지할 수 있으며, 이로 인해 발생하는 불이익에 대해 책임을 부담하지 아니합니다.
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <div class="">
                                                이용자는 정기구매 이용 시 다음과 같은 행동을 하지 않는데 동의합니다.
                                            </div>
                                            <div class="block">
                                                <p>타인의 아이디(ID)와 비밀번호를 도용하는 행위</p>                                                              
                                                <p>이용자가 브랜드 어필리에이트로서 방침 및 절차를 위반하거나 이용자가 방문판매등에관한 법률, 화장품법, 건강기능식품에 관한 법률 등 관련 법률을 위반하는 행위</p>
                                                <p>이용자가 타인의 신용카드를 도용하는 행위</p>
                                                <p>컴퓨터 소프트웨어, 하드웨어, 전기통신 장비를 파괴, 방해 또는 기능을 제한하기 위한 소프트웨어 바이러스를 게시, 게재 또는 전자우편으로 보내는 행위</p>
                                                <p>정기구매 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위</p>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            이디코리아는 이용자가 본 약관을 위반했다고 판명되는 경우 정기구매 이용 계약을 해지할 수 있습니다.  
                                        </div>
                                    </li>
                                </ol>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제17조 (양도금지) </p>
                                </div>
                                <div class="cont">
                                    이용자는 본 정기구매 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.  
                                </div>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제18조 (서비스 종료)</p>
                                </div>
                                <div class="cont">
                                    이디코리아는 경영상의 이유 등 회사의 사정에 의하여 정기구매 서비스를 종료할 수 있으며, 정기구매 서비스를 종료하고자 하는 경우 종료하고자 하는 날로부터 3개월 이전에 이디코리아몰을 통해 사전 통지합니다.
                                </div>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>제19조(기타) </p>
                                </div>
                                <ol class="ordered-num-list basket-consent-cont-list circle">
                                    <li> 
                                        <div>
                                            본 약관 시행일 이전 정기구매 서비스 이용자의 경우에도 2020년 9월 1일부터 본 약관이 적용됩니다.
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            이디코리아이 본 약관과 상충 또는 보충하는 별도의 사항을 이디코리아몰을 통해 고지한 경우 그 고지된 사항은 본 약관에 우선하는 효력을 가지는 것으로 봅니다.
                                        </div>
                                    </li>
                                </ol>
                            </div>
                            <div class="basket-consent-cont-plate">
                                <div class="tit">
                                    <p>부칙</p>
                                </div>
                                <div class="cont">
                                    본 약관은 2022년 7월 1일부터 시행됩니다.
                                </div>
                            </div>
                        </div>
                        <div class="basket-consent-box basket-consent-check">
                            <ul class="basket-consent-check-list">
                                <li>
                                    <label class="checkbox round">
                                        <input type="radio" name="consent-check-regular" id="">
                                        <span class="icon fa fa-check"></span>
                                        <span class="txt">동의합니다</span>
                                    </label>
                                </li>
                                <li>
                                    <label class="checkbox round">
                                        <input type="radio" name="consent-check-regular" id="" checked>
                                        <span class="icon fa fa-check"></span>
                                        <span class="txt">동의하지 않습니다</span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="basket-consent-wrap card active">
                    <h4><span class="tit">신용카드 사용 동의</span></h4>
                    <div class="basket-consent">
                        <div class="basket-consent-box basket-consent-tit">
                            <h5>신용카드 사용 동의</span></h5>
                        </div>
                        <div class="basket-consent-box basket-consent-cont">
                            <div class="basket-consent-cont-plate">
                                <ol class="ordered-num-list basket-consent-cont-list num-point">
                                    <li> 
                                        <div class="">
                                            <div> 정기구매 이용과 관련하여 이용자는 신용카드 자동 승인을 본인의 의사로 이디코리아에 신청하며, 다음의 정보를 이디코리아(이하 “회사” 또는 “이디코리아"라 함)에 제공하는 것에 동의합니다. </div>
                                            <div class="block">
                                                <ul class="basket-consent-cont-list bar">
                                                    <li>카드번호, 유효기간, 생년월일, 카드비밀번호, 할부개월</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            본 이용자 동의는 이용자가 신용카드 자동 승인을 신규 신청하는 때로부터 해지 신청을 할 때까지 유효합니다.
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            이용자 본인은 회사에서 정기구매 대금을 매월 결제하는 것을 승인하며, 회사는 이용자의 정기구매 제품 대금 결제와 중도해지 시 할인 혜택 반환 결제 외에 다른 용도로 본인이 제공한 신용카드 관련 정보를 사용하지 않을 것을 이해하고 동의합니다.  
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            이용자가 신청하신 신용카드 정기결제는 (주)비바리퍼블리카에서 대행합니다. 
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            카드 소유자인 이용자 본인이 납부하여야 할 요금에 대하여 별도의 통지 없이 본인의 카드 정보를 사용하여 본인이 정한 승인 일에 납부함에 이해하고 동의합니다.
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            신용카드 자동승인 시 승인 한도가 지정 출금일에 회사의 청구금액보다 부족하거나, 신용카드의 사용정지 또는 신용카드 대금의 연체 등으로 대체 청구가 불가능한 경우 발생할 수 있는 불이익 또는 손해는 이용자 본인이 부담합니다. 
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            신용카드 자동 승인 신규신청에 의한 승인 개시일은 (주)비바리퍼블리카가 회사으로부터 사전 통지받은 승인일이며, (주)비바리퍼블리카는 회사가 통지한 승인일에 대해서 책임지지 않습니다. 
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            신용카드 자동승인 신청(신규, 해지)은 해당 승인일 1일 전 자정까지 이디코리아 홈페이지를 통해 가능합니다. 
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            신용카드 자동승인 신청에 의한 지정 카드에서의 승인은 회사의 청구대로 승인하기로 하며 승인금액에 이의가 있는 경우에는 본인과 회사가 협의하여 조정합니다. 
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            (주)비바리퍼블리카는 이용자의 본 신청과 관련한 거래내역에 대한 별도 조회(URL등 이용방법) 수단을 제공합니다.  
                                        </div>
                                    </li>
                                    <li>
                                        <div class="">
                                            기타 본 약관에서 규정하지 않은 사항은 여신전문금융업법, 신용카드이용약관 및 (주)비바리퍼블리카의 일반약관을 따릅니다.  
                                        </div>
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <div class="basket-consent-box basket-consent-check">
                            <ul class="basket-consent-check-list">
                                <li>
                                    <label class="checkbox round">
                                        <input type="radio" name="consent-check-card" id="">
                                        <span class="icon fa fa-check"></span>
                                        <span class="txt">동의합니다</span>
                                    </label>
                                </li>
                                <li>
                                    <label class="checkbox round">
                                        <input type="radio" name="consent-check-card" id="" checked>
                                        <span class="icon fa fa-check"></span>
                                        <span class="txt">동의하지 않습니다</span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <% } %>
			</c:if>
			<c:if test="${!fn:contains(currentUrl, 'regular')}">
                <div class="basket-consent-wrap info active">
                    <h4><span class="tit">개인정보 수집 동의</span></h4>
                    <div class="basket-consent">
                        <div class="basket-consent-box basket-consent-tit">
                            <h5>비회원 글작성에 대한 개인정보 수집에 대한 동의 <span class="add">(자세한 내용은 "개인정보취급방침"을 확인하시기 바랍니다)</span></h5>
                        </div>
                        <div class="basket-consent-box basket-consent-cont">
                            <ol class="ordered-num-list circle">
                                <li class="ordered-num-li">
                                    개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명, 주민등록번호 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함합니다)를 말합니다. 
                                </li>
                                <li class="ordered-num-li">
                                    IDI 코리아은 귀하의 개인정보보호를 매우 중요시하며, 『정보통신망이용촉진및정보보호에관한법률』상의 개인정보보호규정 및 정보통신부가 제정한 『개인정보보호지침』을 준수하고 있습니다. IDI 코리아은 개인정보취급방침을 통하여 귀하께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. 
                                </li>
                                <li class="ordered-num-li">
                                    IDI 코리아은 개인정보취급방침을 홈페이지 첫 화면에 공개함으로써 귀하께서 언제나 용이하게 보실 수 있도록 조치하고 있습니다. 
                                </li>
                            </ol>
                        </div>
                        <div class="basket-consent-box basket-consent-check">
                            <ul class="basket-consent-check-list">
                                <li>
                                    <label class="checkbox round">
                                        <input type="radio" name="consent-check" id="">
                                        <span class="icon fa fa-check"></span>
                                        <span class="txt">동의합니다</span>
                                    </label>
                                </li>
                                <li>
                                    <label class="checkbox round">
                                        <input type="radio" name="consent-check" id="" checked>
                                        <span class="icon fa fa-check"></span>
                                        <span class="txt">동의하지 않습니다</span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
			</c:if>
            </div>
        </section>
    
        <section class="basket-sect sect-orderer">
            <div class="layout">
                <div class="basket-orderer-wrap">
                    <h4>
                        <span class="tit">주문자정보</span>
                    </h4>
    
                    <div class="bdNormal-wrap">
                        <div class="bdNormal">
        
                            <ul class="bdNormal-list">
        
                                <li class="bdNormal-li bdNormalL-li required basket-orderer-name">
                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                            <span class="txt">주문자</span>
                                        </li>
                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                            <div class="basket-orderer-input-box">
                                                <label for="" class="input-box">
                                                    <input type="text" name="" id="" value="${memberInfo.memberName }" required>
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="bdNormal-li bdNormalL-li required basket-orderer-address">
                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                            <span class="txt">주소</span>
                                        </li>
                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                            <div class="basket-orderer-input-box">
                                                <label for="" class="input-box postal-num">
                                                    <input type="text" name="" id="" placeholder="우편번호" value="${memberInfo.zipcode}" required readonly>
                                                </label>
                                                <button type="button" class="btn btn-square-black btn-search-postal">
                                                    <span class="txt">우편번호검색</span>
                                                </button>
                                                <label for="" class="input-box address">
                                                    <input type="text" name="" id="" value="${memberInfo.roadAddress ==''? memberInfo.address : memberInfo.roadAddress }" placeholder="주소" required>
                                                </label>
                                                <label for="" class="input-box address-detail">
                                                    <input type="text" name="" id="" value="${memberInfo.subAddress }" placeholder="상세주소">
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="bdNormal-li bdNormalL-li basket-orderer-tel">
                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                            <span class="txt">전화번호</span>
                                        </li>
                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                            <div class="basket-orderer-input-box">
                                                <label for="" class="input-box">
                                                    <input type="tel" value="${memberInfo.phone }" name="" id="">
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="bdNormal-li bdNormalL-li required basket-orderer-phone">
                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                            <span class="txt">핸드폰번호</span>
                                        </li>
                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                            <div class="basket-orderer-input-box">
                                                <label for="" class="input-box">
                                                    <input type="tel" value="${memberInfo.mobile }" name="" id="" required>
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="bdNormal-li bdNormalL-li basket-orderer-email">
                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                            <span class="txt">이메일</span>
                                        </li>
                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                            <div class="basket-orderer-input-box">
                                                <label for="" class="input-box">
                                                    <input type="text" name="" value="${memberInfo.email }" id="">
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
    
                            </ul>
        
                        </div>
                    </div>
    
    
                </div>
            </div>
        </section>
    
        <section class="basket-sect sect-shipping">
            <div class="layout">
                <div class="basket-shipping-wrap">
                    <h4>
                        <span class="tit">배송정보</span>
                        <label class="checkbox round">
                            <input type="checkbox" name="" id="">
                            <span class="icon fa fa-check"></span>
                            <span class="txt">주문자와 동일</span>
                        </label>
                    </h4>
    
                    <div class="bdNormal-wrap">
                        <div class="bdNormal">
        
                            <ul class="bdNormal-list">
        
                                <li class="bdNormal-li bdNormalL-li required basket-orderer-name">
                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                            <span class="txt">받으실분</span>
                                        </li>
                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                            <div class="basket-orderer-input-box">
                                                <label for="" class="input-box">
                                                    <input type="text" name="receiverName" id="receiverName" required>
                                                </label>
                                                <% if(isLogin) { %>
                                                <button type="button" class="btn btn-square-black btn-open-address">
                                                    <div class="txt">배송지 목록</div>
                                                </button>
                                                <% } %>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="bdNormal-li bdNormalL-li required basket-orderer-address">
                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                            <span class="txt">받으실곳</span>
                                        </li>
                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                            <div class="basket-orderer-input-box">
                                                <label for="" class="input-box postal-num">
                                                    <input type="text" name="zipcode" id="zipcode" placeholder="우편번호" required readonly>
                                                </label>
                                                <button type="button" class="btn btn-square-black btn-search-postal">
                                                    <span class="txt">우편번호검색</span>
                                                </button>
                                                <label for="" class="input-box address">
                                                    <input type="text" name="roadAddress" id="roadAddress" placeholder="주소" required>
                                                </label>
                                                <label for="" class="input-box address-detail">
                                                    <input type="text" name="subAddress" id="subAddress" placeholder="상세주소">
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="bdNormal-li bdNormalL-li basket-orderer-tel">
                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                            <span class="txt">전화번호</span>
                                        </li>
                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                            <div class="basket-orderer-input-box">
                                                <label for="" class="input-box">
                                                    <input type="tel" name="phone" id="phone">
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="bdNormal-li bdNormalL-li required basket-orderer-phone">
                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                            <span class="txt">핸드폰번호</span>
                                        </li>
                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                            <div class="basket-orderer-input-box">
                                                <label for="" class="input-box">
                                                    <input type="tel" name="mobile" id="mobile" required>
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="bdNormal-li bdNormalL-li required basket-orderer-memo">
                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                            <span class="txt">메모</span>
                                        </li>
                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                            <div class="basket-orderer-input-box">
                                                <label for="" class="input-box">
                                                    <!-- <input type="text" name="" id=""> -->
                                                    <textarea name="memo" id="memo" class="input-box"></textarea>
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
    
                            </ul>
        
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%
                                    
        // pay ex
        class Pay {
            String cate;
            private String bgColor, color;
            Icon icon;
            Account account;
            Card card;
            Pay() {}
            Pay(String bgColor, String color, String name, String url, String bank, String accountNumber) {
                this.bgColor = bgColor;
                this.color = color;
                Icon icon = new Icon(name, url);
                this.icon = icon;
                if(bank == null || accountNumber == null || bank.trim().isEmpty() || accountNumber.trim().isEmpty()) {
                    Card card = new Card(2, 3, 6);
                    this.card = card;
                    this.cate = "카드";
                } 
                else {
                    Account account = new Account(bank, accountNumber);
                    this.account = account;
                    this.cate = "계좌";
                }
            }
    
            class Icon {
                Square square;
                Icon() {}
                Icon(String name, String url) {
                    Square square = new Square(name, url);
                    this.square = square;
                }
    
                class Square {
                    String name;
                    String url;
                    
                    Square() {}
                    Square(String name, String url) {
                        this.name = name;
                        this.url = url;
                    }
                }
            }
            class Account {
                String bank, accountNumber;
                Account() {}
                Account(String bank, String accountNumber) {
                    this.bank = bank;
                    this.accountNumber = accountNumber;
                }
            }
            class Card {
                NoInterest noInterest;
                Card() {}
                Card(int... month) {
                    NoInterest noInterest = new NoInterest(month);
                    this.noInterest = noInterest;
                }
    
                class NoInterest {
                    Boolean[] isNoInterest = new Boolean[12];
                    NoInterest() {}
                    NoInterest(int... month) {
                        for( int i = 0; i < 12; i++ ) {
                            isNoInterest[i] = false;
                        }
                        for(int m : month) {
                            isNoInterest[m - 1] = true;
                        }
                    }
                }
            }
    
            
            
        }
        Pay[] pays = new Pay[3];
        pays[0] = new Pay("#53555A", "#FFFFFF", "icn-bank-square-lottecard", "https://static.toss.im/icons/png/4x/icn-bank-square-lottecard.png", null, null);
        pays[1] = new Pay("#F2F4F6", "#333D4B", "icn-bank-square-toss-blue200", "https://static.toss.im/icons/png/4x/icn-bank-square-toss-blue200.png", "", "");
        pays[2] = new Pay("#F2F4F6", "#333D4B", "icn-bank-square-toss-blue200", "https://static.toss.im/icons/png/4x/icn-bank-square-toss-blue200.png", "토스", "100*****4904");
    
        
    
        // //pay ex
        
        %>
    
        <section class="basket-sect sect-payment">
            <div class="layout">
                <div class="basket-payment-container">
                    <div class="basket-payment-wrap">
                        <h4><span class="tit">결제수단</span></h4>
    
                        <div class="bdNormal-wrap">
                            <div class="bdNormal">
            
                                <ul class="bdNormal-list">
            

                                    <c:if test="${fn:contains(currentUrl, 'regular')}">
                                    <li class="bdNormal-li bdNormalL-li basket-payment-date required">
                                        <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                            <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                <span class="txt">자동결제일</span>
                                            </li>
                                            <li class="bdNormal-rowli bdNormalL-rowli">
                                                <div class="basket-orderer-inputs">
                                                    <span>매 월</span>
                                                    <label class="input-box">
                                                        <select name="" id="" class="basket-payment-date-select">
                                                            <option value="0" disabled selected>---</option>
                                                            <% for(int i = 1; i <= 25; i++) { %>
                                                            <option value="<%=i%>"><%=i%></option>
                                                            <% } %>
                                                        </select>
                                                    </label>
                                                    <span>일 (원하시는 날짜를 선택해 주세요)</span>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
									</c:if>
                                    <li class="bdNormal-li bdNormalL-li basket-payment-method required">
                                        <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                            <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                <span class="txt">결제방식</span>
                                            </li>
                                            <li class="bdNormal-rowli bdNormalL-rowli">
                                                <div class="basket-orderer-inputs">
                                                	<c:if test="${!fn:contains(currentUrl, 'regular')}">
	                                                    <label class="radio round">
	                                                        <input type="radio" name="payment-method" id="" value="IDI페이" class="idi-pay" checked>
	                                                        <span class="icon"></span>
	                                                        <span class="txt">IDI페이</span>
	                                                    </label>
	                                                    <label class="radio round">
	                                                        <input type="radio" name="payment-method" id="" value="일반결제" class="general-pay" <% if(!isLogin ) { %> checked <% } %> >
	                                                        <span class="icon"></span>
	                                                        <span class="txt">일반결제</span>
	                                                    </label>
                                                	</c:if>
                                              		<c:if test="${fn:contains(currentUrl, 'regular')}">
	                                                    <label class="radio round">
	                                                        <input type="radio" name="payment-method" id="" value="정기결제" class="regular-pay" checked >
	                                                        <span class="icon"></span>
	                                                        <span class="txt">정기결제</span>
	                                                    </label>
                                              		</c:if>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="bdNormal-li bdNormalL-li basket-payment-pay">
                                        <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                            <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                <span class="txt">IDI페이</span>
                                            </li>
                                            <li class="bdNormal-rowli bdNormalL-rowli">
                                                <div class="swiper basket-payment-method-swiper">
                                                    <div class="swiper-wrapper">
                                                        <% for(Pay pay : pays) { %>
                                                            <div class="swiper-slide">
                                                                <div class="basket-payment-card" style="background-color: <%=pay.bgColor%>;">
                                                                    <div class="bg">
                                                                        <img src="<%=pay.icon.square.url%>" alt="이미지">
                                                                    </div>
                                                                    <div class="company" style="color: <%=pay.color%>;">
                                                                        <span><%=pay.cate%></span>
                                                                    </div>
                                                                    <% if(pay.cate == "카드") { %>
                                                                    <label for="" class="input-box month" style="border-color: <%=pay.color%>;">
                                                                        <select name="" id="" class="basket-payment-card-select" style="background-color: <%=pay.bgColor%>; color: <%=pay.color%>;">
                                                                            <option value="1">일시불</option>
                                                                            <% for(int j = 0; j < pay.card.noInterest.isNoInterest.length; j++) { %>
                                                                                <% if(j == 0) { %>
                                                                                    <option value="<%=j + 1%>">일시불</option>
                                                                                <% } else if(pay.card.noInterest.isNoInterest[j] == true) { %>
                                                                                    <option value="<%=j + 1%>"><%=j + 1%>개월(무이자)</option>
                                                                                <% } else { %>
                                                                                    <option value="<%=j + 1%>"><%=j + 1%>개월</option>
                                                                                <% } %>
                                                                            <% } %>
                                                                        </select>
                                                                    </label>
                                                                    <% } else if(pay.cate == "계좌") { %>
                                                                    <div class="name" style="color: <%=pay.color%>;">
                                                                        <span><%=pay.cate%></span>
                                                                    </div>
                                                                    <div class="num" style="color: <%=pay.color%>;">
                                                                        <span><%=pay.account.accountNumber%></span>
                                                                    </div>
                                                                    <% } %>
                                                                </div>
                                                            </div>
                                                        <% } %>
                                                        <div class="swiper-slide">
                                                            <div class="basket-payment-card plus">
                                                                <div class="bg">
                                                                    <div class="icon"></div>
                                                                </div>
                                                                <div class="company">
                                                                    <span>결제수단</span>
                                                                </div>
                                                                <div class="txt">등록/제거</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="swiper-button-prev basket-payment-method-btn prev"></div>
                                                    <div class="swiper-button-next  basket-payment-method-btn next"></div>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="bdNormal-li bdNormalL-li basket-payment-detail required">
                                        <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                            <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                <span class="txt">결제</span>
                                            </li>
                                            <li class="bdNormal-rowli bdNormalL-rowli">
                                                <div class="basket-orderer-inputs">
                                                    <c:if test="${!fn:contains(currentUrl, 'regular')}">
                                                    <label class="radio round">
                                                        <input type="radio" name="payment-detail-method" id="" value="무통장" class="deposit" <% if(!isRegular) { %> checked <% } %>>
                                                        <span class="icon"></span>
                                                        <span class="txt">무통장입금</span>
                                                    </label>
                                                    </c:if>
                                                    <label class="radio round">
                                                        <input type="radio" name="payment-detail-method" id="" value="신용카드" class="card"  <% if(isRegular) { %> checked <% } %> >
                                                        <span class="icon"></span>
                                                        <span class="txt">신용카드</span>
                                                    </label>
                                                    <c:if test="${!fn:contains(currentUrl, 'regular')}">
                                                    <label class="radio round">
                                                        <input type="radio" name="payment-detail-method" id="" class="account">
                                                        <span class="icon"></span>
                                                        <span class="txt">계좌이체</span>
                                                    </label>
													</c:if>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
									<c:if test="${fn:contains(currentUrl, 'regular') && isLogin}">
	                                    <li class="bdNormal-li bdNormalL-li basket-payment-birthday required">
	                                        <ul class="bdNormal-rowlist bdNormalL-rowlist">
	                                            <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
	                                                <span class="txt">생년월일</span>
	                                            </li>
	                                            <li class="bdNormal-rowli bdNormalL-rowli">
	                                                <div class="basket-orderer-selects">
	                                                    <label class="select-wrap">
	                                                        <select name="" id="" class="basket-payment-birthday-select">
	                                                            <option value="0" disabled selected>년</option>
	                                                        <%  %>
	                                                        <% for(int i = 1900; i <= 2024; i++) { %>
	                                                            <option value="<%=i%>"><%=i%></option>
	                                                        <% } %>
	                                                        </select>
	                                                    </label>
	                                                    <label class="select-wrap">
	                                                        <select name="" id="" class="basket-payment-birthday-select">
	                                                            <option value="0" disabled selected>월</option>
	                                                        <% for(int i = 1; i <= 12; i++) { %>
	                                                            <option value="<%=i%>"><%=i%></option>
	                                                        <% } %>
	                                                        </select>
	                                                    </label>
	                                                    <label class="select-wrap">
	                                                        <select name="" id="" class="basket-payment-birthday-select">
	                                                            <option value="0" disabled selected>일</option>
	                                                        <% for(int i = 1; i <= 31; i++) { %>
	                                                            <option value="<%=i%>"><%=i%></option>
	                                                        <% } %>
	                                                        </select>
	                                                    </label>
	                                                </div>
	                                            </li>
	                                        </ul>
	                                    </li>
	                                    <li class="bdNormal-li bdNormalL-li basket-payment-cardnum required">
	                                        <ul class="bdNormal-rowlist bdNormalL-rowlist">
	                                            <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
	                                                <span class="txt">카드번호</span>
	                                            </li>
	                                            <li class="bdNormal-rowli bdNormalL-rowli">
	                                                <div class="basket-orderer-inputs">
	                                                    <label class="input-box">
	                                                        <input type="text" name="" id="">
	                                                    </label>
	                                                    <span> - </span>
	                                                    <label class="input-box">
	                                                        <input type="text" name="" id="">
	                                                    </label>
	                                                    <span> - </span>
	                                                    <label class="input-box">
	                                                        <input type="text" name="" id="">
	                                                    </label>
	                                                    <span> - </span>
	                                                    <label class="input-box">
	                                                        <input type="text" name="" id="">
	                                                    </label>
	                                                </div>
	                                            </li>
	                                        </ul>
	                                    </li>
	                                    <li class="bdNormal-li bdNormalL-li basket-payment-carddate required">
	                                        <ul class="bdNormal-rowlist bdNormalL-rowlist">
	                                            <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
	                                                <span class="txt">유효기간</span>
	                                            </li>
	                                            <li class="bdNormal-rowli bdNormalL-rowli">
	                                                <div class="basket-orderer-selects">
	                                                    <label class="select-wrap">
	                                                        <select name="" id="" class="basket-payment-carddate-select">
	                                                            <option value="0" disabled selected>월</option>
	                                                        <% for(int i = 1; i <= 12; i++) { %>
	                                                            <option value="<%=i%>"><%=i%></option>
	                                                        <% } %>
	                                                        </select>
	                                                    </label>
	                                                    <span> / </span>
	                                                    <label class="select-wrap">
	                                                        <select name="" id="" class="basket-payment-carddate-select">
	                                                            <option value="0" disabled selected>년</option>
	                                                        <%  %>
	                                                        <% for(int i = 2024; i <= 2054; i++) { %>
	                                                            <option value="<%=i%>"><%=i%></option>
	                                                        <% } %>
	                                                        </select>
	                                                    </label>
	                                                </div>
	                                            </li>
	                                        </ul>
	                                    </li>
	                                    <li class="bdNormal-li bdNormalL-li basket-payment-pw required">
	                                        <ul class="bdNormal-rowlist bdNormalL-rowlist">
	                                            <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
	                                                <span class="txt">카드비밀번호</span>
	                                            </li>
	                                            <li class="bdNormal-rowli bdNormalL-rowli">
	                                                <div class="basket-orderer-inputs">
	                                                    <label class="input-box">
	                                                        <input type="text" name="" id="">
	                                                    </label>
	                                                    <span> **(앞자리 2자리) </span>
	                                                    <button type="button" class="btn btn-square-black">카드정보 확인</button>
	                                                </div>
	                                            </li>
	                                        </ul>
	                                    </li>
									</c:if>
   									<c:if test="${!fn:contains(currentUrl, 'regular') && isLogin}">
	                                    <li class="bdNormal-li bdNormalL-li basket-payment-coupon">
	                                        <ul class="bdNormal-rowlist bdNormalL-rowlist">
	                                            <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
	                                                <span class="txt">쿠폰</span>
	                                            </li>
	                                            <li class="bdNormal-rowli bdNormalL-rowli">
	                                                <div class="basket-orderer-selects">
	                                                    <label class="select-wrap">
	                                                        <select name="coupon" id="coupon" class="basket-payment-coupon-select">
	                                                            <option value="0">쿠폰을 선택해주세요.</option>
	                                                            <option value="10">10%</option>
					                                            <c:if test="${couponList!=null && couponList.size()>0 }">
                                          	                        <c:forEach var="item" items="${couponList }" varStatus="status"> 
			                                                            <option value="${item.percent }">${item.couponName }</option>
                                          	                        </c:forEach>
					                                            </c:if>
	                                                        </select>
	                                                    </label>
	                                                </div>
	                                            </li>
	                                        </ul>
	                                    </li>
	                                   <!--  <li class="bdNormal-li bdNormalL-li basket-payment-double">
	                                        <ul class="bdNormal-rowlist bdNormalL-rowlist">
	                                            <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
	                                                <span class="txt">중복쿠폰</span>
	                                            </li>
	                                            <li class="bdNormal-rowli bdNormalL-rowli">
	                                                <div class="basket-orderer-selects">
	                                                    <label class="select-wrap">
	                                                        <select name="" id="" class="basket-payment-double-select">
	                                                            <option value="0">쿠폰을 선택해주세요.</option>
	                                                            <option value="2000">10만원 이상 결제시 2,000원 할인</option>
	                                                        </select>
	                                                    </label>
	                                                </div>
	                                            </li>
	                                        </ul>
	                                    </li> -->
   									</c:if>
                                    
                                    <li class="bdNormal-li bdNormalL-li basket-payment-deposit-name required">
                                        <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                            <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                <span class="txt">입금자명</span>
                                            </li>
                                            <li class="bdNormal-rowli bdNormalL-rowli">
                                                <div class="basket-orderer-input-box">
                                                    <label for="" class="input-box">
                                                        <input type="text" name="bankSender" id="bankSender" required>
                                                    </label>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="bdNormal-li bdNormalL-li basket-payment-deposit-bank required">
                                        <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                            <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                <span class="txt">은행</span>
                                            </li>
                                            <li class="bdNormal-rowli bdNormalL-rowli">
                                                <div class="basket-orderer-selects">
                                                    <label class="select">
                                                        <select name="bank" id="bank" class="sub-account-select">
                                                            <option value="">입금계좌를 선택해주세요.</option>
                                                            <c:forEach var="item" items="${bankList }" varStatus="status"> 
                                                            <option value="${item.bankNo }">${item.bank } ${item.account }(${item.name })</option>
                                                            </c:forEach>
                                                        </select>
                                                    </label>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="bdNormal-li bdNormalL-li basket-payment-cash-receipts">
                                        <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                            <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                <span class="txt">현금영수증</span>
                                            </li>
                                            <li class="bdNormal-rowli bdNormalL-rowli">
                                                <div class="basket-orderer-inputs">
                                                    <label class="radio round">
                                                        <input type="radio" name="payment-cash-receipts" value="Y" id="" class="enable" checked>
                                                        <span class="icon"></span>
                                                        <span class="txt">사용</span>
                                                    </label>
                                                    <label class="radio round">
                                                        <input type="radio" name="payment-cash-receipts" value="N" id="" class="disable">
                                                        <span class="icon"></span>
                                                        <span class="txt">사용안함</span>
                                                    </label>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="bdNormal-li bdNormalL-li basket-payment-purpose">
                                        <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                            <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                <span class="txt">발행용도</span>
                                            </li>
                                            <li class="bdNormal-rowli bdNormalL-rowli">
                                                <div class="basket-orderer-inputs">
                                                    <label class="radio round">
                                                        <input type="radio" name="payment-purpose" value="0" id="" class="deduction" checked>
                                                        <span class="icon"></span>
                                                        <span class="txt">소득공제용</span>
                                                    </label>
                                                    <label class="radio round">
                                                        <input type="radio" name="payment-purpose" value="1" id="" class="proof">
                                                        <span class="icon"></span>
                                                        <span class="txt">지출증빙용</span>
                                                    </label>
                                                    <div class="deduction-num">
                                                        <span>휴대폰(주민)번호</span>
                                                        <label class="input-box">
                                                            <input type="number" name="cashReceiptIdentityNumber" id="">
                                                        </label>
                                                        <span>(' - ' 제외)</span>
                                                    </div>
                                                    <div class="proof-num">
                                                        <span>사업자번호</span>
                                                        <label class="input-box">
                                                            <input type="number" name="cashReceiptIdentityNumber" id="">
                                                        </label>
                                                        <span>(' - ' 제외)</span>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
        
                                </ul>
            
                            </div>
                        </div>
                        <div class="basket-payment-alert">
                            <ul class="basket-payment-alert-list">
                                <li>
                                    <p>홈페이지 개편과정에서 적립금 및 구매내역이 아직 100% 이전되지 못하여 일부 회원님들의 정보가 정확하지 않을 수 있습니다.</p>
                                    <p>순차적으로 적립금 및 구매내역이 옮겨지고 있습니다.</p>
                                </li>
                                <li><p>회원등급은 후원회비 납부 내역에 따라 자동 변동될 수 있으므로, 고객센터 혹은 1:1 문의를 통해 문의해주시기 바랍니다.</p></li>
                                <li><p>여러가지 불편을 끼쳐드려 죄송합니다. 빠른 시일내에 데이터 이전을 마치도록 하겠습니다.</p></li>
                            </ul>
                        </div>
                    </div>
                    <div class="basket-result-wrap">
                        <div class="basket-result-plate">
                            <div class="basket-result-top">
                                <span>결제금액</span>
                            </div>
                            <div class="basket-result-main">
                                <div class="basket-result-ticket">
                                    <ul class="basket-result-ticket-list">
                                        <li class="basket-result-ticket-li product">
                                            <div class="basket-result-cate-plate">
                                                <div class="basket-result-cate-tit"><span>상품합계금액</span></div>
                                                <div class="basket-result-cate-icon"></div>
                                                <div class="basket-result-cate-price">
                                                    <label for="" class="input-box">
                                                        <input type="text" name="" id="" value="<fmt:formatNumber value="${totalOriginPrice}" type="number" pattern="#,##0.##" />" readonly>
                                                    </label>
                                                </div>
                                            </div>
                                        </li>
                                        <c:if test="${isLogin}">
	                                        <li class="basket-result-ticket-li membership">
	                                            <div class="basket-result-cate-plate">
	                                                <div class="basket-result-cate-tit"><span>회원할인</span></div>
	                                                <div class="basket-result-cate-icon"></div>
	                                                <div class="basket-result-cate-price">
	                                                    <label for="" class="input-box">
	                                                        <input type="text" name="" id="" value="<fmt:formatNumber value="${totalMemberDc }" type="number" pattern="#,##0.##" />" readonly>
	                                                    </label>
	                                                </div>
	                                            </div>
	                                        </li>
                                        </c:if>
                                        <c:if test="${!fn:contains(currentUrl, 'regular') && isLogin}">
	                                        <li class="basket-result-ticket-li coupon">
	                                            <div class="basket-result-cate-plate">
	                                                <div class="basket-result-cate-tit"><span>쿠폰할인</span></div>
	                                                <div class="basket-result-cate-icon"></div>
	                                                <div class="basket-result-cate-price">
	                                                    <label for="" class="input-box">
	                                                        <input type="text" name="" id="" value="0" readonly>
	                                                    </label>
	                                                </div>
	                                            </div>
	                                        </li>
                                        </c:if>
                                        <li class="basket-result-ticket-li delivery">
                                            <div class="basket-result-cate-plate">
                                                <div class="basket-result-cate-tit">
                                                    <span>배송비</span>
                                                    <div class="popovers-wrap">
                                                        <button type="button" class="btn btn-popovers basket-result-btn-popovers">
                                                            <div class="icon"></div>
                                                            <div class="txt"></div>
                                                        </button>
                                                        <div class="popovers">
                                                            <div class="popovers-box">
                                                                <button type="button" class="btn btn-close popovers-close"></button>
                                                                <div class="popovers-main">
                                                                    <span class="txt">최종 결제 금액이 30,000원 이상일때 무료입니다.</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="basket-result-cate-icon"></div>
                                                <div class="basket-result-cate-price">
                                                    <label for="" class="input-box">
                                                        <%-- <input type="text" name="" id="" value="<%=Integer.toString(priceDelivery).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%>" readonly> --%>
                                                        <input type="text" name="" id="" value="${ totalPrice < 30000 ? 3000 : 0}" readonly>
                                                        
                                                    </label>
                                                </div>
                                            </div>
                                        </li>                                    
                                        <c:if test="${isLogin}">
	                                        <li class="basket-result-ticket-li fund">
	                                            <div class="basket-result-cate-plate">
	                                                <div class="basket-result-cate-tit">
	                                                    <span>적립금적용</span>
	                                                    <div class="popovers-wrap">
	                                                        <button type="button" class="btn btn-popovers basket-result-btn-popovers">
	                                                            <div class="icon"></div>
	                                                            <div class="txt"></div>
	                                                        </button>
	                                                        <div class="popovers">
	                                                            <div class="popovers-box">
	                                                                <button type="button" class="btn btn-close popovers-close"></button>
	                                                                <div class="popovers-main">
	                                                                    <span class="txt">적립금은 5,000원 부터 300,000원 까지 사용이 가능합니다.</span>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                                <div class="basket-result-cate-icon"></div>
	                                                <div class="basket-result-cate-price">
	                                                    <ul class="price-detail-list">
	                                                        <li class="has">
	                                                            <span class="txt">보유</span>
	                                                            <span class="price">
	                                                                <label for="" class="input-box">
	                                                                    <input type="text" value="<fmt:formatNumber value="${memberInfo.emoney}" type="number" pattern="#,##0.##" />" readonly>
	                                                                </label>
	                                                            </span>
	                                                        </li>
	                                                        <li class="use">
	                                                            <span class="txt">사용</span>
	                                                            <span class="price">
	                                                                <label for="" class="input-box">
	                                                                    <input type="number" name="useEmoney" id="useEmoney" placeholder="0">                                                                
	                                                                </label>
	                                                            </span>
	                                                        </li>
	                                                    </ul>
	                                                </div>
	                                            </div>
	                                        </li>
                                        </c:if>
                                        <li class="basket-result-ticket-li total">
                                            <div class="basket-result-cate-plate">
                                                <div class="basket-result-cate-tit">
                                                    <span>총 결제금액</span>
                                                </div>
                                                <div class="basket-result-cate-icon"></div>
                                                <div class="basket-result-cate-price">
                                                    <label for="" class="input-box">
                                                        <input type="text" name="totalPrice" id="totalPrice" class="c-red" value="<fmt:formatNumber value="${totalPrice < 30000 ? totalPrice + 3000 : totalPrice }" type="number" pattern="#,##0.##" />" readonly>
                                                    </label>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="basket-result-btns">
                                    <button type="button" class="btn btn-order basket-result-btn" id="orderBtn">
                                        <c:choose>
                                            <c:when test="${fn:contains(currentUrl, 'regular')}">
                                                <% if(isModify == true) { %>
                                                    <div class="txt">수정</div>
                                                <% } %>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="txt">주문하기</div>
                                            </c:otherwise>
                                        </c:choose>
                                    
                                    </button>
                                </div>
                                <input type="hidden" name="memberNo" id="memberNo" value="${memberInfo.memberNo }">
                                <input type="hidden" name="memberId" id="memberId" value="${memberInfo.memberId }">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </form>
    
    
    

    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>
<div id="payment-method"></div>
<div id="agreement"></div>
<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<script src="/js/user/pages/basket/basket_order.js"></script>

<script type="module">
	import {get} from '/js/util/toss_payments/toss_payments.js';
	window.brandPay = get;
//	window.brandPay.loadIdiPay('${memberInfo.memberNo}${memberInfo.memberId}');
</script>

</body>
</html>
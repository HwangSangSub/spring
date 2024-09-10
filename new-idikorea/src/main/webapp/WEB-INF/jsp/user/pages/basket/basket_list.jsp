<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeSub";
    // sub banner tit
	String pagename = "basket";
	String pagetxt = "장바구니";
	String navId = "000302";

	// ex
    // Boolean isLogin = false; 
    Boolean isLogin = true; 
    String userName = "이디";
    int hasFund = 912333;
    // Boolean isRegular = false; // 일반배송
    Boolean isRegular = Boolean.parseBoolean(request.getParameter("regular")); // 정기배송일 시

	// //ex


    
    // 장바구니 ex
    class Product {
        String imgFileName;
        String name;
        String option;
        String prodId;
        String url;
        int fund;
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
    prods[0].fund = 2;
    prods[0].sum = 2;
    prods[0].price = 36000;
    prods[0].prodId = "000900010";
    prods[0].url = "/user/product/detail?no=000900010";
    
    prods[1].imgFileName = "00f9447291374571b64a622503ed3cfc.png";
    prods[1].name = "디퓨져 선물세트";
    prods[1].option = "[치프리아 + 디퓨져(리프 그린)]";
    prods[1].fund = 1;
    prods[1].sum = 1;
    prods[1].price = 36000;
    prods[1].prodId = "000900011";
    prods[1].url = "/user/product/detail?no=000900011";
    
    prods[2].imgFileName = "5b0707a1607e49b5ab39c7ca50809a52.png";
    prods[2].name = "1>IDI SOAGEN LATTE - 클렌징 밀크";
    prods[2].option = "";
    prods[2].fund = 1;
    prods[2].sum = 1;
    prods[2].price = 32500;
    prods[2].prodId = "000900012";
    prods[2].url = "/user/product/detail?no=000900012";

    int priceProduct = 0;
    int priceDelivery = priceProduct < 30000 ? 3000 : 0;
    int priceTotal = priceProduct + priceDelivery;
    // //장바구니 ex


%>

<jsp:include page="../../include/common.jsp" flush="false" >
    <jsp:param name="pagetype" value="<%=pagetype%>" />
	<jsp:param name="pagename" value="<%=pagename%>" />
	<jsp:param name="pagetxt" value="<%=pagetxt%>" />	
	<jsp:param name="navId" value="<%=navId%>" />
    <jsp:param name="cssLinks" value="vendors/font-awesome/font-awesome.min" />	
	<jsp:param name="cssLinks" value="vendors/line-awesome/line-awesome-font-awesome.min" />	
	<jsp:param name="cssLinks" value="vendors/line-awesome/line-awesome.min" />	
    <jsp:param name="cssLinks" value="user/compile/pages/basketList/style" />	
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


    <section class="basket-sect sect-tabs">
        <div class="layout">
			<ul class="sub-tabs-list basket-tabs-list">
				<li class="sub-tabs-li basket-tabs-li <% if(!isRegular){ %>active<%}%>" onclick="location.href='?regular=false';">
					<div class="sub-tab basket-tab">일반구매</div>
				</li>
				<li class="sub-tabs-li basket-tabs-li <% if(isRegular){ %>active<%}%>" onclick="location.href='?regular=true';">
					<div  class="sub-tab basket-tab">정기구매</div>
				</li>
			</ul>
        </div>
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

    <section class="basket-sect sect-board">
	${cartList }
        <div class="layout">
            <div class="bdNormal-wrap basket-board">
                <div class="bdNormal bdBasket">

                    <ul class="bdNormal-list">
                        <%-- board head --%>
                        <li class="bdNormal-li bdNormal-head bdBasket-head">
                            <ul class="bdNormal-headlist bdBasket-headlist bdBasket-rowlist">
                                <li class="bdNormal-headli bdBasket-headli bdBasket-rowli col-img">
                                    <span class="txt">이미지</span>
                                </li>
                                <li class="bdNormal-headli bdBasket-headli bdBasket-rowli col-name">
                                    <span class="txt">상품명</span>
                                </li>
                                <li class="bdNormal-headli bdBasket-headli bdBasket-rowli col-fund">
                                    <span class="txt">적립금</span>
                                </li>
                                <li class="bdNormal-headli bdBasket-headli bdBasket-rowli col-sum">
                                    <span class="txt">수량</span>
                                </li>
                                <li class="bdNormal-headli bdBasket-headli bdBasket-rowli col-price">
                                    <span class="txt">가격</span>
                                </li>
                                <li class="bdNormal-headli bdBasket-headli bdBasket-rowli col-order-price">
                                    <span class="txt">주문가격</span>
                                </li>
                                <li class="bdNormal-headli bdBasket-headli bdBasket-rowli col-check-buy">
                                    <label class="checkbox-wrap checkbox-allcheck-wrap">
                                        <input type="checkbox" class="checkbox checkbox-allcheck">
                                        <span class="checkbox-box"></span>
                                    </label>
                                </li>
                            </ul>
                        </li>
                        <c:forEach var="item" items="${cartList }" varStatus="status">  
	 						<li class="bdNormal-li bdBasket-li btn" name="cartList">
	                            <ul class="bdBasket-rowlist">
	                                <li class="bdBasket-rowli col-img">
	                                    <img src="/api/v1/file/${item.iconImage }" alt="">
	                                </li>
	                                <li class="bdBasket-rowli col-name">
	                                <input type="hidden" name="sno" value="${item.sno }">
	                                    <span class="txt">${item.goodsName} <c:if test="${item.opt1!=null && item.opt1!='' }"> > ${item.opt1 }</c:if> <c:if test="${item.opt2 !=null && item.opt2 !='' }"> > ${item.opt2 }</c:if></span>
	                                    <div class="pad">
	                                        <div class="fund">
	                                            <span class="unit">적립금 : </span>
	                                            <span class="txt">${item.reserve }</span>
	                                        </div>
	                                    </div>
	                                    <div class="pad">
	                                        <div class="sum">
	                                            <span class="unit">수량 : ${item.ea < item.minEa}</span>
                                                <div class="sum-control-wrap">
                                                    <button type="button" class="btn btn-sum-control btn-sum-minus">
                                                        <i class="la la-minus" aria-hidden="true"></i>
                                                    </button>
                                                    <label for="" class="input-box">
                                                        <input type="text" class="sum" name="ea" id="" value="${item.ea < item.minEa ? item.minEa : item.ea }">
                                                    </label>
                                                    <input type='hidden' id="minEa" value="${item.minEa }">
                                                    <input type='hidden' id="maxEa" value="${item.maxEa }">
                                                    <input type='hidden' id="nowStock" value="${item.nowStock }">
                                                    <input type='hidden' id="useStock" value="${item.useStock }">
                                                    <button type="button" class="btn btn-sum-control btn-sum-plus">+</button>
                                                </div>
	                                        </div>
	                                    </div>
	                                    <div class="pad">
	                                        <div class="price" data-price="${item.price }">
	                                            <span class="unit">가격 : </span>
	                                            <span class="txt">
<%-- 	                                                <span class="num"><%=Integer.toString(p.price).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%></span>원 --%>
	                                                <span class="num">${item.ea < item.minEa ? item.minEa : item.ea }</span>원
	                                            </span>
	                                        </div>
	                                    </div>
	                                    <div class="pad">
	                                        <div class="order-price">
	                                            <span class="unit">주문가격 : </span>
	                                            <span class="txt">
<%-- 	                                                <span class="num"><%=Integer.toString(p.price * p.sum).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%></span>원 --%>
	                                                <span class="num">${item.price*1*(item.ea < item.minEa ? item.minEa : item.ea) }</span>원
	                                            </span>
	                                        </div>
	                                    </div>
	                                    <div class="pad">
	                                        <div class="check-buy">
	                                            <span class="unit">선택 : </span>
	                                            <label class="checkbox-wrap">
	                                                <input type="checkbox" class="checkbox">
	                                                <span class="checkbox-box"></span>
	                                            </label>
	                                        </div>
	                                    </div>
	                                </li>
	                                <li class="bdBasket-rowli col-fund">
	                                    <span class="txt">${item.reserve * (item.ea < item.minEa ? item.minEa : item.ea) }</span>
	                                </li>
	                                <li class="bdBasket-rowli col-sum">
	                                    <div class="sum-control-wrap">
	                                        <button type="button" class="btn btn-sum-control btn-sum-minus">
	                                            <i class="la la-minus" aria-hidden="true"></i>
	                                        </button>
	                                        <label for="" class="input-box">
	                                            <input type="text" class="sum" name="ea" id="" value="${item.ea < item.minEa ? item.minEa : item.ea }">
	                                        </label>
	                                        <input type='hidden' id="minEa" value="${item.minEa }">
	                                        <input type='hidden' id="maxEa" value="${item.maxEa }">
	                                        <input type='hidden' id="nowStock" value="${item.nowStock }">
	                                        <input type='hidden' id="useStock" value="${item.useStock }">
	                                        <button type="button" class="btn btn-sum-control btn-sum-plus">+</button>
	                                    </div>
	                                </li>
	                                <li class="bdBasket-rowli col-price" data-price="${item.price }">
	                                    <span class="txt">
<%-- 	                                        <span class="num"><%=Integer.toString(p.price).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%></span>원 --%>
	                                        <span class="num">${item.price }</span>원
	                                    </span>
	                                </li>
	                                <li class="bdBasket-rowli col-order-price">
	                                    <strong class="txt c-red">
<%-- 	                                        <span class="num"><%=Integer.toString(p.price * p.sum).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%></span>원 --%>
	                                        <span class="num">${item.price*1*(item.ea < item.minEa ? item.minEa : item.ea) }</span>원
	                                    </strong>
<%-- 	                                    <% priceProduct += p.price * p.sum; %> --%>
	                                </li>
	                                <li class="bdBasket-rowli col-check-buy">
	                                    <label class="checkbox-wrap">
	                                        <input type="checkbox" name="checkGoods"class="checkbox">
	                                        <span class="checkbox-box"></span>
	                                    </label>
	                                </li>
	                            </ul>
	                        </li>                        
                        </c:forEach>
<%--                         <% for(Product p : prods) { %> --%>

<!--                         <li class="bdNormal-li bdBasket-li btn"> -->
<!--                             <ul class="bdBasket-rowlist"> -->
<!--                                 <li class="bdBasket-rowli col-img"> -->
<%--                                     <img src="/images/user/sample/<%=p.imgFileName%>" alt="<%=p.name%>"> --%>
<!--                                 </li> -->
<!--                                 <li class="bdBasket-rowli col-name"> -->
<%--                                     <span class="txt"><%=p.name%><%=p.option%></span> --%>
<!--                                     <div class="pad"> -->
<!--                                         <div class="fund"> -->
<!--                                             <span class="unit">적립금 : </span> -->
<%--                                             <span class="txt"><%=p.fund%></span> --%>
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="pad"> -->
<!--                                         <div class="sum"> -->
<!--                                             <span class="unit">수량 : </span> -->
<%--                                             <span class="txt"><%=p.sum%></span> --%>
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="pad"> -->
<%--                                         <div class="price" data-price="<%=p.price%>"> --%>
<!--                                             <span class="unit">가격 : </span> -->
<!--                                             <span class="txt"> -->
<%--                                                 <span class="num"><%=Integer.toString(p.price).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%></span>원 --%>
<!--                                             </span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="pad"> -->
<!--                                         <div class="order-price"> -->
<!--                                             <span class="unit">주문가격 : </span> -->
<!--                                             <span class="txt"> -->
<%--                                                 <span class="num"><%=Integer.toString(p.price * p.sum).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%></span>원 --%>
<!--                                             </span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="pad"> -->
<!--                                         <div class="check-buy"> -->
<!--                                             <span class="unit">선택 : </span> -->
<!--                                             <label class="checkbox-wrap"> -->
<!--                                                 <input type="checkbox" class="checkbox"> -->
<!--                                                 <span class="checkbox-box"></span> -->
<!--                                             </label> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </li> -->
<!--                                 <li class="bdBasket-rowli col-fund"> -->
<%--                                     <span class="txt"><%=p.fund%></span> --%>
<!--                                 </li> -->
<!--                                 <li class="bdBasket-rowli col-sum"> -->
<!--                                     <div class="sum-control-wrap"> -->
<!--                                         <button type="button" class="btn btn-sum-control btn-sum-minus"> -->
<!--                                             <i class="la la-minus" aria-hidden="true"></i> -->
<!--                                         </button> -->
<!--                                         <label for="" class="input-box"> -->
<%--                                             <input type="text" class="sum" name="" id="" value="<%=p.sum%>"> --%>
<!--                                         </label> -->
<!--                                         <button type="button" class="btn btn-sum-control btn-sum-plus">+</button> -->
<!--                                     </div> -->
<!--                                 </li> -->
<%--                                 <li class="bdBasket-rowli col-price" data-price="<%=p.price%>"> --%>
<!--                                     <span class="txt"> -->
<%--                                         <span class="num"><%=Integer.toString(p.price).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%></span>원 --%>
<!--                                     </span> -->
<!--                                 </li> -->
<!--                                 <li class="bdBasket-rowli col-order-price"> -->
<!--                                     <strong class="txt c-red"> -->
<%--                                         <span class="num"><%=Integer.toString(p.price * p.sum).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%></span>원 --%>
<!--                                     </strong> -->
<%--                                     <% priceProduct += p.price * p.sum; %> --%>
<!--                                 </li> -->
<!--                                 <li class="bdBasket-rowli col-check-buy"> -->
<!--                                     <label class="checkbox-wrap"> -->
<!--                                         <input type="checkbox" class="checkbox"> -->
<!--                                         <span class="checkbox-box"></span> -->
<!--                                     </label> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </li> -->
<%--                         <% } %> --%>
                    </ul>
                    
                    <form name="orderFrm" method="POST" action="/user/order/select-wrapping">
                    	<input type="hidden" name="orderData" value="">
                    </form>

                </div>
            </div>
        </div>
    </section>

    <section class="basket-sect sect-btns">
        <div class="layout">
            <div class="basket-btns">
            <% if(isRegular){ %>
                <a href="#" id="orderBtn" class="btn btn-rounding-black basket-btn">정기배송 신청하기</a>
            <% } else { %>
                <a href="#" id="orderBtn" class="btn btn-rounding-black basket-btn">주문하기</a>
            <% } %>
                <button type="button" class="btn btn-rounding-gray basket-btn remove">삭제하기</button>
            </div>
        </div>
    </section>
    
    

    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<script src="/js/user/pages/basket/basket_list.js"></script>


</body>
</html>
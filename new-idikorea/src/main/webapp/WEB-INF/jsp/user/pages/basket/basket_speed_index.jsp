<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeSub";
    // sub banner tit
	String pagename = "basket";
	String pagetxt = "스피드주문";
	String navId = "000305";

	// ex
    // Boolean isLogin = false; 
    Boolean isLogin = true; 
    String userName = "이디";
    int hasFund = 912333;

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
        String cate;

        public Product() {}
    }
    Product[] prods = new Product[3];
    for(int i=0; i < prods.length; i++) {
        prods[i] = new Product();
        prods[i].cate = "event";
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



    Product[] prod2s = new Product[2];
    for(int i=0; i < prod2s.length; i++) {
        prod2s[i] = new Product();
        prod2s[i].cate = "skin";
    }

    prod2s[0].imgFileName = "00f9447291374571b64a622503ed3cfc.png";
    prod2s[0].name = "디퓨져 선물세트";
    prod2s[0].option = "[치프리아 + 디퓨져(카사블랑카)]";
    prod2s[0].fund = 2;
    prod2s[0].sum = 2;
    prod2s[0].price = 36000;
    prod2s[0].prodId = "000900010";
    prod2s[0].url = "/user/product/detail?no=000900010";
    
    prod2s[1].imgFileName = "00f9447291374571b64a622503ed3cfc.png";
    prod2s[1].name = "디퓨져 선물세트";
    prod2s[1].option = "[치프리아 + 디퓨져(리프 그린)]";
    prod2s[1].fund = 1;
    prod2s[1].sum = 1;
    prod2s[1].price = 36000;
    prod2s[1].prodId = "000900011";
    prod2s[1].url = "/user/product/detail?no=000900011";

    Product[][] arr = {prods, prod2s};

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
    </section>
    
    <section class="basket-sect sect-step">
        <div class="layout">
            <div class="basket-top">
                <h1><%=pagetxt%></h1>
            </div>
        </div>
    </section>

    <section class="basket-sect sect-board">
        <div class="layout">
            <div class="bdNormal-wrap basket-board">
                <div class="bdNormal bdBasket">

                    <ul class="bdNormal-list bdBasket-list">
                        <%-- board head --%>
                        <li class="bdNormal-li bdNormal-head bdBasket-head">
                            <ul class="bdNormal-headlist bdBasket-headlist bdBasket-rowlist">
                                <li class="bdNormal-headli bdBasket-headli bdBasket-rowli col-cate">
                                    <span class="txt">분류</span>
                                </li>
                                <li class="bdNormal-headli bdBasket-headli bdBasket-rowli col-name">
                                    <span class="txt">상품명</span>
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

                        <% for(Product[] arrP : arr) { %>
                            <li class="bdNormal-li bdBasket-li colspan<%=prods.length%>">
                                <span class="txt"><%=arrP[0].cate%></span>
                            </li>
    
                            <% for(Product p : arrP) { %>
                            <li class="bdNormal-li bdBasket-li btn">
                                <ul class="bdBasket-rowlist">
                                    <li class="bdBasket-rowli col-name">
                                        <span class="txt"><%=p.name%><%=p.option%></span>
                                        <div class="pad">
                                            <div class="sum">
                                                <span class="unit">수량 : </span>
                                                <div class="sum-control-wrap">
                                                    <button type="button" class="btn btn-sum-control btn-sum-minus">
                                                        <i class="la la-minus" aria-hidden="true"></i>
                                                    </button>
                                                    <label for="" class="input-box">
                                                        <input type="text" class="sum" name="" id="" value="<%=p.sum%>">
                                                    </label>
                                                    <button type="button" class="btn btn-sum-control btn-sum-plus">+</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="pad">
                                            <div class="price" data-price="<%=p.price%>">
                                                <span class="unit">가격 : </span>
                                                <span class="txt">
                                                    <span class="num"><%=Integer.toString(p.price).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%></span>원
                                                </span>
                                            </div>
                                        </div>
                                        <div class="pad">
                                            <div class="order-price">
                                                <span class="unit">주문가격 : </span>
                                                <span class="txt">
                                                    <span class="num"><%=Integer.toString(p.price * p.sum).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%></span>원
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
                                    <li class="bdBasket-rowli col-sum">
                                        <div class="sum-control-wrap">
                                            <button type="button" class="btn btn-sum-control btn-sum-minus">
                                                <i class="la la-minus" aria-hidden="true"></i>
                                            </button>
                                            <label for="" class="input-box">
                                                <input type="text" class="sum" name="" id="" value="<%=p.sum%>">
                                            </label>
                                            <button type="button" class="btn btn-sum-control btn-sum-plus">+</button>
                                        </div>
                                    </li>
                                    <li class="bdBasket-rowli col-price" data-price="<%=p.price%>">
                                        <span class="txt">
                                            <span class="num"><%=Integer.toString(p.price).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%></span>원
                                        </span>
                                    </li>
                                    <li class="bdBasket-rowli col-order-price">
                                        <strong class="txt c-red">
                                            <span class="num"><%=Integer.toString(p.price * p.sum).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%></span>원
                                        </strong>
                                        <% priceProduct += p.price * p.sum; %>
                                    </li>
                                    <li class="bdBasket-rowli col-check-buy">
                                        <label class="checkbox-wrap">
                                            <input type="checkbox" class="checkbox">
                                            <span class="checkbox-box"></span>
                                        </label>
                                    </li>
                                </ul>
                            </li>
                            <% } %>
                        <% } %>

                        
                        <li class="bdNormal-li bdBasket-li total">
                            <div class="basket-result-plate">
                                <div class="basket-result-tit">
                                    <span>총 결제금액</span>
                                </div>
                                <div class="basket-result-icon"></div>
                                <div class="basket-result-price">
                                    <label for="" class="input-box">
                                        <input type="text" name="totalPrice" id="totalPrice" class="c-red" value="0" readonly>
                                    </label>
                                </div>
                            </div>
                        </li>
                        
                    </ul>
                    

                </div>
            </div>
        </div>
    </section>

    <section class="basket-sect sect-btns">
        <div class="layout">
            <div class="basket-btns">
                <a href="/user/basket/list" class="btn btn-rounding-black">장바구니</a>
        </div>
    </section>
    
    

    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<script src="/js/user/pages/basket/basket_list.js"></script>
<script src="/js/user/pages/basket/basket_speed_index.js"></script>


</body>
</html>
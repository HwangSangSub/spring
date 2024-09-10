<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String pagetype = "typeProductGoods";
	String pagename = "product";
	String pagetxt = "굿즈구매";
	String navId = "0203";

	// ex
    // Boolean isLogin = true; 
  //  Boolean isLogin = false; 
    String userName = "이디";
	// //ex


    
    // 굿즈 ex
    class Goods {
        String imgFileName;
        String name;
        String prodId;
        int sum;
        int price;

        public Goods() {}
    }
    Goods[] goods = new Goods[3];
    for(int i=0; i < goods.length; i++) {
        goods[i] = new Goods();
    }

    goods[0].imgFileName = "3e8cfadc23c74eaabde9db0af91645d3.png";
    goods[0].name = "쇼핑백(small)";
    goods[0].sum = 0;
    goods[0].price = 300;
    goods[0].prodId = "100010001";

    goods[1].imgFileName = "a5bf7c5f2dd04e2fbbe4e0ed04eca0ee.jpg";
    goods[1].name = "포장(박스포장+고급리본) *박스포장 불가능 제품_샴푸";
    goods[1].sum = 0;
    goods[1].price = 5000;
    goods[1].prodId = "100010003";

    goods[2].imgFileName = "3e8cfadc23c74eaabde9db0af91645d3.png";
    goods[2].name = "쇼핑백(big)";
    goods[2].sum = 0;
    goods[2].price = 500;
    goods[2].prodId = "100010002";
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
${wrapping }
//////////
${orderData }

<form id="orderForm" name="orderForm" action="/user/basket/order" method="POST">
	<input type="hidden" value='${orderData }' name="orderData" id="orderItems">
</form>
<div class="wrap wrap-<%=pagetype%>">	
	<jsp:include page="../../include/header.jsp" flush="false" >
		<jsp:param name="navId" value="<%=navId%>" />	
		<jsp:param name="pagename" value="<%=pagename%>" />	
		<jsp:param name="isLogin" value="${isLogin }" />
		<jsp:param name="userName" value="<%=userName%>" />
	</jsp:include>
	<jsp:include page="../../include/modal.jsp" flush="false" >		
		<jsp:param name="isLogin" value="${isLogin }" />
		<jsp:param name="userName" value="<%=userName%>" />
	</jsp:include>

    
    <section class="product-sect sect-notice">
        <div class="layout">
            <div class="product-notice">
                <h4>선물하실 때 선택해 주세요.</h4>
                <p>쇼핑백이 필요하시면 사이즈별로 필요하신 수량을 선택하여 주문하실 수 있습니다.</p>
                <p class="c-red">쇼핑백이 필요하지 않으시면 <span class="underline">결제하기</span> 버튼을 눌러 바로 결제화면으로 이동하시면 됩니다.</p>
            </div>
        </div>
    </section>


    <section class="product-sect sect-bdProduct">
        <div class="layout">

            <div class="bdProduct-wrap product-board active">
                <div class="bdProduct">
                    <ul class="bdProduct-list">
					<c:forEach var="item" items="${wrapping }" varStatus="status">
                        <li class="bdProduct-li">
                            <div class="bdProduct-img">
                                <img src="/api/v1/file/${item.midiumImage}" alt="">
                            </div>
                            <div class="bdProduct-tit">
                                <p class="txt">${item.goodsName }</p>
                            </div>
                            <div class="bdProduct-price">
                                <p class="txt"><span class="icon">₩</span><span class="num">${item.price }</span></p>
                            </div>
                            <div class="bdProduct-sum">
                                <div class="sum-control-wrap">
                                    <button type="button" class="btn btn-sum-control btn-sum-minus">
                                        <i class="la la-minus" aria-hidden="true"></i>
                                    </button>
                                    <label for="" class="input-box">
                                        <input type="text" class="sum" data-id="${item.sno }" name="" id="" value="0">
                                    </label>
                                    <button type="button" class="btn btn-sum-control btn-sum-plus">+</button>
                                    <input type='hidden' id="minEa" value="0">
                                    <input type='hidden' id="maxEa" value="${item.maxEa }">
                                    <input type='hidden' id="nowStock" value="${item.nowStock }">
                                    <input type='hidden' id="useStock" value="${item.useStock }">
                                </div>
                            </div>
                        </li>
					</c:forEach>
                    </ul>
                </div>

            </div>
        </div>
    </section>

    <section class="product-sect sect-btns">
        <div class="layout">
            <div class="product-btns">
                <button type="button" id="orderBtn" class="btn btn-rounding-border product-btn">결제하기</button>
            </div>
        </div>
    </section>


    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>

<script src="/js/user/pages/product/product_goods.js"></script>


</body>
</html>
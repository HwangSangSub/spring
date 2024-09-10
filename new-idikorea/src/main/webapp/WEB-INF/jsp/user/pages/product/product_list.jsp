<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String pagetype = "typeProductList";
	String pagename = "product";
	String pagetxt = "상품목록";
	String navId = "0201";

	// ex
    // Boolean isLogin = true; 
//     Boolean isLogin = false; 
    String userName = "이디";
	// //ex


    
    // 품목 ex
    class Product {
        String imgFileName;
        String name;
        int price;
        String prodId;
        String url;
        Boolean isHeart;
        int stockNum;
        String[] tags;

        public Product() {}
    }

    
    // 카테고리 ex
    class Category {
        String cateId;
        String iconImgUrl;
        String name;
        String tit;
        String titInfo;
        Product[] prods;

        public Category() {}
    }
    

    Category[] cate = new Category[3];
    for(int i=0; i < cate.length; i++) {
        cate[i] = new Category();
    }
    
    
    cate[0].cateId = "00001";
    cate[0].iconImgUrl = "/images/user/main/m_care1_1.png";
    cate[0].name = "event";
    cate[0].tit = "이벤트";
    cate[0].titInfo = "※ 후원할인이 적용되지 않는 품목입니다.";
    cate[0].prods = new Product[3];
    cate[0].prods[0] = new Product();
    cate[0].prods[0].imgFileName = "00f9447291374571b64a622503ed3cfc.png";
    cate[0].prods[0].name = "디퓨져 선물세트";
    cate[0].prods[0].price = 36000;
    cate[0].prods[0].prodId = "000900010";
    cate[0].prods[0].url = "/user/product/detail?no=000900010";
    cate[0].prods[0].isHeart = false;
    cate[0].prods[0].stockNum = 99;
    cate[0].prods[0].tags = new String[]{"인기", "베스트", "신상품", "이벤트", "추천", "기획"};
    
    cate[0].prods[1] = new Product();
    cate[0].prods[1].imgFileName = "00f9447291374571b64a622503ed3cfc.png";
    cate[0].prods[1].name = "디퓨져 선물세트";
    cate[0].prods[1].price = 36000;
    cate[0].prods[1].prodId = "000900011";
    cate[0].prods[1].url = "/user/product/detail?no=000900011";
    cate[0].prods[1].isHeart = true;
    cate[0].prods[1].stockNum = 0;
    cate[0].prods[1].tags = new String[]{"추천", "기획", "신상품"};
    
    cate[0].prods[2] = new Product();
    cate[0].prods[2].imgFileName = "5b0707a1607e49b5ab39c7ca50809a52.png";
    cate[0].prods[2].name = "1>IDI SOAGEN LATTE - 클렌징 밀크";
    cate[0].prods[2].price = 32500;
    cate[0].prods[2].prodId = "000900012";
    cate[0].prods[2].url = "/user/product/detail?no=000900012";
    cate[0].prods[2].isHeart = true;
    cate[0].prods[2].stockNum = 9;
    cate[0].prods[2].tags = new String[]{"기획", "이벤트"};


    cate[1].cateId = "00002";
    cate[1].iconImgUrl = "/images/user/main/m_care2_2.png";
    cate[1].name = "cleansing";
    cate[1].tit = "Cleansing care Line";
    cate[1].prods = new Product[3];
    cate[1].prods[0] = new Product();
    cate[1].prods[0].imgFileName = "00f9447291374571b64a622503ed3cfc.png";
    cate[1].prods[0].name = "디퓨져 선물세트";
    cate[1].prods[0].price = 36000;
    cate[1].prods[0].prodId = "000900010";
    cate[1].prods[0].url = "/user/product/detail?no=000900010";
    cate[1].prods[0].isHeart = false;
    cate[1].prods[0].stockNum = 99;
    cate[1].prods[0].tags = new String[]{"인기", "이벤트", "추천", "기획"};
    
    cate[1].prods[1] = new Product();
    cate[1].prods[1].imgFileName = "00f9447291374571b64a622503ed3cfc.png";
    cate[1].prods[1].name = "디퓨져 선물세트";
    cate[1].prods[1].price = 36000;
    cate[1].prods[1].prodId = "000900011";
    cate[1].prods[1].url = "/user/product/detail?no=000900011";
    cate[1].prods[1].isHeart = true;
    cate[1].prods[1].stockNum = 0;
    cate[1].prods[1].tags = new String[]{"추천", "기획", "신상품"};
    
    cate[1].prods[2] = new Product();
    cate[1].prods[2].imgFileName = "5b0707a1607e49b5ab39c7ca50809a52.png";
    cate[1].prods[2].name = "1>IDI SOAGEN LATTE - 클렌징 밀크";
    cate[1].prods[2].price = 32500;
    cate[1].prods[2].prodId = "000900012";
    cate[1].prods[2].url = "/user/product/detail?no=000900012";
    cate[1].prods[2].isHeart = true;
    cate[1].prods[2].stockNum = 9;
    cate[1].prods[2].tags = new String[]{"기획", "이벤트"};


    cate[2].cateId = "00003";
    cate[2].iconImgUrl = "/images/user/main/m_care3_3.png";
    cate[2].name = "gift set";
    cate[2].tit = "Gift Set - Coffee";
    cate[2].titInfo = "※ 후원할인이 적용되지 않는 품목입니다.";
    cate[2].prods = new Product[2];
    cate[2].prods[0] = new Product();
    cate[2].prods[0].imgFileName = "00f9447291374571b64a622503ed3cfc.png";
    cate[2].prods[0].name = "디퓨져 선물세트";
    cate[2].prods[0].price = 36000;
    cate[2].prods[0].prodId = "000900010";
    cate[2].prods[0].url = "/user/product/detail?no=000900010";
    cate[2].prods[0].isHeart = false;
    cate[2].prods[0].stockNum = 99;
    cate[2].prods[0].tags = new String[]{"추천", "기획", "신상품"};
    
    cate[2].prods[1] = new Product();
    cate[2].prods[1].imgFileName = "00f9447291374571b64a622503ed3cfc.png";
    cate[2].prods[1].name = "디퓨져 선물세트";
    cate[2].prods[1].price = 36000;
    cate[2].prods[1].prodId = "000900011";
    cate[2].prods[1].url = "/user/product/detail?no=000900011";
    cate[2].prods[1].isHeart = true;
    cate[2].prods[1].stockNum = 0;
    cate[2].prods[1].tags = new String[]{"추천", "기획", "신상품"};


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
		<jsp:param name="isLogin" value="${isLogin }" />
		<jsp:param name="userName" value="<%=userName%>" />
	</jsp:include>
	<jsp:include page="../../include/modal.jsp" flush="false" >		
		<jsp:param name="isLogin" value="${isLogin }" />
		<jsp:param name="userName" value="<%=userName%>" />
	</jsp:include>
	${goodsList }<br/>
	///////////////////////////
	${category }
    <section class="product-sect sect-cate">
        <div class="layout">
            <div class="product-cate-notice">
                <p><i class="la la-arrows-h"></i> 좌우로 이동할 수 있습니다.</p>
            </div>
            <div class="product-cate-container">
                <div class="swiper product-cate-swiper">
                    <div class="swiper-wrapper">
                    <%-- <% if(cate.length > 0) { %>
                        <div class="swiper-slide">
                            <button type="button" class="btn product-cate" data-cate="total">
                                <div class="product-cate-img">
                                    <img src="/images/user/product/prod_tab1.png" alt="total">
                                </div>
                                <div class="product-cate-name">total</div>
                            </button>
                        </div>
                    <% } %> --%>
                    <c:if test='${category.size()>0 }'>
                        <div class="swiper-slide">
                            <button type="button" class="btn product-cate" data-cate="total">
                                <div class="product-cate-img">
                                    <img src="/images/user/product/prod_tab1.png" alt="total">
                                </div>
                                <div class="product-cate-name">total</div>
                            </button>
                        </div>
                    </c:if>
                    <c:forEach var="item" items="${category }" varStatus="status">
                        <div class="swiper-slide">
                            <button type="button" class="btn product-cate" data-cate="${item.categoryName }">
                                <div class="product-cate-img">
                                    <img src="/api/v1/file/${item.basicImageId }" alt="${item.categoryName }">
                                </div>
                                <div class="product-cate-name">${item.categoryName }</div>
                            </button>
                        </div>
                <%--         <div class="swiper-slide">
                            <button type="button" class="btn product-cate" data-cate="${item.categoryName }">
                                <div class="product-cate-img">
                                    <img src="/api/v1/file/${item.basicImageId }" alt="${item.categoryName }">
                                </div>
                                <div class="product-cate-name">${item.categoryName }</div>
                            </button>
                        </div>
                        <div class="swiper-slide">
                            <button type="button" class="btn product-cate" data-cate="${item.categoryName }">
                                <div class="product-cate-img">
                                    <img src="/api/v1/file/${item.basicImageId }" alt="${item.categoryName }">
                                </div>
                                <div class="product-cate-name">${item.categoryName }</div>
                            </button>
                        </div> --%>
                    </c:forEach>
                <%--     <% for(Category ct : cate) { %>
                        <div class="swiper-slide">
                            <button type="button" class="btn product-cate" data-cate="<%=ct.name%>">
                                <div class="product-cate-img">
                                    <img src="<%=ct.iconImgUrl%>" alt="<%=ct.name%>">
                                </div>
                                <div class="product-cate-name"><%=ct.name%></div>
                            </button>
                        </div>
                        <div class="swiper-slide">
                            <button type="button" class="btn product-cate" data-cate="<%=ct.name%>">
                                <div class="product-cate-img">
                                    <img src="<%=ct.iconImgUrl%>" alt="<%=ct.name%>">
                                </div>
                                <div class="product-cate-name"><%=ct.name%></div>
                            </button>
                        </div>
                        <div class="swiper-slide">
                            <button type="button" class="btn product-cate" data-cate="<%=ct.name%>">
                                <div class="product-cate-img">
                                    <img src="<%=ct.iconImgUrl%>" alt="<%=ct.name%>">
                                </div>
                                <div class="product-cate-name"><%=ct.name%></div>
                            </button>
                        </div>
                    <% } %> --%>
                    </div>
                </div>
                <div class="swiper-button-prev product-cate-swiper-btn prev">
                    <i class="la la-angle-left" aria-hidden="true"></i>
                </div>
                <div class="swiper-button-next product-cate-swiper-btn next">
                    <i class="la la-angle-right" aria-hidden="true"></i>
                </div>
            </div>

        </div>
    </section>

    <section class="product-sect sect-board-controller">
        <div class="layout">
            <div class="bdProduct-controller">
                <div class="bdProduct-controller-total">
                    <p class="txt">total에 총 <span class="num">${goodsList.size() }</span>개의 상품이 있습니다.</p>
                </div>
                <div class="bdProduct-controller-orders">
                    <button type="button" class="btn bdProduct-controller-order new active">
                        <div class="icon"><i class="la la-check"></i></div>
                        <div class="txt">신상품순</div>
                    </button>
                    <button type="button" class="btn bdProduct-controller-order sale">
                        <div class="icon"><i class="la la-check"></i></div>
                        <div class="txt">판매순</div>
                    </button>
                    <button type="button" class="btn bdProduct-controller-order review">
                        <div class="icon"><i class="la la-check"></i></div>
                        <div class="txt">리뷰순</div>
                    </button>
                    <button type="button" class="btn bdProduct-controller-order low">
                        <div class="icon"><i class="la la-check"></i></div>
                        <div class="txt">낮은가격순</div>
                    </button>
                    <button type="button" class="btn bdProduct-controller-order high">
                        <div class="icon"><i class="la la-check"></i></div>
                        <div class="txt">높은가격순</div>
                    </button>
                </div>
            </div>
        </div>
    </section>

    <section class="product-sect sect-board-list">
        <div class="layout">
      	 	<!-- 어쩔수가없다,, -->
      	 	<% 
			    String[] iconList = {"추천", "인기", "이벤트", "예약", "신상품", "세일", "베스트", "기획"};
			    request.setAttribute("iconList", iconList);
			%>
<%--        	<c:set var="iconList" value="['추천','인기','이벤트','예약','신상품','세일','베스트','기획']"/> --%>
       		<c:forEach var="category" items="${category }" varStatus="status">
           <div class="bdProduct-wrap product-board active" data-cate="${category.categoryName}">
              <div class="bdProduct-cate-tit-wrap">
                    <div class="bdProduct-cate-tit">
                        <h3 class="tit">${category.categoryName2}</h3>
                        <c:if test="${category.memberDc == 'N'}">
 	                       <p class="info">※ 후원할인이 적용되지 않는 품목입니다.</p>
                        </c:if>
                    </div>
                </div>
                <div class="bdProduct">
                    <ul class="bdProduct-list">
				        <c:forEach var="goods" items="${goodsList }" varStatus="innerStatus">
							<c:if test='${category.categoryCode == goods.category }'>
<!-- <<<<<<< HEAD -->
<%--  							${goods.goodsNo }  --%>
<!-- 		                        <li class="bdProduct-li"> -->
<!-- 		                            <div class="bdProduct-li-overlay"></div> -->
<!-- 		                            <div class="bdProduct-li-btns"> -->
<!-- 		                                <button type="button" class="btn bdProduct-li-btn btn-prod-heart"> -->
<!-- 		                                    <i class="la la-heart-o"></i> -->
<!-- 		                                </button> -->
<!-- 		                                <button type="button" class="btn bdProduct-li-btn btn-prod-cart"> -->
<!-- 		                                    <i class="la la-shopping-cart"></i> -->
<!-- 		                                </button> -->
<!-- 		                            </div> -->
<!-- 		                             <div class="bdProdcut-view"> -->
<!-- 		                               <div class="bdProduct-tags"> -->
<%-- 											<c:if test="${(goods.nowStock <= 0 && goods.useStock == 'Y') || goods.soldOut == 1 }"> --%>
<!-- 			                                    <div class="product-tag bdProduct-tag" data-tag="품절"><span>품절</span></div> -->
<%-- 											</c:if> --%>
<%-- 											<c:if test='${ (goods.nowStock >0 && goods.useStock == "Y" && goods.soldOut != 1) || (goods.useStock =="N" && goods.soldOut !=1) }'> --%>
<%-- 									        	<c:set var="iconCount" value="0"/> --%>
<%-- 												<c:forEach var="icon" items="${goods.icon }" varStatus="iconStatus"> --%>
<%-- 										 			<c:if test="${icon == 1 && iconCount <=1 }"> --%>
<%-- 				                                        <div class="product-tag bdProduct-tag" data-tag="${iconList[iconStatus.index] }"><span>${iconList[iconStatus.index] }</span></div> --%>
<%-- 													</c:if> --%>
<%-- 												 	<c:if test="${icon == 1 && iconCount >1 }"> --%>
<%--  				                                        <div class="product-tag bdProduct-tag" data-tag="${iconList[iconStatus.index] }"><span>${iconList[iconStatus.index] }</span></div>  --%>
<%-- 														<c:if test="${ iconCount ==2 }"> --%>
														
<!-- 					                                        <div class="popovers-wrap"> -->
<!-- 					                                            <button type="button" class="product-tag bdProduct-tag btn btn-popovers btn-more-tag" data-tag="더보기"> -->
<!-- 					                                                <div class="icon"></div> -->
<!-- 					                                                <span class="txt"><i class="la la-3x la-ellipsis-h"></i></span> -->
<!-- 					                                            </button> -->
<!-- 					                                            <div class="popovers"> -->
<!-- 					                                                <div class="popovers-box"> -->
<!-- 					                                                    <button type="button" class="btn btn-close popovers-close"></button> -->
<!-- 					                                                    <div class="popovers-main"> -->
<%-- 					                                                    <c:set var="iconCount" value="${iconCount+1 }"/> --%>
<%-- 														</c:if> --%>
<%-- 	                                                    <div class="product-tag bdProduct-tag" data-tag="${iconList[iconStatus.index] }"><span>${iconList[iconStatus.index] }</span></div> --%>
<%-- 														<c:if test="${iconStatus.last }"> --%>
<!-- 						                                                </div> -->
<!-- 						                                            </div> -->
<!-- 						                                        </div> -->
<!-- 						                                    </div> -->
<%-- 														</c:if> --%>
<%-- 													</c:if> --%>
<%-- 													<c:if test="${ icon == 1}"> --%>
<%-- 														<c:set var="iconCount" value="${iconCount+1 }"/> --%>
<%-- 													</c:if> --%>
<%-- 												</c:forEach> --%>
<!-- 												<div> -->
<!-- 												</div> -->
<%-- 											</c:if> --%>
<!-- 		                                </div> -->
<!-- 		                                <div class="bdProduct-img"> -->
<%-- 		                                    <img src="/api/v1/file/${goods.midiumImage }" alt=""> --%>
<!-- 		                                </div> -->
<!-- 		                            </div> -->
		                            
		                            
		                            
<!-- 		                            <div class="bdProduct-tit"> -->
<%-- 		                                <p class="txt">${goods.goodsName }</p> --%>
<!-- 		                            </div> -->
<!-- 		                            <div class="bdProduct-price fw-bold"> -->
<!-- 		                                <p class="txt"> -->
<%-- 		                                    <span class="icon">${goods.price }₩</span> --%>
<%-- 	 	                                    <span class="num"> <%=Integer.toString(p.price).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%> </span>  --%>
<!-- 		                                </p> -->
<!-- 		                            </div> -->
		                        <li class="bdProduct-li" >
                                    <a href="/user/product/${goods.goodsNo }" class="bdProduct-link">
                                    	<input type="hidden" name="sno" value="${goods.sno }"> 
                                        <div class="bdProduct-li-overlay"></div>
                                        <div class="bdProduct-li-btns">
                                            <button type="button" class="btn bdProduct-li-btn btn-prod-heart">
                                                <i class="la la-heart-o"></i>
                                            </button>
                                            <button type="button" class="btn bdProduct-li-btn btn-prod-cart">
                                                <i class="la la-shopping-cart"></i>
                                            </button>
                                        </div>
                                         <div class="bdProdcut-view">
                                           <div class="bdProduct-tags">
                                                <c:if test="${(goods.nowStock <= 0 && goods.useStock == 'Y') || goods.soldOut == 1 }">
                                                    <div class="product-tag bdProduct-tag" data-tag="품절"><span>품절</span></div>
                                                </c:if>
                                                <c:if test='${ (goods.nowStock >0 && goods.useStock == "Y" && goods.soldOut != 1) || (goods.useStock =="N" && goods.soldOut !=1) }'>
                                                    <c:set var="iconCount" value="0"/>
                                                    <c:forEach var="icon" items="${goods.icon }" varStatus="iconStatus">
                                                         <c:if test="${icon == 1 && iconCount <=1 }">
                                                            <div class="product-tag bdProduct-tag" data-tag="${iconList[iconStatus.index] }"><span>${iconList[iconStatus.index] }</span></div>
                                                        </c:if>
                                                         <c:if test="${icon == 1 && iconCount >1 }">
    <%-- 				                                        <div class="product-tag bdProduct-tag" data-tag="${iconList[iconStatus.index] }"><span>${iconList[iconStatus.index] }</span></div> --%>
                                                            <c:if test="${ iconCount ==2 }">
                                                            
                                                                <div class="popovers-wrap">
                                                                    <button type="button" class="product-tag bdProduct-tag btn btn-popovers btn-more-tag" data-tag="더보기">
                                                                        <div class="icon"></div>
                                                                        <span class="txt"><i class="la la-3x la-ellipsis-h"></i></span>
                                                                    </button>
                                                                    <div class="popovers">
                                                                        <div class="popovers-box">
                                                                            <button type="button" class="btn btn-close popovers-close"></button>
                                                                            <div class="popovers-main">
                                                                            <c:set var="iconCount" value="${iconCount+1 }"/>
                                                            </c:if>
                                                            <div class="product-tag bdProduct-tag" data-tag="${iconList[iconStatus.index] }"><span>${iconList[iconStatus.index] }</span></div>
                                                            <c:if test="${iconStatus.last }">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${ icon == 1}">
                                                            <c:set var="iconCount" value="${iconCount+1 }"/>
                                                        </c:if>
                                                    </c:forEach>
                                                    <div>
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="bdProduct-img">
                                                <img src="/api/v1/file/${goods.midiumImage }" alt="">
                                            </div>
                                        </div>
                                        
                                        
                                        
                                        <div class="bdProduct-tit">
                                            <p class="txt">${goods.goodsName }</p>
                                        </div>
                                        <div class="bdProduct-price fw-bold">
                                            <p class="txt">
                                                <span class="icon">${goods.price }₩</span>
        <%-- 	                                    <span class="num"> <%=Integer.toString(p.price).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%> </span> --%>
                                            </p>
                                        </div>
                                    </a>
		                        </li>
							</c:if>

			       		</c:forEach>
                    </ul>
                </div> 
            </div>
        </c:forEach>
<%-- 
            <% for(Category ct : cate) { %>
            <% } %> --%>

        </div>
    </section>


    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>

<script src="/js/user/pages/product/product_list.js"></script>


</body>
</html>
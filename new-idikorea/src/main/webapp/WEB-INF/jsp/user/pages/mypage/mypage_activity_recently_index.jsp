<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeMypageActivityRecently";
    // sub banner tit
	String pagename = "mypage";
	String pagetxt = "최근 본 상품";
	String navId = "070508";

	// ex
    // Boolean isLogin = false; 
    Boolean isLogin = true; 
    String userName = "이디";

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
        String date;

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
    prods[0].date = "2024-07-21";
    
    prods[1].imgFileName = "00f9447291374571b64a622503ed3cfc.png";
    prods[1].name = "디퓨져 선물세트";
    prods[1].option = "[치프리아 + 디퓨져(리프 그린)]";
    prods[1].fund = 1;
    prods[1].sum = 1;
    prods[1].price = 36000;
    prods[1].prodId = "000900011";
    prods[1].url = "/user/product/detail?no=000900011";
    prods[1].date = "2024-07-23";
    
    prods[2].imgFileName = "5b0707a1607e49b5ab39c7ca50809a52.png";
    prods[2].name = "1>IDI SOAGEN LATTE - 클렌징 밀크";
    prods[2].option = "";
    prods[2].fund = 1;
    prods[2].sum = 1;
    prods[2].price = 32500;
    prods[2].prodId = "000900012";
    prods[2].url = "/user/product/detail?no=000900012";
    prods[2].date = "2024-08-11";

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
	<jsp:param name="cssBaseLinks" value="user/before/board" />	
    <jsp:param name="cssLinks" value="vendors/font-awesome/font-awesome.min" />	
	<jsp:param name="cssLinks" value="vendors/line-awesome/line-awesome.min" />	
	<jsp:param name="cssLinks" value="vendors/line-awesome/line-awesome-font-awesome.min" />
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


    <section class="sub-sect sect-containers">
        <div class="layout">

			<div class="sub-containers">
				
				<section class="sub-sect sect-container sect-menus">
					<button type="button" class="btn btn-sub-menus">
						<img src="/images/user/common/my_left_btn.png" alt="게시판메뉴">
					</button>
					<div class="modal-wrap modal-sub-menus-wrap">
						<div class="modal modal-sub-menus">
							<div class="modal-top">
								<button type="button" class="btn btn-close">
									<img src="/images/user/common/top_close_white.png" alt="닫기">
								</button>
							</div>
							<div class="modal-main">
								<div class="sub-menus-tit">마이페이지</div>
                                
								<jsp:include page="../board/board_menu_list.jsp" flush="false" >
                                    <jsp:param name="isAccount" value="false" />	
                                    <jsp:param name="isGuide" value="false" />	
                                </jsp:include>
					
							</div>
							<div class="modal-bottom"></div>
						</div>
					</div>

				</section>
                <section class="sub-sect sect-container sect-views">
                    <div class="sub-views-tit"><%=pagetxt%></div>
                    <form>
                        <div class="sub-views mypage-views">
                            <div class="sub-view">
                                <div class="bdNormal-wrap basket-board">
                                    <div class="bdNormal-top">
                                        <span>총 <strong id="total">2</strong>건의 상품이 있습니다.</span>
                                        <div class="bdNormal-filter">
                                            <ul class="list">
                                                <li>
                                                    <span>제조사</span>
                                                    <ul class="bdNormal-filter-switch">
                                                        <li><button onclick="ordeyBySel(1)"><img src="/images/user/mypage/re_up.png"></button></li>
                                                        <li><button onclick="ordeyBySel(2)"><img src="/images/user/mypage/re_down.png"></button></li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <span>상품명</span>
                                                    <ul class="bdNormal-filter-switch">
                                                        <li><button onclick="ordeyBySel(3)"><img src="/images/user/mypage/re_up.png"></button></li>
                                                        <li><button onclick="ordeyBySel(4)"><img src="/images/user/mypage/re_down.png"></button></li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <span>가격</span>
                                                    <ul class="bdNormal-filter-switch">
                                                        <li><button onclick="ordeyBySel(5)"><img src="/images/user/mypage/re_up.png"></button></li>
                                                        <li><button onclick="ordeyBySel(6)"><img src="/images/user/mypage/re_down.png"></button></li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <span>적립금</span>
                                                    <ul class="bdNormal-filter-switch">
                                                        <li><button onclick="ordeyBySel(7)"><img src="/images/user/mypage/re_up.png"></button></li>
                                                        <li><button onclick="ordeyBySel(8)"><img src="/images/user/mypage/re_down.png"></button></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                            <label for="" class="input-box bdNormal-filter-order">
                                                <select id="pageSize" onchange="pageSizeSel()">
                                                    <option value="10">10개씩 정렬</option>
                                                    <option value="20">20개씩 정렬</option>
                                                    <option value="30">30개씩 정렬</option>
                                                    <option value="50">50개씩 정렬</option>
                                                </select>
                                            </label>
                                        </div>
                                    </div>
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
                                                    <li class="bdNormal-headli bdBasket-headli bdBasket-rowli col-price">
                                                        <span class="txt">판매가</span>
                                                    </li>
                                                </ul>
                                            </li>
                    
                                            <% for(Product p : prods) { %>
                                            <li class="bdNormal-li bdBasket-li btn">
                                                <ul class="bdBasket-rowlist">
                                                    <li class="bdBasket-rowli col-img">
                                                        <img src="/images/user/sample/<%=p.imgFileName%>" alt="<%=p.name%>">
                                                    </li>
                                                    <li class="bdBasket-rowli col-name">
                                                        <a href="<%=p.url%>" class="txt"><%=p.name%><%=p.option%></a>
                                                        <div class="pad">
                                                            <div class="fund">
                                                                <span class="unit">적립금 : </span>
                                                                <span class="txt"><%=p.fund%></span>
                                                            </div>
                                                        </div>
                                                        <div class="pad">
                                                            <div class="price" data-price="<%=p.price%>">
                                                                <span class="unit">판매가 : </span>
                                                                <span class="txt">
                                                                    <span class="num"><%=Integer.toString(p.price).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%></span>원
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="bdBasket-rowli col-fund">
                                                        <span class="txt"><%=p.fund%></span>
                                                    </li>
                                                    <li class="bdBasket-rowli col-price" data-price="<%=p.price%>">
                                                        <span class="txt">
                                                            <span class="num"><%=Integer.toString(p.price).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%></span>원
                                                        </span>
                                                    </li>
                                                </ul>
                                            </li>
                                            <% } %>
                                        </ul>
                                    </div>

                                    
									<!-- paging -->
                                    <%
                                    int pageCurrent = 2;
                                    int pageLast = 4;
                                    %>  
                                    <div class="boardPaging">   
                                        <ul class="clearFix">
                                        <%
                                            if(pageCurrent > 1) {
                                        %>
                                            <li class="pagingFirst">       
                                                <a href="./" class="paging" title="첫 페이지로 이동">           
                                                    <i class="la la-angle-double-left"></i>       
                                                </a>   
                                            </li>     
                                        <%
                                            }
                                            if(pageCurrent - 1 >= 1 && pageCurrent < pageLast ) {
                                        %>
                                            <li class="pagingLast">       
                                                <a href="./" class="paging" title="이전 페이지 블록으로 이동">           
                                                    <i class="la la-angle-left"></i>       
                                                </a>   
                                            </li>
                                        <%
                                            }
                                        %> 
                                        <%
                                            for(int i = 1; i <= pageLast; i++) {
                                                if(i == pageCurrent) {
                                        %>
                                            <li class="pagingCurrent"><strong><%=i%></strong>   </li>   												
                                        <%
                                                } else {
                                        %>
                                        <li><a href="./" class="paging" title="<%=i%> 페이지로 이동"><%=i%></a>   </li>   
                                        <%
                                                }
                                            }
                                        %>
                                        <%
                                            if(pageCurrent + 1 > 1 && pageCurrent < pageLast ) {
                                        %>
                                            <li class="pagingNext">       
                                                <a href="./" class="paging" title="다음 페이지로 이동">           
                                                    <i class="la la-angle-right"></i>       
                                                </a>   
                                            </li>  
                                        <%
                                            }
                                            if(pageCurrent < pageLast) {
                                        %>  
                                            <li class="pagingLast">       
                                                <a href="./" class="paging" title="끝 페이지로 이동">           
                                                    <i class="la la-angle-double-right"></i>       
                                                </a>   
                                            </li>  
                                        <%
                                            }
                                        %>  
                                        </ul>
                                    </div>
                                    <!-- //paging -->
                                </div>
                            </div>
                        </div>
                    </form>
                </section>
			</div>

        </div>
    </section>
    

    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->

<script defer src="/js/user/common/board.js"></script>
<script src="/js/user/pages/mypage/mypage_common_list.js"></script>


</body>
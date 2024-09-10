<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeMypageOrderCancel";
    // sub banner tit
	String pagename = "mypage";
	String pagetxt = "취소내역";
	String navId = "070402";

	// ex
    // Boolean isLogin = false; 
    Boolean isLogin = true; 
    String userName = "이디";

	// //ex


    // 주문내역 ex
    class Order {
        String date;
        String orderprod;
        int price;
        String state;
        
        Order() {}
        Order(String date, String orderprod, int price, String state) {
            this.date = date;
            this.orderprod = orderprod;
            this.price = price;
            this.state = state;
        }
    }
    Order[] ords = new Order[3];

    ords[0] = new Order("2024-08-23 12:11", "34>RIVIGEN OLIGO HAIR ESSENCE - 리비젠 올리고 헤어 에센스", 32500, "주문접수");
    ords[1] = new Order("2024-08-23 13:51", "1>IDI SOAGEN LATTE - 클렌징 밀크", 32500, "취소완료");
    ords[2] = new Order("2024-08-24 09:19", "34>RIVIGEN OLIGO HAIR ESSENCE - 리비젠 올리고 헤어 에센스", 13500, "결제시도");

    String payment = "depositor"; // 무통장결제
    // String payment = "account"; // 계좌결제
    // String payment = "card"; // 카드결제



    // //주문내역 ex
    


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
                                
                                <div class="bd">
                                    <!-- 게시판목록 -->
                                    <div class="bdNormal-wrap bd-wrap">
                                        <div class="bdNormal-top"></div>
                                        <div class="bdNormal bdMypage">

                                            <ul class="bdNormal-list bdMypage-list">
                                                <%-- board head --%>
                                                <li class="bdNormal-li bdNormal-head">
                                                    <ul class="bdNormal-headlist bdMypage-headlist bdMypage-rowlist">
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-num">
                                                            <span class="txt">NO</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-order-date">
                                                            <span class="txt">취소일시</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-else">
                                                            <span class="txt">취소사유</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-order-prod">
                                                            <span class="txt">주문상품</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-else">
                                                            <span class="txt">주문방법</span>
                                                        </li>
                                                    </ul>
                                                </li>

                                                <% int count = 1; %>
                                                <% for(Order reg : ords) { %>
                                                <li class="bdNormal-li bdMypage-li">
                                                    <ul class="bdNormal-rowlist bdMypage-rowlist">
                                                        <li class="bdNormal-rowli bdMypage-rowli col-num">
                                                            <span class="txt"><%=count%></span>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-order-date">
                                                            <span class="txt"><%=reg.date%></span>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-else">
                                                            <span class="txt">취소사유</span>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-order-prod">
                                                            <div class="group flex-column">
                                                                <button type="button" class="btn btn-open-view"><%=reg.orderprod%></button>
                                                                <dl class="else">
                                                                    <span class="unit">주문번호 : </span>
                                                                    <span class="txt">0123141412</span>
                                                                </dl>
                                                                <div class="laptop">
                                                                    <div class="dl order-date">
                                                                        <span class="unit">취소일시 : </span>
                                                                        <span class="txt"><%=reg.date%></span>
                                                                    </div>
                                                                </div>
                                                                <div class="pad">
                                                                    <div class="dl else">
                                                                        <span class="unit">취소사유 : </span>
                                                                        <span class="txt">사유</span>
                                                                    </div>
                                                                </div>
                                                                <div class="pad">
                                                                    <div class="dl cancel">
                                                                        <span class="txt">무통장</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-else">
                                                            <span class="txt">무통장</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <% 
                                                    count++;
                                                    } 
                                                %>
                                                <% if(count == 0) { %>
                                                <li class="bdNormal-li bdMypage-li empty">
                                                    <img src="/images/user/common/no_image.png" alt="no_image" class="icon">
                                                    <p class="txt">주문내역이 없습니다.</p>
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
                                    <!-- //게시판목록 -->

                                    <!-- 상세 -->
                                    <div class="bdNormal-wrap v-wrap">
                                        <div class="bdNormal-top">
                                            <h4 class="bdNormal-tit">취소내역 자세히보기</h4>
                                        </div>
										<div class="bdNormal">
											<ul class="bdNormal-list bdMypage-list">
                                                <%-- board head --%>
												<li class="bdNormal-li bdMypage-li">
                                                    <ul class="bdNormal-headlist bdMypage-headlist bdMypage-rowlist">
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-num">
                                                            <span class="txt">NO</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-else">
                                                            <span class="txt">상품코드</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-ordername">
                                                            <span class="txt">상품명</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-else">
                                                            <span class="txt">수량</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-else">
                                                            <span class="txt">금액</span>
                                                        </li>
                                                    </ul>
												</li>
                                                <%-- board head --%>

                                                <li class="bdNormal-li bdMypage-li">
                                                    <ul class="bdNormal-rowlist bdMypage-rowlist">
                                                        <li class="bdNormal-rowli bdMypage-rowli col-num">
                                                            <span class="txt">1</span>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-else">
                                                            <span class="txt">3</span>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-ordername">
                                                            <span class="txt">상품명</span>
                                                            <div class="group flex-column">
                                                                <div class="pad">
                                                                    <div class="ordername">
                                                                        <span class="unit">상품명 : </span>
                                                                        <span class="txt">상품명</span>
                                                                    </div>
                                                                </div>
                                                                <div class="pad">
                                                                    <div class="else">
                                                                        <span class="unit">상품코드 : </span>
                                                                        <span class="txt">3</span>
                                                                    </div>
                                                                </div>
                                                                <div class="pad">
                                                                    <div class="else">
                                                                        <span class="unit">수량 : </span>
                                                                        <span class="txt">1</span>
                                                                    </div>
                                                                </div>
                                                                <div class="pad">
                                                                    <div class="else">
                                                                        <span class="unit">금액 : </span>
                                                                        <span class="txt">32500</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-else">
                                                            <span class="txt">1</span>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-else">
                                                            <span class="txt">32500</span>
                                                        </li>
                                                    </ul>
                                                </li>
											</ul>
										</div>
                                        <div class="bdNormal-btns-wrap">
                                            <div class="bdNormal-btns">
                                                <div class="bdNormal-btn-wrap add-wrap">
                                                    <button class="btn bdNormal-btn btn-list">목록</button>
                                                </div>
                                            </div>
                                        </div>
									</div>
                                    <!-- 상세 -->

                                    <!-- form -->
                                    <!-- form -->

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
<!-- <script src="/js/user/pages/mypage/mypage_regular_history_index.js"></script> -->
<script src="/js/user/pages/mypage/mypage_order_history_index.js"></script>


</body>
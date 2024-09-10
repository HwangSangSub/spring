<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeMypageOrderHistory";
    // sub banner tit
	String pagename = "mypage";
	String pagetxt = "주문내역/배송조회";
	String navId = "070401";

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
                                        <div class="bdNormal-top">
                                            <div class=""></div>
                                            <div class="mypage-view-filter">
                                                <label class="input-box">
                                                    <select name="" id="">
                                                        <option value="all">전체</option>
                                                        <optiocsn value="">주문접수</optiocsn>
                                                        <option value="">취소완료</option>
                                                        <option value="">배송완료</option>
                                                        <option value="">결제시도</option>
                                                    </select>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="bdNormal bdMypage">

                                            <ul class="bdNormal-list bdMypage-list">
                                                <%-- board head --%>
                                                <li class="bdNormal-li bdNormal-head">
                                                    <ul class="bdNormal-headlist bdMypage-headlist bdMypage-rowlist">
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-num">
                                                            <span class="txt">NO</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-order-date">
                                                            <span class="txt">주문일시</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-order-prod">
                                                            <span class="txt">주문상품</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-price">
                                                            <span class="txt">금액</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-state">
                                                            <span class="txt">주문상태</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-else">
                                                            <span class="txt">주문취소</span>
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
                                                        <li class="bdNormal-rowli bdMypage-rowli col-order-prod">
                                                            <button type="button" class="btn btn-open-view"><%=reg.orderprod%></button>
                                                            <div class="group flex-column">
                                                                <div class="laptop">
                                                                    <div class="dl order-prod">
                                                                        <!-- <span class="unit">주문명 : </span> -->
                                                                        <span class="txt"><%=reg.orderprod%></span>
                                                                    </div>
                                                                </div>
                                                                <div class="laptop">
                                                                    <div class="dl order-date">
                                                                        <span class="unit">주문일시 : </span>
                                                                        <span class="txt c-red"><b><%=reg.date%></b></span>
                                                                    </div>
                                                                </div>
                                                                <div class="laptop">
                                                                    <div class="dl price">
                                                                        <span class="unit">금액 : </span>
                                                                        <span class="txt"><%=reg.price%>원</span>
                                                                    </div>
                                                                </div>
                                                                <div class="pad">
                                                                    <div class="dl state">
                                                                        <span class="unit">주문상태 : </span>
                                                                        <span class="txt"><%=reg.state%></span>
                                                                    </div>
                                                                </div>
                                                                <div class="pad">
                                                                    <div class="dl cancel">
                                                                        <span class="unit">주문취소 : </span>
                                                                        <div class="btn-wrap">
                                                                            <button type="button" class="btn mypage-btn btn-cancel <% if(reg.state == "주문접수") { %>active <% } %>">취소</button>
                                                                        </div>
                                                                        <span class="txt result <% if(reg.state != "주문접수") { %> active <% } %>">취소완료</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-price">
                                                            <span class="txt"><%=reg.price%></span>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-state">
                                                            <span class="txt"><%=reg.state%></span>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-else">
                                                            <button type="button" class="btn mypage-btn btn-cancel <% if(reg.state == "주문접수") { %>active <% } %>">취소</button>
                                                            <span class="txt result <% if(reg.state != "주문접수") { %> active <% } %>">취소완료</span>
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
                                    </div>
                                    <!-- //게시판목록 -->

                                    <!-- 상세 -->
                                    <div class="bdNormal-wrap v-wrap">
                                        <div class="bdNormal-top">
                                            <h4 class="bdNormal-tit">주문상세내역</h4>
                                            <p class="notice">※ <span class="c-emerald">결제시도</span>는 회원님께서 구매과정에서 <span class="c-emerald">결제를 취소한 상태</span>를 말합니다. 실제 결제는 이루어지지 않습니다.</p>
                                        </div>
										<div class="bdNormal">
											<ul class="bdNormal-list">
                                                <%-- board head --%>
												<li class="bdNormal-li">
                                                    <ul class="bdNormal-headlist bdOrder-headlist bdOrder-rowlist">
                                                        <li class="bdNormal-headli bdOrder-headli bdNormal-rowli bdOrder-rowli col-img">
                                                            <span class="txt">이미지</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdOrder-headli bdNormal-rowli bdOrder-rowli col-info">
                                                            <span class="txt">상품정보</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdOrder-headli bdNormal-rowli bdOrder-rowli col-else">
                                                            <span class="txt">단가</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdOrder-headli bdNormal-rowli bdOrder-rowli col-else">
                                                            <span class="txt">수량</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdOrder-headli bdNormal-rowli bdOrder-rowli col-else">
                                                            <span class="txt">판매가</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdOrder-headli bdNormal-rowli bdOrder-rowli col-else">
                                                            <span class="txt">배송추적</span>
                                                        </li>
                                                    </ul>
												</li>
                                                <%-- board head --%>

                                                <li class="bdNormal-li">
                                                    <ul class="bdNormal-rowlist bdOrder-rowlist">
                                                        <li class="bdNormal-rowli bdOrder-rowli col-img">
                                                            <img src="/images/user/sample/5b0707a1607e49b5ab39c7ca50809a52.png" alt="">
                                                        </li>
                                                        <li class="bdNormal-rowli bdOrder-rowli col-info">
                                                            <span class="txt">상품정보</span>
                                                            <div class="pad">
                                                                <div class="else">
                                                                    <span class="unit">단가 : </span>
                                                                    <span class="txt">32500</span>
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
                                                                    <span class="unit">판매가 : </span>
                                                                    <span class="txt">32500</span>
                                                                </div>
                                                            </div>
                                                            <div class="pad">
                                                                <div class="else">
                                                                    <span class="unit">배송추적 : </span>
                                                                    <button type="button" class="btn mypage-btn">배송 추적</button>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="bdNormal-rowli bdOrder-rowli col-else">
                                                            <span class="txt">32500</span>
                                                        </li>
                                                        <li class="bdNormal-rowli bdOrder-rowli col-else">
                                                            <span class="txt">1</span>
                                                        </li>
                                                        <li class="bdNormal-rowli bdOrder-rowli col-else">
                                                            <span class="txt">32500</span>
                                                        </li>
                                                        <li class="bdNormal-rowli bdOrder-rowli col-else">
                                                            <button type="button" class="btn mypage-btn">배송 추적</button>
                                                        </li>
                                                    </ul>
                                                </li>
											</ul>
										</div>
									</div>
									<div class="bdNormal-wrap v-wrap">
                                        <div class="bdNormal-top">
                                            <h4 class="bdNormal-tit">주문자정보</h4>
                                        </div>
                                        <div class="bdNormal bdNormalL">
                                            <ul class="bdNormal-list bdNormalL-list">
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">주문자명</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">이디코리아</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">전화번호</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">031-207-4983</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">핸드폰번호</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">031-207-4983</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">이메일</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt"></span>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
									</div>
									<div class="bdNormal-wrap v-wrap">
                                        <div class="bdNormal-top">
                                            <h4 class="bdNormal-tit">배송정보</h4>
                                        </div>
                                        <div class="bdNormal bdNormalL">
                                            <ul class="bdNormal-list bdNormalL-list">
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">받는자명</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">이디코리아</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">전화번호</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">031-207-4983</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">핸드폰번호</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">031-207-4983</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">우편번호</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">440-310</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">주소</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">경기 수원시 장안구 이목동 23-5</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
									</div>
									<div class="bdNormal-wrap v-wrap">
                                        <div class="bdNormal-top">
                                            <h4 class="bdNormal-tit">결제금액</h4>
                                        </div>
                                        <div class="bdNormal bdNormalL">
                                            <ul class="bdNormal-list bdNormalL-list">
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">총주문금액</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">32,500 원</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">배송비</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">0 원</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">회원할인</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">0 원</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">쿠폰할인</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">0 원</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">적립금사용</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">0 원</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">결제금액</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">32,500 원</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
									</div>
									<div class="bdNormal-wrap v-wrap">
                                        <div class="bdNormal-top">
                                            <h4 class="bdNormal-tit">결제수단</h4>
                                            <% if(payment == "depositor" || payment == "account") { %>
                                            <div class="bdNormal-btn">현금영수증 신청</div>
                                            <% } %>
                                        </div>
                                        <div class="bdNormal bdNormalL">
                                            <ul class="bdNormal-list bdNormalL-list">
                                                <% if(payment == "depositor") { %>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">입금은행</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">농협</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">입금계좌</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">1076-12-090295</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">예금주명</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">김광수</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">입금자명</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">이디코리아</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <% } %> 
                                                <% if(payment == "account") { %>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">계좌이체</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">계좌이체</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <% } %> 
                                                <% if(payment == "depositor" || payment == "account") { %>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">현금영수증</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt"></span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <% } %>
                                                <% if(payment == "card") { %>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">카드 결제</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <span class="txt">카드 결제</span>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <% } %>
                                            </ul>
                                        </div>
									</div>
                                    <!-- 상세 -->

                                    <!-- form -->
                                    <div class="bdNormal-wrap fm-wrap">
                                        <div class="bdNormal-top">
                                            <h4 class="bdNormal-tit">주문취소</h4>
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
                                                <li class="bdNormal-li">
                                                    <div class="bdMypage-total">
                                                        <p>총금액</p>
                                                        <p class="total">32,500 원</p>
                                                    </div>
                                                </li>
											</ul>
										</div>
                                        <div class="bdNormal bdNormalL">
                                            <ul class="bdNormal-list bdNormalL-list">
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">취소사유</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <div class="bdNormal-inputs">
																<label class="input-box">
																	<select name="" id="" class="width_150px">
                                                                        <option value="">사유를 선택하세요</option>
                                                                    </select>
																</label>
															</div>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="" class="txt">방법선택</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <div class="bdNormal-inputs">
                                                                <label class="radio round">
																	<input type="radio" name="cancel" id="" class="" checked>
																	<span class="icon"></span>
																	<span class="txt">취소</span>
																</label>
															</div>
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
                                                <div class="bdNormal-btn-wrap modify-wrap">
                                                    <button class="btn bdNormal-btn">주문취소</button>
                                                </div>
                                            </div>
                                        </div>
									</div>
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
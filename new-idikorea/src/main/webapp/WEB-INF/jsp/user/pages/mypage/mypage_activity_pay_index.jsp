<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeMypageActivityPay";
    // sub banner tit
	String pagename = "mypage";
	String pagetxt = "IDI페이 관리";
	String navId = "070501";

	// ex
    // Boolean isLogin = false; 
    Boolean isLogin = true; 
    String userName = "이디";

	// //ex


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


<jsp:include page="../../include/common.jsp" flush="false" >
    <jsp:param name="pagetype" value="<%=pagetype%>" />
	<jsp:param name="pagename" value="<%=pagename%>" />
	<jsp:param name="pagetxt" value="<%=pagetxt%>" />	
	<jsp:param name="navId" value="<%=navId%>" />
	<jsp:param name="cssBaseLinks" value="user/before/board" />	
    <jsp:param name="cssLinks" value="vendors/font-awesome/font-awesome.min" />	
	<jsp:param name="cssLinks" value="vendors/line-awesome/line-awesome.min" />	
	<jsp:param name="cssLinks" value="vendors/line-awesome/line-awesome-font-awesome.min" />	
    <jsp:param name="cssLinks" value="user/compile/pages/basketOrder/style" />	
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
                                
                                <div class="bdNormal-wrap">
                                    <div class="bdNormal">
                                        <ul class="bdNormal-list">
                                            <li class="bdNormal-li bdNormalL-li basket-payment-method required">
                                                <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                    <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                        <span class="txt">결제방식</span>
                                                    </li>
                                                    <li class="bdNormal-rowli bdNormalL-rowli">
                                                        <div class="basket-orderer-inputs">
                                                            <label class="radio round">
                                                                <input type="radio" name="payment-method" id="" value="IDI페이" class="idi-pay" checked>
                                                                <span class="icon"></span>
                                                                <span class="txt">IDI페이</span>
                                                            </label>
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
                                        </ul>
                                    </div>
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
<script src="/js/user/pages/basket/basket_order.js"></script>
<script src="/js/user/pages/mypage/mypage_activity_pay_index.js"></script>


</body>
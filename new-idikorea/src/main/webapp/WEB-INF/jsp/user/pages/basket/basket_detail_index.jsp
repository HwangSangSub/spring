<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeSub";
    // sub banner tit
	String pagename = "basket";
	String pagetxt = "비회원 주문내역/배송조회";
	String navId = "000304";

	// ex
    // Boolean isLogin = false; 
    Boolean isLogin = true; 
    String userName = "이디";
    int hasFund = 912333;
    // Boolean isRegular = false; // 일반배송
    Boolean isRegular = Boolean.parseBoolean(request.getParameter("regular")); // 정기배송일 시

	// //ex


    

    String payment = "depositor"; // 무통장결제
    // String payment = "account"; // 계좌결제
    // String payment = "card"; // 카드결제


%>

<jsp:include page="../../include/common.jsp" flush="false" >
    <jsp:param name="pagetype" value="<%=pagetype%>" />
	<jsp:param name="pagename" value="<%=pagename%>" />
	<jsp:param name="pagetxt" value="<%=pagetxt%>" />	
	<jsp:param name="navId" value="<%=navId%>" />
    <jsp:param name="cssLinks" value="vendors/font-awesome/font-awesome.min" />	
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

    <section class="sub-sect sect-tit">
        <div class="layout">
            <div class="sub-tit-wrap">
                <h3 class="sub-views-tit"><%=pagetxt%></h3>
            </div>
        </div>
    </section>

    <section class="basket-sect sect-inquiry active">
        <div class="layout">
            <div class="box basket-inquiry">
                <div class="basket-inquiry-input">
                    
                    <label for="" class="input-box bg-gray">
                        <input type="text" id="" class="" placeholder="주문번호">
                    </label>
    
                    <button type="button" class="btn btn-rounding-black btn-open-info">비회원 주문조회</button>
                </div>

                <div class="basket-inquiry-ad">
                    <span>회원가입 후 다양한 혜택을 받아보세요!</span>
                    <a href="/member/terms/index.do" class="btn btn-rounding-border btn-open-join">회원가입</a>
                </div>
            </div>
        </div>
    </section>

    <section class="basket-sect sect-info">
        <div class="layout">
            <div class="basket-info">

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
                
            </div>
        </div>
    </section>
    
    

    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<script defer src="/js/user/common/board.js"></script>
<script src="/js/user/pages/basket/basket_detail_index.js"></script>


</body>
</html>
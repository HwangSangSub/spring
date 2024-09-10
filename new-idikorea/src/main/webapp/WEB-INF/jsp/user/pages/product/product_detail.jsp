<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.brighten.idi.goods.dto.GoodsDto" %>
<%@ page import="com.brighten.idi.util.SessionUtil" %>
<%

	request.setCharacterEncoding("UTF-8");
	String pagetype = "typeProductDetail";
	String pagename = "product";
	String pagetxt = "상품상세";
	String navId = "0201";

	// ex
    // Boolean isLogin = true; 
	Boolean isLogin = SessionUtil.isLogin();
// 	request.setAttribute("isLogin", SessionUtil.isLogin());
// 	request.setAttribute("memberNo", SessionUtil.getMemberNo());
	String userName = "이디";
    Boolean isRegular = false; // 일반배송
    //Boolean isRegular = true; // 정기배송일 시
	// //ex

	// 제품 ex
	String prodId = request.getParameter("no");
	String imgFileName = "8399351b8f5f41979727034a89d0e89d.png";
	String name = "디퓨져 선물세트";
	String intro = "디퓨져 + 이디 비타미나 치프리아 낱개 1개 선물세트 <br> (디퓨져만 3개 선택하시는 분은 향은 요청사항에 3가지 적어주시면 됩니다.)";
	String originCountry = "korea";
	String manufacturer = "제조사명";
	String preference = "★★☆☆☆";
	int sum = 0;
	int originalPrice = 40000;
	int lastPrice = 36000;
	int savedMoney = 0;
	String[][] options = {
		{"[치프리아 + 디퓨져(카사블랑카)]", "[치프리아 + 디퓨져(리프 그린)]"},
		{"투명병", "불투명병"}
	};
	String[] tags = {"인기", "이벤트", "추천", "기획"};
	String prodCate = "이벤트";
	String infoImgName = "00d4104296874384b5244376e3f4e000.jpg";
	Boolean isHeart = false;
	int stockNum = 999;

    class Product {
		String prodId;
        String imgFileName;
        String name;
        String url;
        int price;

        public Product() {}
    }
    Product[] related = new Product[5];
    for(int i=0; i < related.length; i++) {
        related[i] = new Product();
    }
	related[0].prodId = "000900110";
	related[0].imgFileName = "3b7e1445f9fc433b8ef7cf7091014e08.jpg";
	related[0].name = "15>IDI CLARIDERM MASCHERA - 마사지 팩(2024 입고예정)";
	related[1].prodId = "000900111";
	related[1].imgFileName = "3b7e1445f9fc433b8ef7cf7091014e08.jpg";
	related[1].name = "18>IDI SOLARE IDI BB CREMA 36 - 비비크림";
	related[2].prodId = "000900112";
	related[2].imgFileName = "3b7e1445f9fc433b8ef7cf7091014e08.jpg";
	related[2].name = "17>IDI SOLARE IDI 35/PA++ _ 자외선 차단제 35/PA++";
	related[3].prodId = "000900114";
	related[3].imgFileName = "3b7e1445f9fc433b8ef7cf7091014e08.jpg";
	related[3].name = "17>IDI SOLARE IDI 35/PA++ _ 자외선 차단제 35/PA++";
	related[4].prodId = "000900115";
	related[4].imgFileName = "3b7e1445f9fc433b8ef7cf7091014e08.jpg";
	related[4].name = "17>IDI SOLARE IDI 35/PA++ _ 자외선 차단제 35/PA++";
	// //제품 ex


	// 게시판 ex
	class Board {
		String tit;
		String writer;
		String cont;
		String day;
		String hits;
		
		Boolean isNotice;
		Boolean isReply;
		Boolean isSecret;
		Boolean isNew;
		String startDate;
		String endDate;
		String coverImg;
		String attachmentImg;
		int countStar;
		String[] attachmentFile;


		public Board() {}
		public Board(String tit, String writer, String cont, String day, String hits) {
			this.tit = tit;
			this.writer = writer;
			this.cont = cont;
			this.day = day;
			this.hits = hits;

            this.isNotice = false;
            this.isReply = false;
            this.isSecret = false;
            this.isNew = false;
		}

	}
	Board[] reviews = new Board[4];
	reviews[0] = new Board("제목1", "작성자", "내용1", "날짜", "조회수");
	reviews[0].attachmentImg = "첨부파일";
	reviews[1] = new Board("제목2", "작성자", "내용2", "날짜", "조회수");
	reviews[1].isNew = true;
	reviews[2] = new Board("제목3", "작성자", "내용3", "날짜", "조회수");
	reviews[2].isSecret = true;
	reviews[3] = new Board("제목4", "작성자", "내용4", "날짜", "조회수");
	reviews[3].isSecret = true;
	reviews[3].isNew = true;

	Board[] inquiries = new Board[4];
	inquiries[0] = new Board("제목1", "작성자", "내용1", "날짜", "조회수");
	inquiries[0].attachmentImg = "첨부파일";
	inquiries[1] = new Board("제목2", "작성자", "내용2", "날짜", "조회수");
	inquiries[2] = new Board("제목3", "작성자", "내용3", "날짜", "조회수");
	inquiries[3] = new Board("제목4", "작성자", "내용4", "날짜", "조회수");

	// //게시판 ex
%>

<script>
<%-- 	const isLogin = <%=isLogin%>; --%>
</script>
${goods }
<c:set var="goods" value="${goods}" />
<% 
GoodsDto dto = (GoodsDto) pageContext.getAttribute("goods");
System.err.println(dto);
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
<jsp:param name="cssLinks" value="layout/header" />	
<jsp:param name="cssLinks" value="layout/footer" />
<jsp:param name="cssLinks" value="visual/visual" />
<jsp:param name="cssLinks" value="pages/main/layout" />
--%>

${memberNo }
${memberNo }
${memberNo }
${memberNo }
${memberNo }
${memberNo }
${memberNo }
${memberNo }
1111111111111111111111111111111111111111

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


	<section class="detail-sect sect-view">
		<div class="layout">
			<div class="detail-view">
				<div class="detail-view-container">
					<div class="detail-view-tags-wrap">
						<div class="detail-view-tags">
							<% if(tags.length > 0) { %>
								<% int i = 0; %>
								<% for(String tag : tags) { %>
									<% if( i < 2 ){ %>
										<div class="product-tag detail-view-tag" data-tag="<%=tag%>"><span><%=tag%></span></div>
									
									<% } else { %>
										<% if( i == 2 ){ %>
											<div class="popovers-wrap">
												<button type="button" class="product-tag detail-view-tag btn btn-popovers btn-more-tag" data-tag="더보기">
													<div class="icon"></div>
													<span class="txt"><i class="la la-3x la-ellipsis-h"></i></span>
												</button>
												<div class="popovers">
													<div class="popovers-box">
														<button type="button" class="btn btn-close popovers-close"></button>
														<div class="popovers-main">
										<% } %>
															<div class="product-tag detail-view-tag" data-tag="<%=tag%>"><span><%=tag%></span></div>
										<% if( i == tags.length - 1 ){ %>
														</div>
													</div>
												</div>
											</div>
										<% } %>

									<% } %>
									<% i++; %>
								<% } %>
							<% } %>
						</div>
					</div>
					<div class="detail-view-img">
						<img src="/api/v1/file/${goods.midiumImage }" alt="<%=name%>">
					</div>
				</div>
				<div class="detail-view-container">
					<div class="detail-view-info-main">
						<div class="detail-view-cate"><%=prodCate%></div>
						<div class="detail-view-name">${goods.goodsName }</div>
						<div class="detail-view-intro">${goods.shortContent }</div>
						<div class="detail-view-price-container">
							<div class="detail-view-price-wrap">
								<div class="detail-view-price-origin"><i class="symbol">₩</i>  <%=dto.getConsumer().toString().replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%></div>
								<div class="detail-view-price-last"><i class="symbol">₩</i> <%=dto.getPrice().toString().replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%></div>
							</div>
							<div class="detail-view-actions">
								<button type="button" class="btn btn-like detail-view-like <%=isHeart?"active":""%></button>">
									<div class="icon">
										<i class="la la-heart<%=isHeart?"":"-o"%>"></i>
									</div>
									<div class="txt"></div>
								</button>
								<button type="button" class="btn btn-copy-url detail-view-copy">
									<div class="txt">상품URL 복사</div>
									<div class="icon">
										<i class="la la-clone"></i>
									</div>
								</button>
							</div>
						</div>
						<% if(isRegular) { %>
						<div class="detail-view-intro-regular">
							<p>정기구매시</p>
							<p><span class="c-red">3개월</span> 부터 <span class="c-red">10%</span> 할인</p>
						</div>
						<% } %>
					</div>
					<div class="detail-view-info-more">
						<ul class="detail-view-info-list">
							<li class="detail-view-info-li">
								<div class="detail-view-rowli detail-view-fund">
									<div class="tit">적립금</div>
									<div class="info"><span><i class="symbol">₩</i> <%=dto.getReserve()==null ? dto.getPrice()*dto.getSaveEmoneyPercent()/100 : dto.getReserve() %></span></div>
								</div>
							</li>
							<li class="detail-view-info-li">
								<div class="detail-view-rowli detail-view-id">
									<div class="tit">상품코드</div>
									<div class="info"><span><%=dto.getGoodsCode()%></span></div>
								</div>
							</li>
							<li class="detail-view-info-li">
								<div class="detail-view-rowli detail-view-country">
									<div class="tit">원산지</div>
									<div class="info"><span><%=dto.getCountry()==null? "" : dto.getCountry()%></span></div>
								</div>
							</li>
							<li class="detail-view-info-li">
								<div class="detail-view-rowli detail-view-manufacturer">
									<div class="tit">제조사</div>
									<div class="info"><span><%=dto.getMaker()==null? "" : dto.getMaker() %></span></div>
								</div>
							</li>
							<li class="detail-view-info-li">
								<div class="detail-view-rowli detail-view-preference">
									<div class="tit">선호도</div>
									<div class="info"><span><%=preference%></span></div>
								</div>
							</li>
							<c:set var="opt2Used" value="false"/><!-- opt2가 있는지없는지 -->
							<c:set var="firstOpt" value="false"/><!-- opt2가 있는 옵션이 첫번쨰인지 -->
							<input type="hidden" id="sno" value="${goods.optionList[0].sno }">
							<c:if test="${goods.optionList.size() > 1}">
								<li class="detail-view-info-li">
									<div class="detail-view-rowli detail-view-options">
										<div class="tit">옵션</div>
										<div class="info">
											<label class="detail-view-option-select">
												<select id="selectOpt1">
													<option>선택1</option>
													<c:forEach var="item" items="${goods.optionList }" varStatus="status">
														<option data-opt="${item.opt1 }" value="${item.sno }">${item.opt1 }
															<c:if test="${item.optionList.size() > 0 }">
																<c:set var="opt2Used" value="true"/>
																<c:if test="${status.index == 1 }">
																	<c:set var="firstOpt" value="true"/>
																</c:if>
															</c:if>
															<c:if test="${item.optionList == null }">
																-${item.price } 원
															</c:if>
														</option>
													</c:forEach>
												</select>
											</label>
										</div>
									</div>
								</li>
								<c:if test="${opt2Used eq 'true' }">
									<li class="detail-view-info-li" id='opt2Li' style="display:none">
										<div class="detail-view-rowli detail-view-options">
											<div class="tit" >옵션2</div>
											<div class="info">
												<label class="detail-view-option-select">
													<select id="selectOpt2">
														<option>선택2</option>
														<c:forEach var="item" items="${goods.optionList }" varStatus="status">
															<c:forEach var="innerItem" items="${item.optionList }">
																<option data-parent-opt="${innerItem.opt1 }" style="display:none" value="${innerItem.sno}">${innerItem.opt2 } - ${innerItem.price }원</option>
															</c:forEach>
														</c:forEach>
													</select>
												</label>
											</div>
										</div>
									</li>
								</c:if>
								
							</c:if>
							<%-- <% if( options.length > 0 ){ %>
								<% int i = 0; %>
								<% for(String[] option : options) { %>
									<li class="detail-view-info-li">
										<div class="detail-view-rowli detail-view-options">
											<div class="tit">옵션 <%=i > 0 ? i + 1 : ""%></div>
											<div class="info">
												<label class="detail-view-option-select">
													<select>
														<% for(String opt : option) { %>
															<option><%=opt%></option>
														<% } %>
													</select>
												</label>
											</div>
										</div>
									</li>
									<% i++; %>
								<% } %>
							<% } %> --%>
							<li class="detail-view-info-li">
								<div class="detail-view-rowli detail-view-sum">
									<div class="tit">수량</div>
									<div class="info">
										<div class="detail-view-sum-box">
											<button type="button" class="btn btn-sum-control btn-sum-minus detail-view-btn-minus">
												<div class="icon"><i class="la la-minus"></i></div>
											</button>
											<label class="input-box">
												<input type="num" class="sum" name="" id="ea" value="1" readonly>
											</label>
											<button type="button" class="btn btn-sum-control btn-sum-plus detail-view-btn-plus">
												<div class="icon"><i class="la la-plus"></i></div>
											</button>
										</div>
									</div>
								</div>
							</li>
							<li class="detail-view-info-li">
								<div class="detail-view-btns">
									<button type="button" class="btn btn-rounding-border btn-open-list">
										<span class="txt">상품목록</span>
									</button>
									<button type="button" id="saveHeart" class="btn btn-rounding-border btn-add-interest">
										<span class="txt">관심상품</span>
									</button>
								<% if(stockNum <= 0) { %>
									<button type="button" class="btn btn-rounding-border btn-add-notification">
										<span class="txt">입고알림신청</span>
									</button>

								<% } else { %>
									<button type="button" id="saveCart" class="btn btn-rounding-border btn-add-basket">
										<span class="txt">장바구니</span>
									</button>
									<% if(isRegular) { %>
									<button type="button" class="btn btn-rounding-black btn-buy-regular">
										<span class="txt">정기구매담기</span>
									</button>
									<% } else {  %>
									<button type="button" id="orderBtn" class="btn btn-rounding-black btn-buy">
										<span class="txt">상품구매</span>
									</button>
									<% }  %>
								<% }  %>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="detail-sect sect-tabs">
		<div class="layout">
			<ul class="sub-tabs-list detail-tabs-list">
				<li class="sub-tabs-li detail-tabs-li active">
					<div class="sub-tab detail-tab">상세정보</div>
				</li>
				<li class="sub-tabs-li detail-tabs-li">
					<div class="sub-tab detail-tab">관련상품</div>
				</li>
				<li class="sub-tabs-li detail-tabs-li">
					<div class="sub-tab detail-tab">배송안내</div>
				</li>
				<li class="sub-tabs-li detail-tabs-li">
					<div class="sub-tab detail-tab">교환 및 반품안내</div>
				</li>
				<li class="sub-tabs-li detail-tabs-li">
					<div class="sub-tab detail-tab">상품후기</div>
				</li>
				<li class="sub-tabs-li detail-tabs-li">
					<div class="sub-tab detail-tab">상품문의</div>
				</li>
			</ul>
		</div>
	</section>

	<section class="detail-sect sect-tabviews">
		<div class="layout">
			<ul class="detail-tabviews-list">

				<!-- 상세정보 -->
				<li class="detail-tabviews-li active">
					<div class="detail-tabview detail-tabview-info info">
						<div class="detail-tabview-tit">상세정보</div>
						<div class="detail-tabview-main">

							<div class="detail-tabview-info-img">
								<img src="/api/v1/file/${goods.contentImage }" alt="<%=name%> 설명">
							</div>

							<div class="bdNormal-wrap detail-tabview-bd-wrap active">
								<div class="bdNormal detail-tabview-bd detail-tabview-info-bd">
				
									<ul class="bdNormal-list">
				
										<li class="bdNormal-li bdNormalL-li">
											<ul class="bdNormal-rowlist bdNormalL-rowlist">
												<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
													<div class="detail-tabview-bd-tit">
														<span class="icon">
															<i class="la la-info-circle"></i>
														</span>
														<span class="txt">주의사항</span>
													</div>
												</li>
												<li class="bdNormal-rowli bdNormalL-rowli">
													<div class="detail-tabview-bd-cont">
														<ul class="detail-tabview-bd-list detail-tabview-precaution-list">
															<li class="detail-tabview-bd-li detail-tabview-precaution-li">
																<p>화장품을 사용하여 다음과 같은 이상이 있을 경우 사용을 중지하여야 하며, 계속 사용하면 증상을 악화시키므로 피부과 전문의 등에게 상담하세요.</p>
															</li>
															<li class="detail-tabview-bd-li detail-tabview-precaution-li">
																<p>사용중 붉은 반점, 부어오름, 가려움증 자극 등 이상이 있을 경우 상처가 있는 곳 또는 습진 및 피부염 등의 이상이 있는 부위에는 사용을 금할 것.</p>
															</li>
														</ul>
													</div>
												</li>
											</ul>
										</li>
										<li class="bdNormal-li bdNormalL-li">
											<ul class="bdNormal-rowlist bdNormalL-rowlist">
												<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
													<div class="detail-tabview-bd-tit">
														<span class="icon">
															<i class="la la-group"></i>
														</span>
														<span class="txt">후원회원 안내</span>
													</div>
												</li>
												<li class="bdNormal-rowli bdNormalL-rowli">
													<div class="detail-tabview-bd-cont">
														<ul class="detail-tabview-bd-list detail-tabview-sponsorship-list">
															<li class="detail-tabview-bd-li detail-tabview-sponsorship-li">
																<p>마리아의 아들 수도회 후원회에 가입해 주시면 <b class="c-black">항상 20% 할인</b>이 가능합니다. 후원회에 가입하신 본인에 한해서만 할인혜택이 주어지는 것이며, 처음 가입 시 <b class="c-black">최소 1년 이상</b>은 꾸준히 후원을 해주셔야 합니다.</p>
															</li>
															<li class="detail-tabview-bd-li detail-tabview-sponsorship-li">
																<p><b class="c-black">후원회원 탈퇴는 (031) 207-4982 으로 꼭 전화를 주셔야 가능합니다.</b></p>
															</li>
														</ul>
													</div>
												</li>
											</ul>
										</li>

									</ul>
								</div>
							</div>

						</div>
					</div>
				</li>
				<!-- //상세정보 -->

				<!-- 관련상품 -->
				<li class="detail-tabviews-li">
					<div class="detail-tabview detail-tabview-related related">
						<div class="detail-tabview-tit">관련상품</div>
						<div class="detail-tabview-main">

							<div class="swiper detail-tabview-related-swiper">
								<div class="swiper-wrapper">
									<% for(Product prod : related ) { %>
										<div class="swiper-slide">
											<a href="/user/product/detail?no=<%=prod.prodId%>" class="detail-taview-related-link">
												<div class="detail-tabview-related-product">
													<div class="detail-tabview-related-img">
														<img src="/images/user/sample/<%=prod.imgFileName%>" alt="<%=prod.name%>">
													</div>
													<div class="detail-tabview-related-name">
														<span><%=prod.name%></span>
													</div>
													<div class="detail-tabview-related-price"></div>
												</div>
											</a>
										</div>
									<% } %>
								</div>
							</div>
							<div class="swiper-button-prev detail-tabview-related-swiper-btn prev"></div>
							<div class="swiper-button-next detail-tabview-related-swiper-btn next"></div>
						</div>
					</div>
				</li>
				<!-- //관련상품 -->

				<!-- 배송안내 -->
				<li class="detail-tabviews-li">
					<div class="detail-tabview detail-tabview-delivery delivery">
						<div class="detail-tabview-tit">배송안내</div>
						<div class="detail-tabview-main">
							
							<div class="bdNormal-wrap detail-tabview-bd-wrap">
								<div class="bdNormal detail-tabview-bd detail-tabview-delivery-bd">
				
									<ul class="bdNormal-list">
				
										<li class="bdNormal-li bdNormalL-li">
											<ul class="bdNormal-rowlist bdNormalL-rowlist">
												<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
													<div class="detail-tabview-bd-tit">
														<span class="txt">유의사항</span>
													</div>
												</li>
												<li class="bdNormal-rowli bdNormalL-rowli">
													<div class="detail-tabview-bd-cont">
														<ul class="detail-tabview-bd-list detail-tabview-precaution-list">
															<li class="detail-tabview-bd-li detail-tabview-precaution-li">
																<p>배송비 : 기본배송료는 3,000원 입니다. (도서,산간,오지 일부지역은 배송비가 추가될 수 있습니다)</p>
																<p><b>30,000원 이상 구매시 무료배송입니다.</b></p>
															</li>
															<li class="detail-tabview-bd-li detail-tabview-precaution-li">
																<p>본 상품의 평균 배송일은 2일입니다. (입금 확인 후) 설치 상품의 경우 다소 늦어질수 있습니다.</p>
																<p>[배송예정일은 주문시점(주문순서)에 따른 유동성이 발생하므로 평균 배송일과는 차이가 발생할 수 있습니다.]</p>
															</li>
															<li class="detail-tabview-bd-li detail-tabview-precaution-li">
																<p>본 상품의 배송 가능일은 2일 입니다. 배송 가능일이란 본 상품을 주문 하신 고객님들께 상품 배송이 가능한 기간을 의미합니다.</p>
																<p>(단, 연휴 및 공휴일은 기간 계산시 제외하며 현금 주문일 경우 입금일 기준 입니다.)</p>
															</li>
														</ul>
													</div>
												</li>
											</ul>
										</li>

									</ul>
								</div>
							</div>
							
						</div>
					</div>
				</li>
				<!-- //배송안내 -->

				<!-- 교환 및 반품안내 -->
				<li class="detail-tabviews-li">
					<div class="detail-tabview detail-tabview-return return">
						<div class="detail-tabview-tit">교환 및 반품안내</div>
						<div class="detail-tabview-main">
							
							<div class="bdNormal-wrap detail-tabview-bd-wrap">
								<div class="bdNormal detail-tabview-bd detail-tabview-return-bd">
				
									<ul class="bdNormal-list">
				
										<li class="bdNormal-li bdNormalL-li">
											<ul class="bdNormal-rowlist bdNormalL-rowlist">
												<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
													<div class="detail-tabview-bd-tit">
														<span class="txt">유의사항</span>
													</div>
												</li>
												<li class="bdNormal-rowli bdNormalL-rowli">
													<div class="detail-tabview-bd-cont">
														<ul class="detail-tabview-bd-list detail-tabview-precaution-list">
															<li class="detail-tabview-bd-li detail-tabview-precaution-li">
																<p>반품 및 교환은 상품 수령 후 14일 이내에 신청하실 수 있습니다.</p>
															</li>
															<li class="detail-tabview-bd-li detail-tabview-precaution-li">
																<p>상품 불량 및 오배송 등의 이유로 반품하실 경우, 반품 배송비는 무료입니다.</p>
															</li>
															<li class="detail-tabview-bd-li detail-tabview-precaution-li">
																<p>단순변심 및 고객님의 사정으로 반품하실 경우, 반품 배송비는 고객님 부담입니다.</p>
															</li>
															<li class="detail-tabview-bd-li detail-tabview-precaution-li">
																<p>반품 신청 시 상품 확인 후 환불처리 됩니다. 수거일로부터 영업일 기준 10일 이내에 환불처리 되며, 카드사 사정에 따라 카드취소는 시일이 소요될 수 있습니다.</p>
															</li>
															<li class="detail-tabview-bd-li detail-tabview-precaution-li">
																<p>반품 접수 후 영업일 기준 2~5일 이내에 우체국 택배에서 직접 방문하여 상품을 수거하며, 고객님의 부재로 인한 반품 미수거시는 고객님께서 직접 이디코리아 쪽으로 발송해 주셔야 합니다.</p>
															</li>
															<li class="detail-tabview-bd-li detail-tabview-precaution-li">
																<p>반품은 택배 박스 안에 훼손되지 않게 포장 부탁드립니다.</p>
															</li>
															<li class="detail-tabview-bd-li detail-tabview-precaution-li">
																<p>일부 제품은 특정 고객님의 피부에 맞지 않을 수 있으며, 이는 상품 자체 품질의 문제로 볼 수 없습니다.</p>
															</li>
															<li class="detail-tabview-bd-li detail-tabview-precaution-li">
																<p>트러블(알러지, 붉은 반점, 가려움, 따가움) 발생 시 사진, 소견서, 진료확인서 중 1가지를 첨부하셔야 반품이 가능합니다. (단, 기타 제반 비용은 고객님의 부담입니다.)</p>
															</li>
															<li class="detail-tabview-bd-li detail-tabview-precaution-li">
																<p><b>반품/교환 불가 사유</b></p>
																<ul class="list style-bar">
																	<li>
																		<p>반품/교환 가능 기간을 초과하였을 경우</p>
																	</li>
																	<li>
																		<p>고객님의 과실로 상품 등이 멸실 또는 훼손된 경우.(단, 상품 내용을 확인하기 위해 박스 포장을 훼손한 경우는 제외. 튜브 용기의 마개를 개봉하였거나 용기에 부착되어 있는 테이프가 훼손된 경우 교환 불가)</p>
																	</li>
																	<li>
																		<p>포장을 개봉하였거나 포장이 훼손되어 상품 가치가 현저히 상실된 경우</p>
																	</li>
																	<li>
																		<p>시간의 경과에 의하여 재판매가 곤란할 정도로 상품의 가치가 현저히 감소한 경우</p>
																	</li>
																</ul>
															</li>
														</ul>
													</div>
												</li>
											</ul>
										</li>

									</ul>
								</div>
							</div>
							
						</div>
					</div>
				</li>
				<!-- //교환 및 반품안내 -->

				<!-- 상품후기 -->
				<li class="detail-tabviews-li">
					<div class="detail-tabview detail-tabview-review review">
						<div class="detail-tabview-tit">상품후기</div>
						<div class="detail-tabview-main">

							<div class="board">
								<!-- 게시판상세 -->
								<div class="boardDetail detail-tabview-v-wrap  v-wrap">   
									<div class="viewInfo">       
										<input type="hidden" name="adminGoodsno" value="140">       
										<h6>처음 써보았는데</h6>       
										<ul class="clearFix">           
											<li>작성자 : 너부리</li>           
											<li>작성일 : 2019-09-21</li>           
											<li>조회수 : 464</li>       
										</ul>       
										<!-- <a href="./" class="scrollList active">목록</a> -->   
									</div>   
									<div class="viewContent">
										향도 은은하고 좋았어요.<br>
										확실히 트러블도 다른 화장품 쓸 때 보다 거의 없었고요. <br>
										금세 다 써서 다시 주문하네요 ㅎㅎ 
									</div>       
									<div class="boardMenu">           
										<ul>               
											<li>                   
												<a href="javascript:void(0);" class="scrollList active btn-bd-list">목록</a>               
											</li>   
											<li>   
												<a href="javascript:void(0);" class="btn-bd-reply">답변</a>   
											</li>               
											<li>           
												<a href="/member/login/index.do">수정</a>               
											</li>               
											<li>           
												<a href="/member/login/index.do">삭제</a>               
											</li>           
										</ul>       
									</div>
								</div>
								<!-- //게시판상세 -->

	
								<!-- 새글 -->
								<jsp:include page="../board/board_common_form.jsp" flush="false" >	
									<jsp:param name="isReply" value="true" />	
									<jsp:param name="isSecret" value="true" />	
									<jsp:param name="isCountStar" value="true" />	
									<jsp:param name="isPw" value="true" />	
								</jsp:include>
								<!-- <div class="boardForm fm-wrap">
									<ul class="boardFieldset">   
										<li>       
											<label for="form_title">           
												<span title="필수입력항목">
													<i class="la la-check" aria-hidden="true"></i>
												</span> 제목       
											</label>       
											<input type="text" name="subject" value="" id="form_title" class="width_100pe" maxlength="100" required="" autofocus="">   
										</li>   
										<li>       
											<label for="form_name">           
												<span title="필수입력항목">
													<i class="la la-check" aria-hidden="true"></i>
												</span>           작성자       
											</label>       
											<input type="text" name="name" value="" id="form_name" class="width_125px" maxlength="20" required="">   
										</li>
										<li class="line-secret">   
											<span class="label">       비밀글   </span>   
											<p class="guide">※ 게시물을 작성자 · 관리자만 볼 수 있게 설정합니다.</p>   
											<div>       
												<input type="checkbox" name="secret" value="1" id="secret" class="checkBox">
												<label for="secret" class="checkbox">비밀글로 설정</label>   
											</div>
										</li>
										<li class="attachFile">   
											<span class="label">       본문첨부이미지   </span>  
											<div>       
												<input type="file" name="attachImage" title="첨부이미지">       
												<input type="text" title="첨부이미지" readonly="">       
												<button type="button" class="attachFile">파일첨부</button>       
												<button type="reset" class="attachFileReset">           
													<i class="la la-close" aria-hidden="true"></i> 첨부삭제       
												</button>   
											</div>
										</li>
										<li class="line-star">    
											<span class="label no_top">        평점    </span>    
											<div class="reviewScore radio_style">        
												<div>        
													<input type="radio" name="reviewScoreValue" id="score5" value="5" checked="">        
													<label for="score5"><span></span></label>        
													<label for="score5">★★★★★</label>        
													<input type="radio" name="reviewScoreValue" id="score4" value="4">        
													<label for="score4"><span></span></label>        
													<label for="score4">★★★★</label>        
													<input type="radio" name="reviewScoreValue" id="score3" value="3">        
													<label for="score3"><span></span></label>        
													<label for="score3">★★★</label>        
													<input type="radio" name="reviewScoreValue" id="score2" value="2">        
													<label for="score2"><span></span></label>        
													<label for="score2">★★</label>        
													<input type="radio" name="reviewScoreValue" id="score1" value="1">        
													<label for="score1"><span></span></label>        
													<label for="score1">★</label>        
													<div>    

													</div>
												</div>
											</div>
										</li>   
										<li>       
											<label for="form_content">           
												<span title="필수입력항목">
													<i class="la la-check" aria-hidden="true"></i>
												</span>
												내용       
											</label>       
											<textarea name="contents" id="form_content" rows="10" required=""></textarea>   
										</li>
										<li>   
											<label for="form_password">       
												<span title="필수입력항목">
													<i class="la la-check" aria-hidden="true"></i>
												</span>       비밀번호   
											</label>   
											<p class="guide">※ 게시물 수정 · 삭제, 비밀글 답변 확인에 사용될 4자리 비밀번호를 입력하세요.</p>   
											<input type="password" name="password" id="form_password" class="width_125px" maxlength="4" required="">
										</li>
									</ul>   
									<div class="boardMenu new_tab_boardMenu">       
										<ul class="clearFix">           
											<li>           
												<a href="./" class="active">저장</a>           
											</li>           
											<li>               
												<a href="javascript:void(0);" class="btn-bd-cancel">취소</a>           
											</li>       
										</ul>   
									</div>
								</div> -->
								<!-- 새글 -->
	
	
								<!-- 게시판목록 -->
								<div class="boardList detail-tabview-bd-wrap bd-wrap">       
									<div class="boardSearch">           
										<select name="searchOption" title="검색 범주를 선택하세요.">               
											<option value="all">전체</option>               
											<option value="subject">제목</option>               
											<option value="name">작성자</option>               
											<option value="contents">내용</option>           
										</select>           
										<input type="text" name="searchKeyword" title="검색어를 입력하세요.">           
										<button type="button" id="search">검색</button>       
									</div>   
									<div class="boardPostInfo">   
										<%
										int pageCurrent = 2;
										int pageLast = 4;
										%>    
										<span>총게시물 : <b><%=reviews.length%></b></span>       
										<span>페이지 : <%=pageCurrent%> / <%=pageLast%></span>   
									</div>
									<div class="boardTable">   
										<table>       
											<caption class="textAL">게시물목록</caption>       
											<thead>           
												<tr>               
													<th class="width_100px">번호</th>               
													<th>제목</th>               
													<th class="width_100px">첨부</th>               
													<th class="width_120px">작성자</th>               
													<th class="width_140px">작성일</th>               
													<th class="width_100px">조회수</th>           
												</tr>       
											</thead>       
											<tbody>       
												<%
													int j = reviews.length;
													for(Board r : reviews ) {
												%>
												<tr class="">           
													<td><%=j%></td>           
													<td>   
														<a href="javascript:void(0);" class="col-tit btn-bd-view" style="padding-left: 0px">
															<% if(r.isReply) {%> 
																<img src="/images/user/common/img_reply_idi.png" alt="답변" class="reply">
															<% } %>
															<% if(r.isNotice) {%> 
																<span class="noticeIcon" title="공지사항"><i class="fa fa-volume-up" aria-hidden="true"></i></span>
															<% } %>
															<% if(r.isSecret) {%> 
																<span class="lock"><i class="fa fa-unlock" aria-hidden="true"></i></i></span>
															<% } %>
															<span class="txt"><%=r.tit%></span>
															<% if(r.isNew) {%> 
																<img src="/images/user/main/news_new.png" class="newContent" alt="새글">
															<% } %>
														</a>           
														<div class="info">               
															<span>작성자: <%=r.writer%></span>               
															<span>작성일: <%=r.day%></span>               
															<span>조회수: <%=r.hits%></span>           
														</div>           
													</td>          
													<td></td>          
													<td class="textCut"><%=r.writer%></td>          
													<td><%=r.day%></td>          
													<td><%=r.hits%></td>      
												</tr>
												<%
													j--;
													}
												%>       
												<tr>           
													<td>30</td>           
													<td>   
														<a href="javascript:void(0);" class="col-tit btn-bd-view" style="padding-left: 0px">[10&gt;CREMA VISO PELLE SECCA - 건성 수분크림(2024년 입고예정)] 촉촉함이 달라요^^           </a>           
														<div class="info">               
															<span>작성자: 글라라 쭈양</span>               
															<span>작성일: 2018-04-18</span>               
															<span>조회수: 275</span>           
														</div>           
													</td>          
													<td>
														<span><i class="fa fa-file-text-o" aria-hidden="true"></i></span>
													</td>          
													<td class="textCut">글라라 쭈양</td>          
													<td>2018-04-18</td>          
													<td>275</td>      
												</tr>  
											</tbody>
										</table>
									</div>
									
									
									<!-- paging -->
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
		
									<div class="vNormal-btns detail-tabview-bd-btns">
										<a href="javascript:void(0);" class="btn btn-newbd vNormal-btn detail-tabview-bd-btn">새글</a>
									</div>
								 </div>          
								<!-- //게시판목록 -->
								
	

							</div>

						</div>
					</div>
				</li>
				<!-- //상품후기 -->


				<!-- 상품문의 -->
				<li class="detail-tabviews-li">
					<div class="detail-tabview detail-tabview-inquiry inquiry">
						<div class="detail-tabview-tit">상품후기</div>
						<div class="detail-tabview-main">

							<div class="board">
								<!-- 게시판상세 -->
								<div class="boardDetail detail-tabview-v-wrap v-wrap">   
									<div class="viewInfo">       
										<input type="hidden" name="adminGoodsno" value="140">       
										<h6>처음 써보았는데</h6>       
										<ul class="clearFix">           
											<li>작성자 : 너부리</li>           
											<li>작성일 : 2019-09-21</li>           
											<li>조회수 : 464</li>       
										</ul>       
										<!-- <a href="./" class="scrollList active">목록</a> -->   
									</div>   
									<div class="viewContent">
										향도 은은하고 좋았어요.<br>
										확실히 트러블도 다른 화장품 쓸 때 보다 거의 없었고요. <br>
										금세 다 써서 다시 주문하네요 ㅎㅎ 
									</div>       
									<div class="boardMenu">           
										<ul>               
											<li>                   
												<a href="javascript:void(0);" class="scrollList active btn-bd-list">목록</a>               
											</li>   
											<li>   
												<a  href="javascript:void(0);" class="btn-bd-reply">답변</a>   
											</li>               
											<li>           
												<a href="javascript:void(0);" class="btn-bd-modify">수정</a>               
											</li>               
											<li>           
												<a href="/member/login/index.do">삭제</a>               
											</li>           
										</ul>       
									</div>
								</div>
								<!-- //게시판상세 -->
								 
	
								<!-- 새글 -->
								<jsp:include page="../board/board_common_form.jsp" flush="false" >	
									<jsp:param name="isReply" value="true" />	
									<jsp:param name="isSecret" value="true" />	
									<jsp:param name="isPw" value="true" />	
								</jsp:include>
								 <!-- <div class="boardForm fm-wrap">
									<ul class="boardFieldset">   
										<li>       
											<label for="form_title">           
												<span title="필수입력항목">
													<i class="la la-check" aria-hidden="true"></i>
												</span> 제목       
											</label>       
											<input type="text" name="subject" value="" id="form_title" class="width_100pe" maxlength="100" required="" autofocus="">   
										</li>   
										<li>       
											<label for="form_name">           
												<span title="필수입력항목">
													<i class="la la-check" aria-hidden="true"></i>
												</span>           작성자       
											</label>       
											<input type="text" name="name" value="" id="form_name" class="width_125px" maxlength="20" required="">   
										</li>
										<li class="line-secret">   
											<span class="label">       비밀글   </span>   
											<p class="guide">※ 게시물을 작성자 · 관리자만 볼 수 있게 설정합니다.</p>   
											<div>       
												<input type="checkbox" name="secret" value="1" id="secret" class="checkBox">
												<label for="secret" class="checkbox">비밀글로 설정</label>   
											</div>
										</li>
										<li class="attachFile">   
											<span class="label">       본문첨부이미지   </span>  
											<div>       
												<input type="file" name="attachImage" title="첨부이미지">       
												<input type="text" title="첨부이미지" readonly="">       
												<button type="button" class="attachFile">파일첨부</button>       
												<button type="reset" class="attachFileReset">           
													<i class="la la-close" aria-hidden="true"></i> 첨부삭제       
												</button>   
											</div>
										</li>   
										<li>       
											<label for="form_content">           
												<span title="필수입력항목">
													<i class="la la-check" aria-hidden="true"></i>
												</span>
												내용       
											</label>       
											<textarea name="contents" id="form_content" rows="10" required=""></textarea>   
										</li>
										<li>   
											<label for="form_password">       
												<span title="필수입력항목">
													<i class="la la-check" aria-hidden="true"></i>
												</span>       비밀번호   
											</label>   
											<p class="guide">※ 게시물 수정 · 삭제, 비밀글 답변 확인에 사용될 4자리 비밀번호를 입력하세요.</p>   
											<input type="password" name="password" id="form_password" class="width_125px" maxlength="4" required="">
										</li>
									</ul>   
									<div class="boardMenu new_tab_boardMenu">       
										<ul class="clearFix">           
											<li>           
												<a href="javascript:void(0);" class="active">저장</a>                     
											</li>           
											<li>               
												<a  href="javascript:void(0);" class="btn-cancel btn-bd-cancel">취소</a>           
											</li>       
										</ul>   
									</div>
								</div> -->
								<!-- 새글 -->
	
	
								<!-- 게시판목록 -->
								 <div class="boardList detail-tabview-bd-wrap bd-wrap">       
									<div class="boardSearch">           
										<select name="searchOption" title="검색 범주를 선택하세요.">               
											<option value="all">전체</option>               
											<option value="subject">제목</option>               
											<option value="name">작성자</option>               
											<option value="contents">내용</option>           
										</select>           
										<input type="text" name="searchKeyword" title="검색어를 입력하세요.">           
										<button type="button" id="search">검색</button>       
									</div>   
									<div class="boardPostInfo">      
										<span>총게시물 : <b><%=reviews.length%></b></span>       
										<span>페이지 : <%=pageCurrent%> / <%=pageLast%></span>   
									</div>
									<div class="boardTable">   
										<table>       
											<caption class="textAL">게시물목록</caption>       
											<thead>           
												<tr>               
													<th class="width_100px">번호</th>               
													<th>제목</th>               
													<th class="width_100px">첨부</th>               
													<th class="width_120px">작성자</th>               
													<th class="width_140px">작성일</th>               
													<th class="width_100px">조회수</th>           
												</tr>       
											</thead>       
											<tbody>       
												<%
													int k = inquiries.length;
													for(Board bdI : inquiries ) {
												%>
												<tr class="">           
													<td><%=k%></td>           
													<td>   
														<a href="javascript:openBd('view');" class="col-tit" style="padding-left: 0px">
															<% if(bdI.isReply) {%> 
																<img src="/images/user/common/img_reply_idi.png" alt="답변" class="reply">
															<% } %>
															<% if(bdI.isNotice) {%> 
																<span class="noticeIcon" title="공지사항"><i class="fa fa-volume-up" aria-hidden="true"></i></span>
															<% } %>
															<% if(bdI.isSecret) {%> 
																<span class="lock"><i class="fa fa-unlock" aria-hidden="true"></i></i></span>
															<% } %>
															<span class="txt"><%=bdI.tit%></span>
															<% if(bdI.isNew) {%> 
																<img src="/images/user/main/news_new.png" class="newContent" alt="새글">
															<% } %>
														</a>           
														<div class="info">               
															<span>작성자: <%=bdI.writer%></span>               
															<span>작성일: <%=bdI.day%></span>               
															<span>조회수: <%=bdI.hits%></span>           
														</div>           
													</td>          
													<td></td>          
													<td class="textCut"><%=bdI.writer%></td>          
													<td><%=bdI.day%></td>          
													<td><%=bdI.hits%></td>      
												</tr>
												<%
													k--;
													}
												%>       
												<tr>           
													<td>30</td>           
													<td>   
														<a href="javascript:openBd('view');" class="col-tit" style="padding-left: 0px">[10&gt;CREMA VISO PELLE SECCA - 건성 수분크림(2024년 입고예정)] 촉촉함이 달라요^^           </a>           
														<div class="info">               
															<span>작성자: 글라라 쭈양</span>               
															<span>작성일: 2018-04-18</span>               
															<span>조회수: 275</span>           
														</div>           
													</td>          
													<td>
														<span><i class="fa fa-file-text-o" aria-hidden="true"></i></span>
													</td>          
													<td class="textCut">글라라 쭈양</td>          
													<td>2018-04-18</td>          
													<td>275</td>      
												</tr>  
											</tbody>
										</table>
									</div>  

									<!-- paging -->
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
	
									<div class="vNormal-btns detail-tabview-bd-btns">
										<a href="javascript:void(0);" class="btn btn-newbd vNormal-btn detail-tabview-bd-btn">새글</a>
									</div>
								 </div>          
								<!-- //게시판목록 -->
								
	
							</div>

						</div>
					</div>
				</li>
				<!-- //상품문의 -->
			</ul>
		</div>
	</section>
	<form id="orderForm" name="orderForm" action="/user/order/select-wrapping" method="POST">
		<input name="orderData" id="orderData" type='hidden' value=''>
	</form>


    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>


<script src="/js/user/common/board.js"></script>
<script src="/js/user/pages/product/product_detail.js"></script>
</body>
</html>
<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.brighten.idi.util.SessionUtil" %>
<%
	request.setCharacterEncoding("UTF-8");
	String pagetype = "typeMain";
	String pagename = "main";
	String pagetxt = "메인";
	String navId = "0001";
	Boolean isLogin = SessionUtil.isLogin(); 
	if(SessionUtil.isLogin()){
		request.setAttribute("isLogin", SessionUtil.isLogin());
		request.setAttribute("memberNo", SessionUtil.getMemberNo());
	}
	// ex
    // Boolean isLogin = true; 
    String userName = "이디";
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
	<jsp:include page="../../include/modal.jsp" flush="false" >		
		<jsp:param name="isLogin" value="<%=isLogin%>" />
		<jsp:param name="userName" value="<%=userName%>" />
	</jsp:include>
	<jsp:include page="../../include/header.jsp" flush="false" >
		<jsp:param name="navId" value="<%=navId%>" />		
		<jsp:param name="pagename" value="<%=pagename%>" />		
		<jsp:param name="isLogin" value="<%=isLogin%>" />
		<jsp:param name="userName" value="<%=userName%>" />
	</jsp:include>



    <section class="main-sect sect-visual">
		<div class="layout">
			<div class="swiper m_visual_swiper">

				<div class="swiper-wrapper">
				<c:forEach var="item" items="${slide }" varStatus="status">
					<div class="swiper-slide">
						<a href="${item.link }">
							<div class="image_wrap">
								<img src="/api/v1/file/${item.imageFileId }" alt="메인 비주얼 사진">
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
			<button type="button" class="swiper-button-prev m_visual_swiper_btn prev"><img src="/images/user/main/test_left.png"></button>
			<button type="button" class="swiper-button-next m_visual_swiper_btn next"><img src="/images/user/main/test_right.png"></button>
		</div>
    </section>

	<section class="main-sect sect-best">
		<h2 class="main-sect-tit">Best Seller</h2>
		<div class="m_best">
			<div class="m_best_content_wrap">
				<div class="m_best_btns m_swiper_round_btns">
					<button type="button" class="m_best_btn m_swiper_round_btn prev">
						<span></span>
						<span></span>
					</button>
					<button type="button" class="m_best_btn m_swiper_round_btn next">
						<span></span>
						<span></span>
					</button>
				</div>
				
				<div class="swiper m_best_txt_swiper">
					<div class="swiper-wrapper">

						<%-- ex --%>
						<%-- 
						<div class="swiper-slide">
							<a href="제품경로">
								<h3>제품이름</h3>
								<p>제품설명</p>
								<span>★★★★<span class="star_color_no">★</span></span>
								<ul class="clearfix m_best_pay_list">
									<li><strong>₩</strong>제품원가격</li>
									<li><strong>₩</strong>제품최종가격</li>
								</ul>
							</a>
						</div> 
						--%>
						
					</div>
				</div>

			</div>

			
			<div class="swiper m_best_img_swiper">
				<div class="swiper-wrapper">
					
					<%-- ex --%>
					<%-- 
					<div class="swiper-slide">
						<div class="<% if( i == 0 ){ %>active<% } %>">
							<div class="m_product_overlay m_best_overlay" onclick="javascript:goProdDetail(제품고유번호)"></div>
							<div class=""><img src="제품이미지주소"></div>
							<div class="btns-prod m_best_btn_list">
								<button type="button" class="btn btn-prod-heart" data-prod-id="제품고유번호">
									<i class="la la-heart-o"></i>
								</button>
								<button type="button" class="btn btn-prod-cart" data-prod-id="제품고유번호">
									<i class="la la-shopping-cart"></i>
								</button>
							</div>
						</div>
					</div>
					--%>

				</div>
			</div>
		</div>
	</section>


	<section class="main-sect sect-care">
		<h2 class="main-sect-tit">Care line</h2>
		<div class="layout">
			<div class="m_care_line_container">
				<ul class="m_care_line_list">
					<%-- ex --%>
					<%-- 
					<li class="" data-cate="${line.category}">
						<span class="m_care_line_name">카테고리명</span>
					</li>
					--%>
				</ul>
			</div>
			<div class="m_page m_care_page">
				<div class="m_page_btns m_care_btns m_swiper_round_btns">
					<button type="button" class="m_page_btn m_care_btn m_swiper_round_btn prev">
						<span></span>
						<span></span>
					</button>
					<button type="button" class="m_page_btn m_care_btn m_swiper_round_btn next">
						<span></span>
						<span></span>
					</button>
				</div>
				<div class="m_page_rep_wrap m_care_rep_wrap">
					<%-- ex --%>
					<%-- 
					<img class="m_page_rep_img m_care_rep_img" src="카테고리이미지경로${target.cateExImg}" alt="카테고리명">
					<div class="m_page_rep_txt m_care_rep_txt">
						<h2><span class="line">카테고리명</span> Care Line</h2>
						<h3 class="m_page_rep_desc m_care_rep_desc">
							<span>설명1</span>
							<span>설명2</span>
							<span>설명3</span>
						</h3>
					</div>
					--%>
				</div>
				<div class="m_page_list_img m_care_list_img">
					<div class="swiper m_care_list_swiper">
						<div class="swiper-wrapper">
							
							<%-- ex --%>
							<%-- product는 최대 4개까지 보이게 --%>
							<%-- 
							<div class="swiper-slide">
								<div class="m_products">
									<a href="상품경로" class="m_product">
										<div class="m_product_overlay m_care_overlay"></div>
										<img src="상품이미지경로" alt="">
										<div class="prodList_icon">
											<button class="prod_soldOut active" type="button" onclick="runout(140)">품절</button>
										</div>
										<span class="m_product_name">상품명</span>
										<div class="btns-prod m_care_prod_btns">
											<button type="button" class="btn btn-prod-heart" data-prod-id="제품고유번호">
												<i class="la la-heart-o"></i>
											</button>
										</div>
									</a>
								</div>
							</div>
							--%>
			
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="main-sect sect-brand">
		<div class="m_brand">
			<div>
				<h3>IDI Brand</h3>
				<h4>150년 피부의 사랑이<br> 피부의 역사를 다시 씁니다.</h4>
				<p>인류의 피부 건강을 지키고 만들기 위해 전세계 60여 개국 수천명의 피부과전문의들의 공동연구, 개발을 통해 탄생한 세계 최고 수준의 명품 화장품 IDI를 국내에 수입, 판매하고있으며 판매 수익금 전액은 한국 마리아의 아들 수도회가 추진하는 각종 사회복지 사업기금으로 사용되고 있습니다. </p>
				<a href="/service/company/index.do">자세히 보기</a>
			</div>
			<div>
				<!-- <img src="/images/user/main/m_brand_right.png" alt="right"> -->
			</div>
		</div>
	</section>


	<section class="main-sect sect-bia">
		<h2 class="main-sect-tit">Lavazza & Bialetti</h2>
		<div class="layout">
			<div class="m_page m_bia_page">
				<div class="m_page_btns m_bia_btns m_swiper_round_btns">
					<button type="button" class="m_page_btn m_bia_btn m_swiper_round_btn prev">
						<span></span>
						<span></span>
					</button>
					<button type="button" class="m_page_btn m_bia_btn m_swiper_round_btn next">
						<span></span>
						<span></span>
					</button>
				</div>
				<div class="m_page_rep_wrap m_bia_rep_wrap">
					<%-- ex --%>
					<%-- 
					<img class="m_page_rep_img m_bia_rep_img" src="카테고리이미지경로${target.cateExImg}" alt="카테고리명">
					<div class="m_page_rep_txt m_bia_rep_txt">
						<h2><span class="line">카테고리명</span> Care Line</h2>
						<h3 class="m_page_rep_desc m_bia_rep_desc">
							<span>설명1</span>
							<span>설명2</span>
							<span>설명3</span>
						</h3>
					</div>
					--%>
				</div>
				<div class="m_page_list_img m_bia_list_img">
					<div class="swiper m_bia_list_swiper">
						<div class="swiper-wrapper">
							
							<%-- ex --%>
							<%-- product는 최대 4개까지 보이게 --%>
							<%-- 
							<div class="swiper-slide">
								<div class="m_products">
									<a href="상품경로" class="m_product">
										<div class="m_product_overlay m_bia_overlay"></div>
										<img src="상품이미지경로" alt="">
										<div class="prodList_icon">
											<button class="prod_soldOut active" type="button" onclick="runout(140)">품절</button>
										</div>
										<span class="m_product_name">상품명</span>
										<div class="btns-prod m_bia_prod_btns">
											<button type="button" class="btn btn-prod-heart" data-prod-id="제품고유번호">
												<i class="la la-heart-o"></i>
											</button>
										</div>
									</a>
								</div>
							</div>
							--%>
			
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="main-sect sect-news">
		<h2 class="main-sect-tit">IDI news</h2>
		<div class="layout">
			<div class="main-news">
				<div class="main-news-box main-news-box2x event">
					<div class="main-news-box-img">
						<img src="/images/user/sample/event2.png" alt="evnet">
					</div>
					<div class="main-news-box-cont">
						<div class="main-news-box-cate">
							<span class="icon"></span>
							<span class="txt">Events</span>
						</div>
						<div class="main-news-box-tit">
							<span class="txt">
								한Lorem ipsum dolor sit, amet consectetur adipisicing elit. Molestiae placeat exercitationem quis odit dicta quibusdam, sed officia labore culpa dolores veniam modi pariatur recusandae praesentium doloremque reiciendis corporis? Velit, pariatur.
							</span>
						</div>
						<div class="main-news-box-desc">한Lorem ipsum dolor sit, amet consectetur adipisicing elit. Molestiae placeat exercitationem quis odit dicta quibusdam, sed officia labore culpa dolores veniam modi pariatur recusandae praesentium doloremque reiciendis corporis? Velit, pariatur.</div>
						<div class="main-news-box-day">
							<span class="icon">
								<img src="/images/user/main/m_event.png" alt="기간">
							</span>
							<span class="txt">2024-05-30 ~ 2024-06-30</span>
						</div>
					</div>
				</div>
				<div class="main-news-box main-news-box1x blog">
					<div class="main-news-box-cate">
						<span class="icon">
							<img src="/images/user/main/ico_blog.png" alt="blog">
						</span>
						<span class="txt">blog</span>
					</div>
					<div class="main-news-box-cont">
						<div class="main-news-box-tit">
							<span class="txt">
								글Lorem ipsum dolor sit amet consectetur, adipisicing elit. Expedita magnam delectus voluptates fuga? Ipsum atque ipsam corrupti? Asperiores, ab autem. Pariatur, amet. Sint, odio enim? Dolor nisi voluptatem nostrum ipsam.
							</span>
							<span class="icon new active"><img src="/images/user/main/news_new.png" alt="새 글"></span>
						</div>
						<div class="main-news-box-desc">글Lorem ipsum dolor sit, amet consectetur adipisicing elit. Enim, perferendis. Nisi blanditiis totam ad repellat dicta placeat expedita nobis non magni. Suscipit doloremque reprehenderit sint accusamus dolores quisquam explicabo recusandae.</div>
						<div class="main-news-box-day">
							<div class="txt">
								2024.06.04
							</div>
						</div>
					</div>
				</div>
				<div class="main-news-box main-news-box1x blog">
					<div class="main-news-box-cate">
						<span class="icon">
							<img src="/images/user/main/ico_blog.png" alt="blog">
						</span>
						<span class="txt">blog</span>
					</div>
					<div class="main-news-box-cont">
						<div class="main-news-box-tit">
							<span class="txt">
								글2222
							</span>
							<span class="icon new active"><img src="/images/user/main/news_new.png" alt="새 글"></span>
						</div>
						<div class="main-news-box-desc">글Lorem ipsum dolor sit, amet consectetur adipisicing elit. Enim, perferendis. Nisi blanditiis totam ad repellat dicta placeat expedita nobis non magni. Suscipit doloremque reprehenderit sint accusamus dolores quisquam explicabo recusandae.</div>
						<div class="main-news-box-day">
							<div class="txt">
								2024.06.04
							</div>
						</div>
					</div>
				</div>
				<div class="main-news-box main-news-box1x blog">
					<div class="main-news-box-cate">
						<span class="icon">
							<img src="/images/user/main/ico_blog.png" alt="blog">
						</span>
						<span class="txt">blog</span>
					</div>
					<div class="main-news-box-cont">
						<div class="main-news-box-tit">
							<span class="txt">
								글2222
							</span>
							<span class="icon new active"><img src="/images/user/main/news_new.png" alt="새 글"></span>
						</div>
						<div class="main-news-box-desc">글Lorem ipsum dolor sit, amet consectetur adipisicing elit. Enim, perferendis. Nisi blanditiis totam ad repellat dicta placeat expedita nobis non magni. Suscipit doloremque reprehenderit sint accusamus dolores quisquam explicabo recusandae.</div>
						<div class="main-news-box-day">
							<div class="txt">
								2024.06.04
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../../include/footer.jsp" flush="false" />
</div>


<script>
console.log("??")
//let a = `${bestSeller}`;
let bestSeller= JSON.parse(${bestSeller})
let careLine= JSON.parse(${careLine})
console.log(careLine)
</script>
<script src="/js/user/pages/main/main_swiper.js"></script>
<script src="/js/user/pages/main/main.js"></script>
<!-- <script>

console.log(${bestSeller})
window.myObject = ${bestSeller};
</script>	 -->


</body>
</html>
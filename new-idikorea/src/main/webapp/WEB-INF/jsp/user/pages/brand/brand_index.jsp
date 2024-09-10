<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeBrand";
    // sub banner tit
	String pagename = "since 1857";
	String pagetxt = "브랜드소개";
	String navId = "01";

	// ex
    // Boolean isLogin = false; 
    Boolean isLogin = true; 
    String userName = "이디";
    int hasFund = 912333;
    // Boolean isRegular = false; // 일반배송
    Boolean isRegular = Boolean.parseBoolean(request.getParameter("regular")); // 정기배송일 시

	// //exa


    


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


    <section class="brand-sect">
        <div class="layout">
			<div class="brand-gift">
				<h2>당신의 피부에 <span>IDI</span>가<br> 진정한 평화를 선물합니다.</h2>
				<p>IDI는 ‘마리아의 아들 수도회 피부전문병원 및 학회’를 의미합니다. 피부 분야에서는 세계 최고 수준의 의료 기술을 보유하고 있으며, 피부과 외에도 성형외과, 혈관외과, 방서선과, 아토피연구소, 피부암연구소 등을 통해 전세계에서 가장 주목받고 있는 피부 관련 의료 기술의 집합체 입니다.</p>
			</div>
        </div>
    </section>


    <section class="brand-sect sect-idi">
		<div class="brand-idi">
			<img src="/images/user/brand/brand_idi_logo.png" alt="">
			<p>IDI는 1857년 부터 지금까지 인류의 건강한 피부를 위한 각종 피부 신약과 화장품 개발을 위해 전세계 60여 개국 수천명의 피부과 전문의와 공동으로 끊임없는 연구와 의료활동을 계속하고 있습니다.</p>
		</div>
    </section>
    
	<section class="brand-sect sect-list">
		<div class="layout">
			<div class="brand-list">
				<ul class="">
					<li>
						<img src="/images/user/brand/brand_list1.png" alt="IDI KOREA">
						<h2>IDI KOREA</h2>
						<p>인류의 피부 건강을 지키고 만들기 위해 전세계 60여 개국 수천명의 피부과전문의들의 공동연구, 개발을 통해 탄생한 세계 최고 수준의 명품 화장품 IDI를 국내에 수입, 판매하고 있으며 판매 수익금 전액은 한국 마리아의 아들 수도회가 추진하는 각종 사회복지사업기금으로 사용되고 있습니다.</p>
					</li>
					<li>
						<a href="http://www.idifarmaceutici.com/" target="_blank">
							<img src="/images/user/brand/brand_list2.png" alt="IDI Farmaceutici s.r.l">
							<h2>IDI Farmaceutici s.r.l</h2>
						</a>
						<p>IDI병원에서 각종 임상 실험 자료를 바탕으로 연구 개발 된 다양한 피부질환 치료제 및 약용, 기능성 화장품을 전문적으로 생산하는 유명 제약회사 입니다.</p>
					</li>
				</ul>
			</div>
		</div>
	</section>


	<section class="brand-sect sect-history">
		<div class="layout">
			<div class="brand-history">
				<h2>IDI HISTORY</h2>
				<div class="swiper brand-history-swiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div class="brand-history-slide">
								<div class="brand-img-wrap">
									<img src="/images/user/brand/brand_slide1.png" alt="">
								</div>
								<div class="brand-history-slide-info">
									<h3>P.Luigi Maria Monti</h3>
									<p>1857년 이탈리아는 국가 통합의 시기로 온 국민들이 전쟁과 질병, 특히 피부병으로 큰 고통을 받던 시기였습니다. 당시 간호사이며 보조 약사였던 복자 <span>루이지 마리아 몬띠</span>가 피부병으로 고통받는 하느님의 자녀들을 치료하고 전쟁 고아들을 돌보기 위해 <span>마리아의 아들 수도회를 창설</span>하게 되었고 이어 로마에 만연된 피부질병을 치료하기 위해 <span>피부전문종합병원인 IDI병원을 설립</span>하게 되었습니다.</p>
								</div>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="brand-history-slide">
								<div class="brand-img-wrap">
									<img src="/images/user/brand/brand_slide2.png" alt="">
								</div>
								<div class="brand-history-slide-info">
									<h3>Antonio Ludovico Sala</h3>
									<p>1907년 의사, 약사, 화학자 등 각 분야의 전문가들로 구성된 마리아의 아들 수도회에 소속 된 수도자들이 교황 비오 10세의 후원으로 피부 신약을 연구하던 중, <span>안토니오 루도비코 살라(Antonio Ludovico Sala)</span> 수사신부에 의해 인류 최초의 백선균 치료 신약인 <span>살라 신부 크림(Crema P.Sala)이 개발</span> 되었으며 이 신약으로 인해 당시 이탈리아 전역에 창궐하던 백선균 전염병을 모두 몰아내게 되었고 이때부터 이탈리아에서는 마리아의 아들 수도회의 수도자들을 가리켜 <span>피부의 수도자(Frati della pelle)</span> 라고 부르며 칭송하기 시작하였습니다.</p>
								</div>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="brand-history-slide">
								<div class="brand-img-wrap">
									<img src="/images/user/brand/brand_slide3.png" alt="">
								</div>
								<div class="brand-history-slide-info">
									<h3>IDI Ospedale</h3>
									<p>IDI는 이러한 마리아의 아들 수도회의 역사와 전통을 이어 받아 피부 의학 분야에서 전세계 최고 수준의 의료기술을 보유하고 있으며 현재 피부과만 500여 병상을, 400여명의 피부과전문의가 년간 50만명 이상의 피부관련 환자를 치료하는 등 피부전문종합병원으로 세계 최대 규모와 권위를 자랑하게 되었으며 피부과 외에도 성형외과, 혈관외과, 방사선과, 아토피연구소, 피부암연구소 등을 통해 피부 관련 의료시술의 총아로써 전세계의 관심과 이목을 집중 받고 있습니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="brand-history-swiper-controller">
					<button class="btn brand-history-swiper-btn prev"><img src="/images/user/brand/brand_slide_left.png" alt=""></button>
					<button class="btn brand-history-swiper-btn next"><img src="/images/user/brand/brand_slide_right.png" alt=""></button>
					<div class="brand-history-swiper-pagination swiper-pagination"></div>
				</div>
			</div>
		</div> 
	</section>


	<section class="brand-sect sect-story">
		<div class="layout">
			<div class="brand-story">
				<div class="brand-story-tit">
					<p><b>160</b>년 피부 과학이 탄생시킨</p>
					<p>유럽이 인정한 프리미엄 화장품</p>
				</div>
				<div class="brand-story-poster-wrap">
					<div class="brand-story-poster">
						<h4>brand story</h4>
						<p>아름답고 건강한 IDI의 이야기를 들려드립니다.</p>
					</div>
					<div class="brand-story-list-wrap">
						<ul class="brand-story-list">
							<li class="brand-story-li">
								1857년 부터 끊임없는 연구와 의료활동을 해온 마리아의 아들 수도회의 피부 전문 수도자(피부과전문의, 간호사, 화학자)들을 전세계 60여 개국 수천명의 피부전문의와 공동연구를 통해 과학적으로 효능있는 IDI화장품을 생산하고 있습니다.	
							</li>
							<li class="brand-story-li">
								NOW IDI 병원은 산하에 별도의 제약회사(IDI Farmaceutici s.r.i.)를 설립해 피부병 치료약을 비롯한 각종, 기능성 및 약용 화장품과 일반 화장품을 개발 해오고 있으며, 이탈리아 화이자 (NervianoMS)를 인수해 운영해고 있습니다. IDI는 오늘도 최고 품질의 제품을 생산하기 위해 우수한 인적자원 확보와 연구개발 분야에 대한 지속적인 투자로 IDI화장품의 세계화
								에 앞장서고 있습니다.
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="brand-sect sect-rule">
		<div class="layout">
			<div class="brand-rule">
				<div class="brand-rule-philosophy">
					<h2>브랜드 철학</h2>
					<p>인간을 위한 피부 사랑의 철학으로 지내온 150년, 마리아의 아들 수도회의 피부 수도자들이 만든 IDI가 피부의 새로운 역사를 만들고 있습니다.</p>
				</div>
				<div class="brand-rule-list-wrap">
					<ol class="ordered-num-list circle brand-rule-list">
						<li>
							<b>IDI</b>는 아름다움만을 위한 화장품은 생산하지 않습니다.
						</li>
						<li>
							<b>IDI</b>는 아름다움 보다는 건강을 더욱 소중하게 생각합니다.
						</li>
						<li>
							<b>IDI</b>는 맑고 탄력 있는 피부 건강이 진정한 아름다움이라고 생각합니다.
						</li>
						<li>
							<b>IDI</b>는 피부를 건강하게 회복시키는 기능성 화장품만을 만듭니다.
						</li>
						<li>
							<b>IDI</b>는 많은 종류의 화장품 보다는 피부에 반드시 필요한 화장품만을 만듭니다.
						</li>
					</ol>
				</div>
			</div>
		</div>
	</section>


    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>


<script src="/js/user/pages/brand/brand_index.js"></script>


</body>
</html>
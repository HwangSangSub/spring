<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeGuideCenter";
    // sub banner tit
	String pagename = "site helper";
	String pagetxt = "고객센터";
	String navId = "000503";

	// ex
    // Boolean isLogin = false; 
    Boolean isLogin = true; 
    String userName = "이디";
    int hasFund = 912333;
    // Boolean isRegular = false; // 일반배송
    Boolean isRegular = Boolean.parseBoolean(request.getParameter("regular")); // 정기배송일 시

	// //ex


    
	// 게시판 ex
	class Faq {
		String question;
		String writer;
		String cont;

		public Faq() {}
		public Faq(String question, String writer, String cont) {
			this.question = question;
			this.writer = writer;
			this.cont = cont;
		}


	}
	Faq[] faqs = new Faq[4];
	faqs[0] = new Faq("질문 1", "작성자", "내용1");
	faqs[1] = new Faq("질문 2", "작성자", "내용2");
	faqs[2] = new Faq("질문 3", "작성자", "<br>a<br><br><br><br>a<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>");
	faqs[3] = new Faq("질문 3", "작성자", "내용4");


	// //게시판 ex

%>

<jsp:include page="../../include/common_beforestyle.jsp" flush="false" >
    <jsp:param name="pagetype" value="<%=pagetype%>" />
	<jsp:param name="pagename" value="<%=pagename%>" />
	<jsp:param name="pagetxt" value="<%=pagetxt%>" />	
	<jsp:param name="navId" value="<%=navId%>" />
	<jsp:param name="cssBaseLinks" value="user/before/board" />	
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



    <section class="guide-sect sect-private">
        <div class="layout">

			<div class="customer_wrap">
				<div class="cus_help">
					<div>
						<h3>무엇을 도와드릴까요?</h3>
						<p>문의사항이 있으시거나 궁금한 점이 있으시면 언제든지 찾아주십시요.<br> 고객님이 만족하실 때까지 최선을 다하겠습니다.</p>
					</div>
					<div>
						<ul class="clearfix">
							<li>TEL : 031-207-4983</li>
							<li>평 일 09:00 ~ 18:00</li>
							<li>MAIL : webmail@idikorea.com</li>
							<li>일요일 공휴일 휴무</li>
						</ul>
					</div>
				</div>
	
				<div class="cus_best">
					<h4>자주하는 질문 BEST 5</h4>
					<div class="boardList">
						<div class="boardFaq">
							<ul>
								<%for(Faq f: faqs){%>
								<li>
									<div class="question">
										<div class="postMark">
											<img src="/images/user/common/img_question.png" alt="질문">
										</div>
										<div class="cont">
											<%=f.question%> 
										</div>
									</div>
									<div class="answer">
										<div class="postMark">
											<img src="/images/user/common/img_answer.png" alt="질문">
										</div>
										<div class="cont">
											<%=f.cont%> 
										</div>
									</div>
								</li>
								<%}%>
								
							</ul>
						</div> 
					</div>
				</div>

	
				<div class="cus_shop">
					<h4>마이쇼핑</h4>
					<ul class="clearfix">
						<li>
							<a href="/my/myOrderList/index.do">
								<img src="/images/user/qna/c1.png" alt="주문내역 / 배송조회">
								<img src="/images/user/qna/c1_on.png" alt="주문내역 / 배송조회">
								<span>주문내역 / 배송조회</span>
							</a>
						</li>
						<li>
							<a href="/my/myShoppingInfo/emoney/index.do">
								<img src="/images/user/qna/c2.png" alt="적립금내역">
								<img src="/images/user/qna/c2_on.png" alt="적립금내역">
								<span>적립금내역</span>
							</a>
						</li>
						<li>
							<a href="/my/addrList/index.do">
								<img src="/images/user/qna/c3.png" alt="배송지관리">
								<img src="/images/user/qna/c3_on.png" alt="배송지관리">
								<span>배송지관리</span>
							</a>
						</li>
						<li>
							<a href="/my/wishList/index.do">
								<img src="/images/user/qna/c4.png" alt="상품보관함">
								<img src="/images/user/qna/c4_on.png" alt="상품보관함">
								<span>상품보관함</span>
							</a>
						</li>
						<li>
							<a href="/my/myQuestion/index.do">
								<img src="/images/user/qna/c5.png" alt="1:1문의">
								<img src="/images/user/qna/c5_on.png" alt="1:1문의">
								<span>1:1문의</span>
							</a>
						</li>
						<li>
							<a href="/my/myReview/index.do">
								<img src="/images/user/qna/c6.png" alt="상품후기">
								<img src="/images/user/qna/c6_on.png" alt="상품후기">
								<span>상품후기</span>
							</a>
						</li>
					</ul>
				</div>
	
				<div class="cus_use clearfix">
					<div>
						<h4>입금계좌안내</h4>
						<div>
							<img src="/images/user/qna/u1.png" alt="입금계좌안내">
							<ul class="clearfix">
								<li>
									<img src="/images/user/qna/u1-1.png" alt="농협">
									<p><span>농협 -</span> 김광수</p>
									<p>1076-12-090295</p>
								</li>
								<li>
									<img src="/images/user/qna/u1-2.png" alt="하나은행">
									<p><span>하나은행 -</span> 김광수</p>
									<p>460-910073-67207</p>
								</li>
								<li>
									<img src="/images/user/qna/u1-3.png" alt="SC제일은행">
									<p><span>SC제일은행 -</span> 김광수</p>
									<p>585-20-164746</p>
								</li>
							</ul>
						</div>
					</div>
					<div>
						<h4>이용안내</h4>
						<div>
							<img src="/images/user/qna/u2.png" alt="이용안내">
							<div>
								<p>저희 쇼핑몰을 이용해주시는 고객님께 감사드립니다. 주문, 배송, 반품, 결제등 쇼핑몰 이용에 관한 전반적인 가이드입니다. 행복한 쇼핑 되시길 바랍니다. </p>
								<a href="/service/manual/index.do">자세히 보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
            
        </div>
    </section>
    

    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<!-- <script defer src="/js/user/common/board.js"></script> -->
<script src="/js/user/pages/faq/faq_index.js"></script>


</body>
</html>
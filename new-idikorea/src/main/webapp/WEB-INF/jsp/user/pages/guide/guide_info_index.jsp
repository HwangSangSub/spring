<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeGuideInfo";
    // sub banner tit
	String pagename = "site helper";
	String pagetxt = "이용안내";
	String navId = "000504";

	// ex
    // Boolean isLogin = false; 
    Boolean isLogin = true; 
    String userName = "이디";
    int hasFund = 912333;
    // Boolean isRegular = false; // 일반배송
    Boolean isRegular = Boolean.parseBoolean(request.getParameter("regular")); // 정기배송일 시

	// //ex



%>

<jsp:include page="../../include/common_beforestyle.jsp" flush="false" >
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



    <section class="guide-sect sect-private">
        <div class="layout">

			<div class="idi_private">
				<div>
					<ul class="clearfix">
						<li onclick="fnMove('1')" class="active">회원가입안내</li>
						<li onclick="fnMove('2')">적립금제도</li>
						<li onclick="fnMove('3')">상품주문방법</li>
						<li onclick="fnMove('4')">주문확인 및 실시간 배송조회시스템</li>
						<li onclick="fnMove('5')">안전한 대금 결제 시스템</li>
						<li onclick="fnMove('6')">배송기간 및 배송방법</li>
						<li onclick="fnMove('7')">주문취소, 교환 및 환불</li>
					</ul>
				</div>
				<div class="active">
					<ul class="clearfix">
						<li id="d-private1">
							<h4>회원가입안내</h4>
							<ul class="clearfix">
								<li>① 저희 IDI 코리아는 기본적으로는 회원제로 운영하고 있습니다.</li>
								<li>② 회원님들께는 구매시 이 포인트를 적립금으로 사용하실 수 있습니다.</li>
							</ul>
						</li>
						<li id="d-private2">
							<h4>적립금제도</h4>
							<ul class="clearfix">
								<li>① 저희 IDI 코리아은 상기 상품에 대한 포인트를 적립금으로 그대로 사용할 수 있습니다.</li>
								<li>② 적립금 100점은 현금 100원과 같습니다.</li>
								<li>③ 적립금은 1,000원 이상되어야 사용하실 수가 있고 1,000원이 넘지 않는 금액의 적립금은 사용하실 수가 없습니다.</li>
							</ul>
						</li>
						<li id="d-private3">
							<h4>상품주문방법</h4>
							<ul class="clearfix">
								<li>저희 IDI 코리아에서 상품을 주문하는 방법은 크게 6단계입니다.
									<ul>
										<li>① 상품검색</li>
										<li>② 쇼핑백에 담기</li>
										<li>③ 회원ID 로그인 또는 비회원 주문</li>
										<li>④ 주문서 작성</li>
										<li>⑤ 결제방법 선택 및 결제</li>
										<li>⑥ 주문 성공 화면 (주문번호)</li>
										<li>⑦ 비회원 주문인 경우 6단계에서 주문번호와 승인번호(카드결제시)를 꼭 메모해 두시기 바랍니다.</li>
									</ul>
								</li>
								<li>※ 단, 회원인 경우 자동 저장되므로 따로 관리하실 필요가 없습니다.</li>
							</ul>
						</li>
						<li id="d-private4">
							<h4>주문확인 및 실시간 배송조회시스템</h4>
							<ul class="clearfix">
								<li>IDI 코리아에서 주문을 하셨을 경우 주문/배송 확인을 통해서 실제 주문이 어떻게 처리되고 있는지 확인 하실 수 있습니다. 회원페이지에서 주문/배송 확인을 클릭해 보세요.</li>
								<li>회원일 경우 ID와 비밀번호를 입력하시면 되고 비회원으로 주문하셨을 경우, 주문하셨을때 입력했던 메일을 입력하시면 됩니다. (주문시 입력했던 이름을 정확하게 입력하셔야 합니다. 주문자의 이름을 입력하는 것은 본인 확인을 위해서 입니다.)</li>
								<li>현재 배송은 우체국 택배 서비스를 이용하고 있습니다. 본 서비스는 상품 추적을 통해 상품이 어디쯤 도착해 있는지 실시간으로 추적하실 수 있습니다. (현재 Internet Explore 4.x이상에서만 가능)</li>
							</ul>
						</li>
						<li id="d-private5">
							<h4>안전한 대금 결제 시스템</h4>
							<ul class="clearfix">
								<li>저희 IDI 코리아은 무통장 입금과 신용카드의 두 가지 결제방법을 제공하여 드립니다.</li>
								<li>무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 되고, 신용카드 결제는 <b>INICIS 전자결제</b>를 이용하므로 보안문제는 걱정하지 않으셔도 되며, 고객님의 이용내역서에는 <b>(주)INICIS</b>으로 기록됩니다.</li>
								<li>이용 가능한 국내 발행 신용카드
									<ul>
										<li>- 국내발행 모든 신용카드</li>
									</ul>
								</li>
								<li>이용 가능한 해외 발생 신용카드
									<ul>
										<li>- VISA Card, MASTER Card, AMEX Card</li>
									</ul>
								</li>
								<li>무통장 입금 가능 은행
									<ul>
										<li>- 하나은행,농협</li>
									</ul>
								</li>
								<li>무통장 입금시의 송금자 이름은 주문시 입력하신 주문자의 실명이어야 합니다.</li>
							</ul>
						</li>
						<li id="d-private6">
							<h4>배송기간 및 배송방법</h4>
							<ul class="clearfix">
								<li>고객님이 무통장 입금으로 주문하신 경우에는 입금하신 날로부터, 신용카드로 구매하신 경우에는 구매하신 날로부터 2-3일 이내에(최장 7일이내) 입력하신 배송처로 주문상품이 도착하게 됩니다. 주문하신 상품에 따라 배송기간이 조금 상이할 수 있습니다.</li>
								<li>주문하실 때 희망 배송일자를 넉넉히 잡아주시면(3일이상) 원하시는 날자에 배송할 수 있도록 최선을 다하겠습니다.</li>
								<li>저희 IDI 코리아에서는 구입하신 상품의 배송 방법을 <b>우체국 택배 서비스</b>를 원칙으로 하고 있습니다. (배송방법은 상품 종류에 따라 상이할 수 있습니다.)</li>
							</ul>
						</li>
						<li id="d-private7">
							<h4>주문취소, 교환 및 환불</h4>
							<ul class="clearfix">
								<li>IDI 코리아은 소비자의보호를 위해서 규정한 제반 법규를 준수합니다.</li>
								<li>주문 취소는 미결재인 상태에서는 고객님이 직접 취소하실 수가 있습니다. 결재후 취소는 저희 고객센타(031-207-4983)로 문의해 주시기 바랍니다.</li>
								<li>무통장 입금의 경우 일정기간동안 송금을 하지 않으면 자동 주문 취소가 되고, 구매자가 원하는 경우 인터넷에서 바로 취소 하실 수도 있으며, 송금을 하신 경우에는 환불조치 해드립니다.</li>
								<li>카드로 결제하신 경우, 승인 취소가 가능하면 취소을 해드리지만 승인 취소가 불가능한 경우 해당 금액을 모두 송금해 드립니다.</li>
								<li>반송을 하실 때에는 주문번호, 회원번호를 메모하여 보내주시면 보다 신속한 처리에 도움이 됩니다.(문의전화 031-207-4983)</li>
								<li>우송된 상품이 원하는 상품이 아닌 경우는 우송 받으신 날부터 20일 이내에 아래 주소로 주문번호, 회원번호, 이름, 반품사유 등을 메모하여 반송해 주시면 상품 대금은 회원번호로 예치하여 차후 다른 상품 주문시 사용하실 수 있습니다. (반송료는 고객 부담 입니다.)</li>
								<li>반송주소 : 경기 수원시 장안구 이목동 23-8 천주교 마리아의 아들 수도회 IDI 코리아</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
            
        </div>
    </section>
    

    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<!-- <script defer src="/js/user/common/board.js"></script> -->

<script>
	$(document).ready(function(){
		//서브2. 개인정보취급방침 탭메뉴 li active
		$(".idi_private > div:first-child ul li").on("click",function(){
			$(".idi_private > div:first-child ul li").removeClass("active");
			$(this).addClass("active");
		});
	});
	
	//서브2. 개인정보취급방침 탭 메뉴
	function fnMove(move){
		var offset = $("#d-private" + move).offset();
		
		$("html, body").animate({ scrollTop : offset.top - 0 + "px"}, 1000);
	}
</script>


</body>
</html>
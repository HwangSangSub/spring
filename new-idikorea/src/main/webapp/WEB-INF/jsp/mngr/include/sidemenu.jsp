<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String sideMenu = request.getParameter("sideMenu");
	String depth_01 = request.getParameter("depth_01");
	String depth_02 = request.getParameter("depth_02");
 %>
<div class="sideMenu">
	<% if(sideMenu.equals("sideMenu_01")) { %>
		<dl>
			<dt>주문관리</dt>
			<dd<%= depth_01.equals("sideMenu_01_01") ? " class=\"active\"" : "" %>>
				<a href="/mngr/order/list/index" class="straight">주문목록</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_01_02") ? " class=\"active\"" : "" %>>
				<a href="/mngr/order/call/index" class="straight">전화주문접수</a>
			</dd>
			<!-- 
			<dd<%= depth_01.equals("sideMenu_01_03") ? " class=\"active\"" : "" %>>
				<a href="/mngr/order/cancel/index" class="straight">주문취소목록</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_01_04") ? " class=\"active\"" : "" %>>
				<a href="/mngr/order/return/index" class="straight">반품 &middot; 교환접수목록</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_01_05") ? " class=\"active\"" : "" %>>
				<a href="/mngr/order/refund/index" class="straight">환불접수목록</a>
			</dd>
			 -->
			<dd<%= depth_01.equals("sideMenu_01_06") ? " class=\"active\"" : "" %>>
				<a href="/mngr/order/payable/index" class="straight">미수금</a>
			</dd>
		</dl>
	<% } else if(sideMenu.equals("sideMenu_02")) { %>
		<dl>
			<dt>택배연동</dt>
			<dd<%= depth_01.equals("sideMenu_02_01") ? " class=\"active\"" : "" %>>
				<a href="/mngr/postoffice/invoice/index">우체국</a>
				<ul>
					<li<%= depth_02.equals("sideMenu_02_01_01") ? " class=\"active\"" : "" %>>
						<a href="/mngr/postoffice/invoice/index">송장발급</a>
					</li>
					<li<%= depth_02.equals("sideMenu_02_01_02") ? " class=\"active\"" : "" %>>
						<a href="/mngr/postoffice/register/index">송장등록</a>
					</li>
				</ul>
			</dd>
			<dd<%= depth_01.equals("sideMenu_02_02") ? " class=\"active\"" : "" %>>
				<a href="/mngr/delivery/register/index">택배</a>
				<ul>
					<li<%= depth_02.equals("sideMenu_02_02_01") ? " class=\"active\"" : "" %>>
						<a href="/mngr/delivery/register/index">송장등록</a>
					</li>
				</ul>
			</dd>
		</dl>
	<% } else if(sideMenu.equals("sideMenu_03")) { %>
		<dl>
			<dt>자동입금확인</dt>
			<dd<%= depth_01.equals("sideMenu_03_01") ? " class=\"active\"" : "" %>>
				<a href="/mngr/deposit/check/index" class="straight">실시간입금확인 &middot; 조회</a>
			</dd>
		</dl>
	<% } else if(sideMenu.equals("sideMenu_04")) { %>
		<dl>
			<dt>현금영수증</dt>
			<dd<%= depth_01.equals("sideMenu_04_01") ? " class=\"active\"" : "" %>>
				<a href="/mngr/receipt/inquiry/index" class="straight">발급조회</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_04_02") ? " class=\"active\"" : "" %>>
				<a href="/mngr/receipt/issue/index" class="straight">개별발급</a>
			</dd>
		</dl>
	<% } else if(sideMenu.equals("sideMenu_05")) { %>
		<dl>
			<dt>회원</dt>
			<dd<%= depth_01.equals("sideMenu_05_01") ? " class=\"active\"" : "" %>>
				<a href="/mngr/member/management/list/index">회원관리</a>
				<ul>
					<li<%= depth_02.equals("sideMenu_05_01_01") ? " class=\"active\"" : "" %>>
						<a href="/mngr/member/management/list/index">회원목록</a>
					</li>
					<li<%= depth_02.equals("sideMenu_05_01_02") ? " class=\"active\"" : "" %>>
						<a href="/mngr/member/management/detail/index">탈퇴 &middot; 삭제내역</a>
					</li>
					<li<%= depth_02.equals("sideMenu_05_01_03") ? " class=\"active\"" : "" %>>
						<a href="/mngr/member/management/group/index">그룹관리</a>
					</li>
					<li<%= depth_02.equals("sideMenu_05_01_04") ? " class=\"active\"" : "" %>>
						<a href="/mngr/member/management/connect/index">후원회원연결</a>
					</li>
					<li<%= depth_02.equals("sideMenu_05_01_05") ? " class=\"active\"" : "" %>>
						<a href="/mngr/member/management/apply/index">후원회원연결신청</a>
					</li>
					<li<%= depth_02.equals("sideMenu_05_01_06") ? " class=\"active\"" : "" %>>
						<a href="/mngr/member/management/idi/index">이디후원회원가입신청</a>
					</li>
					<li<%= depth_02.equals("sideMenu_05_01_07") ? " class=\"active\"" : "" %>>
						<a href="/mngr/member/management/abbey/index">수도원후원회원가입신청</a>
					</li>
				</ul>
			</dd>
			<dd<%= depth_01.equals("sideMenu_05_02") ? " class=\"active\"" : "" %>>
				<a href="/mngr/member/batch/accumulate/index">일괄관리</a>
				<ul>
					<li<%= depth_02.equals("sideMenu_05_02_01") ? " class=\"active\"" : "" %>>
						<a href="/mngr/member/batch/accumulate/index">적립금일괄지급 &middot; 차감</a>
					</li>
					<li<%= depth_02.equals("sideMenu_05_02_02") ? " class=\"active\"" : "" %>>
						<a href="/mngr/member/batch/group/index">그룹일괄관리</a>
					</li>
					<li<%= depth_02.equals("sideMenu_05_02_03") ? " class=\"active\"" : "" %>>
						<a href="/mngr/member/batch/approve/index">승인상태일괄변경</a>
					</li>
					<li<%= depth_02.equals("sideMenu_05_02_04") ? " class=\"active\"" : "" %>>
						<a href="/mngr/member/batch/notice/index">알림톡일괄발송</a>
					</li>
				</ul>
			</dd>
			<dd<%= depth_01.equals("sideMenu_05_03") ? " class=\"active\"" : "" %>>
				<a href="/mngr/member/sms/shipment/index">SMS</a>
				<ul>
					<li<%= depth_02.equals("sideMenu_05_03_01") ? " class=\"active\"" : "" %>>
						<a href="/mngr/member/sms/shipment/index">SMS일괄발송</a>
					</li>
					<li<%= depth_02.equals("sideMenu_05_03_02") ? " class=\"active\"" : "" %>>
						<a href="/mngr/member/sms/detail/index">SMS발송내역</a>
					</li>
				</ul>
			</dd>
			<dd<%= depth_01.equals("sideMenu_05_04") ? " class=\"active\"" : "" %>>
				<a href="/mngr/member/push/send/index">푸시알림</a>
				<ul>
					<li<%= depth_02.equals("sideMenu_05_04_01") ? " class=\"active\"" : "" %>>
						<a href="/mngr/member/push/send/index">보내기</a>
					</li>
					<li<%= depth_02.equals("sideMenu_05_04_02") ? " class=\"active\"" : "" %>>
						<a href="/mngr/member/push/detail/index">발송내역</a>
					</li>
				</ul>
			</dd>
		</dl>
	<% } else if(sideMenu.equals("sideMenu_06")) { %>
		<dl>
			<dt>상품</dt>
			<dd<%= depth_01.equals("sideMenu_06_01") ? " class=\"active\"" : "" %>>
				<a href="/mngr/product/management/list/index">상품관리</a>
				<ul>
					<li<%= depth_02.equals("sideMenu_06_01_01") ? " class=\"active\"" : "" %>>
						<a href="/mngr/product/management/list/index">상품목록</a>
					</li>
					<!-- 
					<li<%= depth_02.equals("sideMenu_06_01_02") ? " class=\"active\"" : "" %>>
						<a href="/mngr/product/management/register/index">상품등록</a>
					</li>
					 -->
					<li<%= depth_02.equals("sideMenu_06_01_05") ? " class=\"active\"" : "" %>>
						<a href="/mngr/product/category/sort/index">상품정렬</a>
					</li>
					<li<%= depth_02.equals("sideMenu_06_01_03") ? " class=\"active\"" : "" %>>
						<a href="/mngr/product/management/brand/index">브랜드관리</a>
					</li>
					<li<%= depth_02.equals("sideMenu_06_01_04") ? " class=\"active\"" : "" %>>
						<a href="/mngr/product/management/modify/index">가격 &middot; 적립금 &middot; 재고</a>
					</li>
				</ul>
			</dd>
			<dd<%= depth_01.equals("sideMenu_06_02") ? " class=\"active\"" : "" %>>
				<a href="/mngr/product/category/setup/index">카테고리관리</a>
				<ul>
					<li<%= depth_02.equals("sideMenu_06_02_01") ? " class=\"active\"" : "" %>>
						<a href="/mngr/product/category/setup/index">설정</a>
					</li>
				</ul>
			</dd>
		</dl>
	<% } else if(sideMenu.equals("sideMenu_07")) { %>
		<dl>
			<dt>정기구매관리</dt>
			<dd<%= depth_01.equals("sideMenu_07_01") ? " class=\"active\"" : "" %>>
				<a href="/mngr/regular/discount/index" class="straight">할인설정</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_07_02") ? " class=\"active\"" : "" %>>
				<a href="/mngr/regular/list/index" class="straight">목록조회</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_07_03") ? " class=\"active\"" : "" %>>
				<a href="/mngr/regular_call/call/index" class="straight">전화주문</a>
			</dd>
		</dl>
	<% } else if(sideMenu.equals("sideMenu_08")) { %>
		<dl>
			<dt>게시판관리</dt>
			<dd<%= depth_01.equals("sideMenu_08_01") ? " class=\"active\"" : "" %>>
				<a href="/mngr/board/notice/index" class="straight">공지사항</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_08_02") ? " class=\"active\"" : "" %>>
				<a href="/mngr/board/qna/index" class="straight">상품문의</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_08_03") ? " class=\"active\"" : "" %>>
				<a href="/mngr/board/review/index" class="straight">상품후기</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_08_04") ? " class=\"active\"" : "" %>>
				<a href="/mngr/board/one/index" class="straight">1:1문의</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_08_05") ? " class=\"active\"" : "" %>>
				<a href="/mngr/board/faq/index" class="straight">FAQ</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_08_06") ? " class=\"active\"" : "" %>>
				<a href="/mngr/board/event/index" class="straight">이벤트</a>
			</dd>
		</dl>
	<% } else if(sideMenu.equals("sideMenu_09")) { %>
		<dl>
			<dt>디자인관리</dt>
			<dd<%= depth_01.equals("sideMenu_09_01") ? " class=\"active\"" : "" %>>
				<a href="/mngr/design/popup/index" class="straight">팝업관리</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_09_02") ? " class=\"active\"" : "" %>>
				<a href="/mngr/design/popup/index">메인관리</a>
				<ul>
					<li<%= depth_02.equals("sideMenu_09_02_01") ? " class=\"active\"" : "" %>>
						<a href="/mngr/design/main/slide/index">슬라이드</a>
					</li>
					<li<%= depth_02.equals("sideMenu_09_02_02") ? " class=\"active\"" : "" %>>
						<a href="/mngr/design/main/best/index">베스트셀러</a>
					</li>
					<li<%= depth_02.equals("sideMenu_09_02_03") ? " class=\"active\"" : "" %>>
						<a href="/mngr/design/main/careline/index">케어라인</a>
					</li>
				</ul>
			</dd>
		</dl>
	<% } else if(sideMenu.equals("sideMenu_10")) { %>
		<dl>
			<dt>쿠폰관리</dt>
			<dd<%= depth_01.equals("sideMenu_10_01") ? " class=\"active\"" : "" %>>
				<a href="/mngr/coupon/setup/index" class="straight">쿠폰설정</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_10_02") ? " class=\"active\"" : "" %>>
				<a href="/mngr/coupon/list/index" class="straight">쿠폰목록</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_10_03") ? " class=\"active\"" : "" %>>
				<a href="/mngr/coupon/make/index" class="straight">쿠폰생성</a>
			</dd>
		</dl>
	<% } else if(sideMenu.equals("sideMenu_11")) { %>
		<dl>
			<dt>기타관리</dt>
			<dd<%= depth_01.equals("sideMenu_11_01") ? " class=\"active\"" : "" %>>
				<a href="/mngr/etc/notice/index" class="straight">입고알림신청관리</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_11_02") ? " class=\"active\"" : "" %>>
				<a href="/mngr/etc/deposit/index" class="straight">입금대기관리</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_11_03") ? " class=\"active\"" : "" %>>
				<a href="/mngr/etc/popup/index" class="straight">상품팝업관리</a>
			</dd>
		</dl>
	<% } else if(sideMenu.equals("sideMenu_12")) { %>
		<dl>
			<dt>환경설정</dt>
			<dd<%= depth_01.equals("sideMenu_12_01") ? " class=\"active\"" : "" %>>
				<a href="/mngr/setup/basics/index" class="straight">기본정보</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_12_02") ? " class=\"active\"" : "" %>>
				<a href="/mngr/setup/delivery/index" class="straight">배송설정</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_12_03") ? " class=\"active\"" : "" %>>
				<a href="/mngr/setup/accumulate/index" class="straight">적립금설정</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_12_04") ? " class=\"active\"" : "" %>>
				<a href="/mngr/setup/order/index" class="straight">주문설정</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_12_05") ? " class=\"active\"" : "" %>>
				<a href="/mngr/setup/account/index" class="straight">계좌설정</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_12_06") ? " class=\"active\"" : "" %>>
				<a href="/mngr/setup/mail/one/index">메일설정</a>
				<ul>
					<li<%= depth_02.equals("sideMenu_12_06_01") ? " class=\"active\"" : "" %>>
						<a href="/mngr/setup/mail/one/index">1:1문의답변메일</a>
					</li>
					<li<%= depth_02.equals("sideMenu_12_06_02") ? " class=\"active\"" : "" %>>
						<a href="/mngr/setup/mail/delivery/index">배송 &middot; 발송메일</a>
					</li>
					<li<%= depth_02.equals("sideMenu_12_06_03") ? " class=\"active\"" : "" %>>
						<a href="/mngr/setup/mail/id/index">아이디 &middot; 비밀번호찾기메일</a>
					</li>
					<li<%= depth_02.equals("sideMenu_12_06_04") ? " class=\"active\"" : "" %>>
						<a href="/mngr/setup/mail/deposit/index">입금확인메일</a>
					</li>
					<li<%= depth_02.equals("sideMenu_12_06_05") ? " class=\"active\"" : "" %>>
						<a href="/mngr/setup/mail/order/index">주문확인메일</a>
					</li>
					<li<%= depth_02.equals("sideMenu_12_06_06") ? " class=\"active\"" : "" %>>
						<a href="/mngr/setup/mail/join/index">회원가입메일</a>
					</li>
					<li<%= depth_02.equals("sideMenu_12_06_07") ? " class=\"active\"" : "" %>>
						<a href="/mngr/setup/mail/withdrawal/index">회원탈퇴메일</a>
					</li>
				</ul>
			</dd>
			<dd<%= depth_01.equals("sideMenu_12_07") ? " class=\"active\"" : "" %>>
				<a href="/mngr/setup/notice/index" class="straight">알림톡자동발송 &middot; 설정</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_12_08") ? " class=\"active\"" : "" %>>
				<a href="/mngr/setup/terms/index" class="straight">이용약관</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_12_09") ? " class=\"active\"" : "" %>>
				<a href="/mngr/setup/personal/index" class="straight">개인정보처리방침</a>
			</dd>
		</dl>
	<% } else if(sideMenu.equals("sideMenu_13")) { %>
		<dl>
			<dt>통계</dt>
			<dd<%= depth_01.equals("sideMenu_13_01") ? " class=\"active\"" : "" %>>
				<a href="/mngr/statistic/sale/index" class="straight">일일매출</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_13_02") ? " class=\"active\"" : "" %>>
				<a href="/mngr/statistic/delivery/index" class="straight">출고</a>
			</dd>
			<dd<%= depth_01.equals("sideMenu_13_03") ? " class=\"active\"" : "" %>>
				<a href="/mngr/statistic/stock/index" class="straight">재고</a>
			</dd>
		</dl>
	<% } %>
	<p>&copy; IDI</p>
</div>
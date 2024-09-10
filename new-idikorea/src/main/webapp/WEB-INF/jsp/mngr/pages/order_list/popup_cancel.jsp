<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../../include/common.jsp" flush="false" />
<div class="middleArea popup">
	<div class="pageContent">
		<div class="contentTitle">
			<h2>선택상품취소</h2>
		</div>
		${param.orderNo}
		${orderItemList }
		<div class="contentArea">
			<form action="./popup_detail.jsp" method="post">
				<h3>취소상품목록</h3>
				<table class="contentTable resultTable line_hover board">
					<caption>상품목록</caption>
					<colgroup>
						<col style="width: 69px;">
						<col style="width: 69px;">
						<col>
						<col style="width: 69px;">
						<col style="width: 10%;">
						<col style="width: 10%;">
						<col style="width: 10%;">
						<col style="width: 10%;">
					</colgroup>
					<thead>
						<tr>
							<th><div class="textCut">번호</div></th>
							<th><div class="textCut">상품코드</div></th>
							<th><div class="textCut">상품명</div></th>
							<th><div class="textCut">수량</div></th>
							<th><div class="textCut">판매금액</div></th>
							<th><div class="textCut">회원할인금액</div></th>
							<th><div class="textCut">쿠폰할인금액</div></th>
							<th><div class="textCut">상품결제금액</div></th>
						</tr>
					</thead>
					<tbody>
						<%-- <% for(int x = 0; x < 2; x++) { %>
						<tr>
							<td><div class="textCut">000000</div></td>
							<td><div class="textCut">000000</div></td>
							<td class="textAL"><div class="textCut">5&gt;IDI DONNA TONER - 여성용 스킨</div></td>
							<td>1</td>
							<td><div class="textCut textAR">1,000,000</div></td>
							<td><div class="textCut textAR">10,000</div></td>
							<td><div class="textCut textAR">990,000</div></td>
						</tr>
						<% } %> --%>
						<c:set var="totalMemberDc" value="0"/>
						<c:set var="totalCouponDc" value="0"/>
						<c:set var="orderPrice" value="0"/>
						<c:set var="totalEa" value="0"/>
						<c:forEach var="item" items="${orderItemList }" varStatus="status">
							<tr>
								<td><div class="textCut">${status.index }</div></td>
								<td><div class="textCut">${item.goodsCode }</div></td>
								<td class="textAL"><div class="textCut">${item.goodsName }</div></td>
								<td>${item.ea }</td>
								<td><div class="textCut textAR"><fmt:formatNumber value="${item.price*item.ea}" type="number" /></div></td>
								<td><div class="textCut textAR"><fmt:formatNumber value="${item.memberDc*item.ea}" type="number" /></div></td>
								<td><div class="textCut textAR"><fmt:formatNumber value="${item.coupon*item.ea}" type="number" /></div></td>
								<td><div class="textCut textAR"><fmt:formatNumber value="${item.price * item.ea - item.memberDc*item.ea - item.coupon*item.ea}" type="number" /></div></td>
							</tr>
							<c:set var="totalMemberDc" value="${totalMemberDc + (item.memberDc*item.ea)}"/>
							<c:set var="totalCouponDc" value="${totalCouponDc + (item.coupon*item.ea)}"/>
							<c:set var="orderPrice" value="${orderPrice+(item.price*item.ea)}"/>
							<c:set var="totalEa" value="${totalEa+(item.ea)}"/>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr style="background-color: rgba(204,204,204,0.3);">
							<td colspan="3">
								<div class="textCut">
									<strong>합계</strong>
								</div>
							</td>
							<td>
								<div class="textCut">
									<strong><fmt:formatNumber value="${totalEa }" type="number" /></strong>
								</div>
							</td>
							<td>
								<div class="textCut textAR">
									<strong><fmt:formatNumber value="${orderPrice }" type="number" /></strong>
								</div>
							</td>
							<td>
								<div class="textCut textAR">
									<strong><fmt:formatNumber value="${totalMemberDc}" type="number" /></strong>
								</div>
							</td>
							<td>
								<div class="textCut textAR">
									<strong><fmt:formatNumber value="${totalCouponDc}" type="number" /></strong>
								</div>
							</td>
							<td>
								<div class="textCut textAR">
									<strong><fmt:formatNumber value="${orderPrice -totalMemberDc - totalCouponDc}" type="number" /></strong>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
				<h3>주문정보</h3>
				<table class="contentTable">
					<caption>정보</caption>
					<colgroup>
						<col style="width: 180px;">
						<col>
						<col style="width: 180px;">
						<col>
					</colgroup>
					<tbody>
						<!--
						<tr>
							<th rowspan="2">총상품판매금액</th>
							<td rowspan="2"><fmt:formatNumber value="${orderInfo.originPrice }" type="number" /></td>
						</tr>
						-->
						<tr>
							<th>총주문상품결제금액</th>
							<td colspan="3">
								<span id="toppa"><fmt:formatNumber value="${orderPrice -totalMemberDc - totalCouponDc }" type="number" /></span>
							</td>
						</tr>
						<tr>
							<th>환불금액 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3"><input type="number" id="amount" min="0" name="" value="0" class="textAR refund" style="width: 80px;" autofocus required></td>
						</tr>
						<tr>
							<th>환불마일리지 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3"><input type="number" id="mileage" min="0" name="" value="0" class="textAR refund" style="width: 80px;" required></td>
						</tr>
						<tr>
							<th>기타할인금액</th>
							<td colspan="3">
								<fmt:formatNumber value="${ totalMemberDc + totalCouponDc + orderInfo.coupon + orderInfo.emoney + orderInfo.enuri }" type="number" /> (
								<%-- 그룹할인 <fmt:formatNumber value="${totalMemberDc }" type="number" /> + --%>
								쿠폰할인 <fmt:formatNumber value="${totalCouponDc }" type="number" /> (10%) +
								쿠폰할인 <fmt:formatNumber value="${orderInfo.coupon }" type="number" /> +
								적립금사용 <fmt:formatNumber value="${orderInfo.emoney }" type="number" /> +
								에누리 <fmt:formatNumber value="${orderInfo.enuri }" type="number" /> )
								<%-- 에누리 <input type="number" id="discount" min="0" name="" value="${orderInfo.enuri }" class="textAR" style="width: 80px;"> ) --%>
								<!-- 628,000 ( 쿠폰할인 513,000 (10%) + 쿠폰할인 5,000 + 적립금사용 100,000 + 에누리 10000 ) -->
							</td>
						</tr>
						<tr>
							<th>총예상결제금액</th>
							<td colspan="3">
								<span id="payment" class="esa">
									<fmt:formatNumber value='${orderPrice-(totalMemberDc + totalCouponDc + orderInfo.coupon + orderInfo.emoney + orderInfo.enuri)}' type="number" />
								</span>
							</td>
						</tr>
						<tr>
							<th>사유</th>
							<td>
								<select>
									<option value="회원교환요청">회원교환요청</option>
									<option value="회원반품요청">회원반품요청</option>
									<option value="품절취소">품절취소</option>
									<option value="배송지연">배송지연</option>
									<option value="이중주문">이중주문</option>
									<option value="시스템오류">시스템오류</option>
									<option value="누락배송">누락배송</option>
									<option value="택배분실">택배분실</option>
									<option value="상품불량">상품불량</option>
									<option value="기타">기타</option>
								</select>
							</td>
							<th>처리담당자 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td>
								<input type="text" name="" id="adminName" value="" style="width: 110px;">
							</td>
						</tr>
						<tr>
							<th>메모</th>
							<td colspan="3">
								<input type="text" name="" value="" id="memo" placeholder="50자 이내" maxlength="50" style="width: 549px;">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="contentMenu popup">
					<input type="Button" id="saveBtn" value="저장">
					<a href="./popup_detail.jsp" class="buttonType">취소</a>
					<button type="button" onclick="window.self.close();">닫기</button>
				</div>
			</form>
		</div>
		<script>
			let toppa = document.getElementById('toppa').innerHTML.replaceAll(',','')*1;
			let payment = document.getElementById('payment').innerHTML.replaceAll(',','')*1;
			$(document).on('keyup', '.refund', function(){
				const toppaText = toppa - ( Number( $('#amount').val() ) + Number( $('#mileage').val() ) ); // 총주문상품결제금액
				const paymentText = payment - ( Number( $('#amount').val() ) + Number( $('#mileage').val() ) ); // 총예상결제금액
				$('#toppa').text(toppaText.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ','));
				$('#payment').text(paymentText.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ','));
			});
		</script>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<script>
	$('body').css('min-width','980px');
</script>
<script type="module">
	import {open} from '/js/mngr/pages/order_list/popup_cancel.js';
	open.init();
</script>
<jsp:include page="../../include/bottom.jsp" flush="false" />
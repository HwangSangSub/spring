<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../../include/common.jsp" flush="false" />
<div class="middleArea popup">
	<div class="pageContent">
		<div class="contentTitle">
			<h2>상세정보</h2>
		</div>
		${orderItemList }
		//////////////////<br/>
		//////////////////<br/>
		//////////////////<br/>
		//////////////////<br/>
		${orderInfo }
		//////////////////<br/>
		//////////////////<br/>
		//////////////////<br/>
		//////////////////<br/>
		${memberInfo }
		<div id="layer_receipt_target" class="contentArea">
			<!-- 주문 상품이 있을 때만 표시 -->
			<form method="get" action="/mngr/order/list/popup/cancel">
				<h3>주문상품목록</h3>
				<table class="contentTable resultTable line_hover board">
					<caption>상품목록</caption>
					<colgroup>
						<col style="width: 45px;">
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
							<th><div class="textCut"><input type="checkbox" class="products_list" onclick="selectAll(this, 'products_list')"></div></th>
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
					<c:set var="totalMemberDc" value="0"/>
					<c:set var="totalCouponDc" value="0"/>
					<c:set var="orderPrice" value="0"/>
					<c:set var="totalEa" value="0"/>
					<c:forEach var="item" items="${orderItemList }" varStatus="status">
						<c:if test="${item.itemStatus ne '주문취소'  }">
							<tr>
								<td><div class="textCut"><input type="checkbox" id="${item.itemNo }" class="products_list"></div></td>
								<td><div class="textCut">${status.index }</div></td>
								<td><div class="textCut">${item.goodsCode }</div></td>
								<td class="textAL"><div class="textCut"> ${item.goodsName}</div></td>
								<td> ${item.ea}</td>
								<td><div class="textCut textAR"><fmt:formatNumber value="${item.price * item.ea}" type="number" /></div></td>
								
								<td><div class="textCut textAR"><fmt:formatNumber value="${item.memberDc*item.ea}" type="number" /></div></td>
								<td><div class="textCut textAR"><fmt:formatNumber value="${item.coupon*item.ea}" type="number" /></div></td>
								<td><div class="textCut textAR"><fmt:formatNumber value="${item.price * item.ea - item.memberDc*item.ea - item.coupon*item.ea}" type="number" /></div></td>
							</tr>
							<c:set var="totalMemberDc" value="${totalMemberDc + (item.memberDc*item.ea)}"/>
							<c:set var="totalCouponDc" value="${totalCouponDc + (item.coupon*item.ea)}"/>
							<c:set var="orderPrice" value="${orderPrice+(item.price*item.ea)}"/>
							<c:set var="totalEa" value="${totalEa+(item.ea)}"/>
						</c:if>
					</c:forEach>
					<c:if test="${orderItemList.size() eq 0  }">
						<tr>
							<td colspan="9"><div class="textCut">등록된 게시물이 없습니다.</div></td>
						</tr>
					</c:if>>
						<%-- <% for(int x = 0; x < 5; x++) { %>
						<tr>
							<td><div class="textCut"><input type="checkbox" class="products_list"></div></td>
							<td><div class="textCut">000000</div></td>
							<td><div class="textCut">000000</div></td>
							<td class="textAL"><div class="textCut">5&gt;IDI DONNA TONER - 여성용 스킨</div></td>
							<td>1</td>
							<td><div class="textCut textAR">1,000,000</div></td>
							<td><div class="textCut textAR">10,000</div></td>
							<td><div class="textCut textAR">990,000</div></td>
						</tr>
						<% } %> --%>
					</tbody>
					<tfoot>
						<tr style="background-color: rgba(204,204,204,0.3);">
							<td colspan="4">
								<div class="textCut">
									<strong>합계</strong>
								</div>
							</td>
							<td>
								<div class="textCut">
									<strong>${totalEa }</strong>
								</div>
							</td>
							<td>
								<div class="textCut textAR">
									<strong><fmt:formatNumber value="${orderPrice}" type="number" /></strong>
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
				<div class="contentMenu">
					<input type="button" value="선택상품취소" onclick="if(confirm('선택상품 취소 페이지로 이동합니다. 저장하지 않은 데이터는 소멸됩니다. 이동하시겠습니까?')){
						let cancelArr=[];
						document.querySelectorAll('.products_list').forEach((x,y)=>{
							if(y!=0&& x.checked)
								cancelArr.push(x.id);
						})
						location.href='/mngr/order/list/popup/cancel?arr='+cancelArr+'&orderNo='+${orderInfo.orderNo};
						}">
				</div>
			</form>
			<!--// 주문 상품이 있을 때만 표시 -->
			<form action="" method="get" enctype="">
				<!-- 취소 상품이 있을 때만 표시 -->
				<h3>취소상품목록</h3>
				<table class="contentTable resultTable line_hover board">
					<caption>상품목록</caption>
					<colgroup>
						<col style="width: 69px;">
						<col style="width: 69px;">
						<col>
						<col style="width: 81px;">
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
							<th><div class="textCut">취소정보</div></th>
							<th><div class="textCut">수량</div></th>
							<th><div class="textCut">판매금액</div></th>
							<th><div class="textCut">회원할인금액</div></th>
							<th><div class="textCut">쿠폰할인금액</div></th>
							<th><div class="textCut">상품결제금액</div></th>
						</tr>
					</thead>
					<tbody>
					<%-- 	<% for(int x = 0; x < 2; x++) { %>
						<tr>
							<td><div class="textCut">000000</div></td>
							<td><div class="textCut">000000</div></td>
							<td class="textAL"><div class="textCut">5&gt;IDI DONNA TONER - 여성용 스킨</div></td>
							<td>1</td>
							<td><div class="textCut textAR">990,000</div></td>
							<td><div class="textCut">0000-00-00 00:00:00</div></td>
							<td><button type="button" onclick="nextTR(this);">보기</button></td>
						</tr>
						<tr class="state dp_none">
							<td colspan="7" class="textAR">
								<span class="state"><strong>사유</strong> : 시스템오류</span>
								<span class="state"><strong>처리담당자</strong> : 최의영</span>
								<!-- 메모가 있는 경우 -->
								<span class="state"><strong>메모</strong> : 0000-00-00 하나은행 000-00-0000-000 계좌이체 완료</span>
								<!--// 메모가 있는 경우 -->
							</td>
						</tr>
						<% } %>  --%>
							<c:set var="totalCancelEa" value="0"/>
							<c:set var="totalCancelPrice" value="0"/>
							<c:set var="totalCancelMemberDc" value="0"/>
							<c:set var="totalCancelCouponDc" value="0"/>
							<c:forEach var="item" items="${orderItemList }" varStatus="status">
								<c:if test="${item.itemStatus eq '주문취소'  }">
									<tr>
										<td><div class="textCut">${status.index }</div></td>
										<td><div class="textCut">${item.goodsCode }</div></td>
										<td class="textAL"><div class="textCut">${item.goodsName}</div></td>
										<td><button type="button" onclick="nextTR(this);">보기</button></td>
										<td>${item.ea}</td>
										<td><div class="textCut"><fmt:formatNumber value="${item.price*item.ea}" type="number" /></div></td>
										<td><div class="textCut textAR"><fmt:formatNumber value="${item.memberDc*item.ea}" type="number" /></div></td>
										<td><div class="textCut textAR"><fmt:formatNumber value="${item.coupon*item.ea}" type="number" /></div></td>
										<td><div class="textCut textAR"><fmt:formatNumber value="${item.price * item.ea - item.memberDc*item.ea - item.coupon*item.ea}" type="number" /></div></td>
										<c:set var="totalCancelEa" value="${totalCancelEa + item.ea}"/>
										<c:set var="totalCancelPrice" value="${totalCancelPrice + (item.price*item.ea)}"/>
										<c:set var="totalCancelMemberDc" value="${totalCancelMemberDc + item.memberDc*item.ea}"/>
										<c:set var="totalCancelCouponDc" value="${totalCancelCouponDc + (item.coupon*item.ea)}"/>
									</tr>
									<tr class="state dp_none"><!--  상품금액 후원할인금액빼기  -->
										<td colspan="9" class="textAR">
											<span class="state"><strong>처리일시</strong> : ${item.cancelTime }</span>
											<span class="state"><strong>사유</strong> : ${ item.refundReason }</span>
											<span class="state"><strong>처리담당자</strong> : ${item.adminName }</span>
											<!-- 메모가 있는 경우 -->
											<span class="state"><strong>메모</strong> : ${ item.memo }</span>
											<!--// 메모가 있는 경우 -->
										</td>
									</tr>
								</c:if>
							</c:forEach>
						<tr>
					</tbody>
					<!-- 
					<tbody>
						<tr>
							<td colspan="7" class="textAR" style="background-color: rgba(204,204,204,0.3);">
								<span class="state"><strong>총수량</strong> : ${totalEa}</span>
								<span class="state"><strong>총판매금액</strong> : <fmt:formatNumber value="${empty totalPrice ? 0: totalPrice + item.price-item.memberDc}" type="number" /></span>
								<span class="state"><strong>총환불금액</strong> : <fmt:formatNumber value="${empty orderInfo.totalRefund ? 0 : orderInfo.totalRefund   }" type="number" /></span>
								<span class="state"><strong>총환불마일리지</strong> : <fmt:formatNumber value="${empty orderInfo.totalRefundEmoney ? 0 : orderInfo.totalRefundEmoney }" type="number" /></span>
							</td>
						</tr>
					</tbody>
					 -->
					<tfoot>
						<tr style="background-color: rgba(204,204,204,0.3);">
							<td colspan="4">
								<div class="textCut">
									<strong>합계</strong>
								</div>
							</td>
							<td>
								<div class="textCut">
									<strong>${totalCancelEa }</strong>
								</div>
							</td>
							<td>
								<div class="textCut textAR">
									<strong><fmt:formatNumber value="${totalCancelPrice}" type="number" /></strong>
								</div>
							</td>
							<td>
								<div class="textCut textAR">
									<strong><fmt:formatNumber value="${totalCancelMemberDc}" type="number" /></strong>
								</div>
							</td>
							<td>
								<div class="textCut textAR">
									<strong><fmt:formatNumber value="${totalCancelCouponDc}" type="number" /></strong>
								</div>
							</td>
							<td>
								<div class="textCut textAR">
									<strong><fmt:formatNumber value="${totalCancelPrice - totalCancelMemberDc - totalCancelCouponDc}" type="number" /></strong>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
				<!--// 취소 상품이 있을 때만 표시 -->
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
						<tr>
							<th>주문상태</th>
							<td>
								<select name="" autofocus>
									<option value="0" <c:if test="${orderInfo.status eq '주문접수'  }"> selected </c:if> >주문접수</option>
									<option value="1" <c:if test="${orderInfo.status eq '결제확인'  }"> selected </c:if> >결제확인</option>
									<option value="2" <c:if test="${orderInfo.status eq '배송준비중'  }"> selected </c:if> >배송준비중</option>
									<option value="3" <c:if test="${orderInfo.status eq '배송중'  }"> selected </c:if> >배송중</option>
									<option value="4" <c:if test="${orderInfo.status eq '배송완료'  }"> selected </c:if> >배송완료</option>
									<option value="4" <c:if test="${orderInfo.status eq '주문취소'  }"> selected </c:if> >주문취소</option>
								<!-- 	<option value="4">반품</option>
									<option value="4">교환</option>
									<option value="4">환불</option> -->
								</select>
							</td>
							<th>주문번호</th>
							<td>${orderInfo.orderNo} </td>
						</tr>
						<tr>
							<th>회원명 ( 아이디 )</th>
							<td>${memberInfo.memberName} ( ${memberInfo.memberId } )</td>
							<th>주문일</th>
							<td>${orderInfo.createTime} </td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>${memberInfo.mobile}</td>
							<th>추가연락처</th>
							<td>${memberInfo.phone}</td>
						</tr>
						<tr>
							<th rowspan="2">총상품결제금액</th>
							<td rowspan="2"><fmt:formatNumber value="${orderPrice -totalMemberDc - totalCouponDc + totalCancelPrice - totalCancelMemberDc - totalCancelCouponDc}" type="number" /></td>
							<th>총환불금액</th>
							<td><fmt:formatNumber value="${empty orderInfo.totalRefund ? 0 : orderInfo.totalRefund   }" type="number" /></td>
						</tr>
						<tr>
							<th>총환불마일리지</th>
							<td><fmt:formatNumber value="${empty orderInfo.totalRefundEmoney ? 0 : orderInfo.totalRefundEmoney }" type="number" /></td>
						</tr>
						<tr>
							<th>총주문상품결제금액</th>
							<td colspan="3"><fmt:formatNumber value="${orderPrice -totalMemberDc - totalCouponDc}" type="number" /></td>
						</tr>
						<tr>
							<th>생일쿠폰</th>
							<td colspan="3">
								${orderInfo.coupon } <!-- ( 10% ) -->
							</td>
						</tr>
						<tr>
							<th>적립금사용</th>
							<td colspan="3">
								${orderInfo.emoney }
							</td>
						</tr>
						<tr>
							<th>에누리</th>
							<td colspan="3">
								<input type="number" id="discount" min="0" name="" value="${orderInfo.enuri }" style="width: 80px;">
							</td>
						</tr>
						<!-- 
						<tr>
							<th>기타할인금액</th>
							<td colspan="3">
								<c:if test="${orderInfo.status eq '주문취소' }">
									<fmt:formatNumber value="0" type="number" /> ( 쿠폰할인 0 + 쿠폰할인 0 + 적립금사용 0 + 에누리 <input type="number" id="discount" min="0" name="" value="0" class="textAR" style="width: 80px;"> )
								</c:if>
								<c:if test="${orderInfo.status ne '주문취소' }">
									<fmt:formatNumber value="${ orderInfo.coupon + orderInfo.emoney + orderInfo.enuri }" type="number" /> (금액쿠폰할인 <fmt:formatNumber value="${orderInfo.coupon }" type="number" /> + 적립금사용 <fmt:formatNumber value="${orderInfo.emoney }" type="number" /> + 에누리 <input type="number" id="discount" min="0" name="" value="${orderInfo.enuri }" class="textAR" style="width: 80px;"> )
								</c:if>
							</td>
						</tr>
						 -->
						<tr>
							<th>배송비</th>
							<td colspan="3">
								<span id="dpayment"><fmt:formatNumber value="${orderInfo.deliveryPrice }" type="number" /></span> ( 30,000 이상 무료 )
							</td>
						</tr>
						<tr>
							<th>총예상결제금액</th>
							<td colspan="3">
								<span id="payment" class="esa">
									<c:if test="${orderInfo.status eq '주문취소' }">
										<fmt:formatNumber value="0" type="number" />
									</c:if>
									<c:if test="${orderInfo.status ne '주문취소' }">
										<fmt:formatNumber value='${orderPrice -totalMemberDc - totalCouponDc -(orderInfo.coupon + orderInfo.emoney + orderInfo.enuri ) + orderInfo.deliveryPrice}' type="number" />
									</c:if>
								</span>
							</td>
						</tr>
						<!-- 결제 무통장 -->
						<tr>
							<th>결제방식</th>
							<td>${orderInfo.settleKind }</td>
							<th>은행</th>
							<td>${orderInfo.bankName } ${orderInfo.bankAccount} 김광수</td>
						</tr>
						<tr>
							<th>입금자명</th>
							<td>${orderInfo.bankSender }</td>
							<th>결제확인</th>
							<td>하나은행 0000-00-00 00:00:00 </td>
						</tr>
						<!--// 결제 무통장 -->
						<!-- 신용카드 계좌이체 -->
						<tr>
							<th>결제방식</th>
							<td>${orderInfo.settleKind}</td>
							<th>결제확인일</th>
							<td>${orderInfo.paymentTime }</td>
						</tr>
						<!--// 신용카드 계좌이체 -->
						<!-- 현금영수증 발급 전-->
						<c:if test="${orderInfo.cashReceiptStatus ne 'COMPLETED'}"></c:if> 
						<c:if test="${(orderInfo.settleKind eq '무통장' or orderInfo.settleKind eq '현금')}">
							<tr>
								<th>현금영수증발급</th>
								<td colspan="3">
									<c:if test="${(orderInfo.settleKind eq '무통장' or orderInfo.settleKind eq '현금') and orderInfo.cashReceiptNo eq null and orderInfo.cashReceiptYn eq 'Y'}">
										<a href="/mngr/order/list/popup/receipt" onclick="if(!confirm('현금영수증 발급 페이지로 이동합니다. 저장하지 않은 데이터는 소멸됩니다. 이동하시겠습니까?')){}" class="type_button">발급</a>
									</c:if>
									<c:if test="${orderInfo.cashReceiptStatus eq 'COMPLETED'}">
										<a href="/mngr/order/list/popup/receipt" onclick="if(!confirm('현금영수증 발급 페이지로 이동합니다. 저장하지 않은 데이터는 소멸됩니다. 이동하시겠습니까?')){}" class="type_button">보기</a>
									</c:if> 
									<button type="button" onclick="if(!confirm('현금영수증 발급을 완료 처리합니다. 계속하시겠습니까?')){}">별도발급처리(페이지 나오면 a이동)</button>
								</td>
							</tr>
						</c:if>
						
						<!--// 현금영수증 발급 전-->
						<!-- 현금영수증 발급 후-->
						<tr>
							<th>현금영수증발급</th>
							<td colspan="3">
								요청완료
								<!-- 별도 발급 처리인 경우 -->
								( 별도발급처리 )
								<!--// 별도 발급 처리인 경우 -->
							</td>
						</tr>
						<!--// 현금영수증 발급 후-->
					</tbody>
				</table>
				<h3>배송정보</h3>
				<table class="contentTable">
					<caption>정보</caption>
					<colgroup>
						<col style="width: 180px;">
						<col>
						<col style="width: 180px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>송장번호</th>
							<td colspan="3">
								${orderInfo.deliveryCode }
								<c:if test="${orderInfo.deliveryCode ne null and orderInfo.deliveryCode ne '' }"> 
									<button type="button" onclick="openWindow('${fn:replace(orderInfo.deliveryUrl, '{deliveryCode}', orderInfo.deliveryCode)}', 500, 500);">배송추적</button>
								 </c:if>
							</td>
						</tr>
						<tr>
							<th>출고일</th>
							<td>${orderInfo.deliveryTime }</td>
							<th>배송완료일</th>
							<td>${orderInfo.orderCompleteTime }</td>
						</tr>
						<tr>
							<th>이름</th>
							<td colspan="3">
								<input type="text" name="" value="${orderInfo.receiverName}" style="width: 180px;" required>
							</td>
						</tr>
						<tr>
							<th>우편번호 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3">
								<input type="text" name="" id="zipcode1" value="${orderInfo.zipcode }" required readonly="" style="width: 60px;">
								<button type="button" onclick="execDaumPostcode('zipcode1', 'address1');">검색</button>
							</td>
						</tr>
						<tr>
							<th>주소 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3"><input type="text" name="" id="address1" value="${orderInfo.address }" required readonly="" style="width: 549px;"></td>
						</tr>
						<tr>
							<th>상세주소 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3"><input type="text" name="" value="<c:if test="${orderInfo.subAddress eq null or orderInfo.subAddress eq '' }"> </c:if><c:if test="${orderInfo.subAddress ne null or orderInfo.subAddress ne '' }">${orderInfo.subAddress} </c:if>" required style="width: 549px;"></td>
						</tr> 
						<tr>
							<th>연락처 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td><input type="tel" name="" value="${orderInfo.receiverMobile }" required style="width: 110px;"></td>
							<th>추가연락처</th>
							<td><input type="tel" name="" value="${orderInfo.receiverPhone }" style="width: 110px;"></td>
						</tr>
					</tbody>
				</table>
				<h3>메모</h3>
				<table class="contentTable">
					<caption>정보</caption>
					<colgroup>
						<col style="width: 180px;">
						<col>
						<col style="width: 180px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>고객요청사항</th>
							<td colspan="3"><textarea name="" rows="5" cols="5">${orderInfo.memo }</textarea></td>
						</tr>
						<tr>
							<th>상담메모</th>
							<td colspan="3"><textarea name="" rows="5" cols="5">${orderInfo.adminMemo }</textarea></td>
						</tr>
						<tr>
							<th>결제로그</th>
							<td colspan="3"><textarea name="" rows="5" cols="5" disabled>${orderInfo.settleLog }</textarea></td>
						</tr>
					</tbody>
				</table>
				<div class="contentMenu popup">
					<button type="submit" value="저장">저장</button>
					<a href="" onclick="if(!confirm('삭제된 데이터는 복구할 수 없습니다. 삭제하시겠습니까?')){}" class="buttonType caution">삭제</a>
					<div class="selectBtn">
						<select id="selectOrdState">
							<option value="0">주문내역서</option>
							<option value="1">간이영수증</option>
							<option value="2">거래명세서</option>
						</select>
						<button type="button" onclick="">프린트</button>
					</div>
					<button type="button" onclick="window.self.close();">닫기</button>
				</div>
			</form>
		</div>
		<script>
			const amount = document.getElementById('payment').innerHTML.replace(',','')*1;
			const limit = 30000;
			const dpayment = 3000;
			$(document).on('keyup', '#discount', function(){
				const payment = Number(amount - $('#discount').val());
				$('#payment').text(payment.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ','));
				
				/*
				if(payment < limit){
					$('#dpayment').text(dpayment.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ','));
				} else {
					$('#dpayment').text('0');
				}
				*/
			});
		</script>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<script>
	$('body').css('min-width','980px');
	function deliveryOpen(url){
		window.open(url,'배송조회');
	}
</script>
<jsp:include page="../../include/bottom.jsp" flush="false" />
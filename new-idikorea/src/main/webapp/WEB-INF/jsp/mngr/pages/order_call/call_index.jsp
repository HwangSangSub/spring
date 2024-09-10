<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_01" />
</jsp:include>

<div class="middleArea">

	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_01" />
		<jsp:param name="depth_01" value="sideMenu_01_02" />
		<jsp:param name="depth_02" value="sideMenu_01_02_01" />
	</jsp:include>

	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 주문관리
				<i class="fa fa-angle-right" aria-hidden="true"></i> 전화주문목록
			</div>
			<h2>전화주문목록</h2>
		</div>
		<button type="button" class="openerSideMenu">
			<i class="fa fa-chevron-left" aria-hidden="true"></i>
		</button>
		<div class="contentArea">
			<form action="./popup_cancel.jsp" method="post">
				<h3>회원정보</h3>
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
							<th>회원명 ( 아이디 )</th>
							<td colspan="3">
								<input type="text" name="memberId" value="" style="width: 180px;" required readonly>
								<input type="hidden" name="memberNo" value="" >
								<button type="button" onclick="openWindow('/mngr/member/management/popup/list/index', 'member_management_list_popup_list_index', 1000, 840);">회원검색</button>
								<button type="button" onclick="openWindow('../member_management_list/popup_detail.jsp', 'member_management_list_popup_detail', 1000, 840);">회원가입</button>
							</td>
						</tr>
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
							<th>이름</th>
							<td colspan="3">
								<input type="text" name="memberName" value="" style="width: 180px;" required>
							</td>
						</tr>
						<tr>
							<th>그룹</th>
							<td colspan="3">후원회원</td>
						</tr>
						<tr>
							<th>우편번호 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3">
								<input type="text" name="zipcode" id="zipcode1" value="" required readonly style="width: 60px;">
								<button type="button" onclick="execDaumPostcode('zipcode1', 'address1');">검색</button>
							</td>
						</tr>
						<tr>
							<th>주소 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3"><input type="text" name="address" id="address1" value="" required readonly style="width: 549px;"></td>
						</tr>
						<tr>
							<th>상세주소 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3"><input type="text" name="subAddress" value="" required style="width: 549px;"></td>
						</tr>
						<tr>
							<th>연락처 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3"><input type="tel" name="mobile" value="" required style="width: 110px;"></td>
						</tr>
						<tr>
							<th>추가연락처</th>
							<td colspan="3"><input type="tel" name="phone" value="" style="width: 110px;"></td>
						</tr>
					</tbody>
				</table>
				<h3>
					주문상품목록
					<button type="button" class="type_button" id="goodsSearchBtn">상품검색</button>
				</h3>
				<table class="contentTable resultTable board">
					<caption>게시물</caption>
					<colgroup>
						<col style="width: 69px;">
						<col style="width: 69px;">
						<col style="width: 81px;">
						<col>
						<col style="width: 96px;">
						<col style="width: 96px;">
						<col style="width: 96px;">
						<col style="width: 96px;">
						<col style="width: 121px;">
						<col style="width: 96px;">
						<col style="width: 96px;">
						<col style="width: 96px;">
						<col style="width: 78px;">
					</colgroup>
					<thead>
						<tr>
							<th><div class="textCut">번호</div></th>
							<th><div class="textCut">상품코드</div></th>
							<th><div class="textCut">사진</div></th>
							<th><div class="textCut">상품명</div></th>
							<th><div class="textCut">재고수량</div></th>
							<th><div class="textCut">재고제한없음</div></th>
							<th><div class="textCut">최소구매수량</div></th>
							<th><div class="textCut">최대구매수량</div></th>
							<th><div class="textCut">구매수량</div></th>
							<th><div class="textCut">판매금액</div></th>
							<th><div class="textCut">회원할인금액</div></th>
							<th><div class="textCut">상품결제금액</div></th>
							<th><div class="textCut">삭제</div></th>
						</tr>
					</thead>
					<tbody id="product">
						<!--
						<tr>
							<td colspan="13">상품 검색을 통해 상품을 등록해 주세요.</td>
						</tr>
						-->
						<!-- <tr>
							<td><div class="textCut">00000</div></td>
							<td><div class="textCut">00000</div></td>
							<td>
								<div class="thumbnail textCut" style="width: 55px; height: 55px;">
									<img src="https://www.idikorea.com/attach_file/prod/5aafbe4ebd3c468cbf28ea27445c775d.png" alt="">
								</div>
							</td>
							<td class="textAL">
								<div class="textCut">19&gt;SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품)</div>
								상품 옵션이 있는 경우
								<div class="textCut" style="border-top: 1px dashed #ccc; margin-top: 6px; padding-top: 6px;">상품옵션 1 &gt; 상품옵션 1-1</div>
								// 상품 옵션이 있는 경우
							</td>
							<td><div class="textCut">0</div></td>
							<td><div class="textCut">&check;</div></td>
							<td>
								<div class="textCut">
									1
									<input type="hidden" value="1" id="minimum">
								</div>
							</td>
							<td>
								<div class="textCut">
									10
									<input type="hidden" value="10" id="maximum">
								</div>
							</td>
							<td>
								<input type="button" value="-" class="prodQtyMinus" style="width: 19px; padding: 0;">
								<input type="text" value="1" class="textAR goodsQty" readonly style="width: 50px;">
								<input type="button" value="+" class="prodQtyPlus" style="width: 19px; padding: 0;">
							</td>
							<td>
								<div class="textCut textAR">
									<span class="sales">9,900</span>
									<input type="hidden" value="9900" id="one_sales">
								</div>
							</td>
							<td>
								<div class="textCut textAR">
									<span class="discount">990</span>
									<input type="hidden" value="990" id="one_discount">
								</div>
							</td>
							<td>
								<div class="textCut textAR">
									<span class="payment">8,910</span>
									<input type="hidden" value="8910" id="one_payment">
								</div>
							</td>
							<td><div class="textCut"><button type="button">삭제</button></div></td>
						</tr>
						<tr>
							<td><div class="textCut">00000</div></td>
							<td><div class="textCut">00000</div></td>
							<td>
								<div class="thumbnail textCut" style="width: 55px; height: 55px;">
									<img src="https://www.idikorea.com/attach_file/prod/5aafbe4ebd3c468cbf28ea27445c775d.png" alt="">
								</div>
							</td>
							<td class="textAL">
								<div class="textCut">19&gt;SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품)</div>
							</td>
							<td><div class="textCut">0</div></td>
							<td><div class="textCut">&check;</div></td>
							<td>
								<div class="textCut">
									2
									<input type="hidden" value="2" id="minimum">
								</div>
							</td>
							<td>
								<div class="textCut">
									10
									<input type="hidden" value="10" id="maximum">
								</div>
							</td>
							<td>
								<input type="button" value="-" class="prodQtyMinus" style="width: 19px; padding: 0;">
								<input type="text" value="2" class="textAR goodsQty" readonly style="width: 50px;">
								<input type="button" value="+" class="prodQtyPlus" style="width: 19px; padding: 0;">
							</td>
							<td>
								<div class="textCut textAR">
									<span class="sales">19,800</span>
									<input type="hidden" value="9900" id="one_sales">
								</div>
							</td>
							<td>
								<div class="textCut textAR">
									<span class="discount">1,980</span>
									<input type="hidden" value="990" id="one_discount">
								</div>
							</td>
							<td>
								<div class="textCut textAR">
									<span class="payment">17,820</span>
									<input type="hidden" value="8910" id="one_payment">
								</div>
							</td>
							<td><div class="textCut"><button type="button">삭제</button></div></td>
						</tr> -->
						<!--
						<tr>
							<td colspan="13">등록된 게시물이 없습니다.</td>
						</tr>
						-->
					</tbody>
				</table>
				<h3>결제정보</h3>
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
							<th>총주문상품결제금액</th>
							<td colspan="3" id="sum">26,730</td>
						</tr>
						<tr>
							<th>생일할인쿠폰</th>
							<td colspan="3">
								<input type="radio" name="birthday_coupon" value="10" id="birthday_coupon_01" class="birthday_coupon">
								<label for="birthday_coupon_01">사용 ( 10% )</label>
								<input type="radio" name="birthday_coupon" value="0" id="birthday_coupon_02" class="birthday_coupon" checked>
								<label for="birthday_coupon_02">사용안함</label>
							</td>
						</tr>
						<tr>
							<th>적립금사용</th>
							<td colspan="3">
								<input type="number" id="savedmoney" min="0" name="" value="0" style="width: 80px;">
								<span id="usedEmoneyText"> idi info 테이블 생성시 max_emoney 바꿔줘야함</span>
								<input type="hidden" value="100000" id="max_savedmoney">
							</td>
						</tr>
						<tr>
							<th>에누리</th>
							<td colspan="3">
								<input type="number" id="chaffer" min="0" name="" value="0" style="width: 80px;">
							</td>
						</tr>
						<tr>
							<th>배송비</th>
							<td colspan="3">
								<span id="delivery"></span> ( ${delivery.free } 이상 무료 )
								<input type="hidden" value="${delivery.free }" id="delivery_charge" >
							</td>
						</tr>
						<tr>
							<th>예상결제금액</th>
							<td colspan="3">
								<span class="esa" id="orderPrice">29,730</span>
							</td>
						</tr>
					</tbody>
				</table>
				<h3>결제수단</h3>
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
							<th>주문방식</th>
							<td colspan="3">
								<input type="radio" name="orderType" value="전화" id="type1" onclick="disableOption('.payment_method', '.payment_method_03, .payment_method_04', '.payment_method_01');" checked>
								<label for="type1">전화</label>
								<input type="radio" name="orderType" value="내방" id="type2" onclick="disableOption('.payment_method', '.payment_method_02', '.payment_method_01');">
								<label for="type2">내방</label>
								<input type="radio" name="orderType" value="도매점" id="type3" onclick="disableOption('.payment_method', '.payment_method_02, .payment_method_03, .payment_method_04', '.payment_method_01');">
								<label for="type3">도매점</label>
								<input type="radio" name="orderType" value="기증" id="type4" onclick="disableOption('.payment_method', '.payment_method_02', '.payment_method_01');">
								<label for="type4">기증</label>
								<input type="radio" name="orderType" value="직접배송" id="type5" onclick="disableOption('.payment_method', '.payment_method_02', '.payment_method_01');">
								<label for="type5">직접배송</label>
								<input type="radio" name="orderType" value="카페" id="type6" onclick="disableOption('.payment_method', '.payment_method_01, .payment_method_02', '.payment_method_03');">
								<label for="type6">카페</label>
							</td>
						</tr>
						<tr>
							<th>결제방식</th>
							<td colspan="3">
								<input type="radio" name="orderMethod" value="무통장" id="method1" class="payment_method payment_method_01" onclick="dp_content('.method_01, .method_03', '.method_02', 'table-row');" checked>
								<label for="method1">무통장</label>
								<input type="radio" name="orderMethod" value="신용카드" id="method2" class="payment_method payment_method_02" onclick="dp_content('.method_02', '.method_01, .method_03', 'table-row');">
								<label for="method2">신용카드</label>
								<input type="radio" name="orderMethod" value="현금" id="method3" class="payment_method payment_method_03" onclick="dp_content('.method_03', '.method_01, .method_02', 'table-row');" disabled>
								<label for="method3">현금</label>
								<input type="radio" name="orderMethod" value="매장카드" id="method4" class="payment_method payment_method_04" onclick="dp_content('', '.method_01, .method_02, .method_03', 'table-row');" disabled>
								<label for="method4">매장카드</label>
							</td>
						</tr>
						<tr class="method_01">
							<th>
								입금장명
								<abbr class="essential" title="필수입력사항">*</abbr>
							</th>
							<td colspan="3">
								<input type="text" id="bankSender" name="" value="" style="width: 180px;" required>
							</td>
						</tr>
						<tr class="method_01">
							<th>무통장</th>
							<td colspan="3">
								<select name="ordBankSelect" id="bankSelect" style="width: 240px;">
									<option id="bank1" value="1">농협 1076-12-090295 김광수</option>
									<option id="bank2" value="2">하나은행 460-910073-67207 김광수</option>
									<option id="bank3" value="3">SC제일은행 585-20-164746 김광수</option>
								</select>
							</td>
						</tr>
						<tr class="method_02 dp_none">
							<th>LG주문번호</th>
							<td colspan="3">
								<input type="text" id="lgOrdNo" name="lgOrdNo" style="width: 240px;">
							</td>
						</tr>
						<tr class="method_03">
							<th>현금영수증</th>
							<td colspan="3">
								<input type="radio" name="cashReceiptYn" id="method7" value="Y">
								<label for="method7">요청</label>
								<input type="radio" name="cashReceiptYn" id="method8" value="N" checked>
								<label for="method8">요청안함</label>
							</td>
						</tr>
						<tr>
							<th>미수금</th>
							<td colspan="3">
								<input type="number" id="unpaid" min="0" name="" value="0" style="width: 80px;">
								<label for="outstanding" style="margin-left: 12px;">메모</label>
								<input type="text" name="" value="" id="outstanding" style="width: 549px;">
							</td>
						</tr>
						<tr>
							<th>접수일자변경</th>
							<td colspan="3">
								<input type="text" name="slastsaledt" class="datepick" style="width: 80px;" readonly>
							</td>
						</tr>
						<tr>
							<th>카탈로그신청</th>
							<td colspan="3">
								<input type="checkbox" name="catalog" id="method9">
								<label for="method9">신청</label>
							</td>
						</tr>
						<tr>
							<th>상담메모</th>
							<td colspan="3">
								<textarea name="" id="adminMemo" cols="30" rows="10"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" id="memberDc" value="1">
				<div class="contentMenu">
					<input type="button" id="orderBtn" value="결제" />
					<a href="./" class="buttonType">취소</a>
				</div>
			</div>
		</form>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<script>

	// 예상결제금액
	function calcSum(){
		const SAVEDMONEY = $('#savedmoney').val(); // 적립금사용
		const MAX_SAVEDMONEY = $('#max_savedmoney').val(); // 사용가능한적립금금액
		const CHAFFER = $('#chaffer').val(); // 에누리
		const DELIVERY_CHARGE = $('#delivery_charge').val(); // 배송비

		let sum = 0; // '새' 총주문상품결제금액
		let birthday_coupon = 0; // 생일쿠폰
		let delivery = 0; // '새' 배송비

		$('#product tr').each(function(){ // 주문상품목록전체
			sum += Number( $(this).find('input#one_payment').val() * $(this).find('input.goodsQty').val() ); // 개당상품결제금액 * 수량
		});
// 		sum=sum-SAVEDMONEY-CHAFFER;
		let originTotalPrice = 0;
		document.querySelectorAll('span.sales').forEach(tag=>{
			console.log(tag.innerHTML);
			originTotalPrice += tag.innerHTML.replaceAll(',','')*1  ;
		})
		
		if($('input#birthday_coupon_01').is(':checked')){ birthday_coupon = Math.floor(originTotalPrice * 0.1); }; // 생일쿠폰
		if((sum-SAVEDMONEY-CHAFFER) >= DELIVERY_CHARGE){ delivery = 0; } else { delivery = 3000; }; // '새' 배송비
		
		$('#sum').text(numericCommas(sum)); // '새' 총주문상품결제금액 표시
		$('#delivery').text(numericCommas(delivery)); // '새' 배송비 표시
		if(Number(sum) - Number(birthday_coupon) - Number(SAVEDMONEY) - Number(CHAFFER) + Number(delivery)<0){
			document.getElementById('birthday_coupon_02').checked=true;
			document.getElementById('savedmoney').value = '';
			document.getElementById('chaffer').value = '';
			$('span.esa').text(numericCommas(Number(sum)  + Number(delivery)));
			return alert('예상결제금액이 마이너스가 될 수 없습니다.');
		}
		$('span.esa').text(numericCommas(Number(sum) - Number(birthday_coupon) - Number(SAVEDMONEY) - Number(CHAFFER) + Number(delivery))); // '새' 예상결제금액 = 총주문상품결제금액 - 생일할인쿠폰 - 적립금사용 - 에누리 + 배송비
	}

	// 생일할인쿠폰
	$(document).on('click', 'input.birthday_coupon', function(){
		calcSum();
	});

	// 적립금, 에누리
	$(document).on('keyup', '#savedmoney, #chaffer', function(){
		calcSum();
	});

	// 상품 수량 증가 감소
	$(document).on('click', '.prodQtyMinus, .prodQtyPlus', function(){
		let goodsQty; // 구매수량
		const MINIMUM = $(this).closest('tr').find('input#minimum'); // 최소구매수량
		const MAXIMUM = $(this).closest('tr').find('input#maximum'); // 최대구매수량

		const SALESTEXT = $(this).closest('tr').find('span.sales'); // 전체판매금액표시
		const ONE_SALES = $(this).closest('tr').find('input#one_sales'); // 개당판매금액

		const DISCOUNTTEXT = $(this).closest('tr').find('span.discount'); // 전체회원할인금액표시
		const ONE_DISCOUNT = $(this).closest('tr').find('input#one_discount'); // 개당회원할인금액

		const PAYMENTTEXT = $(this).closest('tr').find('span.payment'); // 전체상품결제금액표시
		const PAYMENTVALUE = $(this).closest('tr').find('input#one_payment'); // 개당상품결제금액

		if($(this).hasClass('prodQtyMinus') == true){
			goodsQty = $(this).next('input.goodsQty');
			console.log(goodsQty.val())
			if(goodsQty.val() == MINIMUM.val()){
				alert('최소구매 수량은 ' + MINIMUM.val() + '개입니다.');
				return;
			} else {
				goodsQty.val(Number(goodsQty.val()) - 1);
			}
		} else if($(this).hasClass('prodQtyPlus') == true){
			goodsQty = $(this).prev('input[type=text]');
			console.log(MAXIMUM.val())
			if( MAXIMUM.val()!='' && goodsQty.val() == MAXIMUM.val()){
				alert('최대구매 수량은 ' + MAXIMUM.val() + '개입니다.');
				return;
			}else if($(this).closest('tr').find('[name="stock"').text()!='∞' && $(this).prev('input.goodsQty').val()*1+1 > $(this).closest('tr').find('[name="stock"]').text()*1 ){
				return alert('남은 재고수량은 ' +$(this).closest('tr').find('[name="stock"]').text() + '개입니다.');;
			}else {
				goodsQty.val(Number(goodsQty.val()) + 1);
			}
		}
		const NEWSALES = Number(ONE_SALES.val()) * Number(goodsQty.val()); // '새' 판매금액 = 개당판매금액 * 수량
		SALESTEXT.text(numericCommas(NEWSALES)); // '새' 판매금액표시

		const NEWDISCOUNT = Number(ONE_DISCOUNT.val()) * Number(goodsQty.val()); // '새' 할인금액 = 개당회원할인금액 * 수량
		DISCOUNTTEXT.text(numericCommas(NEWDISCOUNT)); // '새' 할인금액표시

		PAYMENTTEXT.text(numericCommas(NEWSALES - NEWDISCOUNT)); // '새' 상품결제금액표시
		calcSum();
	});
</script>

<script type="module">
	import {get} from '/js/mngr/pages/order_call/call_index.js';
	get.init();
	window.get = get;
console.log(get)
</script>

<jsp:include page="../../include/bottom.jsp" flush="false" />



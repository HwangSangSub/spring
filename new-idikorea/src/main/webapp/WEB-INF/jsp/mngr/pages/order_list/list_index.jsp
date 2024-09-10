<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_01" />
</jsp:include>

<div class="middleArea">

	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_01" />
		<jsp:param name="depth_01" value="sideMenu_01_01" />
		<jsp:param name="depth_02" value="sideMenu_01_01_01" />
	</jsp:include>

	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 주문관리
				<i class="fa fa-angle-right" aria-hidden="true"></i> 주문목록
			</div>
			<h2>주문목록</h2>
		</div>
		<button type="button" class="openerSideMenu">
			<i class="fa fa-chevron-left" aria-hidden="true"></i>
		</button>
		<div class="contentArea notitle">
			<form id="" name="">
				<table class="contentTable no_border">
					<caption>검색</caption>
					<colgroup>
						<col style="width: 87px;">
						<col style="width: 327px;">
						<col style="width: 75px;">
						<col style="width: 327px;">
						<col style="width: 63px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>주문검색</th>
							<td>
								<select name="orderSearchOption">
									<option value="orderNo">주문번호</option>
									<option value="memberName">주문자명</option>
									<option value="receiverName">수령자명</option>
									<option value="memberId">아이디</option>
								</select>
								<input type="text" id="" name="orderSearchValue" autofocus style="width: 180px;">
							</td>
							<th>상품검색</th>
							<td>
								<select name="productSearchOption">
									<option value="1">상품명</option>
									<option value="2">브랜드</option>
									<option value="3">제조사</option>
								</select>
								<input type="text" id="" name="productSearchValue" autofocus style="width: 180px;">
							</td>
							<th>기준일</th>
							<td>
								<select name="">
									<option value="">주문접수일</option>
									<option value="">결제확인일</option>
									<option value="">배송일</option>
									<option value="">배송완료일</option>
								</select>
								<input type="text" id="startTime" name="slastsaledt" class="datepick" style="width: 80px;" readonly>
								~
								<input type="text" id="endTime" name="elastsaledt" class="datepick" style="width: 80px;" readonly>
								<input type="button" onclick="getToday('slastsaledt', 'elastsaledt');" value="오늘">
								<input type="button" onclick="getPeriod('slastsaledt', 'elastsaledt', 7);" value="일주일">
								<input type="button" onclick="getPeriod('slastsaledt', 'elastsaledt', 30);" value="한달">
								<input type="button" onclick="getPeriod('slastsaledt', 'elastsaledt', 0);" value="전체">
							</td>
						</tr>
						<tr>
							<th>주문구분</th>
							<td>
								<input type="radio" name="radio_01" id="radio_01" value="" checked>
								<label for="radio_01">전체</label>
								<input type="radio" name="radio_01" id="radio_02" value="">
								<label for="radio_02">전화주문</label>
								<input type="radio" name="radio_01" id="radio_03" value="">
								<label for="radio_03">일반주문</label>
							</td>
							<th>주문방식</th>
							<td colspan="3" id="orderType">
								<input type="radio" name="orderType" id="type0" value="전체" checked>
								<label for="type0">전체</label> 
								<input type="radio" name="orderType" id="type1" value="쇼핑몰">
								<label for="type1">쇼핑몰</label>
								<input type="radio" name="orderType" id="type2" value="전화">
								<label for="type2">전화</label>
								<input type="radio" name="orderType" id="type3" value="내방현금">
								<label for="type3">내방현금</label>
								<input type="radio" name="orderType" id="type4" value="내방카드">
								<label for="type4">내방카드</label>
								<input type="radio" name="orderType" id="type5" value="도매점">
								<label for="type5">도매점</label>
								<input type="radio" name="orderType" id="type6" value="기증">
								<label for="type6">기증</label>
								<input type="radio" name="orderType" id="type7" value="직접배송">
								<label for="type7">직접배송</label>
								<input type="radio" name="orderType" id="type8" value="카페">
								<label for="type8">카페</label>
							</td>
						</tr>
						<tr>
							<th>현금영수증</th>
							<td class="" id="cashReceipt">
								<input type="radio" name="cashReceipt" id="radio_04" value="" checked>
								<label for="radio_01">전체</label>
								<input type="radio" name="cashReceipt" id="radio_05" value="">
								<label for="radio_05">요청</label>
								<input type="radio" name="cashReceipt" id="radio_06" value="">
								<label for="radio_06">요청안함</label>
							</td>
							<th>결제방식</th>
							<td colspan="3" id="settleKind">
								<input type="radio" name="orderMethod" id="method0" value="0" checked>
								<label for="method0">전체</label> 
								<input type="radio" name="orderMethod" id="method1" value="a">
								<label for="method1">무통장</label>
								<input type="radio" name="orderMethod" id="method2" value="c">
								<label for="method2">신용카드</label>
								<input type="radio" name="orderMethod" id="method3" value="o">
								<label for="method3">계좌이체</label>
								<input type="radio" name="orderMethod" id="method4" value="v">
								<label for="method4">가상계좌</label>
								<input type="radio" name="orderMethod" id="method5" value="h">
								<label for="method5">휴대폰</label>
								<input type="radio" name="orderMethod" id="method6" value="d">
								<label for="method6">전액할인</label>
							</td>
						</tr>
						<tr>
							<th>목록개수</th>
							<td id="itemSize">
								<input type="radio" name="list_num" id="list_num_01" value="20" checked>
								<label for="list_num_01">20개</label>
								<input type="radio" name="list_num" value="40" id="list_num_02">
								<label for="list_num_02">40개</label>
								<input type="radio" name="list_num" value="100000000" id="list_num_03">
								<label for="list_num_03">전체</label>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="contentMenu">
					<input type="button" class="buttonType" id="searchBtn" value="검색">
					<a href="./list_index.jsp" class="buttonType">초기화</a>
				</div>
			</form>
		</div>
		<div class="contentArea notitle">
			<div class="tabmenu clearFix">
				<button type="button" onclick="viewTabmenu('.tc, .print', '.tc_01', 'block', this);" class="tab event active" value="주문접수">주문접수(0,000)</button>
				<button type="button" onclick="viewTabmenu('.tc', '.tc_02, .print', 'block', this);" class="tab event" value="결제확인">결제확인(0,000)</button>
				<button type="button" onclick="viewTabmenu('.tc', '.tc_03, .print', 'block', this);" class="tab event" value="배송준비중">배송준비중(0,000)</button>
				<button type="button" onclick="viewTabmenu('.tc, .print', '.tc_04', 'block', this);" class="tab event" value="배송중">배송중(0,000)</button>
				<button type="button" onclick="viewTabmenu('.tc, .print', '.tc_05', 'block', this);" class="tab event" value="배송완료">배송완료(0,000)</button>
				<button type="button" onclick="viewTabmenu('.tc, .print', '.tc_06', 'block', this);" class="tab event" value="주문취소">주문취소(0,000)</button>
			</div>
			<div class="contentTR clearFix belowtabmenu">
				<span class="colorBox idi"></span> 전화주문
				<span class="colorBox"></span> 일반주문
			</div>
			<!-- tc tc_01 -->
			<div class="tc tc_01">
 				<table class="contentTable resultTable line_hover board"> 
					<caption>전체목록</caption>
					<colgroup>
						<col style="width: 45px;">
						<col style="width: 69px;">
						<col style="width: 147px;">
						<col style="width: 81px;">
						<col>
						<col style="width: 81px;">
						<col style="width: 81px;">
						<col style="width: 81px;">
						<col style="width: 81px;">
						<col style="width: 5%;">
						<col style="width: 5%;">
						<col style="width: 81px;">
						<col style="width: 81px;">
						<col style="width: 96px;">
						<col style="width: 147px;">
					</colgroup>
					<thead>
						<tr>
							<th><div class="textCut"><input type='checkbox' class="tc_01_check" onclick="selectAll(this, 'tc_01_check')" /></div></th>
							<th><div class="textCut">번호</div></th>
							<th><div class="textCut">주문일시</div></th>
							<th><div class="textCut">현금영수증</div></th>
							<th><div class="textCut">주문상품</div></th>
							<th><div class="textCut">상세정보</div></th>
							<th><div class="textCut">회원정보</div></th>
							<th><div class="textCut">주문내역</div></th>
							<th><div class="textCut">적립금내역</div></th>
							<th><div class="textCut">주문자</div></th>
							<th><div class="textCut">수령자</div></th>
							<th><div class="textCut">주문방식</div></th>
							<th><div class="textCut">결제방식</div></th>
							<th><div class="textCut">총결제금액</div></th>
							<th><div class="textCut">일자</div></th>
						</tr>
					</thead>
					<tbody id="orderList">
						<%-- <% for(int x = 0; x < 5; x++) { %>
>>>>>>> branch 'main' of https://gitlab.brighten.co.kr/hdi/new-idikorea.git
						<tr class="idi_connect">
							<td><div class="textCut"><input type="checkbox" name="" class="tc_01_check" value=""></div></td>
							<td><div class="textCut">000000</div></td>
							<td><div class="textCut">0000-00-00 00:00:00</div></td>
							<td><div class="textCut">요청</div></td>
							<td><div class="textCut textAL">19>SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품) 외 1건</div></td>
							<td>
								<div class="textCut">
									<button type="button" onclick="openWindow('/mngr/order/list/popup/detail', 1000, 840);">보기</button>
								</div>
							</td>
							<td>
								<div class="textCut">
									<button type="button" onclick="openWindow('../member_management_list/popup_detail.jsp', 1000, 840);">보기</button>
								</div>
							</td>
							<td>
								<div class="textCut">
									<button type="button">보기</button>
								</div>
							</td>
							<td>
								<div class="textCut">
									<button type="button">보기</button>
								</div>
							</td>
							<td><div class="textCut">김연아 스텔라 수녀님</div></td>
							<td><div class="textCut">안중근 토마스 신부님</div></td>
							<td><div class="textCut">내방현금</div></td>
							<td><div class="textCut">신용카드</div></td>
							<td><div class="textCut textAR">000,000,000</div></td>
							<td><div class="textCut">0000-00-00 00:00:00</div></td>
						</tr>
						<% for(int x = 0; x < 4; x++) { %>
						<tr class="idi_connect">
							<td><div class="textCut"><input type="checkbox" name="" class="tc_01_check" value=""></div></td>
							<td><div class="textCut">000000</div></td>
							<td><div class="textCut">0000-00-00 00:00:00</div></td>
							<td><div class="textCut">발급완료</div></td>
							<td><div class="textCut textAL">19>SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품) 외 1건</div></td>
							<td>
								<div class="textCut">
									<button type="button" onclick="openWindow('/mngr/order/list/popup/detail', 1000, 840);">보기</button>
								</div>
							</td>
							<td>
								<div class="textCut">
									<button type="button" onclick="openWindow('../member_management_list/popup_detail.jsp', 1000, 840);">보기</button>
								</div>
							</td>
							<td>
								<div class="textCut">
									<button type="button">보기</button>
								</div>
							</td>
							<td>
								<div class="textCut">
									<button type="button">보기</button>
								</div>
							</td>
							<td><div class="textCut">김연아 스텔라 수녀님</div></td>
							<td><div class="textCut">안중근 토마스 신부님</div></td>
							<td><div class="textCut">내방현금</div></td>
							<td><div class="textCut">신용카드</div></td>
							<td><div class="textCut textAR">000,000,000</div></td>
							<td><div class="textCut">0000-00-00 00:00:00</div></td>
						</tr>
						<% } %> --%>

						<%-- <% for(int x = 0; x < 15; x++) { %>
						<tr>
							<td><div class="textCut"><input type="checkbox" name="" class="tc_01_check" value=""></div></td>
							<td><div class="textCut">000000</div></td>
							<td><div class="textCut">0000-00-00 00:00:00</div></td>
							<td><div class="textCut"></div></td>
							<td><div class="textCut textAL">19>SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품) 외 1건</div></td>
							<td>
								<div class="textCut">
									<button type="button" onclick="openWindow('/mngr/order/list/popup/detail', 1000, 840);">보기</button>
								</div>
							</td>
							<td>
								<div class="textCut">
									<button type="button" onclick="openWindow('../member_management_list/popup_detail.jsp', 1000, 840);">보기</button>
								</div>
							</td>
							<td>
								<div class="textCut">
									<button type="button">보기</button>
								</div>
							</td>
							<td>
								<div class="textCut">
									<button type="button">보기</button>
								</div>
							</td>
							<td><div class="textCut">김연아 스텔라 수녀님</div></td>
							<td><div class="textCut">안중근 토마스 신부님</div></td>
							<td><div class="textCut">쇼핑몰</div></td>
							<td><div class="textCut">휴대폰</div></td>
							<td><div class="textCut textAR">000,000,000</div></td>
							<td><div class="textCut">0000-00-00 00:00:00</div></td>
						</tr>
						<% } %> --%>
						<!-- <tr>
							<td colspan="15"><div class="textCut">등록된 게시물이 없습니다.</div></td>
						</tr> -->
					</tbody>
				</table>
				<!-- <div class="boardPaging">
					<ul class="clearFix">
						<li class="pagingFirst">
							<a href="#" title="첫 페이지로 이동">
								<i class="fa fa-chevron-left" aria-hidden="true"></i>
							</a>
						</li>
						<li class="pagingBlock">  
							<a href="#" title="이전 페이지 블록으로 이동">
								<i class="fa fa-angle-double-left" aria-hidden="true"></i>
							</a>
						</li>
						<li class="pagingPrev">
							<a href="#" title="이전 페이지로 이동">
								<i class="fa fa-angle-left" aria-hidden="true"></i>
							</a>
						</li>
						<li><strong>1</strong></li>
						<li><a href="#" title="2 페이지로 이동">2</a></li>
						<li><a href="#" title="3 페이지로 이동">3</a></li>
						<li><a href="#" title="4 페이지로 이동">4</a></li>
						<li><a href="#" title="5 페이지로 이동">5</a></li>
						<li class="pagingNext">
							<a href="" title="다음 페이지로 이동">
								<i class="fa fa-angle-right" aria-hidden="true"></i>
							</a>
						</li>
						<li class="pagingBlock">
							<a href="#" title="다음 페이지 블록으로 이동">
								<i class="fa fa-angle-double-right" aria-hidden="true"></i>
							</a>
						</li>
						<li class="pagingLast">
							<a href="#" title="끝 페이지로 이동">
								<i class="fa fa-chevron-right" aria-hidden="true"></i>
							</a>
						</li>
					</ul>
				</div> -->
			</div>
			<!--// tc tc_01 -->

			<!--// tc tc_02 ~ 09 -->
			<% for(int x = 2; x < 10; x++) { %>
			<div class="dp_none tc tc_0<%= x %>">
				<table class="contentTable resultTable line_hover board">
					<caption>전체목록</caption>
					<colgroup>
						<col style="width: 45px;">
						<col style="width: 69px;">
						<col style="width: 147px;">
						<col style="width: 81px;">
						<col>
						<col style="width: 81px;">
						<col style="width: 81px;">
						<col style="width: 81px;">
						<col style="width: 81px;">
						<col style="width: 5%;">
						<col style="width: 5%;">
						<col style="width: 81px;">
						<col style="width: 81px;">
						<col style="width: 96px;">
						<col style="width: 147px;">
					</colgroup>
					<thead>
						<tr>
							<th><div class="textCut"><input type='checkbox' class="tc_01_check" onclick="selectAll(this, 'tc_01_check')" /></div></th>
							<th><div class="textCut">번호</div></th>
							<th><div class="textCut">주문일시</div></th>
							<th><div class="textCut">현금영수증</div></th>
							<th><div class="textCut">주문상품</div></th>
							<th><div class="textCut">상세정보</div></th>
							<th><div class="textCut">회원정보</div>	</th>
							<th><div class="textCut">주문내역</div></th>
							<th><div class="textCut">적립금내역</div></th>
							<th><div class="textCut">주문자</div></th>
							<th><div class="textCut">수령자</div></th>
							<th><div class="textCut">주문방식</div></th>
							<th><div class="textCut">결제방식</div></th>
							<th><div class="textCut">총주문금액</div></th>
							<th><div class="textCut">일자</div></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="15">등록된 게시물이 zzzz없습니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
			<% } %>
			<div class="boardPaging">
				<ul class="clearFix">
					<li><strong>1</strong></li>
				</ul>
			</div>
			<!--// tc tc_02 ~ 09 -->

			<div class="contentMenu">
				<button type="button" class="print" style="display: none;">선택주문포장용주문지출력</button>
				<div class="selectBtn">
					선택주문
					<select id="selectOrdState">
						<option value="0">주문접수</option>
						<option value="1">결제확인</option>
						<option value="2">배송준비중</option>
						<option value="3">배송중</option>
						<option value="4">배송완료</option>
					</select>
					<button type="button" onclick="if(!confirm('선택한 주문을 일괄 처리합니다. 계속하시겠습니까?')){}">처리</button>
				</div>
				<button type="button" class="caution" onclick="if(!confirm('삭제된 데이터는 복구할 수 없습니다. 삭제하시겠습니까?')){}">선택주문삭제</button>
				<button type="button" onclick="if(!confirm('전체 페이지 주문 목록을 엑셀로 저장합니다. 계속하시겠습니까?')){}">엑셀저장</button>
				<button type="button" onclick="if(!confirm('전체 페이지 주문 목록을 로젠택배 엑셀 형식으로 저장합니다. 계속하시겠습니까?')){}">로젠택배엑셀저장</button>
			</div>
		</div>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<jsp:include page="../../include/bottom.jsp" flush="false" />
<script>
</script>
<script type="module">
	import {paging} from '/js/util/paging/paging.js';
	import {get} from '/js/mngr/pages/order_list/list_index.js';

	getToday('slastsaledt', 'elastsaledt');
	document.addEventListener("click",event=>{
		if(paging.clickBtn(event)){
			get.searchBtn(get.getParam());
		}
	})
	get.init();
</script>
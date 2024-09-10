<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_01" />
</jsp:include>

<div class="middleArea">

	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_01" />
		<jsp:param name="depth_01" value="sideMenu_01_06" />
		<jsp:param name="depth_02" value="sideMenu_01_06_01" />
	</jsp:include>

	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 주문관리
				<i class="fa fa-angle-right" aria-hidden="true"></i> 미수금
			</div>
			<h2>미수금</h2>
		</div>
		<button type="button" class="openerSideMenu">
			<i class="fa fa-chevron-left" aria-hidden="true"></i>
		</button>
		
		<div class="contentArea notitle">
			<form id="" name="">
				<table class="contentTable no_border">
					<caption>검색</caption>
					<colgroup>
						<col style="width: 75px;">
						<col style="width: 315px;">
						<col style="width: 51px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>주문검색</th>
							<td>
								<select name="">
									<option value="1">주문번호</option>
									<option value="2">주문자명</option>
									<option value="3">수령자명</option>
									<option value="5">아이디</option>
								</select>
								<input type="text" id="" name="" autofocus style="width: 180px;">
							</td>
							<th>일자</th>
							<td>
								<select name="">
									<option value="1">주문일</option>
									<option value="2">마지막입금일</option>
								</select>
								<input type="text" name="slastsaledt" class="datepick" style="width: 80px;" readonly>
								~
								<input type="text" name="elastsaledt" class="datepick" style="width: 80px;" readonly>
								<input type="button" onclick="getToday('slastsaledt', 'elastsaledt');" value="오늘">
								<input type="button" onclick="getPeriod('slastsaledt', 'elastsaledt', 7);" value="일주일">
								<input type="button" onclick="getPeriod('slastsaledt', 'elastsaledt', 30);" value="한달">
								<input type="button" onclick="getPeriod('slastsaledt', 'elastsaledt', 0);" value="전체">
							</td>
						</tr>
						<tr>
							<th>완납여부</th>
							<td colspan="3">
								<input type="radio" name="radio_01" id="radio_01" value="">
								<label for="radio_01">전체</label>
								<input type="radio" name="radio_01" id="radio_02" value="">
								<label for="radio_02">포함</label>
								<input type="radio" name="radio_01" id="radio_03" value="" checked>
								<label for="radio_03">제외</label>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="contentMenu">
					<input type="submit" class="buttonType" value="검색">
					<a href="./list_index.jsp" class="buttonType">초기화</a>
				</div>
			</form>
		</div>
		<div class="contentArea notitle">
			<div class="board_util clearFix">
				<div class="boardPostInfo">
					<span>총게시물 : 0</span>
					<span>페이지 : 1 / 1</span>
				</div>
			</div>
			<table class="contentTable resultTable line_hover board">
				<caption>전체목록</caption>
				<colgroup>
					<col style="width: 69px;">
					<col style="width: 12%;">
					<col style="width: 12%;">
					<col style="width: 147px;">
					<col style="width: 96px;">
					<col style="width: 96px;">
					<col style="width: 81px;">
					<col style="width: 102px;">
					<col>
					<col style="width: 81px;">
					<col style="width: 81px;">
				</colgroup>
				<thead>
					<tr>
						<th><div class="textCut">번호</div></th>
						<th><div class="textCut">주문자</div></th>
						<th><div class="textCut">수령자</div></th>
						<th><div class="textCut">주문일시</div></th>
						<th><div class="textCut">미수금액</div></th>
						<th><div class="textCut">잔액</div></th>
						<th><div class="textCut">완납여부</div></th>
						<th><div class="textCut">마지막입금일</div></th>
						<th><div class="textCut">마지막메모</div></th>
						<th><div class="textCut">상세정보</div></th>
						<th><div class="textCut">주문정보</div></th>
					</tr>
				</thead>
				<tbody>
					<% for(int x = 0; x < 5; x++) { %>
					<tr>
						<td><div class="textCut">000000</div></td>
						<td><div class="textCut">김연아 스텔라 수녀님</div></td>
						<td><div class="textCut">안중근 토마스 신부님</div></td>
						<td><div class="textCut">0000-00-00 00:00:00</div></td>
						<td><div class="textCut textAR">000,000,000</div></td>
						<td><div class="textCut textAR">000,000,000</div></td>
						<td><div class="textCut"></div></td>
						<td><div class="textCut">0000-00-00</div></td>
						<td><div class="textCut textAL">수요일 신부님편에 현금으로 주실예정</div></td>
						<td>
							<div class="textCut">
								<button type="button" onclick="openWindow('/mngr/order/payable/popup/detail/', 'order_payable_popup_datail', 1000, 840);">보기</button>
							</div>
						</td>
						<td>
							<div class="textCut">
								<button type="button" onclick="openWindow('/mngr/order/{orderNo}/list/popup/detail', 'order_list_popup_detail', 1000, 840);">보기</button>
							</div>
						</td>
					</tr>
					<% } %>
					<% for(int x = 0; x < 15; x++) { %>
					<tr>
						<td><div class="textCut">000000</div></td>
						<td><div class="textCut">김연아 스텔라 수녀님</div></td>
						<td><div class="textCut">안중근 토마스 신부님</div></td>
						<td><div class="textCut">0000-00-00 00:00:00</div></td>
						<td><div class="textCut textAR">000,000,000</div></td>
						<td><div class="textCut textAR">0</div></td>
						<td><div class="textCut">완납</div></td>
						<td><div class="textCut">0000-00-00</div></td>
						<td><div class="textCut textAL">수요일 신부님편에 현금으로 주실예정</div></td>
						<td>
							<div class="textCut">
								<button type="button" onclick="openWindow('/mngr/order/payable/popup/detail/', 'order_list_popup_detail', 1000, 840);">보기</button>
							</div>
						</td>
						<td>
							<div class="textCut">
								<button type="button" onclick="openWindow('/mngr/order/{orderNo}/list/popup/detail', 'order_list_popup_detail', 1000, 840);">보기</button>
							</div>
						</td>
					</tr>
					<% } %>
					<tr>
						<td colspan="11"><div class="textCut">등록된 게시물이 없습니다.</div></td>
					</tr>
				</tbody>
			</table>
			<div class="boardPaging">
				<ul class="clearFix">
					<li class="pagingFirst">
						<a href="" title="첫 페이지로 이동">
							<i class="fa fa-chevron-left" aria-hidden="true"></i>
						</a>
					</li>
					<li class="pagingBlock">
						<a href="" title="이전 페이지 블록으로 이동">
							<i class="fa fa-angle-double-left" aria-hidden="true"></i>
						</a>
					</li>
					<li class="pagingPrev">
						<a href="" title="이전 페이지로 이동">
							<i class="fa fa-angle-left" aria-hidden="true"></i>
						</a>
					</li>
					<li><strong>1</strong></li>
					<li><a href="" title="2 페이지로 이동">2</a></li>
					<li><a href="" title="3 페이지로 이동">3</a></li>
					<li><a href="" title="4 페이지로 이동">4</a></li>
					<li><a href="" title="5 페이지로 이동">5</a></li>
					<li class="pagingNext">
						<a href="" title="다음 페이지로 이동">
							<i class="fa fa-angle-right" aria-hidden="true"></i>
						</a>
					</li>
					<li class="pagingBlock">
						<a href="" title="다음 페이지 블록으로 이동">
							<i class="fa fa-angle-double-right" aria-hidden="true"></i>
						</a>
					</li>
					<li class="pagingLast">
						<a href="" title="끝 페이지로 이동">
							<i class="fa fa-chevron-right" aria-hidden="true"></i>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<jsp:include page="../../include/bottom.jsp" flush="false" />
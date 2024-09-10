<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_04" />
</jsp:include>

<div class="middleArea">

	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_04" />
		<jsp:param name="depth_01" value="sideMenu_04_01" />
		<jsp:param name="depth_02" value="sideMenu_04_01_01" />
	</jsp:include>

	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 현금영수증
				<i class="fa fa-angle-right" aria-hidden="true"></i> 발급조회
			</div>
			<h2>발급조회</h2>
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
						<col style="width: 339px;">
						<col style="width: 63px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>검색</th>
							<td>
								<select name="">
									<option value="1">회원명</option>
									<option value="2">인증번호</option>
									<option value="2">승인번호</option>
									<option value="3">주문번호</option>
								</select>
								<input type="text" id="" name="" autofocus style="width: 180px;">
							</td>
							<th>기준일</th>
							<td>
								<select name="">
									<option value="">신청일자</option>
									<option value="">처리일자</option>
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
							<th>발급구분</th>
							<td>
								<input type="radio" name="list_num" id="list_num_06" checked>
								<label for="list_num_06">전체</label>
								<input type="radio" name="list_num" value="" id="list_num_07">
								<label for="list_num_07">주문발급</label>
								<input type="radio" name="list_num" value="" id="list_num_08">
								<label for="list_num_08">개별발급</label>
							</td>
							<th>처리상태</th>
							<td>
								<input type="radio" name="list_num" id="list_num_01" checked>
								<label for="list_num_01">전체</label>
								<input type="radio" name="list_num" value="" id="list_num_02">
								<label for="list_num_02">요청</label>
								<input type="radio" name="list_num" value="" id="list_num_03">
								<label for="list_num_03">완료</label>
								<input type="radio" name="list_num" value="" id="list_num_04">
								<label for="list_num_04">취소</label>
								<input type="radio" name="list_num" value="" id="list_num_05">
								<label for="list_num_05">거절</label>
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
					<col>
					<col style="width: 147px;">
					<col style="width: 147px;">
					<col>
					<col>
					<col style="width: 153px;">
					<col>
					<col>
					<col>
				</colgroup>
				<thead>
					<tr>
						<th><div class="textCut">번호</div></th>
						<th><div class="textCut">회원명</div></th>
						<th><div class="textCut">신청일시</div></th>
						<th><div class="textCut">처리일시</div></th>
						<th><div class="textCut">인증번호</div></th>
						<th><div class="textCut">승인번호</div></th>
						<th><div class="textCut">주문번호</div></th>
						<th><div class="textCut">발급구분</div></th>
						<th><div class="textCut">처리상태</div></th>
						<th><div class="textCut">처리</div></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><div class="textCut">000000</div></td>
						<td><div class="textCut">김연아 스텔라 수녀님</div></td>
						<td><div class="textCut">0000-00-00 00:00:00</div></td>
						<td><div class="textCut">0000-00-00 00:00:00</div></td>
						<td><div class="textCut">00000000000</div></td>
						<td><div class="textCut">00000</div></td>
						<td>
							<div class="textCut textAR">
								<button type="button" onclick="openWindow('../order_list/popup_detail.jsp', 'order_list_popup_detail', 1000, 840);">1712628323951977</button>
							</div>
						</td>
						<td><div class="textCut">주문발급</div></td>
						<td><div class="textCut">요청</div></td>
						<td>
							<div class="textCut">
								<button type="button" onclick="if(!confirm('현금영수증을 발급합니다. 계속하시겠습니까?')){}">발급</button>
								<button type="button" onclick="if(!confirm('한번 거절된 요청은 취소할 수 없습니다. 계속하시겠습니까?')){}">거절</button>
							</div>
						</td>
					</tr>
					<tr>
						<td><div class="textCut">000000</div></td>
						<td><div class="textCut">김연아 스텔라 수녀님</div></td>
						<td><div class="textCut">0000-00-00 00:00:00</div></td>
						<td><div class="textCut">0000-00-00 00:00:00</div></td>
						<td><div class="textCut">00000000000</div></td>
						<td><div class="textCut">00000</div></td>
						<td>
							<div class="textCut textAR">
								<button type="button" onclick="openWindow('../order_list/popup_detail.jsp', 'order_list_popup_detail', 1000, 840);">1712628323951977</button>
							</div>
						</td>
						<td><div class="textCut">주문발급</div></td>
						<td><div class="textCut">완료</div></td>
						<td>
							<div class="textCut">
								<button type="button">영수증</button>
								<button type="button" onclick="if(!confirm('발급된 현금영수증을 취소합니다. 계속하시겠습니까?')){}">취소</button>
							</div>
						</td>
					</tr>
					<tr>
						<td><div class="textCut">000000</div></td>
						<td><div class="textCut">김연아 스텔라 수녀님</div></td>
						<td><div class="textCut">0000-00-00 00:00:00</div></td>
						<td><div class="textCut">0000-00-00 00:00:00</div></td>
						<td><div class="textCut">00000000000</div></td>
						<td><div class="textCut">00000</div></td>
						<td>
							<div class="textCut textAR">
								<button type="button" onclick="openWindow('../order_list/popup_detail.jsp', 'order_list_popup_detail', 1000, 840);">1712628323951977</button>
							</div>
						</td>
						<td><div class="textCut">주문발급</div></td>
						<td><div class="textCut">취소</div></td>
						<td>
							<div class="textCut">
								<button type="button">영수증</button>
								<button type="button" onclick="if(!confirm('삭제된 게시물은 복구할 수 없습니다. 계속하시겠습니까?')){}">삭제</button>
							</div>
						</td>
					</tr>
					<tr>
						<td><div class="textCut">000000</div></td>
						<td><div class="textCut">김연아 스텔라 수녀님</div></td>
						<td><div class="textCut">0000-00-00 00:00:00</div></td>
						<td><div class="textCut">0000-00-00 00:00:00</div></td>
						<td><div class="textCut">00000000000</div></td>
						<td><div class="textCut">00000</div></td>
						<td>
							<div class="textCut textAR">
								<button type="button" onclick="openWindow('../order_list/popup_detail.jsp', 'order_list_popup_detail', 1000, 840);">1712628323951977</button>
							</div>
						</td>
						<td><div class="textCut">주문발급</div></td>
						<td><div class="textCut">거절</div></td>
						<td>
							<div class="textCut">
								<button type="button" onclick="if(!confirm('삭제된 게시물은 복구할 수 없습니다. 계속하시겠습니까?')){}">삭제</button>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="10"><div class="textCut">등록된 게시물이 없습니다.</div></td>
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
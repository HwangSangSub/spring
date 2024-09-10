<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_03" />
</jsp:include>

<div class="middleArea">

	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_03" />
		<jsp:param name="depth_01" value="sideMenu_03_01" />
		<jsp:param name="depth_02" value="sideMenu_03_01_01" />
	</jsp:include>

	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 자동입금확인
				<i class="fa fa-angle-right" aria-hidden="true"></i> 실시간입금확인 &middot; 조회
			</div>
			<h2>실시간입금확인 &middot; 조회</h2>
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
						<col style="width: 51px;">
						<col style="width: 190px;">
						<col style="width: 75px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>입금검색</th>
							<td>
								<select name="">
									<option value="1">입금자명</option>
									<option value="2">주문번호</option>
									<option value="3">입금예정금액</option>
								</select>
								<input type="text" id="" name="" autofocus style="width: 180px;">
							</td>
							<th>상태</th>
							<td>
								<select id="gdstatus" name="gdstatus" class="width_145px">
									<option> 전체 </option>
									<option value="N">확인전</option>
									<option value="T">매칭성공(by시스템)</option>
									<option value="B">매칭성공(by관리자)</option>
									<option value="F">매칭실패(불일치)</option>
									<option value="S">매칭실패(동명이인)</option>
									<option value="A">관리자입금확인완료</option>
									<option value="U">관리자미확인</option>
									<option value="G">후원회비</option>
									<option value="D">도매점</option>
								</select>
							</td>
							<th>기준일</th>
							<td>
								<select name="">
									<option value="">입금일</option>
									<option value="">최종매칭일</option>
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
							<th>입금은행</th>
							<td>
								<select id="bkname" name="bkname">
									<option>전체</option>
									<option value="경남은행">경남은행</option>
									<option value="광주은행">광주은행</option>
									<option value="국민은행">국민은행</option>
									<option value="기업은행">기업은행</option>
									<option value="농협">농협</option>
									<option value="대구은행">대구은행</option>
									<option value="도이치뱅크">도이치뱅크</option>
									<option value="부산은행">부산은행</option>
									<option value="산업은행">산업은행</option>
									<option value="상호저축은행">상호저축은행</option>
									<option value="새마을금고">새마을금고</option>
									<option value="수협중앙회">수협중앙회</option>
									<option value="신용협동조합">신용협동조합</option>
									<option value="신한은행">신한은행</option>
									<option value="외환은행">외환은행</option>
									<option value="우리은행">우리은행</option>
									<option value="우체국">우체국</option>
									<option value="전북은행">전북은행</option>
									<option value="제주은행">제주은행</option>
									<option value="한국시티은행">한국시티은행</option>
									<option value="HSBC">HSBC</option>
									<option value="SC제일은행">SC제일은행</option>
									<option value="하나은행">하나은행</option>
								</select>
							</td>
							<th>정렬</th>
							<td>
								<select id="orderBy" name="orderBy">
									<option value="Bkid desc">입금일 내림차순</option>
									<option value="Bkid asc" selected>입금일 오름차순</option>
									<option value="bankregdt desc">최종매칭일 내림차순</option>
									<option value="bankregdt asc">최종매칭일 오름차순</option>
								</select>
							</td>
							<th>목록개수</th>
							<td>
								<input type="radio" name="list_num" id="list_num_01" checked>
								<label for="list_num_01">20개</label>
								<input type="radio" name="list_num" value="" id="list_num_02">
								<label for="list_num_02">40개</label>
								<input type="radio" name="list_num" value="" id="list_num_03">
								<label for="list_num_03">전체</label>
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
			<form id="" name="">
				<table class="contentTable resultTable line_hover board">
					<caption>전체목록</caption>
					<colgroup>
						<col style="width: 69px;">
					</colgroup>
					<thead>
						<tr>
							<th><div class="textCut">번호</div></th>
							<th><div class="textCut">입금일시</div></th>
							<th><div class="textCut">은행명</div></th>
							<th><div class="textCut">계좌번호</div></th>
							<th><div class="textCut">입금자명</div></th>
							<th><div class="textCut">입금금액</div></th>
							<th><div class="textCut">주문번호</div></th>
							<th><div class="textCut">상태</div></th>
							<th><div class="textCut">최종매칭일</div></th>
						</tr>
					</thead>
					<tbody>
						<% for(int x = 0; x < 15; x++) { %>
						<tr>
							<td><div class="textCut">000000</div></td>
							<td><div class="textCut">0000-00-00 00:00:00</div></td>
							<td><div class="textCut">아이엠뱅크(대구은행)</div></td>
							<td><div class="textCut">0000000000</div></td>
							<td><div class="textCut">김연아 스텔라 수녀님</div></td>
							<td><div class="textCut textAR">000,000,000</div></td>
							<td><input type="text" name="" value="1546663439513" style="width: 100%;"></td>
							<td>
								<select name="status11" id="status11" style="width: 100%;">
									<option value="F">매칭실패(불일치)</option>
									<option value="S">매칭실패(동명이인)</option>
									<option value="A" selected="">관리자입금확인완료</option>
									<option value="U">관리자미확인</option>
									<option value="G">후원회비</option>
									<option value="D">도매점</option>
								</select>
							</td>
							<td><div class="textCut">0000-00-00 00:00:00</div></td>
						</tr>
						<% } %>
						<!--
						<tr>
							<td colspan="14"><div class="textCut">등록된 게시물이 없습니다.</div></td>
						</tr>
						-->
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
				<div class="contentMenu">
					<input type="submit" value="저장">
				</div>
			</form>
		</div>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<jsp:include page="../../include/bottom.jsp" flush="false" />
<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_05" />
</jsp:include>

<div class="middleArea">

	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_05" />
		<jsp:param name="depth_01" value="sideMenu_05_01" />
		<jsp:param name="depth_02" value="sideMenu_05_01_02" />
	</jsp:include>

	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 회원
				<i class="fa fa-angle-right" aria-hidden="true"></i> 회원관리
				<i class="fa fa-angle-right" aria-hidden="true"></i> 탈퇴 &middot; 삭제내역
			</div>
			<h2>탈퇴 &middot; 삭제내역</h2>
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
						<col style="width: 111px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>검색</th>
							<td>
								<select name="skey">
									<option value="m_id">아이디</option>
									<option value="name">회원명</option>
								</select>
								<input type="text" id="" name="" autofocus style="width: 180px;">
							</td>
							<th>처리일시</th>
							<td>
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
							<th>처리형태</th>
							<td>
								<input type="radio" name="radio_01" value="" id="radio_01_01" checked>
								<label for="radio_01_01">전체</label>
								<input type="radio" name="radio_01" value="" id="radio_01_02">
								<label for="radio_01_02">본인탈퇴</label>
								<input type="radio" name="radio_01" value="" id="radio_01_03">
								<label for="radio_01_03">강제탈퇴</label>
							</td>
							<th>재가입가능여부</th>
							<td>
								<input type="radio" name="radio_02" value="" id="radio_02_01" checked>
								<label for="radio_02_01">전체</label>
								<input type="radio" name="radio_02" value="" id="radio_02_02">
								<label for="radio_02_02">가능</label>
								<input type="radio" name="radio_02" value="" id="radio_02_03">
								<label for="radio_02_03">불가</label>
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
			<table id="layer_target" class="contentTable resultTable board">
				<caption>목록</caption>
				<colgroup>
					<col style="width: 45px;">
					<col style="width: 69px;">
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col style="width: 78px;">
				</colgroup>
				<thead>
					<tr>
						<th><input type='checkbox' class="member_check" onclick="selectAll(this, 'member_check')" /></th>
						<th><div class="textCut">번호</div></th>
						<th><div class="textCut">회원명</div></th>
						<th><div class="textCut">아이디</div></th>
						<th><div class="textCut">처리형태</div></th>
						<th><div class="textCut">처리일시</div></th>
						<th><div class="textCut">재가입여부</div></th>
						<th><div class="textCut">남긴말씀</div></th>
						<th><div class="textCut">관리메모</div></th>
						<th><div class="textCut">상세정보</div></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><div class="textCut"><input type="checkbox" name="" class="member_check" value=""></div></td>
						<td><div class="textCut">000000</div></td>
						<td><div class="textCut">김연아 스텔라 수녀님</div></td>
						<td><div class="textCut">yunakim</div></td>
						<td><div class="textCut">강제탈퇴</div></td>
						<td><div class="textCut">0000-00-00 00:00:00</div></td>
						<td><div class="textCut">불가</div></td>
						<td><div class="textCut"></div></td>
						<td><div class="textCut">○</div></td>
						<td>
							<div class="textCut">
								<a href="/mngr/member/management/detail/detail" class="type_button">보기</a>
							</div>
						</td>
					</tr>
					<% for(int x = 0; x < 9; x++) { %>
					<tr>
						<td><div class="textCut"><input type="checkbox" name="" class="member_check" value=""></div></td>
						<td><div class="textCut">000000</div></td>
						<td><div class="textCut">김연아 스텔라 수녀님</div></td>
						<td><div class="textCut">yunakim</div></td>
						<td><div class="textCut">본인탈퇴</div></td>
						<td><div class="textCut">0000-00-00 00:00:00</div></td>
						<td><div class="textCut">가능</div></td>
						<td><div class="textCut">○</div></td>
						<td><div class="textCut"></div></td>
						<td>
							<div class="textCut">
								<a href="/mngr/member/management/detail/detail" class="type_button">보기</a>
							</div>
						</td>
					</tr>
					<% } %>
					<tr>
						<td colspan="10">등록된 게시물이 없습니다.</td>
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
			<div class="contentMenu">
				<button type="button" class="caution" onclick="if(!confirm('삭제된 데이터는 복구할 수 없습니다. 삭제하시겠습니까?')){}">선택회원삭제</button>
			</div>
		</div>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<jsp:include page="../../include/bottom.jsp" flush="false" />
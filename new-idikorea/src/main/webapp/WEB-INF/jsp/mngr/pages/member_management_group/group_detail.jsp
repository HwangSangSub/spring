<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_05" />
</jsp:include>

<div class="middleArea">

	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_05" />
		<jsp:param name="depth_01" value="sideMenu_05_01" />
		<jsp:param name="depth_02" value="sideMenu_05_01_03" />
	</jsp:include>

	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 회원
				<i class="fa fa-angle-right" aria-hidden="true"></i> 회원관리
				<i class="fa fa-angle-right" aria-hidden="true"></i> 그룹관리
			</div>
			<h2>그룹관리</h2>
		</div>
		<button type="button" class="openerSideMenu">
			<i class="fa fa-chevron-left" aria-hidden="true"></i>
		</button>
		<div class="contentArea">
			<form action="" method="get" enctype="">
				<h3>그룹설정</h3>
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
							<th>그룹명</th>
							<td colspan="3">
								<input type="text" name="" value="일반회원" style="width: 180px;" required>
							</td>
						</tr>
						<tr>
							<th>할인율</th>
							<td colspan="3">
								구매액의
								<input type="number" min="0" name="" value="0" style="width: 80px;"> %
							</td>
						</tr>
						<tr>
							<th>추가적립금</th>
							<td colspan="3">
								구매액의
								<input type="number" min="0" name="" value="0" style="width: 80px;"> %
							</td>
						</tr>
						<tr>
							<th>정기구매중복적용</th>
							<td colspan="3">
								<input type="radio" name="radio_02" value="0" id="radio_02_01" checked>
								<label for="radio_02_01">적용</label>
								<input type="radio" name="radio_02" value="1" id="radio_02_02">
								<label for="radio_02_02">미적용</label>
							</td>
						</tr>
						<tr>
							<th>배송비</th>
							<td colspan="3">
								<input type="radio" name="radio_01" value="0" id="radio_01_01" checked>
								<label for="radio_01_01">배송비 정책에 따름</label>
								<input type="radio" name="radio_01" value="1" id="radio_01_02">
								<label for="radio_01_02">무료</label>
							</td>
						</tr>
					</tbody>
				</table>
				<h3>할인예외카테고리</h3>
				<ol id="getCategoryList" class="category ui-sortable">
					<li>
						<input type="checkbox" class="tc_01_check" onclick="selectAll(this, 'tc_01_check')">
						EVENT
						<ol>
							<li class="ui-sortable-handle">
								<input type="checkbox" name="" class="tc_01_check" value="">
								하위카테고리
							</li>
							<li class="ui-sortable-handle">
								<input type="checkbox" name="" class="tc_01_check" value="">
								하위카테고리
							</li>
							<li class="ui-sortable-handle">
								<input type="checkbox" name="" class="tc_01_check" value="">
								하위카테고리
							</li>
							<li class="ui-sortable-handle">
								<input type="checkbox" name="" class="tc_01_check" value="">
								하위카테고리
							</li>
							<li class="ui-sortable-handle">
								<input type="checkbox" name="" class="tc_01_check" value="">
								하위카테고리
							</li>
						</ol>
					</li>
					<li>
						<input type="checkbox" class="tc_02_check" onclick="selectAll(this, 'tc_02_check')">
						CLEANSING
					</li>
					<li class="no_list textAC">
						등록된 카테고리가 없습니다.
					</li>
				</ol>

				<h3>
					할인예외상품
					<button type="button" class="type_button" onclick="openWindow('../order_call/popup_product.jsp', 'order_call_popup_product', 1000, 840);">상품검색</button>
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
							<th><div class="textCut">판매금액</div></th>
							<th><div class="textCut">삭제</div></th>
						</tr>
					</thead>
					<tbody id="product">
						<tr>
							<td colspan="10">상품 검색을 통해 상품을 등록해 주세요.</td>
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
							<td><div class="textCut">✓</div></td>
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
								<div class="textCut textAR">
									<span class="sales">9,900</span>
									<input type="hidden" value="9900" id="one_sales">
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
							<td><div class="textCut">✓</div></td>
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
								<div class="textCut textAR">
									<span class="sales">19,800</span>
									<input type="hidden" value="9900" id="one_sales">
								</div>
							</td>
							<td><div class="textCut"><button type="button">삭제</button></div></td>
						</tr>
					</tbody>
				</table>


				<div class="contentMenu">
					<input type="submit" value="저장">
					<a href="" class="buttonType">목록</a>
					<a href="" onclick="if(!confirm('삭제된 데이터는 복구할 수 없습니다. 삭제하시겠습니까?')){}" class="buttonType caution">삭제</a>
				</div>
			</form>
		</div>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<jsp:include page="../../include/bottom.jsp" flush="false" />
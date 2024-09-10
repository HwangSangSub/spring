<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_06" />
</jsp:include>

<div class="middleArea">

	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_06" />
		<jsp:param name="depth_01" value="sideMenu_06_01" />
		<jsp:param name="depth_02" value="sideMenu_06_01_04" />
	</jsp:include>

	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 상품
				<i class="fa fa-angle-right" aria-hidden="true"></i> 상품관리
				<i class="fa fa-angle-right" aria-hidden="true"></i> 가격 &middot; 적립금 &middot; 재고
			</div>
			<h2>가격 &middot; 적립금 &middot; 재고</h2>
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
						<col style="width: 315px;">
						<col style="width: 75px;">
						<col style="width: 407px;">
						<col style="width: 75px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>상품검색</th>
							<td>
								<select name="">
									<option value="1">상품명</option>
									<option value="2">상품코드</option>
								</select>
								<input type="text" id="" name="" autofocus style="width: 180px;">
							</td>
							<th>등록일</th>
							<td>
								<input type="text" name="sDate" readonly class="datepick" style="width: 80px;"> ~ 
								<input type="text" name="eDate" readonly class="datepick" style="width: 80px;">
								<input type="button" onclick="getToday('sDate', 'eDate');" value="오늘">
								<input type="button" onclick="getPeriod('sDate', 'eDate', 7);" value="일주일">
								<input type="button" onclick="getPeriod('sDate', 'eDate', 30);" value="한달">
								<input type="button" onclick="getPeriod('sDate', 'eDate', 0);" value="전체">
							</td>
							<th>상품분류</th>
							<td>
								<select name="">
									<option value="">1차분류</option>
								</select>
								<select name="">
									<option value="">2차분류</option>
								</select>
								<select name="">
									<option value="">3차분류</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>정렬순서</th>
							<td>
								<input type="radio" name="radio_num_06" id="radio_num_06" checked>
								<label for="radio_num_06">등록일</label>
								<input type="radio" name="radio_num_06" value="" id="radio_num_07">
								<label for="radio_num_07">재고량</label>
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
					<col style="width: 96px;">
				</colgroup>
				<thead>
					<tr>
						<th><div class="textCut">번호</div></th>
						<th><div class="textCut">상품코드</div></th>
						<th><div class="textCut">사진</div></th>
						<th><div class="textCut">상품명</div></th>
						<th><div class="textCut">정가 <abbr class="essential" title="필수입력사항">*</abbr></div></th>
						<th><div class="textCut">판매가 <abbr class="essential" title="필수입력사항">*</abbr></div></th>
						<th><div class="textCut">매입가</div></th>
						<th><div class="textCut">적립금</div></th>
						<th><div class="textCut">재고수량 <abbr class="essential" title="필수입력사항">*</abbr></div></th>
						<th><div class="textCut">입고예정일</div></th>
					</tr>
				</thead>
				<tbody>
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
							<!-- 상품 옵션이 있는 경우-->
							<div class="textCut" style="border-top: 1px dashed #ccc; margin-top: 6px; padding-top: 6px;">상품옵션 1 &gt; 상품옵션 1-1</div>
							<!--// 상품 옵션이 있는 경우-->
						</td>
						<td><input type="number" min="0" name="" value="10000" class="textAR" style="width: 80px;"></td>
						<td><input type="number" min="0" name="" value="10000" class="textAR" style="width: 80px;"></td>
						<td><input type="number" min="0" name="" value="10000" class="textAR" style="width: 80px;"></td>
						<td><input type="number" min="0" name="" value="10000" class="textAR" style="width: 80px;"></td>
						<td><input type="number" min="0" name="" value="10000" class="textAR" style="width: 80px;"></td>
						<td><input type="text" name="" readonly class="datepick" style="width: 80px;"></td>
					</tr>
					<tr>
						<td colspan="10">등록된 게시물이 없습니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<jsp:include page="../../include/bottom.jsp" flush="false" />
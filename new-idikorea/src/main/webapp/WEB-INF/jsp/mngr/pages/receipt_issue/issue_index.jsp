<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_04" />
</jsp:include>

<div class="middleArea">

	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_04" />
		<jsp:param name="depth_01" value="sideMenu_04_02" />
		<jsp:param name="depth_02" value="sideMenu_04_02_01" />
	</jsp:include>

	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 현금영수증
				<i class="fa fa-angle-right" aria-hidden="true"></i> 개별발급
			</div>
			<h2>개별발급</h2>
		</div>
		<button type="button" class="openerSideMenu">
			<i class="fa fa-chevron-left" aria-hidden="true"></i>
		</button>
		<div class="contentArea notitle">
			<form action="./popup_cancel.jsp" method="post">
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
							<th>상품명 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3">
								<input type="text" name="" value="19>SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품)" required style="width: 549px;" autofocus>
							</td>
						</tr>
						<tr>
							<th>주문자명 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3">
								<input type="text" name="" value="김연아 스텔라 수녀님" style="width: 180px;" required>
							</td>
						</tr>
						<tr>
							<th>휴대폰(주민등록번호) <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3">
								<input type="tel" name="" value="01000000000" required style="width: 110px;">
							</td>
						</tr>
						<tr>
							<th>추가연락처</th>
							<td colspan="3">
								<input type="tel" name="" value="01000000000" style="width: 110px;">
							</td>
						</tr>
						<tr>
							<th>이메일 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3">
								<input type="tel" name="" value="01000000000" style="width: 110px;">
							</td>
						</tr>
						<tr>
							<th>발행액 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3">
								<input type="number" min="0" name="" value="10000" class="textAR" style="width: 80px;" required>
							</td>
						</tr>
						<tr>
							<th>공급액 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3">
								<input type="number" min="0" name="" value="10000" class="textAR" style="width: 80px;" required>
							</td>
						</tr>
						<tr>
							<th>부가세 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3">
								<input type="number" min="0" name="" value="10000" class="textAR" style="width: 80px;" required>
							</td>
						</tr>
						<tr>
							<th>발행용도</th>
							<td colspan="3">
								<input type="radio" name="radio_01" value="" id="radio_01" checked>
								<label for="radio_01">개인소득공제용</label>
								<input type="radio" name="radio_01" value="" id="radio_02">
								<label for="radio_02">사업자지출증빙용</label>
							</td>
						</tr>
						<tr>
							<th>과세여부</th>
							<td colspan="3">
								<input type="radio" name="radio_03" value="" id="radio_03" checked>
								<label for="radio_03">과세</label>
								<input type="radio" name="radio_03" value="" id="radio_04">
								<label for="radio_04">면세</label>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="contentMenu">
					<input type="button" id="orderBtn" value="발급">
				</div>
			</form>
		</div>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<jsp:include page="../../include/bottom.jsp" flush="false" />
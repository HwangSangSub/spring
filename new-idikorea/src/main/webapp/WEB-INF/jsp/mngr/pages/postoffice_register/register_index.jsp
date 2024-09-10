<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_02" />
</jsp:include>

<div class="middleArea">

	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_02" />
		<jsp:param name="depth_01" value="sideMenu_02_01" />
		<jsp:param name="depth_02" value="sideMenu_02_01_02" />
	</jsp:include>

	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 택배연동
				<i class="fa fa-angle-right" aria-hidden="true"></i> 우체국
				<i class="fa fa-angle-right" aria-hidden="true"></i> 송장등록
			</div>
			<h2>송장등록</h2>
		</div>
		<button type="button" class="openerSideMenu">
			<i class="fa fa-chevron-left" aria-hidden="true"></i>
		</button>
		<div class="contentArea">
			<form action="" method="get" enctype="">
				<h3>송장등록</h3>
				<table class="contentTable">
					<caption>게시물</caption>
					<colgroup>
						<col style="width: 180px;">
						<col style="width: 270px;">
						<col style="width: 180px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>파일등록</th>
							<td colspan="3">
								<ul>
									<li>
										<div class="attachWrap">
											<input type="file" name="">
											<input type="text" class="attachFileView" style="width: 433px;" readonly>
											<button type="button" class="attachFile">파일첨부</button>
											<button type="button" class="attachFileReset">초기화</button>
										</div>
									</li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="contentMenu">
					<input type="submit" value="확인">
					<a href="/mngr/postoffice/register/index" class="buttonType">초기화</a>
				</div>
			</form>
		</div>
		<div class="contentArea notitle">
			<form action="" method="get" enctype="">
				<table class="contentTable resultTable line_hover board">
					<caption>전체목록</caption>
					<colgroup>
						<col style="width: 69px;">
						<col style="width: 147px;">
						<col>
						<col style="width: 12%;">
						<col style="width: 12%;">
						<col style="width: 81px;">
						<col style="width: 81px;">
						<col style="width: 96px;">
						<col style="width: 120px;">
					</colgroup>
					<thead>
						<tr>
							<th><div class="textCut">번호</div></th>
							<th><div class="textCut">주문일시</div></th>
							<th><div class="textCut">주문상품</div></th>
							<th><div class="textCut">주문자</div></th>
							<th><div class="textCut">수령자</div></th>
							<th><div class="textCut">주문상태</div></th>
							<th><div class="textCut">결제방식</div></th>
							<th><div class="textCut">총결제금액</div></th>
							<th><div class="textCut">운송장번호</div></th>
						</tr>
					</thead>
					<tbody>
						<% for(int x = 0; x < 15; x++) { %>
						<tr>
							<td><div class="textCut">000000</div></td>
							<td><div class="textCut">0000-00-00 00:00:00</div></td>
							<td><div class="textCut textAL">19>SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품) 외 1건</div></td>
							<td><div class="textCut">김연아 스텔라 수녀님</div></td>
							<td><div class="textCut">안중근 토마스 신부님</div></td>
							<td><div class="textCut">결제확인</div></td>
							<td><div class="textCut">휴대폰</div></td>
							<td><div class="textCut textAR">000,000,000</div></td>
							<td><div class="textCut">6019912042082</div></td>
						</tr>
						<% } %>
						<tr>
							<td colspan="9"><div class="textCut">등록된 게시물이 없습니다.</div></td>
						</tr>
					</tbody>
				</table>
				<div class="contentMenu">
					<input type="submit" value="저장" onclick="if(!confirm('송장등록을 일괄 처리합니다. 계속하시겠습니까?')){}">
				</div>
			</form>
		</div>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<jsp:include page="../../include/bottom.jsp" flush="false" />
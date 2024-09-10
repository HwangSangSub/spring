<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>
<jsp:include page="../../include/common.jsp" flush="false" />
<div class="middleArea popup">
	<div class="pageContent">
		<div class="contentTitle">
			<h2>상세정보</h2>
		</div>
		<div class="contentArea">
			<h3>미수금정보</h3>
			<table class="contentTable resultTable line_hover board">
				<caption>전체목록</caption>
				<colgroup>
					<col style="width: 138px;">
					<col>
					<col>
					<col style="width: 147px;">
					<col style="width: 96px;">
					<col style="width: 96px;">
					<col style="width: 81px;">
				</colgroup>
				<thead>
					<tr>
						<th><div class="textCut">주문번호</div></th>
						<th><div class="textCut">주문자</div></th>
						<th><div class="textCut">수령자</div></th>
						<th><div class="textCut">주문일시</div></th>
						<th><div class="textCut">금액</div></th>
						<th><div class="textCut">잔액</div></th>
						<th><div class="textCut">완납여부</div></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><div class="textCut">1677721673378739</div></td>
						<td><div class="textCut">김연아 스텔라 수녀님</div></td>
						<td><div class="textCut">안중근 토마스 신부님</div></td>
						<td><div class="textCut">0000-00-00 00:00:00</div></td>
						<td><div class="textCut textAR">000,000,000</div></td>
						<td><div class="textCut textAR">000,000,000</div></td>
						<td><div class="textCut">완납</div></td>
					</tr>
				</tbody>
			</table>

			<h3>입금내역</h3>
			<table class="contentTable resultTable line_hover board">
				<caption>전체목록</caption>
				<colgroup>
					<col style="width: 138px;">
					<col style="width: 96px;">
					<col>
					<col style="width: 147px;">
				</colgroup>
				<thead>
					<tr>
						<th><div class="textCut">입금일</div></th>
						<th><div class="textCut">입금금액</div></th>
						<th><div class="textCut">메모</div></th>
						<th><div class="textCut">작성일</div></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><div class="textCut">0000-00-00</div></td>
						<td><div class="textCut textAR">0,000,000</div></td>
						<td><div class="textCut textAL">오배송으로 인한 추가주문건</div></td>
						<td><div class="textCut">0000-00-00 00:00:00</div></td>
					</tr>
					<tr>
						<td><div class="textCut">0000-00-00</div></td>
						<td><div class="textCut textAR">000,000,000</div></td>
						<td><div class="textCut textAL">우선배송</div></td>
						<td><div class="textCut">0000-00-00 00:00:00</div></td>
					</tr>
				</tbody>
			</table>
			<form id="" name="">
				<h3>입금기록</h3>
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
							<th>입금금액 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3"><input type="number" id="amount" min="0" name="" value="0" class="textAR refund" style="width: 80px;" autofocus required></td>
						</tr>
						<tr>
							<th>입금일 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3">
								<input type="text" name="" class="datepick" style="width: 80px;" readonly required>
							</td>
						</tr>
						<tr>
							<th>메모</th>
							<td colspan="3">
								<input type="text" name="" value="하나은행 000-00-0000-000 계좌이체 완료" placeholder="50자 이내" maxlength="50" style="width: 549px;">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="contentMenu">
					<input type="submit" value="저장">
				</div>
			</form>
		</div>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<script>
	$('body').css('min-width','980px');
</script>
<jsp:include page="../../include/bottom.jsp" flush="false" />
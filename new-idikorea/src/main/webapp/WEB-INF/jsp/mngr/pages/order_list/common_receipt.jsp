<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>
<div class="contentArea notitle">
	<form action="" method="" enctype="">
				<table class="contentTable">
			<caption>정보</caption>
			<colgroup>
				<col style="width: 90px;">
				<col style="width: 90px;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th colspan="2">전자지불(PG)</th>
					<td>LG U+ ( 현금영수증 사용증)</td>
				</tr>
				<tr>
					<th colspan="2">주문자명</th>
					<td><input type="text" name="" value="김연아 스텔라 수녀님" style="width: 180px;" required></td>
				</tr>
				<tr>
					<th colspan="2">연락처</th>
					<td><input type="tel" name="" value="01000000000" style="width: 110px;" required></td>
				</tr>
				<tr>
					<th colspan="2">이메일</th>
					<td><input type="email" name="" value="yunakim@idikorea.com" style="width: 180px;"></td>
				</tr>
				<tr>
					<th colspan="2">주문상품</th>
					<td><input type="text" name="" value="19>SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품) 외 1건" style="width: 549px;"></td>
				</tr>
				<tr>
					<th colspan="2">과세여부</th>
					<td>
						<input type="radio" name="tax" id="tax_01" value="" checked>
						<label for="tax_01">과세 ( 판매물품에 부가세가 있음 )</label> 
						<input type="radio" name="tax" id="tax_02" value="">
						<label for="tax_02">면세 ( 판매물품에 부가세가 없음 )</label>
					</td>
				</tr>
				<tr>
					<th rowspan="3">상품가격</th>
					<th>발행금액</th>
					<td><input type="number" min="0" name="" value="10000" class="textAR" style="width: 80px;"></td>
				</tr>
				<tr>
					<th>공급금액</th>
					<td><input type="number" min="0" name="" value="10000" class="textAR" style="width: 80px;"></td>
				</tr>
				<tr>
					<th>부가세</th>
					<td><input type="number" min="0" name="" value="10000" class="textAR" style="width: 80px;"></td>
				</tr>
				<tr>
					<th colspan="2">발행용도</th>
					<td>
						<input type="radio" name="purpose" id="purpose_01" value="" checked>
						<label for="purpose_01">개인소득공제용</label>
						<input type="radio" name="purpose" id="purpose_02" value="">
						<label for="purpose_02">사업자지출증빙용</label>
					</td>
				</tr>
				<tr>
					<th colspan="2">주민등록 ( 휴대폰 ) 번호</th>
					<td><input type="number" min="0" name="" value="0000000000000" style="width: 110px;"></td>
				</tr>
			</tbody>
		</table>
		<div class="contentMenu popup">
			<input type="submit" value="발급">
			<a href="./popup_detail.jsp" class="buttonType">취소</a>
			<button type="button" onclick="window.self.close();">닫기</button>
		</div>
	</form>
</div>
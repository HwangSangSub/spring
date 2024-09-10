<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../../include/common.jsp" flush="false" />
<div class="middleArea popup">
	<div class="pageContent">
		<div class="contentTitle">
			<h2>상품검색</h2>
		</div>
		<div class="contentArea notitle">
			<form id="" name="">
				<table class="contentTable no_border">
					<caption>검색</caption>
					<colgroup>
						<col style="width: 75px;">
						<col style="width: 327px;">
						<col style="width: 75px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>상품검색</th>
							<td>
								<select name="searchOption">
									<option value="goodsName">상품명</option>
									<option value="goodsCode">상품코드</option>
								</select>
								<input type="text" id="" name="searchValue" autofocus="" style="width: 180px;">
							</td>
							<th>상품분류</th>
							<td>
								<select name="" category-depth="1" style="min-width: 80px;">
									<option value="">1차분류</option>
									<c:if test="${category ne null && category.size()!=0 }">
										<c:forEach var="item" items="${category }" varStatus="status">
											<c:if test="${ fn:length( item.categoryCode) == 3 }">
												<option value="${item.categoryCode }" <c:if test="${fn:substring( goods.category , 0 , 3 ) eq item.categoryCode }">selected </c:if>>${item.categoryName }</option>
											</c:if>
										</c:forEach>
									</c:if>									
								</select>
								<select name="" category-depth="2" style="min-width: 80px;">
									<option value="">2차분류</option>
									<c:if test="${category ne null && category.size()!=0 }">
										<c:forEach var="item" items="${category }" varStatus="status">
											<c:if test="${ fn:length( item.categoryCode) == 6 }">
												<option <c:if test="${fn:substring( goods.category , 0 , 3 ) != fn:substring(item.categoryCode ,0 ,3) }"> style="display:none" </c:if> value="${item.categoryCode }"  <c:if test="${fn:substring( goods.category , 0 , 6 ) == item.categoryCode }">selected </c:if>>${item.categoryName }</option>
											</c:if>
										</c:forEach>
									</c:if>									
								</select>
								<select name="" category-depth="3" style="min-width: 80px;">
									<option value="">3차분류</option>
									<c:if test="${category ne null && category.size()!=0 }">
										<c:forEach var="item" items="${category }" varStatus="status">
											<c:if test="${ fn:length( item.categoryCode) == 9 }">
												<option <c:if test="${fn:substring( goods.category , 0 , 6 ) != fn:substring(item.categoryCode ,0 ,6) }"> style="display:none" </c:if> value="${item.categoryCode }" <c:if test="${fn:substring( goods.category , 0 , 9 ) == item.categoryCode }">selected </c:if>>${item.categoryName }</option>
											</c:if>
										</c:forEach>
									</c:if>									
								</select>
							</td>
						</tr>
						<tr>
					<th>브랜드</th>
							<td>
								<select name="" id="brand" style="min-width: 80px;">
									<option value="">전체</option>
									<c:forEach var="item" items="${brandList }"
										varStatus="status">
										<c:if test="${item.brandName ne ''  }">
											<option value="${item.brandNo }" >${item.brandName}</option>
										</c:if> 
									</c:forEach>
								</select>
							</td>
							<th>품절표시</th>
							<td>
								<input type="radio"  name="radio_num_09" id="radio_num_09">
								<label for="radio_num_09">전체</label>
								<input type="radio" value="99" name="radio_num_09" id="radio_num_12" checked="">
								<label for="radio_num_12" value="Y">사용가능</label>
								<input type="radio" name="radio_num_09" value="1" id="radio_num_10">
								<label for="radio_num_10">품절</label>
								<input type="radio" name="radio_num_09" value="0" id="radio_num_11">
								<label for="radio_num_11">품절표시</label>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="contentMenu">
					<input type="button" id="searchBtn" class="buttonType" value="검색">
					<a href="./popup_product.jsp" class="buttonType">초기화</a>
				</div>
			</form>
		</div>
		<div class="contentArea notitle">
			<table class="contentTable resultTable board">
				<caption>게시물</caption>
				<colgroup>
					<col style="width: 81px;">
					<col>
					<col style="width: 96px;">
					<col style="width: 96px;">
					<col style="width: 96px;">
					<col style="width: 96px;">
					<col style="width: 78px;">
				</colgroup>
				<thead>
					<tr>
						<th><div class="textCut">사진</div></th>
						<th><div class="textCut">상품명</div></th>
						<th><div class="textCut">판매금액</div></th>
						<th><div class="textCut">재고수량</div></th>
						<th><div class="textCut">재고제한없음</div></th>
						<th><div class="textCut">품절표시</div></th>
						<th><div class="textCut">선택</div></th>
					</tr>
				</thead>
				<tbody id="product">
					<!-- <tr>
						<td>
							<div class="thumbnail textCut" style="width: 55px; height: 55px;">
								<img src="https://www.idikorea.com/attach_file/prod/5aafbe4ebd3c468cbf28ea27445c775d.png" alt="">
							</div>
						</td>
						<td class="textAL">
							<div class="textCut">19&gt;SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품)</div>
							상품 옵션이 있는 경우
							<div class="textCut" style="border-top: 1px dashed #ccc; margin-top: 6px; padding-top: 6px;">상품옵션 1 &gt; 상품옵션 1-1</div>
							// 상품 옵션이 있는 경우
						</td>
						<td>
							<div class="textCut textAR">
								<span class="sales">9,900</span>
							</div>
						</td>
						<td><div class="textCut">0</div></td>
						<td><div class="textCut"></div></td>
						<td><div class="textCut">품절</div></td>
						<td><button type="button">선택</button></td>
					</tr>
					<tr>
						<td>
							<div class="thumbnail textCut" style="width: 55px; height: 55px;">
								<img src="https://www.idikorea.com/attach_file/prod/5aafbe4ebd3c468cbf28ea27445c775d.png" alt="">
							</div>
						</td>
						<td class="textAL">
							<div class="textCut">19&gt;SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품)</div>
						</td>
						<td>
							<div class="textCut textAR">
								<span class="sales">19,800</span>
							</div>
						</td>
						<td><div class="textCut">&infin; ( 0 )</div></td>
						<td><div class="textCut">✓</div></td>
						<td><div class="textCut"></div></td>
						<td><button type="button">선택</button></td>
					</tr> -->
<!-- 					<tr>
						<td colspan="7">등록된 게시물이 없습니다.</td>
					</tr> -->
				</tbody>
			</table>
		</div>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<script>
	$('body').css('min-width','980px');
</script>
<script type="module">
	import {get} from '/js/mngr/pages/order_call/popup_product.js';
	get.init();
</script>
<script>
	document.querySelector('[category-depth="1"]').querySelectorAll('option')[9].selected=true;
	const changeEvent = new Event('change');
	document.querySelector('[category-depth="1"]').dispatchEvent(changeEvent);
</script>


<jsp:include page="../../include/bottom.jsp" flush="false" />
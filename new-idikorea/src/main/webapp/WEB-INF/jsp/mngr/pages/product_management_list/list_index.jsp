<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_06" />
</jsp:include>
<div class="middleArea">
	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_06" />
		<jsp:param name="depth_01" value="sideMenu_06_01" />
		<jsp:param name="depth_02" value="sideMenu_06_01_01" />
	</jsp:include>
	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 상품
				<i class="fa fa-angle-right" aria-hidden="true"></i> 상품관리
				<i class="fa fa-angle-right" aria-hidden="true"></i> 상품목록
			</div>
			<h2>상품목록</h2>
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
						<col style="width: 327px;">
						<col style="width: 75px;">
						<col style="width: 407px;">
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
								<input type="text" id="searchValue" name="searchValue" autofocus style="width: 180px;">
							</td>
							<th>등록일</th>
							<td>
								<input type="text" name="sDate" readonly="" class="Datepicker" style="width: 80px;"> ~ 
								<input type="text" name="eDate" readonly="" class="Datepicker" style="width: 80px;">
								<input type="button" onclick="getToday('sDate', 'eDate');" value="오늘">
								<input type="button" onclick="getPeriod('sDate', 'eDate', 7);" value="일주일">
								<input type="button" onclick="getPeriod('sDate', 'eDate', 30);" value="한달">
								<input type="button" onclick="getPeriod('sDate', 'eDate', 0);" value="전체">
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
							<th>삼품금액</th>
							<td>
								<input type="text" id="minPrice" name="" class="textAR" style="width: 80px;"> ~ 
								<input type="text" id="maxPrice" name="" class="textAR" style="width: 80px;">
							</td>
							<th>품절표시</th>
							<td>
								<input type="radio" name="radio_num_09" value="" id="radio_num_09" checked>
								<label for="radio_num_09">전체</label>
								<input type="radio" name="radio_num_09" value="1" id="radio_num_10">
								<label for="radio_num_10">품절</label>
								<input type="radio" name="radio_num_09" value="0" id="radio_num_11">
								<label for="radio_num_11">품절표시</label>
							</td>
						</tr>
						<tr>
							<th>쇼핑몰판매</th>
							<td>
								<input type="radio" name="radio_num_01" value="" id="radio_num_01" checked>
								<label for="radio_num_01">전체</label>
								<input type="radio" name="radio_num_01" value="1" id="radio_num_02">
								<label for="radio_num_02">표시</label>
								<input type="radio" name="radio_num_01" value="0" id="radio_num_03">
								<label for="radio_num_03">표시안함</label>
							</td>
							<th>전화주문</th>
							<td>
								<input type="radio" name="radio_num_03" value="" id="radio_num_03" checked>
								<label for="radio_num_03">전체</label>
								<input type="radio" name="radio_num_03" value="1" id="radio_num_04">
								<label for="radio_num_04">표시</label>
								<input type="radio" name="radio_num_03" value="0" id="radio_num_05">
								<label for="radio_num_05">표시안함</label>
							</td>
							<th>정기구매</th>
							<td>
								<input type="radio" name="radio_num_06" id="radio_num_06" checked>
								<label for="radio_num_06">전체</label>
								<input type="radio" name="radio_num_06" value="1" id="radio_num_07">
								<label for="radio_num_07">가능</label>
								<input type="radio" name="radio_num_06" value="0" id="radio_num_08">
								<label for="radio_num_08">불가</label>
							</td>
						</tr>
						<tr>
							<th>목록개수</th>
							<td>
								<input type="radio" name="list_num" value="20" id="list_num_01" checked>
								<label for="list_num_01">20개</label>
								<input type="radio" name="list_num" value="40" id="list_num_02">
								<label for="list_num_02">40개</label>
								<input type="radio" name="list_num" value="9999999" id="list_num_03">
								<label for="list_num_03">전체</label>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="contentMenu">
					<input type="button" id="searchBtn" class="buttonType" value="검색">
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
					<col style="width: 78px;">
					<col style="width: 78px;">
					<col style="width: 78px;">
					<col style="width: 78px;">
					<col style="width: 78px;">
					<col style="width: 78px;">
					<col style="width: 90px;">
				</colgroup>
				<thead>
					<tr>
						<th><div class="textCut">번호</div></th>
						<th><div class="textCut">상품코드</div></th>
						<th><div class="textCut">사진</div></th>
						<th><div class="textCut">상품명</div></th>
						<th><div class="textCut">판매금액</div></th>
						<th><div class="textCut">재고수량</div></th>
						<th><div class="textCut">재고제한없음</div></th>
						<th><div class="textCut">품절표시</div></th>
						<th><div class="textCut">쇼핑몰판매</div></th>
						<th><div class="textCut">전화주문</div></th>
						<th><div class="textCut">정기구매</div></th>
						<th><div class="textCut">상세정보</div></th>
						<th><div class="textCut">상품복사</div></th>
						<th><div class="textCut">등록일</div></th>
					</tr>
				</thead>
				<tbody id="boardList">
					<%-- <tr>
						<td><div class="textCut">00000</div></td>
						<td><div class="textCut">00000</div></td>
						<td>
							<div class="thumbnail textCut" style="width: 55px; height: 55px;">
								<img src="https://www.idikorea.com/attach_file/prod/5aafbe4ebd3c468cbf28ea27445c775d.png" alt="">
							</div>
						</td>
						<td class="textAL"><div class="textCut">19>SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품)</div></td>
						<td><div class="textCut textAR">000,000,000</div></td>
						<td><div class="textCut">0</div></td>
						<td><div class="textCut"><input type="checkbox" name=""></div></td>
						<td><div class="textCut">품절</div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><button type="button" onclick="openWindow('/mngr/product/management/list/popup/detail', 'product_management_list_popup_detail', 1000, 840);">보기</button></div></td>
						<td><div class="textCut"><button type="button">복사</button></div></td>
						<td><div class="textCut">0000-00-00</div></td>
					</tr>
					<tr>
						<td><div class="textCut">00000</div></td>
						<td><div class="textCut">00000</div></td>
						<td>
							<div class="thumbnail textCut" style="width: 55px; height: 55px;">
								<img src="https://www.idikorea.com/attach_file/prod/5aafbe4ebd3c468cbf28ea27445c775d.png" alt="">
							</div>
						</td>
						<td class="textAL"><div class="textCut">19>SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품)</div></td>
						<td><div class="textCut textAR">000,000,000</div></td>
						<td><div class="textCut">&infin; ( 0 )</div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name=""></div></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><button type="button" onclick="openWindow('./popup_detail.jsp', 'product_management_list_popup_detail', 1000, 840);">보기</button></div></td>
						<td><div class="textCut"><button type="button">복사</button></div></td>
						<td><div class="textCut">0000-00-00</div></td>
					</tr>
					<tr>
						<td><div class="textCut">00000</div></td>
						<td><div class="textCut">00000</div></td>
						<td>
							<div class="thumbnail textCut" style="width: 55px; height: 55px;">
								<img src="https://www.idikorea.com/attach_file/prod/5aafbe4ebd3c468cbf28ea27445c775d.png" alt="">
							</div>
						</td>
						<td class="textAL"><div class="textCut">19>SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품)</div></td>
						<td><div class="textCut textAR">000,000,000</div></td>
						<td><div class="textCut">&infin; ( 00,000 )</div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name=""></div></td>
						<td><div class="textCut"><button type="button" onclick="openWindow('./popup_detail.jsp', 'product_management_list_popup_detail', 1000, 840);">보기</button></div></td>
						<td><div class="textCut"><button type="button">복사</button></div></td>
						<td><div class="textCut">0000-00-00</div></td>
					</tr>
					<tr>
						<td><div class="textCut">00000</div></td>
						<td><div class="textCut">00000</div></td>
						<td>
							<div class="thumbnail textCut" style="width: 55px; height: 55px;">
								<img src="https://www.idikorea.com/attach_file/prod/5aafbe4ebd3c468cbf28ea27445c775d.png" alt="">
							</div>
						</td>
						<td class="textAL"><div class="textCut">19>SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품)</div></td>
						<td><div class="textCut textAR">000,000,000</div></td>
						<td><div class="textCut">00,000</div></td>
						<td><div class="textCut"><input type="checkbox" name=""></div></td>
						<td><div class="textCut"><input type="checkbox" name=""></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name=""></div></td>
						<td><div class="textCut"><button type="button" onclick="openWindow('./popup_detail.jsp', 'product_management_list_popup_detail', 1000, 840);">보기</button></div></td>
						<td><div class="textCut"><button type="button">복사</button></div></td>
						<td><div class="textCut">0000-00-00</div></td>
					</tr>
					<tr>
						<td><div class="textCut">00000</div></td>
						<td><div class="textCut">00000</div></td>
						<td>
							<div class="thumbnail textCut" style="width: 55px; height: 55px;">
								<img src="https://www.idikorea.com/attach_file/prod/5aafbe4ebd3c468cbf28ea27445c775d.png" alt="">
							</div>
						</td>
						<td class="textAL"><div class="textCut">19>SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품)</div></td>
						<td><div class="textCut textAR">000,000,000</div></td>
						<td><div class="textCut">00,000</div></td>
						<td><div class="textCut"><input type="checkbox" name=""></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name=""></div></td>
						<td><div class="textCut"><button type="button" onclick="openWindow('./popup_detail.jsp', 'product_management_list_popup_detail', 1000, 840);">보기</button></div></td>
						<td><div class="textCut"><button type="button">복사</button></div></td>
						<td><div class="textCut">0000-00-00</div></td>
					</tr>
					<% for(int x = 0; x < 15; x++) { %>
					<tr>
						<td><div class="textCut">00000</div></td>
						<td><div class="textCut">00000</div></td>
						<td>
							<div class="thumbnail textCut" style="width: 55px; height: 55px;">
								<img src="https://www.idikorea.com/attach_file/prod/5aafbe4ebd3c468cbf28ea27445c775d.png" alt="">
							</div>
						</td>
						<td class="textAL"><div class="textCut">19>SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품)</div></td>
						<td><div class="textCut textAR">000,000,000</div></td>
						<td><div class="textCut">00,000</div></td>
						<td><div class="textCut"><input type="checkbox" name=""></div></td>
						<td><div class="textCut"><input type="checkbox" name=""></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name=""></div></td>
						<td><div class="textCut"><button type="button" onclick="openWindow('./popup_detail.jsp', 'product_management_list_popup_detail', 1000, 840);">보기</button></div></td>
						<td><div class="textCut"><button type="button">복사</button></div></td>
						<td><div class="textCut">0000-00-00</div></td>
					</tr>
					<% } %>
					<tr>
						<td colspan="14">등록된 게시물이 없습니다.</td>
					</tr> --%>
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
				<a href="#" onclick="openWindow('/mngr/product/management/list/popup/detail?param=false', 'product_management_list_popup_detail', 1000, 840)" class="buttonType">등록</a>
				<button type="button" onclick="if(!confirm('전체 페이지 상품 목록을 엑셀로 저장합니다. 계속하시겠습니까?')){}">엑셀저장</button>
			</div>
		</div>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<script>
location.href
</script>
<script type="module">
	import {paging} from '/js/util/paging/paging.js';
	import {get} from '/js/mngr/pages/product_management_list/list_index.js';
	get.init();
</script>

<jsp:include page="../../include/bottom.jsp" flush="false" />
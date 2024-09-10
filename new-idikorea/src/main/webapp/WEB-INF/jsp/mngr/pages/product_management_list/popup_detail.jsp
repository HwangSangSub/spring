<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<jsp:include page="../../include/common.jsp" flush="false" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="middleArea popup">
	<div class="pageContent">
		<div class="contentTitle">
			<h2>상세정보</h2>
		</div>
		${goods }
		${category }
		aaaaaaaaaaaaaaaaaaaaaa
		${optionList }
		<div class="contentArea">
			<form action="" method="get" enctype="">
				<h3>상품상세정보</h3>
				<table class="contentTable">
					<caption>정보</caption>
					<colgroup>
						<col style="width: 180px;">
						<col>
						<col style="width: 180px;">
						<col>
					</colgroup>
					<input type="hidden" id="goodsNo" value="${goods.goodsNo }">
					<tbody>
						<tr>
							<th>상품명 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3"><input type="text" id="goodsName" name="goodsName"
								value="${goods.goodsName }" required style="width: 549px;"
								autofocus></td>
						</tr>
						<tr>  
							<th>상품분류 ${goods.category }  ${fn:substring( goods.category , 0 , 3 ) } ${fn:substring( goods.category , 0 , 6 ) }<abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3"><select name="categoryList" category-depth="1"  style="min-width: 80px;">
									<option value="">1차분류</option>
									<c:if test="${category ne null && category.size()!=0 }">
										<c:forEach var="item" items="${category }" varStatus="status">
											<c:if test="${ fn:length( item.categoryCode) == 3 }">
												<option value="${item.categoryCode }" <c:if test="${fn:substring( goods.category , 0 , 3 ) eq item.categoryCode }">selected </c:if>>${item.categoryName }</option>
											</c:if>
										</c:forEach>
									</c:if>
							</select> <select name="categoryList" category-depth="2"  style="min-width: 80px;">
									<option value="">2차분류</option>
									<c:if test="${category ne null && category.size()!=0 }">
										<c:forEach var="item" items="${category }" varStatus="status">
											<c:if test="${ fn:length( item.categoryCode) == 6 }">
												<option <c:if test="${fn:substring( goods.category , 0 , 3 ) != fn:substring(item.categoryCode ,0 ,3) }"> style="display:none" </c:if> value="${item.categoryCode }"  <c:if test="${fn:substring( goods.category , 0 , 6 ) == item.categoryCode }">selected </c:if>>${item.categoryName }</option>
											</c:if>
										</c:forEach>
									</c:if>
							</select> <select name="categoryList" category-depth="3"  style="min-width: 80px;">
									<option value="">3차분류</option>
									<c:if test="${category ne null && category.size()!=0 }">
										<c:forEach var="item" items="${category }" varStatus="status">
											<c:if test="${ fn:length( item.categoryCode) == 9 }">
												<option <c:if test="${fn:substring( goods.category , 0 , 6 ) != fn:substring(item.categoryCode ,0 ,6) }"> style="display:none" </c:if> value="${item.categoryCode }" <c:if test="${fn:substring( goods.category , 0 , 9 ) == item.categoryCode }">selected </c:if>>${item.categoryName }</option>
											</c:if>
										</c:forEach>
									</c:if>
							</select></td>
						</tr>
						<tr>
							<th>아이콘표시</th>
							<td id="iconTag" colspan="3"><input type="checkbox" id="check_01" name=""
								value="" <c:if test="${goods.icon[7] eq 1  }">checked</c:if>>
								<label for="check_01">기획</label> <input type="checkbox"
								id="check_02" name="" value=""
								<c:if test="${goods.icon[6] eq 1  }">checked</c:if>> <label
								for="check_02">베스트</label> <input type="checkbox" id="check_03"
								name="" value=""
								<c:if test="${goods.icon[5] eq 1  }">checked</c:if>> <label
								for="check_03">세일</label> <input type="checkbox" id="check_04"
								name="" value=""
								<c:if test="${goods.icon[4] eq 1  }">checked</c:if>> <label
								for="check_04">신상품</label> <input type="checkbox" id="check_05"
								name="" value=""
								<c:if test="${goods.icon[3] eq 1  }">checked</c:if>> <label
								for="check_05">예약</label> <input type="checkbox" id="check_06"
								name="" value=""
								<c:if test="${goods.icon[2] eq 1  }">checked</c:if>> <label
								for="check_06">이벤트</label> <input type="checkbox" id="check_07"
								name="" value=""
								<c:if test="${goods.icon[1] eq 1  }">checked</c:if>> <label
								for="check_07">인기</label> <input type="checkbox" id="check_08"
								name="" value=""
								<c:if test="${goods.icon[0] eq 1  }">checked</c:if>> <label
								for="check_08">추천</label></td>
						</tr>
						<tr>
							<th>상품코드</th>
							<td colspan="3"><input type="number" id="goodsCode" name=""
								value="${goods.goodsCode }" style="width: 150px;"> <!-- <span class="advice">5자리 숫자로 자동 생성됩니다.</span> -->
							</td>
						</tr>
						<tr>
							<th>제조사</th>
							<td colspan="3"><input type="text" name="" id="textMaker" value="${goods.maker }"
								style="width: 150px;"> <select name="" id='maker' class="prevval">
									<option value="">직접입력</option>
									<c:forEach var="item" items="${goods.makerList }"
										varStatus="status">
										<c:if test="${item ne ''  }">
											<option value="${item }"  <c:if test="${goods.maker eq item  }">selected</c:if> >  ${item }</option>
										</c:if>
									</c:forEach>
							</select> <span class="advice">직접 입력 시 중복되지 않는 제조사명은 목록에 자동 저장됩니다.</span>
							</td>
						</tr>
						<tr>
							<th>원산지</th>
							<td colspan="3"><input type="text" name="" id="textCountry" value="${goods.countryOrigin }"
								style="width: 150px;"> <select name="" id="country" class="prevval">
									<option value="">직접입력</option>
									<c:forEach var="item" items="${goods.countryList }"
										varStatus="status">
										<c:if test="${item ne ''  }">
											<option value="${item }" > ${item }</option>
										</c:if>
									</c:forEach>
							</select> <span class="advice">직접 입력 시 중복되지 않는 원산지명은 목록에 자동 저장됩니다.</span>
							</td>
						</tr>
						<tr>
							<th>브랜드</th>
							<td colspan="3"><input type="text" id="textBrand" name="" value="${goods.brandName }" readOnly
								style="width: 150px;"> <select id="brand" name="brandno"
								class="prevval"> 
 									<option value="" >선택</option>
									<c:forEach var="item" items="${goods.brandList }"
										varStatus="status">
										<c:if test="${item.brandName ne ''  }">
											<option value="${item.brandNo }" <c:if test="${item.brandNo eq goods.brandNo  }">selected</c:if>>${item.brandName}</option>
										</c:if> 
									</c:forEach>
							</select> <!-- <span class="advice">직접 입력 시 중복되지 않는 브랜드명은 목록에 자동 저장됩니다.</span> -->
							</td>
						</tr>
						<tr>
							<th>쇼핑몰판매</th>
							<td colspan="3"><input type="radio" name="radio_01"
								id="radio_01" value="1"
								<c:if test="${goods.userOpen eq 1 or goods.userOpen eq null  }">checked</c:if>> <label
								for="radio_01">표시</label> <input type="radio" name="radio_01"
								id="radio_02" value="0"
								<c:if test="${goods.userOpen ne 1  }">checked</c:if>> <label
								for="radio_02">표시안함</label></td>
						</tr>
						<tr>
							<th>전화주문</th>
							<td colspan="3"><input type="radio" name="radio_03" value="1"
								id="radio_03"
								<c:if test="${goods.callOpen eq 1  }">checked</c:if>> <label
								for="radio_03">표시</label> <input type="radio" name="radio_03" value="0"
								id="radio_04"
								<c:if test="${goods.callOpen ne 1  }">checked</c:if>> <label
								for="radio_04">표시안함</label></td>
						</tr>
						<tr>
							<th>적립금정책</th>
							<td colspan="3"><input type="radio" name="radio_05" value="Y"
								id="radio_05" onclick="money_table(true);"
								<c:if test="${goods.reserve eq null  }">checked</c:if>> <label
								for="radio_05">환경설정 적립금 설정을 따름</label> <input type="radio" value="N"
								name="radio_05" id="radio_06" onclick="money_table(false);"
								<c:if test="${goods.reserve ne null  }">checked</c:if>> <label
								for="radio_06">개별입력</label></td>
						</tr>
						<tr>
							<th>과세여부</th>
							<td colspan="3"><input type="radio" name="radio_07" value="1"
								id="radio_07" <c:if test="${goods.tax eq 1 or goods.tax eq null}">checked</c:if>>
								<label for="radio_07">과세</label> <input type="radio"
								name="radio_07" id="radio_08" value="0"
								<c:if test="${goods.tax ne 1  }">checked</c:if>> <label
								for="radio_08">비과세</label></td>
						</tr>
						<tr>
							<th>재고제한없음</th>
							<td colspan="3"><input type="checkbox" name="useStock" id="useStock" value="Y"
								<c:if test="${goods.useStock eq 'N'  }">checked</c:if>>
								<span class="advice">체크 시 재고수량과 상관없이 주문이 가능해집니다.</span></td>
						</tr>
						<tr>
							<th>품절표시</th>
							<td colspan="3"><input type="checkbox" name="" id="soldOut" value = "Y"
								<c:if test="${goods.soldOut eq 1  }">checked</c:if>> <span
								class="advice">체크 시 재고수량, 재고 제한과 상관없이 주문이 불가능해집니다.</span></td>
						</tr>
						<!-- 재고제한없음이 미체크이고, 재고수량이 0이 되었을 경우 -->
						<c:if test="${goods.nowStock eq 0 && goods.useStock eq 'Y' }">
							<tr>
								<th>품절표시</th>
								<td colspan="3">품절
									<ul class="advice">
										<li>재고수량이 0이므로 자동 품절 처리되었습니다.</li>
										<li>재고수량 수정 또는 재고 제한 없음을 체크 후 저장하면 품절 표시 여부를 선택하실 수 있습니다.</li>
									</ul>
								</td>
							</tr>
						</c:if>
						<!--// 재고제한없음이 미체크이고, 재고수량이 0이 되었을 경우 -->
						<tr>
							<th>구매수량제한 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3"><input type="number" min="1" id="minEa" 
								value="${goods.minEa }" class="textAR" style="width: 45px;"
								placeholder="최소"> ~ <input type="number" min="1" id="maxEa" 
								value="${goods.maxEa }" class="textAR" style="width: 45px;"
								placeholder="최대"> <input type="checkbox" id="check_09"
								name="" value="" 
								<c:if test="${goods.minEa eq 0 && goods.maxEa eq 0  }">checked</c:if>>
								<label for="check_09">제한없음</label></td>
						</tr>
						<tr>
							<th>가격 &middot; 재고설정 </th>
							<td colspan="3"><input type="radio" name="radio_09"
								id="radio_09" value ='Y'
								onclick="viewTabmenu('.tbody_02', '.tbody_01', 'table-row-group', this);"
								<c:if test="${(fn:length(optionList) eq 1 and (optionList[0].optionList eq null or fn:length(optionList[0].optionList) eq 1)) or optionList eq null}">checked</c:if>>
								<label for="radio_09">단독상품설정</label> <input type="radio"
								name="radio_09" id="radio_10" value='N' 
								onclick="viewTabmenu('.tbody_01', '.tbody_02', 'block', this);"
								<c:if test="${optionList.size() > 1 or optionList[0].optionList ne null and optionList[0].optionList.size() > 1 }">checked</c:if>>
								<label for="radio_10">옵션상품설정</label></td>
						</tr>
					</tbody>
					<tbody class="tbody_01" data-id="${goods.sno }">
						<tr>
							<th>정가 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td><input type="number" min="0" name="" id="singularConsumer"
								value="${goods.consumer }" class="textAR" style="width: 80px;"></td>
							<th>매입가</th>
							<td><input type="number" min="0" name="" id="singularSupply"
								value="${goods.supply }" class="textAR" style="width: 80px;"></td>
						</tr>
						<tr>
							<th>판매가 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td><input type="number" min="0" name="" id="singularPrice"
								value="${goods.price }" class="textAR" style="width: 80px;"></td>
							<th>적립금</th>
							<td><input type="number" min="0" name="reserve" id="singularReserve"
								value="${goods.reserve }" class="textAR saved_money"
								style="width: 80px;"
								<c:if test="${goods.reserve eq 0  }">readonly</c:if>></td>
						</tr>
						<tr>
							<th>재고수량 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3"><input type="number" min="0" name="" id="singularStock"
								value="${goods.nowStock }" class="textAR" style="width: 80px;"></td>
						</tr>
					</tbody>
				</table>
				<div class="tbody_02 dp_none">
					<h3>
						옵션상품설정
						<button type="button" class="type_button" onclick="createBox();">1차선택옵션추가</button>
					</h3>
					<%-- <ol id="optionList" class="category ui-sortable">
						<c:forEach var="item" items="${goods.optionList }"
							varStatus="status">
							<li><c:if test="${item.opt1 ne null && item.opt1 ne ''  }">
									<input type="text" name="" value="${item.opt1 }"
										placeholder="1차선택옵션명" style="width: 150px;" required>
								${item.opt2 }
									<button type="button" onclick="createBox_sub(this, 2);">2차선택옵션추가</button>
								</c:if>
								<div style="margin: 9px 0 0 23px;">
									<table class="contentTable resultTable" style="margin: 0;">
										<caption>정보</caption>
										<colgroup>
											<col>
											<col>
											<col>
											<col>
											<col>
										</colgroup>
										<thead>	
											<tr>
												<th>정가 <abbr class="essential" title="필수입력사항">*</abbr>
													<input type="number" min="0" name=""
													value="${item.consumer }" class="textAR"
													style="width: 80px;">
												</th>
												<th>판매가 <abbr class="essential" title="필수입력사항">*</abbr>
													<input type="number" min="0" name="" value="${item.price }"
													class="textAR" style="width: 80px;">
												</th>
												<th>매입가 <input type="number" min="0" name=""
													value="${item.supply }" class="textAR" style="width: 80px;">
												</th>
												<th>적립금 <input type="number" min="0" name=""
													value="${item.reserve }" class="textAR saved_money"
													style="width: 80px;" readonly>
												</th>
												<th>재고수량 <abbr class="essential" title="필수입력사항">*</abbr>
													<input type="number" min="0" name="" value="${item.stock }"
													class="textAR" style="width: 80px;">
												</th>
											</tr>
										</thead>
									</table>
								</div></li>
						</c:forEach>
					</ol> --%>
					
				<ol id="optionList" class="category ui-sortable">
				<c:if test="${optionList.size() ne 0  }">
					<c:forEach var="item" items="${optionList }" varStatus="status">
							<li name="depth1">
							<input type="text" name="optionName" value="${item.opt1 }" placeholder="1차선택옵션명" style="width: 150px;" required="">
							<button type="button" onclick="createBox_sub(this, 2);">2차선택옵션추가</button>
							<button type="button"  data-id="${item.sno }" name="deleteBtn">삭제</button>
							<c:if test="${!empty item.optionList }">
								<ol id="optionList_sub_1" class="ui-sortable">
									<c:forEach var="innerItem" items="${item.optionList }" varStatus="status">
										<li name="depth2" class="ui-sortable-handle"><input type="text" name="optionName" value="${innerItem.opt2 }" placeholder="2차선택옵션명" tyle="width: 150px;" required="">&nbsp;
											<!-- <button type="button" onclick="createBox_sub(this, 3);">3차선택옵션추가</button>&nbsp; -->
											<button type="button" data-id="${innerItem.sno }" name="deleteBtn">삭제</button>
											<div style="margin: 9px 0 0 23px;">
												<table class="contentTable resultTable" style="margin: 0;">
													<caption>정보</caption>
													<colgroup>
														<col>
														<col>
														<col>
														<col>
														<col>
													</colgroup>
													<thead data-id ="${innerItem.sno }">
														<tr>
															<th>
																정가 <abbr class="essential" title="필수입력사항">*</abbr>
																<input type="number" min="0" name="consumer" value="${innerItem.consumer }" class="textAR" style="width: 80px;">
															</th>
															<th>
																판매가 <abbr class="essential" title="필수입력사항">*</abbr>
																<input type="number" min="0" name="price" value="${innerItem.price}" class="textAR" style="width: 80px;">
															</th>
															<th>
																매입가
																<input type="number" min="0" name="supply" value="${innerItem.supply }" class="textAR" style="width: 80px;">
															</th>
															<th>
																적립금
																<input type="number" min="0" name="reserve" value="${innerItem.reserve }" class="textAR saved_money" style="width: 80px;">
															</th>
															<th>
																재고수량 <abbr class="essential" title="필수입력사항">*</abbr>
																<input type="number" min="0" name="stock" value="${innerItem.stock }" class="textAR" style="width: 80px;">
															</th>
														</tr>
													</thead>
												</table>
											</div>
										</li>
									</c:forEach>
								</ol>
								
							</c:if>
							<c:if test="${empty item.optionList }">
								<div style="margin: 9px 0 0 23px;">
									<table class="contentTable resultTable" style="margin: 0;">
										<caption>정보</caption>
										<colgroup>
											<col>
											<col>
											<col>
											<col>
											<col>
										</colgroup>
										<thead data-id ="${innerItem.sno }">
											<tr>
												<th>
													정가 <abbr class="essential" title="필수입력사항">*</abbr>
													<input type="number" min="0" name="consumer" value="${item.consumer }" class="textAR" style="width: 80px;">
												</th>
												<th>
													판매가 <abbr class="essential" title="필수입력사항">*</abbr>
													<input type="number" min="0" name="price" value="${item.price}" class="textAR" style="width: 80px;">
												</th>
												<th>
													매입가
													<input type="number" min="0" name="supply" value="${item.supply }" class="textAR" style="width: 80px;">
												</th>
												<th>
													적립금
													<input type="number" min="0" name="reserve" value="${item.reserve }" class="textAR saved_money" style="width: 80px;">
												</th>
												<th>
													재고수량 <abbr class="essential" title="필수입력사항">*</abbr>
													<input type="number" min="0" name="stock" value="${item.stock }" class="textAR" style="width: 80px;">
												</th>
											</tr>
										</thead>
									</table>
								</div>						
							</c:if>
						</li>					
					</c:forEach>
				</c:if>
					
				</ol>					
				</div>
				<h3>상품이미지</h3>
				<table class="contentTable">
					<caption>상품이미지 및 설명</caption>
					<colgroup>
						<col style="width: 180px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>목록 썸네일 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td>
								<div class="imgView" style="width: 330px;">
									<c:if test="${goods.iconImage ne null  }">
										<img src="/api/v1/file/${goods.iconImage }" alt="상품명">
									</c:if>
								</div>
								<ul class="advice">
									<li>첨부 시 현재 이미지는 삭제되고, 새 이미지로 교체됩니다.</li>
								</ul>
								<div class="attachWrap">
									<input type="file" name="" id="iconImage" value='.' accept=".svg, .png, .jpg">
									<input type="text" value="${goods.iconImageName }" style="width: 433px;" readonly="">
									<button type="button" class="attachFile">파일첨부</button>
								<%-- 	<button type="button" delete-id="${ goods.iconImage}"
										class="attachFileReset">첨부삭제</button> --%>
								</div>
							</td>
						</tr>
						<tr>
							<th>상세페이지 상품 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td>
								<div class="imgView" style="width: 330px;">
									<c:if test="${goods.midiumImage ne null  }">
										<img src="/api/v1/file/${goods.midiumImage }" alt="상품명">
									</c:if>
								</div>							
								<ul class="advice">
									<li>첨부 시 현재 이미지는 삭제되고, 새 이미지로 교체됩니다.</li>
								</ul>
								<div class="attachWrap">
									<input type="file" name="" id="midiumImage" accept=".svg, .png, .jpg">
									<input type="text" value="${goods.midiumImageName }" style="width: 433px;" readonly="">
									<button type="button" class="attachFile">파일첨부</button>
								<%-- 	<button type="button" delete-id="${ goods.midiumImage}"
										class="attachFileReset">첨부삭제</button> --%>
								</div>
							</td>
						</tr>
						<tr>
							<th>상세페이지 설명 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td>
								<div class="imgView" style="width: 330px;">
									<c:if test="${goods.contentImage ne null  }">
										<img src="/api/v1/file/${goods.contentImage }" alt="">
									</c:if>
								</div>								
								<ul class="advice">
									<li>첨부 시 현재 이미지는 삭제되고, 새 이미지로 교체됩니다.</li>
								</ul>
								<div class="attachWrap">
									<input type="file" name="" id="contentImage" accept=".svg, .png, .jpg">
									<input type="text" style="width: 433px;" value="${goods.contentImageName }" readonly="">
									<button type="button" class="attachFile">파일첨부</button>
							<%-- 		<button type="button" delete-id="${ goods.contentImage}"
										class="attachFileReset">첨부삭제</button> --%>
								</div>
							</td>
						</tr>
						<tr>
							<th>상품설명</th>
							<td><textarea name="" id="shortContent" cols="30" rows="10">${goods.shortContent }</textarea>
							</td>
						</tr>
						<tr>
							<th>관리메모</th>
							<td><textarea name="" id="memo" cols="30" rows="10">${goods.memo }</textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="contentMenu popup">
					<input type="button" id="saveBtn" value="저장"> 
					<a href="#" name="goodsDeleteBtn" data-id=${goods.goodsNo } "
						class="buttonType caution">삭제</a>
					<button type="button" onclick="window.self.close();">닫기</button>
				</div>
			</form>
		</div>
	</div>
	<input type="hidden" id="pageChecnk">
	<!--// pageContent -->
</div>
<!--// middleArea -->
<script>
	$('body').css('min-width','980px');
	// 옵션상품설정 및 적립금 토글
	var html_money_table;
	function money_table(value){
		$('.saved_money').attr('readonly', value);
		html_money_table =
		`<div style="margin: 9px 0 0 23px;">
			<table class="contentTable resultTable" style="margin: 0;">
				<caption>정보</caption>
				<colgroup>
					<col>
					<col>
					<col>
					<col>
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>
							정가 <abbr class="essential" title="필수입력사항">*</abbr>
							<input type="number" min="0" name="consumer" value="" class="textAR" style="width: 80px;">
						</th>
						<th>
							판매가 <abbr class="essential" title="필수입력사항">*</abbr>
							<input type="number" min="0" name="price" value="" class="textAR" style="width: 80px;">
						</th>
						<th>
							매입가
							<input type="number" min="0" name="supply" value="" class="textAR" style="width: 80px;">
						</th>
						<th>
							적립금
							<input type="number" min="0" name="reserve" value="" class="textAR saved_money" style="width: 80px;"` + (value == true ? ' readonly' : '') + `>
						</th>
						<th>
							재고수량 <abbr class="essential" title="필수입력사항">*</abbr>
							<input type="number" min="0" name="stock" value="" class="textAR" style="width: 80px;">
						</th>
					</tr>
				</thead>
			</table>
		</div>`;
	}
	// 1차선택옵션추가
	function createBox(){
		var html = 
			`<li name="depth1">
				<input type="text" name="optionName" value="" placeholder="1차선택옵션명" style="width: 150px;" required />
				<button type="button" onclick="createBox_sub(this, 2);">2차선택옵션추가</button>`;
			if(document.querySelectorAll('li[name="depth1"]').length > 0)
				html += `&nbsp;<button type="button" name="deleteBtn">삭제</button>`;
		html += html_money_table + `</li>`;
		if($('li.no_list').length == 0){ // 게시물이 없는 상태일 때
			$('#optionList').append(html);
		}else{
			$('#optionList').html(html);
		}
	}
	// 2차이상선택옵션추가
	var id_num = 1;
	var option_num = 3; // 옵션 최대 개수
	function createBox_sub(target, depth){
		console.log(depth)
		$(target).siblings('div').remove();
		var html = '<li name="depth'+depth+'"><input type="text" name="optionName" value="" placeholder="' + depth + '차선택옵션명" tyle="width: 150px;" required />';
		if(depth < option_num){
			//html += '&nbsp;<button type="button" onclick="createBox_sub(this, ' + (depth + 1) + ');">' + (depth + 1) + '차선택옵션추가</button>';
		}
		html += '&nbsp;<button type="button" name="deleteBtn">삭제</button>' + html_money_table + '</li>';
		var html_list = '<ol id="optionList_sub_' + id_num + '">' + html + '</ol>';
		if($(target).siblings('ol').length == 0){
			$(target).parent().append(html_list);
		}else{	
			$(target).siblings('ol').append(html);
		}
		sortableExe('#optionList_sub_' + id_num);
		id_num++;
	}

	$(function(){
		//sortableExe('#optionList');
		money_table(document.getElementsByName('reserve')[0].readonly);
		document.querySelector('input[name="radio_09"]:checked').click();
	});
//	let optionList=JSON.parse('<c:out value="${goods.optionList }" escapeXml="false"	/>')
//	console.log(${optionList});	
</script>

<script type="module">
	import {get} from '/js/mngr/pages/product_management_list/popup_detail.js';
//	get.optionList=${optionList};
	get.init();
	// 옵션삭제
	
	document.addEventListener('click' , deleteBox)
	
	function deleteBox(target){
	target = target.target;
		if( target.name == "deleteBtn" && confirm('삭제 시, 해당 옵션의 하위옵션까지 모두 삭제됩니다.')){
			if($(target).parent().siblings().length == 0){
				$(target).parent().parent().parent().append(html_money_table);
				$(target).parent().parent().remove(); // ol 부모삭제
			}else{
				$(target).parent().remove();
			}
			
			if( target.getAttribute('data-id') != null && target.getAttribute('data-id') != "" ){
				console.log( get.deleteOptionList )
				let obj ={
					sno : target.getAttribute('data-id'),
					depth : target.closest('li').name
				}
				get.deleteOptionList.push(obj);
			}
				
		}
	}
</script>
<jsp:include page="../../include/bottom.jsp" flush="false" />
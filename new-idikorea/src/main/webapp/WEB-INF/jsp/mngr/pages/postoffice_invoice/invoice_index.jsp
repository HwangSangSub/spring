<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_02" />
</jsp:include>

<div class="middleArea">

	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_02" />
		<jsp:param name="depth_01" value="sideMenu_02_01" />
		<jsp:param name="depth_02" value="sideMenu_02_01_01" />
	</jsp:include>

	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 택배연동
				<i class="fa fa-angle-right" aria-hidden="true"></i> 우체국
				<i class="fa fa-angle-right" aria-hidden="true"></i> 송장발급
			</div>
			<h2>송장발급</h2>
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
						<col style="width: 351px;">
						<col style="width: 75px;">
						<col style="width: 407px;">
						<col style="width: 75px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>주문검색</th>
							<td>
								<select name="orderSearchOption">
									<option value="orderNo">주문번호</option>
									<option value="memberName">주문자명</option>
									<option value="receiverName">수령자명</option>
									<option value="memberId">아이디</option>
								</select>
								<input type="text" id="" name="orderSearchValue" autofocus style="width: 180px;">
							</td>
							<th>주문일</th>
							<td>
								<input type="text" name="sDate" id="startTime" readonly class="datepick" style="width: 80px;"> ~ 
								<input type="text" name="eDate" id="endTime" readonly class="datepick" style="width: 80px;">
								<input type="button" onclick="getToday('sDate', 'eDate');" value="오늘">
								<input type="button" onclick="getPeriod('sDate', 'eDate', 7);" value="일주일">
								<input type="button" onclick="getPeriod('sDate', 'eDate', 30);" value="한달">
								<input type="button" onclick="getPeriod('sDate', 'eDate', 0);" value="전체">
							</td>
							<th>발급상태</th>
							<td>
								<input type="radio" name="radio_num_09" value="All" id="radio_num_09">
								<label for="radio_num_09">전체</label>
								<input type="radio" name="radio_num_09" value="Y" id="radio_num_10">
								<label for="radio_num_10">발급</label>
								<input type="radio" name="radio_num_09" value="N" id="radio_num_11" checked>
								<label for="radio_num_11">미발급</label>
							</td>
						</tr>
						<tr>
							<th>주문상태</th>
							<td>
								<input type="radio" name="radio_num_01" id="radio_num_01" checked>
								<label for="radio_num_01">전체</label>
								<input type="radio" name="radio_num_01" value="" id="radio_num_02">
								<label for="radio_num_02">주문접수</label>
								<input type="radio" name="radio_num_01" value="" id="radio_num_03">
								<label for="radio_num_03">결제확인</label>
								<input type="radio" name="radio_num_01" value="" id="radio_num_04">
								<label for="radio_num_04">배송준비중</label>
							</td>
							<th>결제방식</th>
							<td colspan="3">
								<input type="radio" name="orderMethod" id="method0" value="0" checked>
								<label for="method0">전체</label> 
								<input type="radio" name="orderMethod" id="method1" value="a">
								<label for="method1">무통장</label>
								<input type="radio" name="orderMethod" id="method2" value="c">
								<label for="method2">신용카드</label>
								<input type="radio" name="orderMethod" id="method3" value="o">
								<label for="method3">계좌이체</label>
								<input type="radio" name="orderMethod" id="method4" value="v">
								<label for="method4">가상계좌</label>
								<input type="radio" name="orderMethod" id="method5" value="h">
								<label for="method5">휴대폰</label>
								<input type="radio" name="orderMethod" id="method6" value="d">
								<label for="method6">전액할인</label>
							</td>
						</tr>
						<tr>
							<th>목록개수</th>
							<td>
								<input type="radio" name="list_num" id="list_num_01" value="20" checked>
								<label for="list_num_01">20개</label>
								<input type="radio" name="list_num" value="40" id="list_num_02">
								<label for="list_num_02">40개</label>
								<input type="radio" name="list_num" value="100000000" id="list_num_03">
								<label for="list_num_03">전체</label>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="contentMenu">
					<input type="button" id="searchBtn" class="buttonType" value="검색">
					<a href="./invoice_index.jsp" class="buttonType">초기화</a>
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
			<table class="contentTable resultTable line_hover board" id="content">
				<caption>전체목록</caption>
				<colgroup>
					<col style="width: 45px;">
					<col style="width: 69px;">
					<col style="width: 147px;">
					<col>
					<col style="width: 9%;">
					<col style="width: 9%;">
					<col style="width: 81px;">
					<col style="width: 81px;">
					<col style="width: 96px;">
					<col style="width: 81px;">
					<col style="width: 120px;">
					<col style="width: 147px;">
				</colgroup>
				<thead>
					<tr>
						<th><div class="textCut"><input type='checkbox' class="tc_01_check" onclick="selectAll(this, 'tc_01_check')" /></div></th>
						<th><div class="textCut">번호</div></th>
						<th><div class="textCut">주문일시</div></th>
						<th><div class="textCut">주문상품</div></th>
						<th><div class="textCut">주문자</div></th>
						<th><div class="textCut">수령자</div></th>
						<th><div class="textCut">주문상태</div></th>
						<th><div class="textCut">결제방식</div></th>
						<th><div class="textCut">총결제금액</div></th>
						<th><div class="textCut">발급상태</div></th>
						<th><div class="textCut">운송장번호</div></th>
						<th><div class="textCut">발급일</div></th>
					</tr>
				</thead>
				<tbody>
<%-- 					<% for(int x = 0; x < 15; x++) { %> --%>
<!-- 					<tr> -->
<!-- 						<td><div class="textCut"><input type="checkbox" name="" class="tc_01_check" value=""></div></td> -->
<!-- 						<td><div class="textCut">000000</div></td> -->
<!-- 						<td><div class="textCut">0000-00-00 00:00:00</div></td> -->
<!-- 						<td><div class="textCut textAL">19>SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품) 외 1건</div></td> -->
<!-- 						<td><div class="textCut">김연아 스텔라 수녀님</div></td> -->
<!-- 						<td><div class="textCut">안중근 토마스 신부님</div></td> -->
<!-- 						<td><div class="textCut">결제확인</div></td> -->
<!-- 						<td><div class="textCut">휴대폰</div></td> -->
<!-- 						<td><div class="textCut textAR">000,000,000</div></td> -->
<!-- 						<td><div class="textCut">미발급</div></td> -->
<!-- 						<td><div class="textCut">6019912042082</div></td> -->
<!-- 						<td><div class="textCut">0000-00-00 00:00:00</div></td> -->
<!-- 					</tr> -->
<%-- 					<% } %> --%>
					<tr>
						<td colspan="12"><div class="textCut">등록된 게시물이 없습니다.</div></td>
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
				<div class="selectBtn">
					<select id="selectOrdState">
						<option value="all">현재 송장번호 미발급 주문 전체</option>
						<option value="select">선택주문</option>
					</select>
					<button type="button" id="excelBtn" onclick="">송장번호 발급</button>
				</div>
			</div>
		</div>
	</div><!--// pageContent -->
</div><!--// middleArea -->

<script type="module">
	import {paging} from '/js/util/paging/paging.js';
	import {get} from '/js/mngr/pages/postoffice_invoice/invoice_index.js';

	getToday('slastsaledt', 'elastsaledt');
	document.addEventListener("click",event=>{

		if(paging.clickBtn(event)){
			get.searchBtn(get.getParam());
		}else if (event.target.id=='excelBtn'){
			if(confirm('송장번호 발급을 일괄 처리합니다. 계속하시겠습니까?')){
				if(document.getElementById('selectOrdState').value=='all'){
					location.href = '/api/v1/mngr/delivery/excel?flag=Y&&'+(new URLSearchParams(get.getParam()));
				}else if(document.getElementById('selectOrdState').value=='select'){
					let i = 0;
					let checkedList ='';
					document.querySelectorAll('.tc_01_check').forEach(checkBox=>{
						if(i==0){
							i++;
							return;
						}
						if(checkBox.checked && i==1){
							checkedList = checkBox.value 
						}else if(checkBox.checked && i>1){
							checkedList += ','+checkBox.value 
						}
						i++;
					})
					location.href = '/api/v1/mngr/delivery/excel?flag=N&&orderNoList='+checkedList ;
				}
			}
		}
	})
	get.init();
</script>
<jsp:include page="../../include/bottom.jsp" flush="false" />
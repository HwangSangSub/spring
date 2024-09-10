<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String pageType = request.getParameter("pageType") != null ? request.getParameter("pageType") : "";
 %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 ${memberList }
<div class="contentArea notitle">
	<form name="">
		<table class="contentTable no_border">
			<caption>검색</caption>
			<colgroup>
			<% if(!pageType.equals("popup")){ %>
				<col style="width: 75px;">
				<col style="width: 327px;">
				<col style="width: 75px;">
				<col style="width: 253px;">
				<col style="width: 87px;">
				<col>
			<% } else { %>
				<col style="width: 51px;">
				<col style="width: 327px;">
				<col style="width: 51px;">
				<col>
			<% } %>
			</colgroup>
			<tbody>
				<tr>
					<th>검색</th>
					<td>
						<select name="searchOption">
							<option value="memberName">회원명</option>
							<option value="memberId">아이디</option>
							<option value="christianName">닉네임</option>
							<option value="email">이메일</option>
							<option value="phone">전화번호</option>
							<option value="mobile">핸드폰번호</option>
						</select>
						<input type="text" name="searchValue" autofocus style="width: 180px;">
					</td>
					<th>그룹</th>
					<td>
						<select name="groupOption">
							<option value="All">전체</option>
							<c:forEach var="item" items="${levelList }" varStatus="status">
								<option value="${item.level }">${item.groupName }</option>
							</c:forEach>
						</select>
					</td>
					<% if(!pageType.equals("popup")){ %>
					<th>구매일</th>
					<td>
						<input type="text" name="slastsaledt" class="datepick orderDate" style="width: 80px;" readonly>
						~
						<input type="text" name="elastsaledt" class="datepick orderDate" style="width: 80px;" readonly>
						<input type="button" onclick="getToday('slastsaledt', 'elastsaledt');" value="오늘">
						<input type="button" onclick="getPeriod('slastsaledt', 'elastsaledt', 7);" value="일주일">
						<input type="button" onclick="getPeriod('slastsaledt', 'elastsaledt', 30);" value="한달">
						<input type="button" onclick="getPeriod('slastsaledt', 'elastsaledt', 0);" value="전체">
					</td>
					<% } %>
				</tr>
				<% if(!pageType.equals("popup")){ %>
				<tr>
					<th>생년월일</th>
					<td>
						<select name="birthType">
							<option value="All">전체</option>
							<option value="s">양력</option>
							<option value="l">음력</option>
						</select>
						<input type="text" name="birthDate" class="datepick" style="width: 80px;" readonly>
						~
						<input type="text" name="birthDate" class="datepick" style="width: 80px;" readonly>
					</td>
					<th>적립금</th>
					<td>
						<input type="number" min="0" name="saveEmoney" class="textAR" style="width: 80px;" placeholder="최소">
						~
						<input type="number" min="0" name="saveEmoney" class="textAR" style="width: 80px;" placeholder="최대"> 원
					</td>
					<th>구매금액</th>
					<td>
						<input type="number" min="0" name="buyMoney" class="textAR" style="width: 80px;" placeholder="최소">
						~
						<input type="number" min="0" name="buyMoney" class="textAR" style="width: 80px;" placeholder="최대"> 원
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" value="All" id="radio_01" checked>
						<label for="radio_01">전체</label>
						<input type="radio" name="gender" value="M" id="radio_02">
						<label for="radio_02">남자</label>
						<input type="radio" name="gender" value="W" id="radio_03">
						<label for="radio_03">여자</label>
					</td>
					<th>목록개수</th>
					<td>
						<input type="radio" name="list_num" id="list_num_01" value="20" checked>
						<label for="list_num_01">20개</label>
						<input type="radio" name="list_num" value="40" id="list_num_02">
						<label for="list_num_02">40개</label>
						<input type="radio" name="list_num" value="100000000" id="list_num_03">
						<label for="list_num_03">전체</label>
					</td>
<!-- 					<th>승인여부</th>
					<td>
						<input type="radio" name="radio_04" id="radio_04" checked>
						<label for="radio_04">전체</label>
						<input type="radio" name="radio_04" value="m" id="radio_05">
						<label for="radio_05">승인</label>
						<input type="radio" name="radio_04" value="w" id="radio_06">
						<label for="radio_06">미승인</label>
					</td> -->
					<th>총구매금액</th>
					<td>
						<input type="checkbox" id="sumPriceCheck" name="" />
						구매일 내 총 구매금액을 표시
					</td>
				</tr>
				<tr>
					<!-- <th>회원구분</th>
					<td>
						<input type="radio" name="member_div" id="member_div_01" checked>
						<label for="member_div_01">전체</label>
						<input type="radio" name="member_div" value="" id="member_div_02">
						<label for="member_div_02">후원회원</label>
						<input type="radio" name="member_div" value="" id="member_div_03">
						<label for="member_div_03">일반회원</label>
					</td> -->

				</tr>
				<% } %>
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
	<div class="contentTR clearFix">
		<span class="colorBox idi"></span> 후원회원
		<span class="colorBox"></span> 일반회원
	</div>
	<table id="layer_target" class="contentTable resultTable board">
		<caption>목록</caption>
		<colgroup>
		<% if(!pageType.equals("popup")){ %>
			<col style="width: 45px;">
			<col style="width: 69px;">
			<col>
			<col>
			<col style="width: 115px;">
			<col style="width: 69px;">
			<col style="width: 81px;">
			<col style="width: 81px;">
			<col style="width: 81px;">
			<col style="width: 81px;">
			<col id="emoneyCol" style="width: 96px;">
			<!-- <col id="sumCol" style="width: 96px;">  -->
			<col style="width: 180px;">
			<col style="width: 180px;">
		<% } else { %>
			<col style="width: 69px;">
			<col>
			<col>
			<col style="width: 69px;">
			<col>
			<col style="width: 96px;">
			<%-- <col style="width: 96px;"> --%>
			<col style="width: 69px;">
			<%-- <col style="width: 69px;"> --%>
		<% } %>
		</colgroup>
		<thead id="title">
			<tr>
				<% if(!pageType.equals("popup")){ %>
				<th><input type='checkbox' class="member_check" onclick="selectAll(this, 'member_check')" /></th>
				<% } %>
				<th><div class="textCut">번호</div></th>
				<th><div class="textCut">회원명 ( 세례명 )</div></th>
				<th><div class="textCut">아이디</div></th>
				<% if(!pageType.equals("popup")){ %> 
				<th><div class="textCut">생년월일</div></th>
				<% } %>
				<th><div class="textCut">성별</div></th>
				<th><div class="textCut">그룹</div></th>
				<% if(!pageType.equals("popup")){ %>
				<th><div class="textCut">상세정보</div></th>
				<th><div class="textCut">주문내역</div></th>
				<th><div class="textCut">적립금내역</div></th>
				<% } %>
				<th id="titleEmoney"><div class="textCut">적립금</div></th>
 				<!-- <th><div class="textCut">총구매금액</div></th> -->
				<% if(!pageType.equals("popup")){ %>
				<th><div class="textCut">가입일</div></th>
				<th><div class="textCut">마지막구매일</div></th>
				<% } %>
				<% if(pageType.equals("popup")){ %>
			<!-- 	<th><div class="textCut">총구매금액</div></th> -->
				<th><div class="textCut">선택</div></th>
				<% } %>
			</tr>
		</thead>
		<tbody id="memberContent">
			<%-- <% for(int x = 0; x < 5; x++) { %>
			<tr class="idi_connect">
				<% if(!pageType.equals("popup")){ %>
					<td><div class="textCut"><input type="checkbox" name="" class="member_check" value=""></div></td>
				<% } %>
				<td><div class="textCut">000000</div></td>
				<td><div class="textCut">김연아 스텔라 수녀님</div></td>
				<td><div class="textCut">yunakim</div></td>
				<% if(!pageType.equals("popup")){ %>
				<td><div class="textCut">양력 0000-00-00</div></td>
				<% } %>
				<td><div class="textCut">여</div></td>
				<td><div class="textCut">수도자</div></td>
				<% if(!pageType.equals("popup")){ %>
				<td>
					<div class="textCut">
						<button type="button" onclick="openWindow('./popup_detail.jsp', 'member_management_list_popup_detail', 1000, 840);">보기</button>
					</div>
				</td>
				<td>
					<div class="textCut">
						<button type="button">보기</button>
					</div>
				</td>
				<td>
					<div class="textCut">
						<button type="button">보기</button>
					</div>
				</td>
				<% } %>
				<td><div class="textCut textAR">000,000,000</div></td>
				<td><div class="textCut textAR">000,000,000</div></td>
				<% if(!pageType.equals("popup")){ %>
				<td><div class="textCut">0000-00-00 00:00:00</div></td>
				<td><div class="textCut">0000-00-00 00:00:00</div></td>
				<% } %>
				<td><div class="textCut">미승인</div></td>
				<% if(pageType.equals("popup")){ %>
				<td>
					<div class="textCut">
						<button type="button">선택</button>
					</div>
				</td>
				<% } %>
			</tr>
			<% } %>

			<% for(int x = 0; x < 15; x++) { %>
			<tr>
				<% if(!pageType.equals("popup")){ %>
				<td><div class="textCut"><input type="checkbox" name="" class="member_check" value=""></div></td>
				<% } %>
				<td><div class="textCut">000000</div></td>
				<td><div class="textCut">안중근 토마스 신부님</div></td>
				<td><div class="textCut">thomas</div></td>
				<% if(!pageType.equals("popup")){ %>
				<td><div class="textCut">음력 0000-00-00</div></td>
				<% } %>
				<td><div class="textCut">남</div></td>
				<td><div class="textCut">일반회원</div></td>
				<% if(!pageType.equals("popup")){ %>
				<td>
					<div class="textCut">
						<button type="button" onclick="openWindow('./popup_detail.jsp', 'member_management_list_popup_detail', 1000, 840);">보기</button>
					</div>
				</td>
				<td>
					<div class="textCut">
						<button type="button">보기</button>
					</div>
				</td>
				<td>
					<div class="textCut">
						<button type="button">보기</button>
					</div>
				</td>
				<% } %>
				<td><div class="textCut textAR">000,000,000</div></td>
				<td><div class="textCut textAR">000,000,000</div></td>
				<% if(!pageType.equals("popup")){ %>
				<td><div class="textCut">0000-00-00 00:00:00</div></td>
				<td><div class="textCut">0000-00-00 00:00:00</div></td>
				<% } %>
				<td><div class="textCut">승인</div></td>
				<% if(pageType.equals("popup")){ %>
				<td>
					<div class="textCut">
						<button type="button">선택</button>
					</div>
				</td>
				<% } %>
			</tr>
			<% } %>
			<tr>
				<% if(!pageType.equals("popup")){ %>
				<td colspan="15">등록된 게시물이 없습니다.</td>
				<% } else { %>
				<td colspan="9">등록된 게시물이 없습니다.</td>
				<% } %>
			</tr> --%>
		</tbody>
	</table>
	<div class="boardPaging">
		 <ul class="clearFix">
			<!--<li class="pagingFirst">
				<a href="" title="첫 페이지로 이동">
					<i class="fa fa-chevron-left" aria-hidden="true"></i>
				</a>
			</li>
			<li class="pagingBlockPrev">
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
			<li class="pagingBlockNext">
				<a href="" title="다음 페이지 블록으로 이동">
					<i class="fa fa-angle-double-right" aria-hidden="true"></i>
				</a>
			</li>
			<li class="pagingLast">
				<a href="" title="끝 페이지로 이동">
					<i class="fa fa-chevron-right" aria-hidden="true"></i>
				</a>
			</li>-->
		</ul> 
	</div>
	<% if(!pageType.equals("popup")){ %>
	<div class="contentMenu">
		<!-- <button type="button" onclick="if(!confirm('선택한 회원을 일괄 승인 처리합니다. 계속하시겠습니까?')){}">선택회원승인처리</button> -->
		<button type="button" onclick="if(!confirm('삭제된 데이터는 복구할 수 없습니다. 삭제하시겠습니까?')){}">선택회원삭제</button>
		<button type="button" id="excelBtn" onclick="">엑셀저장</button>
	</div>
	<% } %>
</div>
<script type="module">
	import {paging} from '/js/util/paging/paging.js';
	import {get} from '/js/mngr/pages/member_management_list/list_index.js';
	window.pageType = "<%= pageType %>";
	get.init();
//	getToday('slastsaledt', 'elastsaledt');
	document.addEventListener("click",event=>{
		if(paging.clickBtn(event)){
			get.searchBtn(get.getParam());
		}else if(event.target.id=='excelBtn'){
			if(confirm('전체 페이지 회원 목록을 엑셀로 저장합니다. 계속하시겠습니까?')){
				console.log((new URLSearchParams(get.getParam())))				
				location.href = '/mngr/member/excel?'+(new URLSearchParams(get.getParam()));
			}
		}
	})
</script>
<script>

if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('/service.js')
    .then(registration => {
        console.log('Service Worker registered with scope:', registration.scope);
    })
    .catch(error => {
        console.log('Service Worker registration failed:', error);
    });
}
</script>
<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_06" />
</jsp:include>

<div class="middleArea">

	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_06" />
		<jsp:param name="depth_01" value="sideMenu_06_01" />
		<jsp:param name="depth_02" value="sideMenu_06_01_05" />
	</jsp:include>

	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 상품
				<i class="fa fa-angle-right" aria-hidden="true"></i> 상품관리
				<i class="fa fa-angle-right" aria-hidden="true"></i> 상품정렬
			</div>
			<h2>상품정렬</h2>
		</div>
		<button type="button" class="openerSideMenu">
			<i class="fa fa-chevron-left" aria-hidden="true"></i>
		</button>
		<div class="half">
			<div class="contentArea">
				<h3>카테고리목록</h3>
				<form action="" method="post" enctype="">
					<ol id="getCategoryList" class="category ui-sortable">
						<li>
							EVENT
							<strong style="color: #16a765;">보임</strong>
							<button type="button">상품목록보기</button>
						</li>
						<li>
							CLEANSING
							<strong style="color: #f53f59;">숨김</strong>
							<button type="button">상품목록보기</button>
						</li>
						<!--
						<li class="no_list textAC">
							등록된 카테고리가 없습니다.
						</li>
						-->
					</ol>
				</form>
			</div>
			<div class="contentArea">
				<h3>
					상품목록
					<button type="button" title="도움말" class="openerContentAdvice"><i class="fa fa-question-circle fa-lg" aria-hidden="true"></i></button>
				</h3>
				<div class="contentAdvice" style="top: 47px;">
					<h4>분류 순서 변경 방법</h4>
					<p>순서 변경을 원하는 목록을 마우스 왼쪽 버튼을 누른 체 마우스를 움직여, 원하는 위치에서 마우스 버튼을 떼면 순서가 변경됩니다. 변경 후 순서 저장을 클릭해야 적용이 됩니다.</p>
					<button type="button" title="도움말 닫기" class="closeContentAdvice"><i class="fa fa-times fa-lg" aria-hidden="true"></i></button>
				</div>
				<form action="" method="post" enctype="">
					<table class="contentTable resultTable board">
						<caption>게시물</caption>
						<colgroup>
							<col style="width: 69px;">
							<col style="width: 81px;">
							<col>
							<col style="width: 96px;">
							<col style="width: 90px;">
						</colgroup>
						<thead>
							<tr>
								<th><div class="textCut">상품코드</div></th>
								<th><div class="textCut">사진</div></th>
								<th><div class="textCut">상품명</div></th>
								<th><div class="textCut">판매금액</div></th>
								<th><div class="textCut">등록일</div></th>
							</tr>
						</thead>
						<tbody id="product_list">
							<% for(int x = 0; x < 5; x++) { %>
							<tr>
								<td><div class="textCut">00000</div></td>
								<td>
									<div class="thumbnail textCut" style="width: 55px; height: 55px;">
										<img src="https://www.idikorea.com/attach_file/prod/5aafbe4ebd3c468cbf28ea27445c775d.png" alt="">
									</div>
								</td>
								<td class="textAL"><div class="textCut">19&gt;SOAGEN ANTIETA’ CREMA GIORNO _ 소아젠 안티에타 크레마 죠르노(반품,환불 불가한 상품)</div></td>
								<td><div class="textCut textAR">000,000,000</div></td>
								<td><div class="textCut">0000-00-00</div></td>
							</tr>
							<% } %>
							<!--
							<tr>
								<td colspan="5">등록된 게시물이 없습니다.</td>
							</tr>
							-->
						</tbody>
					</table>
					<div class="contentMenu">
						<input type="submit" value="순서저장" />
					</div>
				</form>
			</div>
		</div>
		
		<script>
			$( function() {
				$('#product_list').sortable();
				$('#product_list').disableSelection();
			});
		</script>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<jsp:include page="../../include/bottom.jsp" flush="false" />
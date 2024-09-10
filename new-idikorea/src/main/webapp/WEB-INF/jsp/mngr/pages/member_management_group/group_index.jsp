<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_05" />
</jsp:include>

<div class="middleArea">

	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_05" />
		<jsp:param name="depth_01" value="sideMenu_05_01" />
		<jsp:param name="depth_02" value="sideMenu_05_01_03" />
	</jsp:include>

	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 회원
				<i class="fa fa-angle-right" aria-hidden="true"></i> 회원관리
				<i class="fa fa-angle-right" aria-hidden="true"></i> 그룹관리
			</div>
			<h2>그룹관리</h2>
		</div>
		<button type="button" class="openerSideMenu">
			<i class="fa fa-chevron-left" aria-hidden="true"></i>
		</button>
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
					<col style="width: 96px;">
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col style="width: 96px;">
					<col style="width: 96px;">
				</colgroup>
				<thead>
					<tr>
						<th><div class="textCut">번호</div></th>
						<th><div class="textCut">그룹레벨</div></th>
						<th><div class="textCut">그룹명</div></th>
						<th><div class="textCut">회원수</div></th>
						<th><div class="textCut">제공할인율(%)</div></th>
						<th><div class="textCut">추가적립금(%)</div></th>
						<th><div class="textCut">배송비</div></th>
						<th><div class="textCut">정기구매중복적용</div></th>
						<th><div class="textCut">상세정보</div></th>
						<th><div class="textCut">삭제</div></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><div class="textCut">00000</div></td>
						<td><div class="textCut">1</div></td>
						<td><div class="textCut">일반회원</div></td>
						<td><div class="textCut">5,924</div></td>
						<td><div class="textCut">0</div></td>
						<td><div class="textCut">0</div></td>
						<td><div class="textCut">배송비 정책에 따름 </div></td>
						<td><div class="textCut">미적용</div></td>
						<td>
							<div class="textCut">
								<a href="/mngr/member/management/group/detail" class="type_button">보기</a>
							</div>
						</td>
						<td></td>
					</tr>
					<tr>
						<td><div class="textCut">00000</div></td>
						<td><div class="textCut">2</div></td>
						<td><div class="textCut">후원회원</div></td>
						<td><div class="textCut">2,553</div></td>
						<td><div class="textCut">11</div></td>
						<td><div class="textCut">0</div></td>
						<td><div class="textCut">배송비 정책에 따름 </div></td>
						<td><div class="textCut">미적용</div></td>
						<td>
							<div class="textCut">
								<a href="/mngr/member/management/group/detail" class="type_button">보기</a>
							</div>
						</td>
						<td>
							<div class="textCut">
								<button type="button" onclick="if(!confirm('삭제된 데이터는 복구할 수 없습니다. 삭제하시겠습니까?')){}">삭제</button>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="10">등록된 게시물이 없습니다.</td>
					</tr>
				</tbody>
			</table>
			<div class="contentMenu">
				<a href="" class="buttonType">등록</a>
			</div>
		</div>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<jsp:include page="../../include/bottom.jsp" flush="false" />
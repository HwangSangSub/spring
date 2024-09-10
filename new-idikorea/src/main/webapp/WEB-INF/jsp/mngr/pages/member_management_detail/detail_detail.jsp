<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_05" />
</jsp:include>

<div class="middleArea">

	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_05" />
		<jsp:param name="depth_01" value="sideMenu_05_01" />
		<jsp:param name="depth_02" value="sideMenu_05_01_02" />
	</jsp:include>

	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 회원
				<i class="fa fa-angle-right" aria-hidden="true"></i> 회원관리
				<i class="fa fa-angle-right" aria-hidden="true"></i> 탈퇴 &middot; 삭제내역
			</div>
			<h2>탈퇴 &middot; 삭제내역</h2>
		</div>
		<button type="button" class="openerSideMenu">
			<i class="fa fa-chevron-left" aria-hidden="true"></i>
		</button>
		<div class="contentArea notitle">
			<form action="" method="get" enctype="">
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
							<th>회원명</th>
							<td colspan="3">김연아 스텔라 수녀님</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td colspan="3">yunakim</td>
						</tr>
						<tr>
							<th>처리형태</th>
							<td colspan="3">강제탈퇴</td>
						</tr>
						<tr>
							<th>탈퇴일</th>
							<td colspan="3">0000-00-00 00:00:00</td>
						</tr>
						<tr>
							<th>남긴말씀</th>
							<td colspan="3"><textarea rows="5" cols="10"></textarea></td>
						</tr>
						<tr>
							<th>관리메모</th>
							<td colspan="3"><textarea rows="5" cols="10"></textarea></td>
						</tr>
					</tbody>
				</table>
				<div class="contentMenu">
					<input type="submit" value="저장">
					<a href="" class="buttonType">목록</a>
					<a href="" onclick="if(!confirm('삭제된 데이터는 복구할 수 없습니다. 삭제하시겠습니까?')){}" class="buttonType caution">삭제</a>
				</div>
			</form>
		</div>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<jsp:include page="../../include/bottom.jsp" flush="false" />
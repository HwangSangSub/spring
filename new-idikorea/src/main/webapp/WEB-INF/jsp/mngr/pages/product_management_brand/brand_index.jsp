<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_06" />
</jsp:include>

<div class="middleArea">

	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_06" />
		<jsp:param name="depth_01" value="sideMenu_06_01" />
		<jsp:param name="depth_02" value="sideMenu_06_01_03" />
	</jsp:include>

	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 상품
				<i class="fa fa-angle-right" aria-hidden="true"></i> 상품관리
				<i class="fa fa-angle-right" aria-hidden="true"></i> 브랜드관리
			</div>
			<h2>브랜드관리</h2>
		</div>
		<button type="button" class="openerSideMenu">
			<i class="fa fa-chevron-left" aria-hidden="true"></i>
		</button>
		<div class="contentArea">
			<h3>
				브랜드목록
				<button type="button" class="type_button" onclick="createBox();">추가</button>
			</h3>
			<form action="" method="post" enctype="">
				<ol id="getCategoryList" class="category ui-sortable">
					<li>
						<input type="text" name="" value="LUKA" style="width: 150px;">
						<button type="button" onclick="deleteBox(this)" style="margin-right: 9px;">삭제</button>
						<span>상품 수 : 8개</span>
					</li>
					<!--
					<li class="no_list textAC">
						등록된 카테고리가 없습니다.
					</li>
					-->
				</ol>
				<div class="contentMenu">
					<input type="submit" value="저장" />
				</div>
			</form>
		</div>
		<!-- 현재페이지설정 -->
		<script>
			function createBox(){
				var html = `<li>
						<input type="text" name="" value="" style="width: 150px;">
						<button type="button" onclick="deleteBox(this)" style="margin-right: 9px;">삭제</button>
					</li>`;
				if($('li.no_list').length == 0){
					$('#getCategoryList').append(html);
				} else {
					$('#getCategoryList').html(html);
				}
			}

			function deleteBox(target){
				if(confirm('삭제 시, 등록된 상품들은 *** 처리됩니다.')) {
					$(target).parent().remove();
				} else { }

				if($('#getCategoryList li').length == 0){
					$('#getCategoryList').html('<li class="no_list textAC">등록된 카테고리가 없습니다.</li>');
				}
			}
		</script>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<jsp:include page="../../include/bottom.jsp" flush="false" />
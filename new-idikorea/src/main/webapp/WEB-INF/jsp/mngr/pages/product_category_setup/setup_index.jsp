<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_06" />
</jsp:include>

<div class="middleArea">

	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_06" />
		<jsp:param name="depth_01" value="sideMenu_06_02" />
		<jsp:param name="depth_02" value="sideMenu_06_02_01" />
	</jsp:include>

	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 상품
				<i class="fa fa-angle-right" aria-hidden="true"></i> 카테고리관리
				<i class="fa fa-angle-right" aria-hidden="true"></i> 설정
			</div>
			<h2>설정</h2>
		</div>
		<button type="button" class="openerSideMenu">
			<i class="fa fa-chevron-left" aria-hidden="true"></i>
		</button>

		<div class="half">
			<div class="contentArea">
				<h3>
					카테고리목록
					<button type="button" class="type_button" onclick="createBox();">1차카테고리 추가</button>
					<button type="button" title="도움말" class="openerContentAdvice"><i class="fa fa-question-circle fa-lg" aria-hidden="true"></i></button>
				</h3>
				<div class="contentAdvice" style="top: 47px;">
					<h4>분류 순서 변경 방법</h4>
					<p>순서 변경을 원하는 목록을 마우스 왼쪽 버튼을 누른 체 마우스를 움직여, 원하는 위치에서 마우스 버튼을 떼면 순서가 변경됩니다. 변경 후 순서 저장을 클릭해야 적용이 됩니다.</p>
					<button type="button" title="도움말 닫기" class="closeContentAdvice"><i class="fa fa-times fa-lg" aria-hidden="true"></i></button>
				</div>
				<form action="" method="post" enctype="">
					<ol id="getCategoryList" class="category ui-sortable">
						<li>
							<input type="text" name="" value="" style="width: 150px;" readonly required>
							<strong style="color: #16a765;">보임</strong>
							<button type="button">설정</button>
							<button type="button" onclick="createBox_sub(this);">하위카테고리 추가</button>
							<button type="button" onclick="deleteBox(this)" style="float: right;">삭제</button>
						</li>
						<li>
							<input type="text" name="" value="" style="width: 150px;" readonly required>
							<strong style="color: #f83a22;">숨김</strong>
							<button type="button">설정</button>
							<button type="button" onclick="createBox_sub(this);">하위카테고리 추가</button>
							<button type="button" onclick="deleteBox(this)" style="float: right;">삭제</button>
						</li>
						<!-- 
						<li class="no_list textAC">
							등록된 카테고리가 없습니다.
						</li>
						 -->
					</ol>
					<div class="contentMenu">
						<input type="submit" value="순서저장" />
					</div>
				</form>
			</div>
			<div class="contentArea">
				<h3>카테고리설정</h3>
				<form action="" method="post" enctype="">
					<table class="contentTable">
						<caption>매장상세정보</caption>
						<colgroup>
							<col style="width: 180px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th>표시여부</th>
								<td>
									<input type="radio" name="radio_01" id="radio_01_01" value="" checked>
									<label for="radio_01_01">보임</label>
									<input type="radio" name="radio_01" id="radio_01_02" value="">
									<label for="radio_01_02">숨김</label>
								</td>
							</tr>
							<tr>
								<th>카테고리명 <abbr class="essential">*</abbr></th>
								<td>
									<input type="text" name="" value="카테고리 1" style="width: 171px;" autofocus>
								</td>
							</tr>
							<tr>
								<th>상품목록명 <abbr class="essential">*</abbr></th>
								<td>
									<input type="text" name="" value="카테고리 1" style="width: 171px;" autofocus>
								</td>
							</tr>
							<tr>
								<th>카테고리 이미지 <abbr class="essential" title="필수입력사항">*</abbr></th>
								<td>
									<div style="width: 330px;">
										<img src="https://www.idikorea.com/images/user/prod/prod_tab1.png" alt="상품명">
									</div>
									<ul class="advice">
										<li>첨부 시 현재 이미지는 삭제되고, 새 이미지로 교체됩니다.</li>
									</ul>
									<div class="attachWrap">
										<input type="file" name="" id="" accept=".svg, .png, .jpg">
										<input type="text" value="" style="width: 433px;" readonly="">
										<button type="button" class="attachFile">파일첨부</button>
										<button type="button" class="attachFileReset">첨부삭제</button>
									</div>
								</td>
							</tr>
							<tr>
								<th>카테고리 오버 이미지 <abbr class="essential" title="필수입력사항">*</abbr></th>
								<td>
									<div style="width: 330px;">
										<img src="https://www.idikorea.com/images/user/prod/prod_tab1.png" alt="상품명">
									</div>
									<ul class="advice">
										<li>첨부 시 현재 이미지는 삭제되고, 새 이미지로 교체됩니다.</li>
									</ul>
									<div class="attachWrap">
										<input type="file" name="" id="" accept=".svg, .png, .jpg">
										<input type="text" value="" style="width: 433px;" readonly="">
										<button type="button" class="attachFile">파일첨부</button>
										<button type="button" class="attachFileReset">첨부삭제</button>
									</div>
								</td>
							</tr>
							<tr>
								<th>접근권한</th>
								<td>
									<select name="level">
										<option value="0">제한없음</option>
										<option value="1">일반회원</option>
										<option value="2">후원회원</option>
										<option value="3">직원</option>
										<option value="4">수도자</option>
										<option value="5">도매점</option>
										<option value="6">후원회비 미납</option>
										<option value="7">후원회원 탈퇴</option>
										<option value="8">미사용</option>
										<option value="9">비타꼰</option>
										<option value="10">IDI회원</option>
										<option value="11">기타</option>
										<option value="12">우편미발송</option>
										<option value="13">중복</option>
										<option value="16">수도회직원</option>
										<option value="17">알수없는 후원회원</option>
										<option value="18">후원(바다의별)</option>
										<option value="20">후원대기</option>
										<option value="80">부관리자</option>
										<option value="100">관리자</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="contentMenu">
						<input type="submit" value="설정저장" />
					</div>
				</form>
			</div>
		</div>

		<!-- 현재페이지설정 -->
		<script>
			var html_top =
				'<li>' +
				'	<input type="text" name="" value="" style="width: 150px;" readonly required />' +
				'	<strong style="color: #16a765;">보임</strong>' +
				'	<button type="button">설정</button>';

			var html_bottom =
				'	<button type="button" onclick="deleteBox(this)" style="float: right;">삭제</button>' +
				'</li>';

			function createBox(){
				var html = html_top + '	<button type="button" onclick="createBox_sub(this);">하위카테고리 추가</button>' + html_bottom;
				if($('li.no_list').length == 0){
					$('#getCategoryList').append(html);
				} else {
					$('#getCategoryList').html(html);
				}
			}

			let num = 1;
			function createBox_sub(target){
				var html = html_top + html_bottom;
				var html_list = '<ol id="getCategoryList_sub_' + num + '" class="getCategoryList_sub">' + html + '</ol>';
				if($(target).siblings('ol').length == 0){
					$(target).parent().append(html_list);
					$('#getCategoryList_sub_' + num).sortable();
					$('#getCategoryList_sub_' + num).disableSelection();
					num++;
				} else {
					$(target).siblings('ol').append(html);
				}
			}

			function deleteBox(target){
				if(confirm('카테고리 삭제 시, 해당 카테고리의 하위 카테고리까지 모두 삭제되며, 등록된 상품들은 *** 처리됩니다.')) {
					$(target).parent().remove();
				} else { }

				if($('#getCategoryList li').length == 0){
					$('#getCategoryList').html('<li class="no_list textAC">등록된 카테고리가 없습니다.</li>');
				}
			}
			
			$( function() {
				$('#getCategoryList').sortable();
				$('#getCategoryList').disableSelection();
			});
		</script>
		<!-- // 현재페이지설정 -->
	</div><!--// pageContent -->
</div><!--// middleArea -->
<jsp:include page="../../include/bottom.jsp" flush="false" />
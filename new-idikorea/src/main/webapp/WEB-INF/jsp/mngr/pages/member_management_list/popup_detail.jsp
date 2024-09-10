<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../../include/common.jsp" flush="false" />
<div class="middleArea popup">
	<div class="pageContent">
		<div class="contentTitle">
			<h2>상세정보</h2>
		</div>
		${memberInfo }
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
						<!-- <tr>
							<th>승인여부</th>
							<td>
								<input type="radio" name="radio_21" value="" id="radio_21" checked>
								<label for="radio_21">승인</label>
								<input type="radio" name="radio_21" value="" id="radio_22" >
								<label for="radio_22">미승인</label>
							</td>
							<th>승인일</th>
							<td>0000-00-00 00:00:00</td>
						</tr> -->
						<tr>
							<th>아이디</th>
							<td id="memberId">${memberInfo.memberId }</td>
							<th>가입일</th>
							<td>${memberInfo.createTime }</td>
						</tr>
						<tr>
							<th>회원명 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td><input type="text" name="" id="memberName" value="${memberInfo.memberName }" style="width: 180px;" required autofocus> </td>
							<th>세례명</th>
							<td><input type="text" name="" id="christianName" value="${memberInfo.christianName }" style="width: 110px;"></td>
						</tr>
						<tr>
							<th>그룹</th>
							<td>
								<select id="level" name="level">
									<option value="1" <c:if test="${memberInfo.level eq 1  }">selected</c:if>>일반회원</option>
									<option value="2" <c:if test="${memberInfo.level eq 2  }">selected</c:if>>후원회원</option>
									<option value="3" <c:if test="${memberInfo.level eq 3  }">selected</c:if>>직원</option>
									<option value="4" <c:if test="${memberInfo.level eq 4  }">selected</c:if>>수도자</option>
									<option value="5" <c:if test="${memberInfo.level eq 5  }">selected</c:if>>도매점</option>
									<option value="6" <c:if test="${memberInfo.level eq 6  }">selected</c:if>>후원회비 미납</option>
									<option value="7" <c:if test="${memberInfo.level eq 7  }">selected</c:if>>후원회원 탈퇴</option>
									<option value="8" <c:if test="${memberInfo.level eq 8  }">selected</c:if>>미사용</option>
									<option value="9" <c:if test="${memberInfo.level eq 9  }">selected</c:if>>탈퇴된 회원 임시</option>
									<option value="12" <c:if test="${memberInfo.level eq 12  }">selected</c:if>>우편미발송</option>
									<option value="13" <c:if test="${memberInfo.level eq 13  }">selected</c:if>>중복</option>
									<option value="16" <c:if test="${memberInfo.level eq 16  }">selected</c:if>>수도회직원</option>
									<option value="17" <c:if test="${memberInfo.level eq 17  }">selected</c:if>>알수없는 후원회원</option>
									<option value="18" <c:if test="${memberInfo.level eq 18  }">selected</c:if>>후원(바다의별)</option>
									<option value="20" <c:if test="${memberInfo.level eq 20  }">selected</c:if>>후원대기</option>
									<option value="80" <c:if test="${memberInfo.level eq 80  }">selected</c:if>>부관리자</option>
									<option value="100" <c:if test="${memberInfo.level eq 100  }">selected</c:if>>관리자</option>
									<option value="11" <c:if test="${memberInfo.level eq 11  }">selected</c:if>>기타</option>
								</select>
							</td>
							<th>이메일</th>
							<td><input type="email" name="" value="${memberInfo.email }" style="width: 180px;"></td>
						</tr>
						<tr>
							<th>연락처 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td><input type="tel" name="" id="mobile" value="${memberInfo.mobile }" required style="width: 110px;"></td>
							<th>추가연락처</th>
							<td><input type="tel" name="" id="phone" value="${memberInfo.phone }" required style="width: 110px;"></td>
						</tr>
						<tr>
							<th>우편번호 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3">
								<input type="text" name="" id="zipcode1" value="16200" required readonly style="width: 60px;">
								<button type="button" onclick="execDaumPostcode('zipcode1', 'address1');">검색</button>
							</td>
						</tr>
						<tr>
							<th>주소 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3"><input type="text" name="" id="address1" value="${memberInfo.roadAddress eq null ? memberInfo.address : memberInfo.roadAddress  }" required readonly style="width: 549px;"></td>
						</tr>
						<tr>
							<th>상세주소 <abbr class="essential" title="필수입력사항">*</abbr></th>
							<td colspan="3"><input type="text" name="" id="subAddress" value="${memberInfo.subAddress }" required style="width: 549px;"></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>
								<input type="radio" name="radio_01" value="S" id="radio_01" <c:if test="${memberInfo.calendar.name() == 'S'  }">checked</c:if>>
								<label for="radio_01">양력</label>
								<input type="radio" name="radio_01" value="L" id="radio_02" <c:if test="${memberInfo.calendar.name() == 'L'  }">checked</c:if>>
								<label for="radio_02">음력</label>
								<input type="text" name="birthDate" id="birth" class="datepick" value="${memberInfo.birthYear  }-${fn:substring(memberInfo.birth, 0, 2)}-${fn:substring(memberInfo.birth, 2, 4)}" style="width: 80px; margin-left: 9px;" readonly placeholder="<c:if test="${memberInfo.calendar.name() == 'S'  }">양력</c:if><c:if test="${memberInfo.calendar.name() == 'L'  }">음력</c:if>">
							</td>
							<th>축일</th>
							<td>
								<%-- <input type="radio" name="radio_11" value="" id="radio_11" <c:if test="${memberInfo.saintDateBn == 'b' or memberInfo.saintDateBn == '' or memberInfo.saintDateBn == null   }">checked</c:if>>
								<label for="radio_11">생일</label>
								<input type="radio" name="radio_11" value="" id="radio_12" <c:if test="${memberInfo.saintDateBn == 'n'  }">checked</c:if>>
								<label for="radio_12">축일</label> --%>
								<input type="text" name="" id="birth" class="datepick" style="width: 80px; margin-left: 9px;" readonly placeholder="축일">
							</td>
						</tr>
						<tr>
							<th>남긴말씀</th>
							<td colspan="3"><textarea rows="5" id="memo" cols="10">${memberInfo.memo }</textarea></td>
						</tr>
						<tr>
							<th>관리자메모</th>
							<td colspan="3"><textarea rows="5" id="recommid" cols="10">${memberInfo.recommid }</textarea></td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td colspan="3">
								<input type="password" id="password" name="password" value="" style="width: 180px;">
								<!-- 수정일 때 -->
								<span class="advice">변경 시에만 입력해 주세요.</span>
								<!--// 수정일 때 -->
							</td>
						</tr>
						<tr>
							<th>패스워드확인</th>
							<td colspan="3"><input type="password" name="passwordCheck" value="" style="width: 180px;"></td>
						</tr>
						<tr>
							<th>마지막구매일</th>
							<td>${memberInfo.lastSale }</td>
							<th>마지막로그인</th>
							<td>${memberInfo.lastLogin }</td>
						</tr>
					</tbody>
				</table>
				<div class="contentMenu popup">
					<input type="button" id="saveBtn" value="저장">
					<a href="" onclick="if(!confirm('삭제된 데이터는 복구할 수 없습니다. 삭제하시겠습니까?')){}" class="buttonType caution">삭제</a>
					<button type="button" onclick="window.self.close();">닫기</button>
				</div>
			</form>
		</div>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<script>
	$('body').css('min-width','980px');
</script>
<script type="module">
	import {get} from '/js/mngr/pages/member_management_list/popup_detail.js';
	get.init();
</script>
<jsp:include page="../../include/bottom.jsp" flush="false" />
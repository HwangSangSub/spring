<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeMypage";
    // sub banner tit
	String pagename = "mypage";
	String pagetxt = "후원회원신청";
	String navId = "070202";

	// ex
    // Boolean isLogin = false; 
    Boolean isLogin = true; 
    String userName = "이디";

	// //ex


    

%>


<jsp:include page="../../include/common.jsp" flush="false" >
    <jsp:param name="pagetype" value="<%=pagetype%>" />
	<jsp:param name="pagename" value="<%=pagename%>" />
	<jsp:param name="pagetxt" value="<%=pagetxt%>" />	
	<jsp:param name="navId" value="<%=navId%>" />
	<jsp:param name="cssBaseLinks" value="user/before/board" />	
    <jsp:param name="cssLinks" value="vendors/font-awesome/font-awesome.min" />	
	<jsp:param name="cssLinks" value="vendors/line-awesome/line-awesome.min" />	
	<jsp:param name="cssLinks" value="vendors/line-awesome/line-awesome-font-awesome.min" />	
</jsp:include>


<%-- ex, css file 연결할 시 아래와 같이 적은 후 common.jsp include에 삽입 --%>
<%-- 
<jsp:param name="cssLinks" value="vendors/font-awesome/font-awesome.min" />	
--%>



<div class="wrap wrap-<%=pagetype%>">	
	<jsp:include page="../../include/header.jsp" flush="false" >
		<jsp:param name="navId" value="<%=navId%>" />	
		<jsp:param name="pagename" value="<%=pagename%>" />	
		<jsp:param name="isLogin" value="<%=isLogin%>" />
		<jsp:param name="userName" value="<%=userName%>" />
	</jsp:include>
	<jsp:include page="../../include/modal.jsp" flush="false" >		
		<jsp:param name="isLogin" value="<%=isLogin%>" />
		<jsp:param name="userName" value="<%=userName%>" />
	</jsp:include>


    <section class="sub-sect sect-containers">
        <div class="layout">

			<div class="sub-containers">
				
				<section class="sub-sect sect-container sect-menus">
					<button type="button" class="btn btn-sub-menus">
						<img src="/images/user/common/my_left_btn.png" alt="게시판메뉴">
					</button>
					<div class="modal-wrap modal-sub-menus-wrap">
						<div class="modal modal-sub-menus">
							<div class="modal-top">
								<button type="button" class="btn btn-close">
									<img src="/images/user/common/top_close_white.png" alt="닫기">
								</button>
							</div>
							<div class="modal-main">
								<div class="sub-menus-tit">마이페이지</div>
                                
								<jsp:include page="../board/board_menu_list.jsp" flush="false" >
                                    <jsp:param name="isAccount" value="false" />	
                                    <jsp:param name="isGuide" value="false" />	
                                </jsp:include>
					
							</div>
							<div class="modal-bottom"></div>
						</div>
					</div>

				</section>
                <section class="sub-sect sect-container sect-views">
                    <div class="sub-views-tit"><%=pagetxt%></div>
                    <form>
                        <div class="sub-views mypage-views">
                            <div class="sub-view">

								<div class="bd">
									<div class="bdNormal-wrap">
										<div class="bdNormal bdNormalL">
											<ul class="bdNormal-list">
												<li class="bdNormal-li bdNormalL-li join">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<span class="txt">후원회원가입</span>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<label class="checkbox round">
																	<input type="checkbox" name="" id="" class="">
																	<span class="icon"></span>
																	<span class="txt">후원회원 가입을 원하시면 체크해주세요. 후원회비로 월 10,000원 이상 매달 납입하시면 20% 할인혜택을 드립니다. 후원회원 가입시 반드시 <b>CMS 이체할 계좌번호</b>를 기재하여 주세요.</span>
																</label>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li required">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<label for="form_name" class="txt">이름</label>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<label class="input-box">
																	<input type="text" id="form_name" required>
																</label>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<label for="form_christian" class="txt">세례명</label>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<label class="input-box">
																	<input type="text" id="form_christian">
																</label>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<label for="form_email" class="txt">이메일</label>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<div class="bdNormal-input-group">
																	<label class="input-box">
																		<input type="text" id="form_email">
																	</label>
																</div>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<label for="form_email" class="txt">전화번호</label>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<div class="bdNormal-input-group">
																	<label class="input-box">
																		<input type="text" id="form_email">
																	</label>
																</div>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<label for="form_email" class="txt">휴대전화</label>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<div class="bdNormal-input-group">
																	<label class="input-box">
																		<input type="text" id="form_email">
																	</label>
																</div>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li address">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<span class="txt">주소</span>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<div class="bdNormal-input-group">
																	<label for="" class="input-box postal-num">
																		<input type="text" name="" id="" placeholder="우편번호" required readonly>
																	</label>
																	<button type="button" class="btn width_110px btn-square-black btn-search-postal">
																		<span class="txt">우편번호검색</span>
																	</button>
																</div>
																<div class="bdNormal-input-group line-full">
																	<label for="" class="input-box address">
																		<input type="text" name="" id="" placeholder="주소" required>
																	</label>
																	<label for="" class="input-box address-detail">
																		<input type="text" name="" id="" placeholder="상세주소">
																	</label>
																</div>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li required">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<label for="form_donation" class="txt">정기후원금액</label>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<label class="input-box">
																	<input type="text" id="form_donation">
																</label>
																<span>원</span>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<span class="txt">축일</span>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli"> 
															<div class="bdNormal-inputs">
																<div class="bdNormal-input-group">
																	<label class="input-box">
																		<input type="text" class="width_60px txt-right" placeholder="월">
																	</label>
																	<label class="input-box">
																		<input type="text" class="width_60px txt-right" placeholder="일">
																	</label>
																</div>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li required">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<span class="txt">후원방법</span>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<label class="radio round">
																	<input type="radio" name="method" id="" class="" checked>
																	<span class="icon"></span>
																	<span class="txt">CMS</span>
																</label>
																<label class="radio round">
																	<input type="radio" name="method" id="" class="">
																	<span class="icon"></span>
																	<span class="txt">지로</span>
																</label>
																<label class="radio round">
																	<input type="radio" name="method" id="" class="">
																	<span class="icon"></span>
																	<span class="txt">이체</span>
																</label>
																<label class="radio round">
																	<input type="radio" name="method" id="" class="">
																	<span class="icon"></span>
																	<span class="txt">일시</span>
																</label>
																<label class="radio round">
																	<input type="radio" name="method" id="" class="">
																	<span class="icon"></span>
																	<span class="txt">기타</span>
																</label>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li required">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<span class="txt">기부금영수증</span>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<label class="radio round">
																	<input type="radio" name="receipt" id="" class="" checked>
																	<span class="icon"></span>
																	<span class="txt">사용</span>
																</label>
																<label class="radio round">
																	<input type="radio" name="receipt" id="" class="">
																	<span class="icon"></span>
																	<span class="txt">사용안함</span>
																</label>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li required">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<span class="txt">CMS계좌정보</span>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<div class="bdNormal-input-group-wrap">
																	<div class="bdNormal-input-group-tit">예금주성명</div>
																	<div class="bdNormal-input-group">
																		<label class="input-box">
																			<input type="text" id="">
																		</label>
																	</div>
																</div>
																<div class="bdNormal-input-group-wrap">
																	<div class="bdNormal-input-group-tit">주민등록번호 앞 6자리(YYMMDD)</div>
																	<div class="bdNormal-input-group">
																		<label class="input-box">
																			<input type="text" id="">
																		</label>
																	</div>
																</div>
																<div class="bdNormal-input-group-wrap">
																	<div class="bdNormal-input-group-tit">계좌번호</div>
																	<div class="bdNormal-input-group">
																		<label class="input-box">
																			<select name="" id="">
																				<option value="">신업은행</option>
																				<option value="">기업은행</option>
																			</select>
																		</label>
																	</div>
																</div>
																<div class="bdNormal-input-group-wrap">
																	<div class="bdNormal-input-group-tit">이체일자</div>
																	<div class="bdNormal-input-group">
																		<label class="radio round">
																			<input type="radio" name="transfer-date" id="" class="" checked>
																			<span class="icon"></span>
																			<span class="txt">10일</span>
																		</label>
																		<label class="radio round">
																			<input type="radio" name="transfer-date" id="" class="">
																			<span class="icon"></span>
																			<span class="txt">26일</span>
																		</label>
																	</div>
																</div>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li required consent-info">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<label for="form_check_coonsent" class="txt">개인정보 수집과 이용동의</label>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<div class="barlist-wrap">
																	<ul class="barlist">
																		<li>수집 및 이용목적 : CMS 출금이체를 통한 후원금 납부</li>
																		<li>수집항목 : 성명, 생년월일, 전화번호, 휴대전화번호, 금융기관명, 계좌번호</li>
																		<li>보유와 이용기간 : 수집, 이용 동의일로부터 CMS 출금이체 종료일(해지일)까지</li>
																		<li>신청자는 개인정보 수집과 이용을 거부할 권리가 있으며, 권리행사시 출금이체 신청이 거부될 수 있습니다.</li>
																	</ul>
																</div>
																<label class="checkbox round">
																	<input type="checkbox" name="receipt" id="form_check_coonsent" class="">
																	<span class="icon"></span>
																	<span class="txt">개인정보 수집과 이용에 동의합니다.</span>
																</label>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li required consent-info">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<label for="form_check_coonsent_third" class="txt"> 개인정보 제3자 제공동의</label>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<div class="barlist-wrap">
																	<ul class="barlist">
																		<li>개인정보를 제공받는 자 : 사단법인 금용결제원</li>
																		<li>개인정보를 제공받는자의 개인정보 이용 목적 : CMS 출금이체서비스 제공 및 출금동의 확인, 출금이체 신규등록과 해지 사실 통지</li>
																		<li>제공하는 개인정보의 항목 : 성명, 금융기관명, 계좌번호, 생년월일, 전화번호, 휴대전화번호</li>
																		<li>개인정보를 제공받는 자의 개인정보 보유와 이용기간 : CMS 출금이체 서비스 제공과 출금동의 확인 목적을 달성할 때까지</li>
																		<li>신청자는 개인정보에 대해 수납기관이 금융결제원에 제공하는 것을 거부할 권리가 있으며, 거부시 출금이체 신청이 거부될 수 있습니다.</li>
																	</ul>
																</div>
																<label class="checkbox round">
																	<input type="checkbox" name="receipt" id="form_check_coonsent_third" class="">
																	<span class="icon"></span>
																	<span class="txt">개인정보 수집과 이용에 동의합니다.</span>
																</label>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<label for="form_tell" class="txt">후원동기</label>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<label class="input-box">
																	<textarea name="" id="form_tell" class="width_100pe"></textarea>
																</label>
															</div>
														</li>
													</ul>
												</li>
											</ul>
										</div>
										<div class="bdNormal-btns-wrap">
											<div class="bdNormal-btns">
												<div class="bdNormal-btn-wrap">
													<button class="btn bdNormal-btn">취소</button>
												</div>
												<div class="bdNormal-btn-wrap">
													<button class="btn bdNormal-btn active">확인</button>
												</div>
											</div>
										</div>
									</div>
								</div>
                                
                            </div>
                        </div>
                    </form>
                </section>
			</div>

        </div>
    </section>
    

    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->

<script src="/js/user/common/board.js"></script>
<script src="/js/user/pages/mypage/mypage_common_form.js"></script>
<script src="/js/user/pages/mypage/mypage_info_modify_form_index.js"></script>


</body>
</html>
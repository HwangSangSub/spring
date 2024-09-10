<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeMypage";
    // sub banner tit
	String pagename = "mypage";
	String pagetxt = "회원정보수정 페이지";
	String navId = "07020102";

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
												<li class="bdNormal-li bdNormalL-li required">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<span class="txt">아이디</span>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<label class="input-box hide">
																	<input type="text" value="user id" readonly>
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
												<li class="bdNormal-li bdNormalL-li required">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<span class="txt">성별</span>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<label class="radio round">
																	<input type="radio" name="gender" id="" class="" checked>
																	<span class="icon"></span>
																	<span class="txt">남자</span>
																</label>
																<label class="radio round">
																	<input type="radio" name="gender" id="" class="">
																	<span class="icon"></span>
																	<span class="txt">여자</span>
																</label>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li required">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<span class="txt">생년월일</span>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<div class="bdNormal-input-group">
																	<label class="input-box">
																		<input type="text" class="width_60px txt-right" placeholder="xxxx 년" required>
																	</label>
																	<label class="input-box">
																		<input type="text" class="width_60px txt-right" placeholder="월" required>
																	</label>
																	<label class="input-box">
																		<input type="text" class="width_60px txt-right" placeholder="일" required>
																	</label>
																</div>
																<label class="radio round">
																	<input type="radio" name="calendar" id="" class="" checked>
																	<span class="icon"></span>
																	<span class="txt">양력</span>
																</label>
																<label class="radio round">
																	<input type="radio" name="calendar" id="" class="">
																	<span class="icon"></span>
																	<span class="txt">음력</span>
																</label>
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
																<label class="radio round">
																	<input type="radio" name="day_celebration" id="" class="" checked>
																	<span class="icon"></span>
																	<span class="txt">생일</span>
																</label>
																<label class="radio round">
																	<input type="radio" name="day_celebration" id="" class="">
																	<span class="icon"></span>
																	<span class="txt">축일</span>
																</label>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li required">
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
																	<button type="button" class="btn width_110px btn-square-black">메일 중복확인</button>
																</div>
																<label class="checkbox square">
																	<input type="checkbox" name="calendar" id="" class="">
																	<span class="icon"></span>
																	<span class="txt">정보메일수신</span>
																</label>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li required address">
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
															<label for="form_phone" class="txt">핸드폰</label>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<div class="bdNormal-input-group">
																	<label class="input-box">
																		<input type="text" id="form_phone" required>
																	</label>
																	<button type="button" class="btn width_110px btn-square-black">본인인증</button>
																</div>
																<label class="checkbox square">
																	<input type="checkbox" name="calendar" id="" class="">
																	<span class="icon"></span>
																	<span class="txt">문자서비스수신</span>
																</label>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li required">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<label for="form_tel" class="txt">전화번호</label>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<div class="bdNormal-input-group">
																	<label class="input-box">
																		<input type="text" id="form_tel" required>
																	</label>
																</div>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<label for="form_tell" class="txt">남기는 말씀</label>
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
													<a href="./pw" class="btn bdNormal-btn">취소</a>
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

<script src="/js/user/common/board.js"></script>
<script src="/js/user/pages/mypage/mypage_common_form.js"></script>
<script src="/js/user/pages/mypage/mypage_info_modify_form_index.js"></script>


</body>
</html>
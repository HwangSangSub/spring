<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeMypageInfoWithdrawal";
    // sub banner tit
	String pagename = "mypage";
	String pagetxt = "회원탈퇴";
	String navId = "070206";

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
									<div class="bdNormal-wrap mypage-form fm-wrap">
										<div class="bdNormal bdNormalL">
											<ul class="bdNormal-list">
												<li class="bdNormal-li bdNormalL-li required">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<label for="form_pw" class="txt">비밀번호</label>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<label class="input-box">
																	<input type="password" id="form_pw">
																</label>
															</div>
														</li>
													</ul>
												</li>
											</ul>
										</div>
									</div>
									<div class="bdNormal-wrap mypage-form fm-wrap">
                                        <h4 class="bdNormal-tit">무엇이 불편하셨나요?</h4>
                                        <div class="bdNormal bdNormalL">
                                            <ul class="bdNormal-list">
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="form_check_coonsent_third" class="txt">탈퇴사유</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <div class="bdNormal-inputs">
                                                                <div class="bdNormal-input-group-wrap">
                                                                    <div class="bdNormal-input-group line-full">
                                                                        <label class="checkbox round">
                                                                            <input type="checkbox" name="receipt" id="" class="">
                                                                            <span class="icon"></span>
                                                                            <span class="txt">고객서비스(상담,포장 등) 불만</span>
                                                                        </label>
                                                                        <label class="checkbox round">
                                                                            <input type="checkbox" name="receipt" id="" class="">
                                                                            <span class="icon"></span>
                                                                            <span class="txt">상품 가격 불만</span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="bdNormal-input-group-wrap">
                                                                    <div class="bdNormal-input-group line-full">                                                                    
                                                                        <label class="checkbox round">
                                                                            <input type="checkbox" name="receipt" id="" class="">
                                                                            <span class="icon"></span>
                                                                            <span class="txt">배송불만</span>
                                                                        </label>
                                                                        <label class="checkbox round">
                                                                            <input type="checkbox" name="receipt" id="" class="">
                                                                            <span class="icon"></span>
                                                                            <span class="txt">개인 정보유출 우려</span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="bdNormal-input-group-wrap">
                                                                    <div class="bdNormal-input-group line-full">
                                                                        <label class="checkbox round">
                                                                            <input type="checkbox" name="receipt" id="" class="">
                                                                            <span class="icon"></span>
                                                                            <span class="txt">교환/환불/반품 불만</span>
                                                                        </label>
                                                                        <label class="checkbox round">
                                                                            <input type="checkbox" name="receipt" id="" class="">
                                                                            <span class="icon"></span>
                                                                            <span class="txt">쇼핑몰의 신뢰도 불만</span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="bdNormal-input-group-wrap">
                                                                    <div class="bdNormal-input-group line-full">
                                                                        <label class="checkbox round">
                                                                            <input type="checkbox" name="receipt" id="" class="">
                                                                            <span class="icon"></span>
                                                                            <span class="txt">방문 빈도가 낮음</span>
                                                                        </label>
                                                                        <label class="checkbox round">
                                                                            <input type="checkbox" name="receipt" id="" class="">
                                                                            <span class="icon"></span>
                                                                            <span class="txt">쇼핑 기능 불만</span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="bdNormal-input-group-wrap">
                                                                    <div class="bdNormal-input-group-tit">고객님의 진심어린 충고 부탁드립니다.</div>
                                                                    <div class="bdNormal-input-group line-full">
                                                                        <label class="input-box">
                                                                            <textarea name="" id=""></textarea>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
										<div class="bdNormal-btns-wrap">
											<div class="bdNormal-btns">
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
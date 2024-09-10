<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeMypageInfoPw";
    // sub banner tit
	String pagename = "mypage";
	String pagetxt = "비밀번호 변경";
	String navId = "070205";

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
												<li class="bdNormal-li bdNormalL-li">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<label for="form_pw_current" class="txt">기존 비밀번호</label>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<label class="input-box">
																	<input type="password" id="form_pw_current">
																</label>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<label for="form_pw_change" class="txt">수정할 비밀번호</label>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<label class="input-box">
																	<input type="password" id="form_pw_change">
																</label>
															</div>
														</li>
													</ul>
												</li>
												<li class="bdNormal-li bdNormalL-li">
													<ul class="bdNormal-rowlist bdNormalL-rowlist">
														<li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
															<label for="form_pw_check" class="txt">수정할 비밀번호 확인</label>
														</li>
														<li class="bdNormal-rowli bdNormalL-rowli">
															<div class="bdNormal-inputs">
																<label class="input-box">
																	<input type="password" id="form_pw_check">
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
<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeMypageInfoInterlock";
    // sub banner tit
	String pagename = "mypage";
	String pagetxt = "후원회원 연동";
	String navId = "070203";

	// ex
    // Boolean isLogin = false; 
    Boolean isLogin = true; 
    String userName = "이디";
    String [] pageType = {"request", "received", "display"};
    String pageCurrent = "display";

	// //ex


    

%>

<script>
    const pageCurrent = "<%=pageCurrent%>";
</script>


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

                            <div class="sub-view interlock-view request">
                                <div class="interlock-img-wrap">
                                    <img src="/images/user/mypage/connect_title.png" class="interlock-img" alt="후원회원 연동신청">
                                </div>
                                <div class="interlock-tit">
                                    <h2>후원회원 <span>연동신청</span>을<br> 하시겠습니까?</h2>
                                </div>
                                <div class="interlock-cont">
                                    <p>후원회원 연동을 신청하시면 이디코리아의 할인혜택의 서비스를 제공받으실 수 있으며 보다 편리한 사용에 도움이 됩니다.</p>
                                </div>
                                <form id="frm" name="frm" method="post">
                                    <div class="interlock-btns">
                                        <div class="interlock-btn-wrap">
                                            <button type="submit" class="btn interlock-btn btn-request">신청하기</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="sub-view interlock-view received">
                                <div class="interlock-img-wrap">
                                    <img src="/images/user/mypage/connect_title2.png" class="interlock-img" alt="후원회원 연동신청 접수완료">
                                </div>
                                <div class="interlock-tit">
                                    <h2>후원회원 <span>연동신청</span>이<br> 접수되었습니다.</h2>
                                </div>
                                <div class="interlock-cont">
                                    <p>관리자의 승인이 필요한 절차이니 번거로우시겠지만 잠시만 기다려주십시오.</p>
                                    <p>접수처리가 되면 현재 페이지에서 후원회원님의 연동정보를 확인하실 수 있습니다.</p>
                                </div>
                            </div>

                            <div class="sub-view interlock-view display">
                                <div class="interlock-img-wrap">
                                    <img src="/images/user/mypage/connect_title3.png" class="interlock-img" alt="후원회원 연동신청 정보">
                                </div>
                                <div class="interlock-tit">
                                    <h2>후원회원 <span>연동정보는</span><br> 아래와 같습니다.</h2>
                                </div>
                                <div class="interlock-cont">
                                    <div class="interlock-list-wrap">
                                        <ul class="interlock-list">
                                            <li class="interlock-li">
                                                <dl>
                                                    <dt>후원회원번호</dt>
                                                    <dd></dd>
                                                </dl>
                                            </li>
                                            <li class="interlock-li">
                                                <dl>
                                                    <dt>후원회원이름</dt>
                                                    <dd></dd>
                                                </dl>
                                            </li>									
                                            <li class="interlock-li">
                                                <dl>
                                                    <dt>세례명</dt>
                                                    <dd></dd>
                                                </dl>
                                            </li>									
                                            <li class="interlock-li">
                                                <dl>
                                                    <dt>전화번호</dt>
                                                    <dd></dd>
                                                </dl>
                                            </li>									
                                            <li class="interlock-li">
                                                <dl>
                                                    <dt>핸드폰번호</dt>
                                                    <dd></dd>
                                                </dl>
                                            </li>									
                                            <li class="interlock-li">
                                                <dl>
                                                    <dt>주소</dt>
                                                    <dd></dd>
                                                </dl>
                                            </li>									
                                            <li class="interlock-li">
                                                <dl>
                                                    <dt>
                                                        <div class="popovers-wrap">
                                                            <button type="button" class="btn btn-popovers basket-result-btn-popovers">
                                                                <div class="icon"></div>
                                                                <div class="txt"></div>
                                                            </button>
                                                            <div class="popovers">
                                                                <div class="popovers-box">
                                                                    <button type="button" class="btn btn-close popovers-close"></button>
                                                                    <div class="popovers-main">
                                                                        <span class="txt">최근 6개월중 3번 이상 미납</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <p>미납내역</p>
                                                    </dt>
                                                    <dd>
                                                        <div>
                                                            <span class="idi_layer_click" id="">${data.isPay == true ? "없음": "미납" }</span>
                                                        </div>
                                                    </dd>
                                                </dl>
                                            </li>									
                                        </ul>
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
<script src="/js/user/pages/mypage/mypage_info_interlock_index.js"></script>
<!-- <script src="/js/user/pages/mypage/mypage_common_form.js"></script> -->
<!-- <script src="/js/user/pages/mypage/mypage_info_modify_form_index.js"></script> -->


</body>
</html>
<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeMypageActivityCoupon";
    // sub banner tit
	String pagename = "mypage";
	String pagetxt = "쿠폰내역";
	String navId = "070507";

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
    <jsp:param name="cssLinks" value="user/compile/pages/basketList/style" />		
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
                            
                                <div class="bdNormal-wrap basket-board">
                                    <div class="bdNormal-top">
                                        
                                    </div>
                                    <div class="bdNormal bdBasket">
                    
                                        <ul class="bdNormal-list">
                                            <%-- board head --%>
                                            <li class="bdNormal-li bdNormal-head bdBasket-head">
                                                <ul class="bdNormal-headlist bdBasket-headlist bdBasket-rowlist">
                                                    <li class="bdNormal-headli bdBasket-headli bdBasket-rowli col-else">
                                                        <span class="txt">쿠폰</span>
                                                    </li>
                                                    <li class="bdNormal-headli bdBasket-headli bdBasket-rowli col-period">
                                                        <span class="txt">사용가능기간</span>
                                                    </li>
                                                    <li class="bdNormal-headli bdBasket-headli bdBasket-rowli col-name">
                                                        <span class="txt">기능</span>
                                                    </li>
                                                    <li class="bdNormal-headli bdBasket-headli bdBasket-rowli col-else">
                                                        <span class="txt">사용여부</span>
                                                    </li>
                                                </ul>
                                            </li>
                    
                                            <li class="bdNormal-li bdBasket-li btn">
                                                <ul class="bdBasket-rowlist">
                                                    <li class="bdBasket-rowli col-else">
                                                        <span class="txt">생일쿠폰</span>
                                                    </li>
                                                    <li class="bdBasket-rowli col-period">
                                                        <span class="txt">2024.01.01 ~ 2024.12.31</span>
                                                    </li>
                                                    <li class="bdBasket-rowli col-name">
                                                        <div class="group flex-column">
                                                            <span class="txt">
                                                                1천원 이상일 때 10% 할인
                                                            </span>
                                                            <div class="pad">
                                                                <div class="else">
                                                                    <span class="unit">쿠폰 : </span>
                                                                    <span class="txt">생일쿠폰</span>
                                                                </div>
                                                            </div>
                                                            <div class="laptop">
                                                                <div class="period">
                                                                    <span class="unit">사용가능기간 : </span>
                                                                    <span class="txt">2024.01.01 ~ 2024.12.31</span>
                                                                </div>
                                                            </div>
                                                            <div class="pad">
                                                                <div class="name">
                                                                    <span class="unit">기능 : </span>
                                                                    <span class="txt">
                                                                        1천원 이상일 때 10% 할인
                                                                    </span>
                                                                </div> 
                                                            </div>
                                                            <div class="pad">
                                                                <div class="else">
                                                                    <span class="unit">사용여부 : </span>
                                                                    <span class="txt">사용안함</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="bdBasket-rowli col-else">
                                                        <span class="txt">사용안함</span>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>

                                </div>

                                <div class="box-border-wrap">
                                    <div class="box-border bold gray">
                                        <p>쿠폰은 사용가능기간 내 사용이 가능합니다.</p>
                                        <p>사용가능기간이 넘을 경우 사용불가으로 처리됩니다.</p>
                                        <p>사용불가 쿠폰은 사용할 수 없는 쿠폰을 말합니다.</p>
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

<script defer src="/js/user/common/board.js"></script>
<script src="/js/user/pages/mypage/mypage_common_list.js"></script>


</body>
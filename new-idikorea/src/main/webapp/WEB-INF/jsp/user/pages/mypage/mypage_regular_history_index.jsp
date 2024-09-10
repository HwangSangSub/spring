<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeMypageRegularHistory";
    // sub banner tit
	String pagename = "mypage";
	String pagetxt = "정기구매 내역조회";
	String navId = "070301";

	// ex
    // Boolean isLogin = false; 
    Boolean isLogin = true; 
    String userName = "이디";

	// //ex


    // 배송지 ex
    class Regular {
        String ordername;
        int date;
        int episode;
        
        Regular() {}
        Regular(String ordername, int date, int episode) {
            this.ordername = ordername;
            this.date = date;
            this.episode = episode;
        }
    }
    Regular[] regs = new Regular[3];

    regs[0] = new Regular("기본 주소", 15, 0);
    regs[1] = new Regular("1111", 12, 5);
    regs[2] = new Regular("2222", 19, 2);



    // //배송지 ex
    


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
                                
                                <div class="mypage-view-filter">
                                    <label class="input-box">
                                        <select name="" id="">
                                            <option value="all">전체</option>
                                            <option value="use">사용중</option>
                                            <option value="stop">중단</option>
                                        </select>
                                    </label>
                                </div>
                                <div class="bd">
                                    <!-- 게시판목록 -->
                                    <div class="bdNormal-wrap bd-wrap">
                                        <div class="bdNormal bdMypage">

                                            <ul class="bdNormal-list bdMypage-list">
                                                <%-- board head --%>
                                                <li class="bdNormal-li bdNormal-head">
                                                    <ul class="bdNormal-headlist bdMypage-headlist bdMypage-rowlist">
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-ordername">
                                                            <span class="txt">주문명</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-date">
                                                            <span class="txt">결제일</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-episode">
                                                            <span class="txt">회차</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-change">
                                                            <span class="txt">주문변경</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-more">
                                                            <span class="txt">자세히</span>
                                                        </li>
                                                    </ul>
                                                </li>

                                                <% for(Regular reg : regs) { %>
                                                <li class="bdNormal-li bdMypage-li">
                                                    <ul class="bdNormal-rowlist bdMypage-rowlist">
                                                        <li class="bdNormal-rowli bdMypage-rowli col-ordername">
                                                            <span class="txt"><%=reg.ordername%></span>
                                                            <div class="group flex-column">
                                                                <div class="laptop">
                                                                    <div class="dl ordername">
                                                                        <span class="unit">주문명 : </span>
                                                                        <span class="txt"><%=reg.ordername%></span>
                                                                    </div>
                                                                </div>
                                                                <div class="laptop">
                                                                    <div class="dl date">
                                                                        <span class="unit">결제일 : </span>
                                                                        <span class="txt c-red">매월 <b><%=reg.date%></b>일</span>
                                                                    </div>
                                                                </div>
                                                                <div class="laptop">
                                                                    <div class="dl episode">
                                                                        <span class="unit">회차 : </span>
                                                                        <span class="txt"><%=reg.episode%>회차</span>
                                                                    </div>
                                                                </div>
                                                                <div class="pad">
                                                                    <div class="dl change">
                                                                        <span class="unit">수정 : </span>
                                                                        <div class="btn-wrap">
                                                                            <button class="btn mypage-btn btn-order-change">주문변경</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="pad">
                                                                    <div class="dl more">
                                                                        <span class="unit">자세히 : </span>
                                                                        <div class="btn-wrap">
                                                                            <button type="button" class="btn mypage-btn btn-order-stop active">결제중단</button>
                                                                        </div>
                                                                        <div class="btn-wrap">
                                                                            <button type="button" class="btn mypage-btn btn-order-active">활성화</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-date">
                                                            <span class="txt">매월 <%=reg.date%>일</span>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-episode">
                                                            <span class="txt"><%=reg.episode%>회차</span>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-change">
                                                            <a href="/user/basket/order" class="btn mypage-btn btn-order-change">주문변경</a>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-more">
                                                            <button type="button" class="btn mypage-btn btn-order-stop active">결제중단</button>
                                                            <button type="button" class="btn mypage-btn btn-order-active">활성화</button>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <% 
                                                    } 
                                                %>
                                                <li class="bdNormal-li bdMypage-li empty">
                                                    <img src="/images/user/common/no_image.png" alt="no_image" class="icon">
                                                    <p class="txt">정기구매 신청건이 없습니다.</p>
                                                </li>
                                            </ul>

                                        </div>
                                    </div>
                                    <!-- //게시판목록 -->

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
<script src="/js/user/pages/mypage/mypage_regular_history_index.js"></script>


</body>
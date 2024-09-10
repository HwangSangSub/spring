<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeMypageInfoAdd";
    // sub banner tit
	String pagename = "mypage";
	String pagetxt = "배송지 관리";
	String navId = "070204";

	// ex
    // Boolean isLogin = false; 
    Boolean isLogin = true; 
    String userName = "이디";

	// //ex


    // 배송지 ex
    class Address {
        String nickname;
        String name;
        String tel;
        String phone;
        String post;
        String address;
        Boolean isBase;
        
        Address() {}
        Address(String nickname, String name, String tel, String phone, String post, String address) {
            this.nickname = nickname;
            this.name = name;
            this.tel = tel;
            this.phone = phone;
            this.post = post;
            this.address = address;
            this.isBase = false;
        }
    }
    Address[] adds = new Address[3];

    adds[0] = new Address("기본 주소", "이디코리아", "0312074983", "0312074983", "16200", "경기 수원시 장안구 이목동 23-5");
    adds[1] = new Address("1111", "이디", "0312074983", "0312074983", "16200", "경기 수원시 장안구 이목동 23-5");
    adds[1].isBase = true;
    adds[2] = new Address("2222", "코리아", "0312074983", "0312074983", "16200", "경기 수원시 장안구 이목동 23-5");



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
                                
                                <div class="mypage-view-btn">
                                    <button type="button" class="btn mypage-btn btn-add-address">배송지 등록하기</button>
                                </div>
                                <div class="bd">
                                    <!-- 게시판목록 -->
                                    <div class="bdNormal-wrap bd-wrap">
                                        <div class="bdNormal">

                                            <ul class="bdNormal-list">
                                                <%-- board head --%>
                                                <li class="bdNormal-li bdNormal-head">
                                                    <ul class="bdNormal-headlist bdMypage-headlist bdMypage-rowlist">
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-num">
                                                            <span class="txt">번호</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-nickname">
                                                            <span class="txt">배송지명</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-cont">
                                                            <span class="txt">상세</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-base">
                                                            <span class="txt">기본배송지</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-modify">
                                                            <span class="txt">수정</span>
                                                        </li>
                                                        <li class="bdNormal-headli bdMypage-headli bdMypage-rowli col-remove">
                                                            <span class="txt">삭제</span>
                                                        </li>
                                                    </ul>
                                                </li>

                                                <% int iAdd = 1; %>
                                                <% for(Address add : adds) { %>
                                                <li class="bdNormal-li bdMypage-li">
                                                    <ul class="bdNormal-rowlist bdMypage-rowlist">
                                                        <li class="bdNormal-rowli bdMypage-rowli col-num">
                                                            <span class="txt"><%=iAdd%></span>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-nickname">
                                                            <span class="txt"><%=add.nickname%></span>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-cont">
                                                            <div class="group flex-column">
                                                                <div class="dl name">
                                                                    <span class="unit">수령자 : </span>
                                                                    <span class="txt"><%=add.name%></span>
                                                                </div>
                                                                <div class="dl price">
                                                                    <span class="unit">주소 : </span>
                                                                    <span class="txt"><%=add.address%></span>
                                                                </div>
                                                                <div class="dl phone">
                                                                    <span class="unit">핸드폰번호 : </span>
                                                                    <span class="txt"><%=add.phone%></span>
                                                                </div>
                                                                <div class="dl tel">
                                                                    <span class="unit">전화번호 : </span>
                                                                    <span class="txt"><%=add.tel%></span>
                                                                </div>
                                                                <div class="laptop">
                                                                    <div class="dl post">
                                                                        <span class="unit">우편번호 : </span>
                                                                        <span class="txt"><%=add.post%></span>
                                                                    </div>
                                                                </div>
                                                                <div class="laptop">
                                                                    <div class="dl base">
                                                                        <span class="unit">기본배송지 : </span>
                                                                        <label class="checkbox square">
                                                                            <input type="checkbox" name="" id="" class="" <%if(add.isBase){%>checked<%}%> >
                                                                            <span class="icon"></span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="pad">
                                                                    <div class="dl btns">
                                                                        <div class="btn-wrap">
                                                                            <button type="button" class="btn mypage-btn btn-modify">수정</button>
                                                                        </div>
                                                                        <div class="bltn-wrap">
                                                                            <button type="button" class="btn mypage-btn btn-remove">삭제</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-base">
                                                            <label class="checkbox square">
                                                                <input type="checkbox" name="" id="" class="" <%if(add.isBase){%>checked<%}%> >
                                                                <span class="icon"></span>
                                                            </label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-modify">
                                                            <button type="button" class="btn mypage-btn btn-modify">수정</button>
                                                        </li>
                                                        <li class="bdNormal-rowli bdMypage-rowli col-remove">
                                                            <button type="button" class="btn mypage-btn btn-remove">삭제</button>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <% 
                                                        iAdd++;
                                                    } 
                                                %>
                                            </ul>

                                        </div>
                                    </div>
                                    <!-- //게시판목록 -->

                                    
                                    <!-- 새글 -->
                                    <div class="bdNormal-wrap mypage-form fm-wrap">
                                        <div class="bdNormal bdNormalL">
                                            <ul class="bdNormal-list">
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="form_nickname" class="txt">배송지명</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <div class="bdNormal-inputs">
                                                                <label class="input-box">
                                                                    <input type="text" id="form_nickname" placeholder="기본주소">
                                                                </label>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="form_recipient" class="txt">수령자</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <div class="bdNormal-inputs">
                                                                <div class="bdNormal-input-group">
                                                                    <label class="input-box">
                                                                        <input type="text" id="form_recipient">
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
                                                                        <input type="text" name="" id="" placeholder="주소" required readonly>
                                                                    </label>
                                                                    <label for="" class="input-box address-detail">
                                                                        <input type="text" name="" id="" placeholder="상세주소">
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="form_phone" class="txt">핸드폰번호</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <div class="bdNormal-inputs">
                                                                <div class="bdNormal-input-group">
                                                                    <label class="input-box">
                                                                        <input type="text" id="form_phone" required>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="form_tel" class="txt">전화번호</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <div class="bdNormal-inputs">
                                                                <div class="bdNormal-input-group">
                                                                    <label class="input-box">
                                                                        <input type="text" id="form_tel">
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="bdNormal-li bdNormalL-li consent-info">
                                                    <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                                        <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                                            <label for="form_check_coonsent" class="txt">기본 배송지</label>
                                                        </li>
                                                        <li class="bdNormal-rowli bdNormalL-rowli">
                                                            <div class="bdNormal-inputs">
                                                                <label class="checkbox square">
                                                                    <input type="checkbox" name="receipt" id="form_check_coonsent" class="">
                                                                    <span class="icon"></span>
                                                                    <span class="txt">기본 배송지로 설정합니다.</span>
                                                                </label>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="bdNormal-btns-wrap">
                                            <div class="bdNormal-btns">
                                                <div class="bdNormal-btn-wrap add-wrap">
                                                    <button class="btn bdNormal-btn active">등록</button>
                                                </div>
                                                <div class="bdNormal-btn-wrap modify-wrap">
                                                    <button class="btn bdNormal-btn active">수정</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- //새글 -->

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
<script src="/js/user/pages/mypage/mypage_info_address_index.js"></script>


</body>
</html>
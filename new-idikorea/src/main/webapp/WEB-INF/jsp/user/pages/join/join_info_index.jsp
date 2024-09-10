<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeJoinInfo";
    // sub banner tit
	String pagename = "site helper";
	String pagetxt = "회원가입";
	String navId = "000202";

	// ex
    // Boolean isLogin = false; 
    Boolean isLogin = true; 
    String userName = "이디";
    int hasFund = 912333;
    // Boolean isRegular = false; // 일반배송
    Boolean isRegular = Boolean.parseBoolean(request.getParameter("regular")); // 정기배송일 시

	// //ex



%>

<jsp:include page="../../include/common.jsp" flush="false" >
    <jsp:param name="pagetype" value="<%=pagetype%>" />
	<jsp:param name="pagename" value="<%=pagename%>" />
	<jsp:param name="pagetxt" value="<%=pagetxt%>" />	
	<jsp:param name="navId" value="<%=navId%>" />
    <jsp:param name="cssLinks" value="vendors/font-awesome/font-awesome.min" />	
	<jsp:param name="cssLinks" value="vendors/line-awesome/line-awesome-font-awesome.min" />	
	<jsp:param name="cssLinks" value="vendors/line-awesome/line-awesome.min" />	
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

    <section class="sub-sect sect-tit">
        <div class="layout">
            <div class="sub-tit-wrap">
                <h3 class="sub-views-tit"><%=pagetxt%></h3>
            </div>
            <div class="sub-tit-wrap">
                <span class="sub-views-subtit">회원가입 후 다양한 혜택을 누려보세요!</span>
            </div>
        </div>
    </section>


    <section class="join-sect sect-step">
        <div class="layout">
            <div class="join-step">
                <ol class="join-step-list">
                    <li class="join-step-li">
                        <div class="join-step-box">
                            <img src="/images/user/join/img_join_01_off.png" alt="">
                            <span>약관동의</span>
                        </div>
                    </li>
                    <li class="join-step-li">
                        <div class="join-step-box">
                            <img src="/images/user/join/img_join_02_on.png" alt="">
                            <span class="active">정보입력</span>
                        </div>
                    </li>
                    <li class="join-step-li">
                        <div class="join-step-box">
                            <img src="/images/user/join/img_join_03_off.png" alt="">
                            <span>가입완료</span>
                        </div>
                    </li>
                </ol>
            </div>
        </div>
    </section>
    

    <section class="join-sect sect-form">
        <div class="layout">

            <div class="bdNormal-wrap bdJoin-wrap">
                <div class="bdNormal bdJoin">

                    <div class="bdNormal-top">
                        <div class="bdNormal-tit">
                            <h4>개인회원정보</h4>
                        </div>
                    </div>

                    <ul class="bdNormal-list">

                        <li class="bdNormal-li bdNormalL-li required">
                            <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                    <label for="id" class="txt"> 아이디 </label>
                                </li>
                                <li class="bdNormal-rowli bdNormalL-rowli">
                                    <div class="bdNormal-inputs">
                                        <div class="input-box">
                                            <input type="text" name="" id="id" value="" required>
                                        </div>
                                        <div class="btn-wrap">
                                            <button type="button" class="btn btn-square-black btn-check-id">
                                                <span class="txt">아이디 중복체크</span>
                                            </button>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>

                        <li class="bdNormal-li bdNormalL-li required">
                            <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                    <label for="pw" class="txt"> 비밀번호 </label>
                                </li>
                                <li class="bdNormal-rowli bdNormalL-rowli">
                                    <div class="bdNormal-inputs">
                                        <div class="input-box full">
                                            <input type="password" name="" id="pw" value="" required>
                                        </div>
                                        <span class="full">영문(대소문자구분), 숫자, 특수문자를 혼용하여 4~20자를 입력해 주세요.</span>
                                    </div>
                                </li>
                            </ul>
                        </li>

                        <li class="bdNormal-li bdNormalL-li required">
                            <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                    <label for="pw-check" class="txt">비밀번호확인</label>
                                </li>
                                <li class="bdNormal-rowli bdNormalL-rowli">
                                    <div class="bdNormal-inputs">
                                        <div class="input-box full">
                                            <input type="password" name="" id="pw-check" value="" required>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>

                        <li class="bdNormal-li bdNormalL-li required">
                            <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                    <label for="name" class="txt"> 이름 </label>
                                </li>
                                <li class="bdNormal-rowli bdNormalL-rowli">
                                    <div class="bdNormal-inputs">
                                        <div class="input-box">
                                            <input type="text" name="" id="name" value="" required>
                                        </div>
                                        <div class="btn-wrap">
                                            <button type="button" class="btn btn-square-black">
                                                <span class="txt">본인인증</span>
                                            </button>
                                        </div>
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
                                        <div class="input-box full">
                                            <input type="text" name="" id="form_christian" value="" required>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>

                        <li class="bdNormal-li bdNormalL-li required">
                            <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                    <label for="" class="txt">성별</label>
                                </li>
                                <li class="bdNormal-rowli bdNormalL-rowli">
                                    <div class="bdNormal-inputs">
                                        <div class="bdNormal-input-group">
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
                                    </div>
                                </li>
                            </ul>
                        </li>

                        <li class="bdNormal-li bdNormalL-li required birthday">
                            <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                    <label for="" class="txt">생년월일</label>
                                </li>
                                <li class="bdNormal-rowli bdNormalL-rowli">
                                    <div class="bdNormal-inputs">
                                        <div class="bdNormal-input-group full">
                                            <label class="input-box">
                                                <input type="text" class="width_80px txt-right" placeholder="xxxx 년" required>
                                            </label>
                                            <label class="input-box">
                                                <input type="text" class="width_80px txt-right" placeholder="월" required>
                                            </label>
                                            <label class="input-box">
                                                <input type="text" class="width_80px txt-right" placeholder="일" required>
                                            </label>
                                        </div>
                                        <div class="bdNormal-input-group">
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
                                    </div>
                                </li>
                            </ul>
                        </li>

                        <li class="bdNormal-li bdNormalL-li required">
                            <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                    <label for="" class="txt">이메일</label>
                                </li>
                                <li class="bdNormal-rowli bdNormalL-rowli">
                                    <div class="bdNormal-inputs">
                                        <div class="bdNormal-input-group full">
                                            <label class="input-box">
                                                <input type="text" id="form_email">
                                            </label>
                                            <button type="button" class="btn width_110px btn-square-black">메일 중복확인</button>
                                        </div>
                                        <div class="checkbox-wrap">
                                            <label class="checkbox round">
                                                <input type="checkbox" name="" id="" class="">
                                                <span class="icon"></span>
                                                <span class="txt">정보메일수신</span>
                                            </label>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>

                        <li class="bdNormal-li bdNormalL-li required">
                            <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                    <span class="txt">주소</span>
                                </li>
                                <li class="bdNormal-rowli bdNormalL-rowli">
                                    <div class="bdNormal-inputs">
                                        <div class="bdNormal-input-group full">
                                            <label for="" class="input-box postal-num">
                                                <input type="text" name="" id="" placeholder="우편번호" required readonly>
                                            </label>
                                            <button type="button" class="btn width_110px btn-square-black btn-search-postal">
                                                <span class="txt">우편번호검색</span>
                                            </button>
                                        </div>
                                        <label for="" class="input-box full address">
                                            <input type="text" name="" id="" placeholder="주소" required>
                                        </label>
                                        <label for="" class="input-box full address-detail">
                                            <input type="text" name="" id="" placeholder="상세주소">
                                        </label>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="bdNormal-li bdNormalL-li required">
                            <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                    <span class="txt">핸드폰번호</span>
                                </li>
                                <li class="bdNormal-rowli bdNormalL-rowli">
                                    <div class="bdNormal-inputs">
                                        <div class="bdNormal-input-group full">
                                            <label class="input-box">
                                                <input type="text" id="form_phone" required>
                                            </label>
                                        </div>
                                        <div class="checkbox-wrap">
                                            <label class="checkbox round">
                                                <input type="checkbox" name="" id="" class="">
                                                <span class="icon"></span>
                                                <span class="txt">문자서비스수신</span>
                                            </label>
                                        </div>
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
                                        <label class="input-box full">
                                            <textarea name="" id="form_tell" class="width_100pe"></textarea>
                                        </label>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="bdNormal-li bdNormalL-li support">
                            <div class="bdNormal-inputs">
                                <div class="checkbox-wrap">
                                    <label class="checkbox round">
                                        <input type="checkbox" name="" id="" class="">
                                        <span class="icon"></span>
                                        <span class="txt">후원회원 가입을 원하시면 체크해주세요.</span>
                                    </label>
                                </div>
                            </div>
                        </li>

                    </ul>

                </div>
            </div>
            
        </div>
    </section>


    <section class="join-sect sect-btns">
        <div class="layout">
            <div class="join-btns">
                <div class="join-btn-wrap">
                    <button type="button" class="btn join-btn btn-rounding-black btn-next">확인</button>
                </div>
                <div class="join-btn-wrap">
                    <button type="button" class="btn join-btn btn-rounding-black btn-prev">취소</button>
                </div>
            </div>
        </div>
    </section>
    

    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<script defer src="/js/user/pages/join/join_info_index.js"></script>


</body>
</html>
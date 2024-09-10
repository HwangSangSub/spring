<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeJoinSearch";
    // sub banner tit
	String pagename = "site helper";
	String pagetxt = "아이디 / 비밀번호 찾기";
	String navId = "000204";

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
                <span class="sub-views-subtit">로그인 후 각종 혜택 및 정보를 제공받으실 수 있습니다.</span>
            </div>
        </div>
    </section>


    <section class="join-sect sect-tabs">
        <div class="layout">
			<ul class="sub-tabs-list">
				<li class="sub-tabs-li active">
					<div class="sub-tab">아이디 찾기</div>
				</li>
				<li class="sub-tabs-li">
					<div class="sub-tab">비밀번호 찾기</div>
				</li>
			</ul>
        </div>
    </section>
    

    <section class="join-sect sect-form">
        <div class="layout">

            <div class="bdNormal-wrap bdJoin-wrap">
                <div class="bdNormal bdJoin">
                    <ul class="bdNormal-list">

                        <li class="bdNormal-li bdNormalL-li required li-id">
                            <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                    <label for="id" class="txt"> 아이디 </label>
                                </li>
                                <li class="bdNormal-rowli bdNormalL-rowli">
                                    <div class="bdNormal-inputs">
                                        <div class="input-box full">
                                            <input type="text" name="" id="id" value="" placeholder="아이디를 입력해 주세요." required>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>

                        <li class="bdNormal-li bdNormalL-li required form-name">
                            <ul class="bdNormal-rowlist bdNormalL-rowlist">
                                <li class="bdNormal-rowli bdNormal-headli bdNormalL-rowli bdNormalL-headli">
                                    <label for="name" class="txt"> 이름 </label>
                                </li>
                                <li class="bdNormal-rowli bdNormalL-rowli">
                                    <div class="bdNormal-inputs">
                                        <div class="input-box full">
                                            <input type="text" name="" id="name" value="" placeholder="이름을 입력해 주세요." required>
                                        </div>
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
                                        <label class="input-box full">
                                            <input type="text" id="form_email" placeholder="이메일을 입력해 주세요.">
                                        </label>
                                    </div>
                                </li>
                            </ul>
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
                    <a href="/user/login" class="btn join-btn btn-rounding-black">확인</a>
                </div>
            </div>
        </div>
    </section>
    

    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<script defer src="/js/user/pages/join/join_search_index.js"></script>


</body>
</html>
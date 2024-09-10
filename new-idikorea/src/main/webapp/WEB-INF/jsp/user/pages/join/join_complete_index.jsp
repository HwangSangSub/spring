<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeJoinComplete";
    // sub banner tit
	String pagename = "site helper";
	String pagetxt = "회원가입";
	String navId = "000203";

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
                            <img src="/images/user/join/img_join_02_off.png" alt="">
                            <span>정보입력</span>
                        </div>
                    </li>
                    <li class="join-step-li">
                        <div class="join-step-box">
                            <img src="/images/user/join/img_join_03_on.png" alt="">
                            <span class="active">가입완료</span>
                        </div>
                    </li>
                </ol>
            </div>
        </div>
    </section>
    

    <section class="join-sect">
        <div class="layout">
            <div class="joincomplete">
                <p>회원 가입신청이 <strong>완료</strong>되었습니다!</p>
                <p>모든 회원가입절차가 완료되었습니다.<br />
                로그인 후 모든 서비스를 이용하실 수 있습니다.</p>
            </div>
        </div>
    </section>

    <section class="join-sect sect-btns">
        <div class="layout">
            <div class="join-btns">
                <div class="join-btn-wrap">
                    <a href="/user/login" class="btn join-btn btn-rounding-black">로그인</a>
                </div>
            </div>
        </div>
    </section>
    

    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<!-- <script defer src="/js/user/common/board.js"></script> -->

</body>
</html>
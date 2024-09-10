<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
	String pagetype = "typeLogin";
	String pagename = "site helper";
	String pagetxt = "로그인";
	String navId = "0004";

	// ex
    // Boolean isLogin = false; 
//     Boolean isLogin = true; 
    String userName = "이디";
    int hasFund = 912333;
	// //ex

%>

<jsp:include page="../../include/common.jsp" flush="false" >
    <jsp:param name="pagetype" value="<%=pagetype%>" />
	<jsp:param name="pagename" value="<%=pagename%>" />
	<jsp:param name="pagetxt" value="<%=pagetxt%>" />	
	<jsp:param name="navId" value="<%=navId%>" />
</jsp:include>


<%-- ex, css file 연결할 시 아래와 같이 적은 후 common.jsp include에 삽입 --%>
<%-- 
<jsp:param name="cssLinks" value="vendors/font-awesome/font-awesome.min" />	
--%>



<div class="wrap wrap-<%=pagetype%>">	
	<jsp:include page="../../include/header.jsp" flush="false" >
		<jsp:param name="navId" value="<%=navId%>" />	
		<jsp:param name="pagename" value="<%=pagename%>" />	
		<jsp:param name="isLogin" value="${isLogin }" />
		<jsp:param name="userName" value="<%=userName%>" />
	</jsp:include>
	<jsp:include page="../../include/modal.jsp" flush="false" >		
		<jsp:param name="isLogin" value="${isLogin }" />
		<jsp:param name="userName" value="<%=userName%>" />
	</jsp:include>


    <div class="login-sect sect-tit">
		<div class="layout">
			<div class="login-tit-wrap">
				<h3 class="login-tit">로그인하세요!</h3>
				<p>IDI에 오신것을 진심으로 환영합니다.</p>
				<p>로그인 후에 각종 혜택 및 정보를 제공받으실 수 있습니다.</p>
			</div>
		</div>
	</div>
    <div class="login-sect sect-form">
        <div class="layout">
			<div class="login-form">
				<form name="frm">
					<fieldset>
						<legend>회원정보입력</legend>
						
						<div class="login-input-box-wrap">
							<label class="input-box login-input-box">
								<input type="text" name="username" id="" placeholder="아이디" value="" class="">
							</label>
							<label class="input-box login-input-box">
								<input type="password" name="password" id="" placeholder="비밀번호" value="" class="">
							</label>
						</div>

						<div class="login-form-checkes">
							<label class="checkbox-wrap">
								<input type="checkbox" name="id_local_save2" id="id_local_save2" value="Y" class="check">
								<span class="checkbox-box round"></span>
								<span class="txt">아이디 저장</span>
							</label>
							<a href="/user/basket/detail" class="link">비회원 주문조회</a>
						</div>
						<div class="login-form-btns">
							<!-- <input type="button" value="로그인" class="login_btn inputLogin"> -->
							 <button type="button"  id="login" class="btn btn-rounding-black login-form-btn">로그인</button>
						</div>
						<div class="login-form-links">
							<a href="/user/join/search" id="" class="link login-form-link search-id search-pw">아이디 · 비밀번호 찾기</a>
							<!-- <span class="divLine"> -->
							<!-- <input type="button" value="회원가입" class="join_btn"></span> -->
							<a href="/usser/join/agree" id="" class="link login-form-link join">회원가입</a>
						</div>
				</form>
			</div>
		</div>
    </div>
    

    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<script src="/js/user/pages/basket/basket_order.js"></script>
<script type="module">
	import {get} from '/js/user/pages/login/login_index.js';
	get.init();
</script>

</body>
</html>
<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false">
	<jsp:param name="htmlType" value="login" />
</jsp:include>

<div class="adminLogin login_box idi">
	<h1>
		IDI
		<br />
		<span>idikorea.com</span>
	</h1>
	<div class="right_content">
		<form method="get" name="frm" action="/mngr/order/list/index">
			<fieldset>
				<legend>관리자 정보입력</legend>
				<div class="input_wrap">
					<span>
						<input type="text" name="username" autofocus="autofocus" placeholder="ADMIN ID" title="관리자 ID" required="required">
					</span>
					<span>
						<input type="password" name="password" placeholder="PASSWORD" title="패스워드" required="required">
					</span>
					<input type="button" id="login" value="LOGIN" class="login_btn inputLogin">
				</div>
			</fieldset>
		</form>
	</div>
</div>
<script>
document.getElementById("login").addEventListener("click",x=>{
	fetch("/api/v1/login",{
		method:"post",
		body:new FormData(document.getElementsByName('frm')[0]),
	}).then(resp=>resp.json())
	.then(x=>{
		alert("??")
		location.href="/mngr/order/list/index";
	})

})
</script>
<jsp:include page="../../include/bottom.jsp" flush="false" />
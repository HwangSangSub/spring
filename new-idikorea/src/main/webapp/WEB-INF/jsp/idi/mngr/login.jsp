<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ReDoc</title>
<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,700|Roboto:300,400,700" rel="stylesheet">

</head>
<body>
관리자 로그인
<form name="frm">
	<div>
	</div>
	<input name="username" placeholder="id">
	<input name="password" placeholder="password" type="password">
</form>
<button id="login" type="button" >로그인</button>
</body>
<script type="text/javascript">
document.getElementById("login").addEventListener("click",x=>{
	fetch("/api/v1/login",{
		method:"post",
		body:new FormData(document.getElementsByName('frm')[0]),
	}).then(resp=>resp.json())
	.then(x=>{
		console.log(x.code)
		//location.href="/mngr/main";
	})

})

</script>
</html>
<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>
<div id="payment-method">
<script>
const currentUrl = window.location.href;
const url = new URL(currentUrl);
const params = new URLSearchParams(url.search);
const code = params.get('code');
const ERROR_MESSAGE = params.get('ERROR_MESSAGE');
alert(code +":"+ ERROR_MESSAGE);

</script>
</div>


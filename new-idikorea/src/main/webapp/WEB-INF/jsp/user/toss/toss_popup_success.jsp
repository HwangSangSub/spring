<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>
<div id="payment-method">
결제를 성공하였습니다.
<script>
const currentUrl = window.location.href;
const url = new URL(currentUrl);
const params = new URLSearchParams(url.search);
const paramValue = params.get('orderId');

opener.location.href="/user/basket/complete?orderNo="+paramValue;
window.close();
</script>
</div>


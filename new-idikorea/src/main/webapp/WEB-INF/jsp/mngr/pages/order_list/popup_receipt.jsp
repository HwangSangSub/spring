<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>
<jsp:include page="../../include/common.jsp" flush="false" />
<div class="middleArea popup">
	<div class="pageContent">
		<div class="contentTitle">
			<h2>현금영수증발급</h2>
		</div>
		<jsp:include page="./common_receipt.jsp" flush="false" />
	</div><!--// pageContent -->
</div><!--// middleArea -->
<script>
	$('body').css('min-width','980px');
</script>
<jsp:include page="../../include/bottom.jsp" flush="false" />
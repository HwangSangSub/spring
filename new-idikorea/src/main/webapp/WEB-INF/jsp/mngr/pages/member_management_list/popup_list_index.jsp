<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>
<jsp:include page="../../include/common.jsp" flush="false" />
<div class="middleArea popup">
	<div class="pageContent">
		<div class="contentTitle">
			<h2>회원목록</h2>
		</div>
		<jsp:include page="./common_list_index.jsp" flush="false">
			<jsp:param name="pageType" value="popup" />
		</jsp:include>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<script>
	$('body').css('min-width','980px');
</script>
<jsp:include page="../../include/bottom.jsp" flush="false" />
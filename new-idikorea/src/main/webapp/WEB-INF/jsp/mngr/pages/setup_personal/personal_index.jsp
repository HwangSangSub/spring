<%@ page language = "java" contentType = "text/html; charset=utf-8" pageEncoding = "utf-8" %>

<jsp:include page="../../include/common.jsp" flush="false" />
<jsp:include page="../../include/toparea.jsp" flush="false">
	<jsp:param name="mainMenu" value="mainMenu_12" />
</jsp:include>

<div class="middleArea">

	<jsp:include page="../../include/sidemenu.jsp" flush="false">
		<jsp:param name="sideMenu" value="sideMenu_12" />
		<jsp:param name="depth_01" value="sideMenu_12_09" />
		<jsp:param name="depth_02" value="sideMenu_12_09_01" />
	</jsp:include>

	<div class="pageContent">
		<div class="contentTitle">
			<div class="currentPage">
				홈
				<i class="fa fa-angle-right" aria-hidden="true"></i> 환경설정
				<i class="fa fa-angle-right" aria-hidden="true"></i> 개인정보처리방침
			</div>
			<h2>개인정보처리방침</h2>
		</div>
		<button type="button" class="openerSideMenu">
			<i class="fa fa-chevron-left" aria-hidden="true"></i>
		</button>
		<div class="contentArea notitle">
		</div>
	</div><!--// pageContent -->
</div><!--// middleArea -->
<jsp:include page="../../include/bottom.jsp" flush="false" />
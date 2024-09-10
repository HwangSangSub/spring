<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeFaq";
    // sub banner tit
	String pagename = "Frequently Asked questions";
	String pagetxt = "자주하는 질문";
	String navId = "0401";

	// ex
    // Boolean isLogin = false; 
    Boolean isLogin = true; 
    String userName = "이디";
    int hasFund = 912333;
    // Boolean isRegular = false; // 일반배송
    Boolean isRegular = Boolean.parseBoolean(request.getParameter("regular")); // 정기배송일 시

	// //ex


    
	// 게시판 ex
	class Faq {
		String question;
		String writer;
		String cont;

		public Faq() {}
		public Faq(String question, String writer, String cont) {
			this.question = question;
			this.writer = writer;
			this.cont = cont;
		}


	}
	Faq[] faqs = new Faq[4];
	faqs[0] = new Faq("질문 1", "작성자", "내용1");
	faqs[1] = new Faq("질문 2", "작성자", "내용2");
	faqs[2] = new Faq("질문 3", "작성자", "<br>a<br><br><br><br>a<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>");
	faqs[3] = new Faq("질문 3", "작성자", "내용4");


	// //게시판 ex


%>


<jsp:include page="../../include/common.jsp" flush="false" >
    <jsp:param name="pagetype" value="<%=pagetype%>" />
	<jsp:param name="pagename" value="<%=pagename%>" />
	<jsp:param name="pagetxt" value="<%=pagetxt%>" />	
	<jsp:param name="navId" value="<%=navId%>" />
	<jsp:param name="cssBaseLinks" value="user/before/board" />	
    <jsp:param name="cssLinks" value="vendors/font-awesome/font-awesome.min" />	
	<jsp:param name="cssLinks" value="vendors/line-awesome/line-awesome.min" />	
	<jsp:param name="cssLinks" value="vendors/line-awesome/line-awesome-font-awesome.min" />	
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


    <section class="sub-sect sect-containers">
        <div class="layout">

			<div class="sub-containers">
				
				<section class="sub-sect sect-container sect-menus">
					<button type="button" class="btn btn-sub-menus">
						<img src="/images/user/common/my_left_btn.png" alt="게시판메뉴">
					</button>
					<div class="modal-wrap modal-sub-menus-wrap">
						<div class="modal modal-sub-menus">
							<div class="modal-top">
								<button type="button" class="btn btn-close">
									<img src="/images/user/common/top_close_white.png" alt="닫기">
								</button>
							</div>
							<div class="modal-main">
								<div class="sub-menus-tit">faq</div>
                                
								<jsp:include page="../board/board_menu_list.jsp" flush="false" >
                                    <jsp:param name="isAccount" value="true" />	
                                    <jsp:param name="isGuide" value="true" />	
                                </jsp:include>
					
							</div>
							<div class="modal-bottom"></div>
						</div>
					</div>

				</section>
				<section class="sub-sect sect-container sect-views">
					<div class="sub-views-tit"><%=pagetxt%></div>
					<div class="sub-views">

						<form>
							<div class="sub-view">
								<div class="board">
		
									<!-- 새글 -->
									<div class="boardForm sub-view-fm-wrap fm-wrap">
										<ul class="boardFieldset">   
											<li>       
												<label for="form_title">           
													<span title="필수입력항목">
														<i class="fa fa-check" aria-hidden="true"></i>
													</span> 제목       
												</label>       
												<input type="text" name="subject" value="" id="form_title" class="width_100pe" maxlength="100" required="" autofocus="">   
											</li>   
											<li>       
												<label for="form_name">           
													<span title="필수입력항목">
														<i class="fa fa-check" aria-hidden="true"></i>
													</span>           작성자       
												</label>       
												<input type="text" name="name" value="" id="form_name" class="width_125px" maxlength="20" required="">   
											</li> 
											<li>       
												<label for="form_content">           
													<span title="필수입력항목">
														<i class="fa fa-check" aria-hidden="true"></i>
													</span>
													내용       
												</label>       
												<textarea name="contents" id="form_content" rows="10" required=""></textarea>   
											</li>
										</ul>   
										<div class="boardMenu new_tab_boardMenu">       
											<ul class="clearFix">           
												<li>           
													<a href="./" class="active">저장</a>           
												</li>           
												<li>               
													<a href="javascript:void(0);" class="btn-bd-cancel">취소</a>           
												</li>       
											</ul>   
										</div>
									</div>
									<!-- 새글 -->
		
		
									<!-- 게시판목록 -->  
									<div class="boardList sub-view-bdQ-wrap bdQ-wrap">       
										<div class="boardSearch">           
											<select name="searchOption" title="검색 범주를 선택하세요.">               
												<option value="all">전체</option>               
												<option value="subject">제목</option>               
												<option value="name">작성자</option>               
												<option value="contents">내용</option>           
											</select>           
											<input type="text" name="searchKeyword" title="검색어를 입력하세요.">           
											<button type="button" id="search">검색</button>       
										</div>   
										<div class="boardPostInfo bdPostInfo">   
											<%
											int pageCurrent = 2;
											int pageLast = 4;
											%>      
											<span>총게시물 : <b><%=faqs.length%></b></span>       
											<span>페이지 : <%=pageCurrent%> / <%=pageLast%></span> 
										</div>
										<div class="boardFaq">
											<ul>
												<%for(Faq f: faqs){%>
												<li>
													<div class="question">
														<div class="postMark">
															<img src="/images/user/common/img_question.png" alt="질문">
														</div>
														<div class="cont">
															<%=f.question%> 
														</div>
													</div>
													<div class="answer">
														<div class="postMark">
															<img src="/images/user/common/img_answer.png" alt="질문">
														</div>
														<div class="cont">
															<%=f.cont%> 
														</div>
													</div>
												</li>
												<%}%>
												
                                                <li class="empty">
                                                    <img src="/images/user/common/no_image.png" alt="no_image" class="icon">
                                                    <p class="txt">게시물이 없습니다.</p>
                                                </li>
											</ul>
										</div>     

										<!-- paging -->
										<div class="boardPaging">   
											<ul class="clearFix">
											<%
												if(pageCurrent > 1) {
											%>
												<li class="pagingFirst">       
													<a href="./" class="paging" title="첫 페이지로 이동">           
														<i class="la la-angle-double-left"></i>       
													</a>   
												</li>     
											<%
												}
												if(pageCurrent - 1 >= 1 && pageCurrent < pageLast ) {
											%>
												<li class="pagingLast">       
													<a href="./" class="paging" title="이전 페이지 블록으로 이동">           
														<i class="la la-angle-left"></i>       
													</a>   
												</li>
											<%
												}
											%> 
											<%
												for(int i = 1; i <= pageLast; i++) {
													if(i == pageCurrent) {
											%>
												<li class="pagingCurrent"><strong><%=i%></strong>   </li>   												
											<%
													} else {
											%>
											<li><a href="./" class="paging" title="<%=i%> 페이지로 이동"><%=i%></a>   </li>   
											<%
													}
												}
											%>
											<%
												if(pageCurrent + 1 > 1 && pageCurrent < pageLast ) {
											%>
												<li class="pagingNext">       
													<a href="./" class="paging" title="다음 페이지로 이동">           
														<i class="la la-angle-right"></i>       
													</a>   
												</li>  
											<%
												}
												if(pageCurrent < pageLast) {
											%>  
												<li class="pagingLast">       
													<a href="./" class="paging" title="끝 페이지로 이동">           
														<i class="la la-angle-double-right"></i>       
													</a>   
												</li>  
											<%
												}
											%>  
											</ul>
										</div>
										<!-- //paging -->
		
										<% if(isLogin){ %>
										<div class="vNormal-btns detail-tabview-bd-btns">
											<a href="javascript:void(0);" class="btn btn-newbd vNormal-btn detail-tabview-bd-btn">새글</a>
										</div>
										<% } %>
									</div>
									<!-- //게시판목록 -->
									


								</div>
							</div>
						</form>
					</div>
				</section>
			</div>

        </div>
    </section>
    

    <jsp:include page="../../include/footer.jsp" flush="false" />
</div>

<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
 
<script src="/js/user/common/board.js"></script>
<script src="/js/user/pages/faq/faq_index.js"></script>


</body>
</html>
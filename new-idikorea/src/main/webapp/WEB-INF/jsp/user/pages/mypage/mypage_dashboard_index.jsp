<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>


<%
	request.setCharacterEncoding("UTF-8");
    // wrap css용
	String pagetype = "typeMypage";
    // sub banner tit
	String pagename = "mypage";
	String pagetxt = "마이페이지";
	String navId = "0701";

	// ex
    // Boolean isLogin = false; 
    Boolean isLogin = true; 
    String userName = "이디";
    int hasFund = 912333;
    // Boolean isRegular = false; // 일반배송
    Boolean isRegular = Boolean.parseBoolean(request.getParameter("regular")); // 정기배송일 시

	// //ex


    
	// 게시판 ex
	class Board {
		String tit;
		String attachment;
		String writer;
		String cont;
		String day;
		String hits;
		
		Boolean isNotice;
		Boolean isReply;
		Boolean isSecret;
		Boolean isNew;
		String startDate;
		String endDate;
		String coverImg;
		String attachmentImg;
		int countStar;
		String[] attachmentFile;


		public Board() {}
		public Board(String tit, String writer, String cont, String day, String hits) {
			this.tit = tit;
			this.writer = writer;
			this.cont = cont;
			this.day = day;
			this.hits = hits;
            
            this.isNotice = false;
            this.isReply = false;
            this.isSecret = false;
            this.isNew = false;
		}


	}
	Board[] boards = new Board[4];
	boards[0] = new Board("제목1", "작성자", "내용1", "날짜", "조회수");
	boards[0].attachment = "첨부파일";
	boards[0].isNew = true;
	boards[1] = new Board("제목2", "작성자", "내용2", "날짜", "조회수");
	boards[1].isNew = true;
	boards[2] = new Board("제목3", "작성자", "내용3", "날짜", "조회수");
	boards[2].isNew = true;
	boards[3] = new Board("제목4", "작성자", "내용4", "날짜", "조회수");
	boards[3].isNotice = false;
	boards[3].isReply = true;
	boards[3].isSecret = true;
	boards[3].isNew = true;

	
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
								<div class="sub-menus-tit">마이페이지</div>
                                
								<jsp:include page="../board/board_menu_list.jsp" flush="false" >
                                    <jsp:param name="isAccount" value="false" />	
                                    <jsp:param name="isGuide" value="false" />	
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

								<div class="bd">
									<div class="box-border bold gray">
										<ul class="dashboard-box-list">
											<li class="dashboard-box-li">
												<div class="dashboard-box-li-tit">
													<img src="/images/user/mypage/main1.png" alt="주문">
													<span>주문</span>
												</div>
												<div class="dashboard-box-li-cont">
													<span><strong class="num">63</strong>건</span>
												</div>
											</li>
											<li class="dashboard-box-li">
												<div class="dashboard-box-li-tit">
													<img src="/images/user/mypage/main2.png" alt="취소">
													<span>취소</span>
												</div>
												<div class="dashboard-box-li-cont">
													<span><strong class="num">30</strong>건</span>
												</div>
											</li>
											<li class="dashboard-box-li">
												<div class="dashboard-box-li-tit">
													<img src="/images/user/mypage/main3.png" alt="완료">
													<span>완료</span>
												</div>
												<div class="dashboard-box-li-cont">
													<span><strong class="num">0</strong>건</span>
												</div>
											</li>
										</ul>
									</div>
									<div class="bdNormal-wrap">
										<div class="bdNormal-top">
											<div class="bdNormal-tit">최근 주문 내역</div>
											<a href="/user/mypages/order/history" class="bdNormal-link-more">더보기 +</a>
										</div>
										<table id="itemTable">
											<thead>
												<tr><th class="table_hidden_1024_th" scope="col" width="130%">주문일자</th>
												<th scope="col" width="200%">제품명</th>
												<!-- <th scope="col" width="">수량</th> -->
												<th scope="col" width="100%">주문금액</th>
												<!-- <th>주문상태</th> -->
											</tr></thead>
											<tbody id="getOrderRecentList">
												<tr>
													<td class="table_hidden_1024_td">2024-08-23</td>	
													<td id="" class="textAlignLeft table_pc_td">		
														<span class="line_height_20">1&gt;IDI SOAGEN LATTE - 클렌징 밀크</span>		
														<div class="table_pc_list">			
															<ul>				
																<li class="table_block_1024_td">					
																	<span>주문일자 :</span> 
																	<strong>2024-08-23</strong>				
																</li>			
															</ul>		
														</div>	
													</td>
													<td>32,500</td>
												</tr>
											</tbody>
										</table>
									</div>

									<div class="bdNormal-wrap">
										<div class="bdNormal-top">
											<div class="bdNormal-tit">1:1 문의 내역</div>
											<a href="/user/mypages/activity/question" class="bdNormal-link-more">더보기 +</a>
										</div>
										
										<div class="bdNormal boardFaq">
											<ul class="bdNormal-list">

												<%-- board head --%>
												<li class="bdNormal-li bdNormal-head">
													<ul class="bdNormal-headlist bdNormal-rowlist">
														<li class="bdNormal-headli bdNormal-rowli col-tit">
															<span class="txt">제목</span>
														</li>
														<li class="bdNormal-headli bdNormal-rowli col-else">
															<span class="txt">등록일</span>
														</li>
														<li class="bdNormal-headli bdNormal-rowli col-else">
															<span class="txt">답변상태</span>
														</li>
													</ul>
												</li>
												
												<%for(Faq f: faqs){%>
												<li class="bdNormal-li">
													<div class="line">
														<ul class="bdNormal-rowlist">
															<li class="bdNormal-rowli col-tit">
																<span class="txt">제목</span>
															</li>
															<li class="bdNormal-rowli col-else">
																<span class="txt">2024-08-01</span>
															</li>
															<li class="bdNormal-rowli col-else">
																<span class="txt dashboard-qna-reply">답변상태</span>
															</li>
														</ul>
													</div>
													<div class="answer">
														<div class="box">
															<div class="postMark">
																<img src="/images/user/mypage/question.png" alt="질문">
															</div>
															<div class="cont">
																<%=f.question%> 
															</div>
														</div>
														<div class="box">
															<div class="postMark">
																<img src="/images/user/mypage/answer.png" alt="질문">
															</div>
															<div class="cont">
																<%=f.cont%> 
															</div>
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
									</div>

									
									<div class="bdNormal-wrap">
										<div class="v-wrap"> 
											<div class="viewInfo">       
												<input type="hidden" name="adminGoodsno" value="140">       
												<h6>처음 써보았는데</h6>       
												<ul class="clearFix">           
													<li>작성자 : 너부리</li>           
													<li>작성일 : 2019-09-21</li>         
													<li>최종수정일 : 2019-09-21</li>          
													<li>조회수 : 464</li>       
												</ul>       
												<!-- <a href="./" class="scrollList active">목록</a> -->   
											</div>   
											<div class="viewContent">
												향도 은은하고 좋았어요.<br>
												확실히 트러블도 다른 화장품 쓸 때 보다 거의 없었고요. <br>
												금세 다 써서 다시 주문하네요 ㅎㅎ 
		
												<div class="video-wrap">
													<iframe width="" height="" src="https://www.youtube.com/embed/aeoM5EpcZ0g" title="관리가 대세인 시대, 건강은 정관장으로 종합편, (60&quot;)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" class="video" allowfullscreen></iframe>
												</div>
											</div>  
											<div class="boardMenu">           
												<ul>               
													<li>                   
														<a href="javascript:void(0);" class="scrollList active btn-bd-list">목록</a>               
													</li>             
												</ul>       
											</div>
										</div>
										
										<div class="bd-wrap">
											<div class="bdNormal-top">
												<div class="bdNormal-tit">상품 문의 내역</div>
												<a href="/user/mypages/activity/qna" class="bdNormal-link-more">더보기 +</a>
											</div>
											
											<div class="boardTable">   
												<table>       
													<caption class="textAL">게시물목록</caption>       
													<thead>           
														<tr>               
															<th class="width_100px">번호</th>               
															<th>제목</th>               
															<th class="width_100px">첨부</th>               
															<th class="width_120px">작성자</th>               
															<th class="width_140px">작성일</th>               
															<th class="width_100px">조회수</th>           
														</tr>       
													</thead>       
													<tbody>       
														<%
															int k = boards.length;
															for(Board bdI : boards ) {
														%>
														<tr class="">           
															<td><%=k%></td>           
															<td>   
																<a href="javascript:void(0);" class="col-tit dashboard-btn-open-view" style="padding-left: 0px">
																	<% if(bdI.isReply) {%> 
																		<img src="/images/user/common/img_reply_idi.png" alt="답변" class="reply">
																	<% } %>
																	<% if(bdI.isNotice) {%> 
																		<span class="noticeIcon" title="공지사항"><i class="fa fa-volume-up" aria-hidden="true"></i></span>
																	<% } %>
																	<% if(bdI.isSecret) {%> 
																		<span class="lock"><i class="fa fa-unlock" aria-hidden="true"></i></i></span>
																	<% } %>
		
																	<span class="txt"><%=bdI.tit%></span>
																	
																	<% if(bdI.isNew) {%> 
																		<img src="/images/user/main/news_new.png" class="newContent" alt="새글">
																	<% } %>
																</a>           
																<div class="info">               
																	<span>작성자: <%=bdI.writer%></span>               
																	<span>작성일: <%=bdI.day%></span>               
																	<span>조회수: <%=bdI.hits%></span>           
																</div>           
															</td>          
															<td></td>          
															<td class="textCut"><%=bdI.writer%></td>          
															<td><%=bdI.day%></td>          
															<td><%=bdI.hits%></td>      
														</tr>
														<%
															k--;
															}
														%>       
														<tr>           
															<td>30</td>           
															<td>   
																<a href="javascript:void(0);" class="col-tit dashboard-btn-open-view" style="padding-left: 0px">
																	<span class="txt">[10&gt;CREMA VISO PELLE SECCA - 건성 수분크림(2024년 입고예정)] 촉촉함이 달라요^^ </span>          
																</a>           
																<div class="info">               
																	<span>작성자: 글라라 쭈양</span>               
																	<span>작성일: 2018-04-18</span>               
																	<span>조회수: 275</span>           
																</div>           
															</td>          
															<td>
																<span><i class="fa fa-file-text-o" aria-hidden="true"></i></span>
															</td>          
															<td class="textCut">글라라 쭈양</td>          
															<td>2018-04-18</td>          
															<td>275</td>      
														</tr> 
														<tr>
															<td colspan="6" class="no_txt">
																<img src="/images/user/common/no_image.png" alt="no_image">
																<p class="txt">게시물이 없습니다.</p>
															</td>
														</tr> 
													</tbody>
												</table>
											</div>  
										</div>
									</div>

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
<script src="/js/user/pages/mypage/mypage_common_form.js"></script>
<script src="/js/user/pages/mypage/mypage_dashboard_index.js"></script>


</body>
</html>
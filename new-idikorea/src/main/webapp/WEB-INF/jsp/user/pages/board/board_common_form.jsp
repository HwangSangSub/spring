<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>

<%

Boolean isReview = Boolean.parseBoolean(request.getParameter("isReview"));
Boolean isInquiries = Boolean.parseBoolean(request.getParameter("isInquiries"));
Boolean isEvent = Boolean.parseBoolean(request.getParameter("isEvent"));

Boolean isDate = Boolean.parseBoolean(request.getParameter("isDate"));
Boolean isCoverImg = Boolean.parseBoolean(request.getParameter("isCoverImg"));
Boolean isNotice = Boolean.parseBoolean(request.getParameter("isNotice"));
Boolean isReply = Boolean.parseBoolean(request.getParameter("isReply"));
Boolean isSecret = Boolean.parseBoolean(request.getParameter("isSecret"));
Boolean isYoutube = Boolean.parseBoolean(request.getParameter("isYoutube"));
Boolean isCountStar = Boolean.parseBoolean(request.getParameter("isCountStar"));
Boolean isPw = Boolean.parseBoolean(request.getParameter("isPw"));
Boolean isAttachmentFile = Boolean.parseBoolean(request.getParameter("isAttachmentFile"));

%>

<%
    if(isReview) {
        isDate = false;
        isCoverImg = false;
        isNotice = true;
        isReply = false;
        isSecret = true;
        isYoutube = false;
        isCountStar = true;
        isPw = true;
        isAttachmentFile = false;
    }
    if(isInquiries) {
        isDate = false;
        isCoverImg = false;
        isNotice = true;
        isReply = false;
        isSecret = true;
        isYoutube = false;
        isCountStar = false;
        isPw = true;
        isAttachmentFile = false;
    }
    if(isEvent) {
        isDate = true;
        isCoverImg = true;
        isNotice = false;
        isReply = false;
        isSecret = false;
        isYoutube = false;
        isCountStar = false;
        isPw = false;
        isAttachmentFile = true;
    }
%>


<div class="boardForm fm-wrap">
    <ul class="boardFieldset">   
        <li>       
            <label for="form_title">           
                <span title="필수입력항목">
                    <i class="la la-check" aria-hidden="true"></i>
                </span> 제목       
            </label>       
            <input type="text" name="subject" value="" id="form_title" class="width_100pe" maxlength="100" required="" autofocus="">   
        </li>   
        <li>       
            <label for="form_name">           
                <span title="필수입력항목">
                    <i class="la la-check" aria-hidden="true"></i>
                </span>           작성자       
            </label>       
            <input type="text" name="name" value="" id="form_name" class="width_125px" maxlength="20" required="">   
        </li>

        <% if(isDate) {%>
        <li>       
            <span class="label">           
                <span title="필수입력항목">
                    <i class="la la-check" aria-hidden="true"></i>
                </span>           기간 
            </span>       
            <div class="fm-plate-date-wrap">
                <input type="text" name="sEventDate" value="" id="" class="width_125px" maxlength="20" readonly required />
                <span>~</span>
                <input type="text" name="eEventDate" value="" id="" class="width_125px" maxlength="20" readonly required />  
            </div>
        </li>
        <% } %>

        
        <% if(isNotice) {%>
        <li class="line-secret">   
            <span class="label">       공지사항   </span>   
            <p class="guide">※  목록 상단에 고정되는 게시물로 설정합니다.</p>   
            <div>       
                <input type="checkbox" name="notice" value="1" id="notice" class="checkBox">
                <label for="notice" class="checkbox">공지사항으로 설정</label>   
            </div>
        </li>
        <% } %>

        <% if(isSecret) {%>
        <li class="line-secret">   
            <span class="label">       비밀글   </span>   
            <p class="guide">※ 게시물을 작성자 · 관리자만 볼 수 있게 설정합니다.</p>   
            <div>       
                <input type="checkbox" name="secret" value="1" id="secret" class="checkBox">
                <label for="secret" class="checkbox">비밀글로 설정</label>   
            </div>
        </li> 
        <% } %>

        <% if(isYoutube) {%>
        <li>       
            <span class="label">YouTube 영상링크</span>        
            <input type="text" name="subject" value="" id="form_title" class="width_100pe" maxlength="100" required="" autofocus="">   
        </li> 
        <% } %>

        <% if(isCoverImg) { %>
        <li class="attachFile">   
            <span class="label">           
                <span title="필수입력항목">
                    <i class="la la-check" aria-hidden="true"></i>
                </span> 커버이미지       
            </span>
            <div>       
                <input type="file" name="attachImage" title="첨부이미지">       
                <input type="text" title="첨부이미지" readonly="">       
                <button type="button" class="attachFile">파일첨부</button>       
                <button type="reset" class="attachFileReset">           
                    <i class="la la-close" aria-hidden="true"></i> 첨부삭제       
                </button>   
            </div>
        </li>
        <% } %>


        <li class="attachFile">   
            <span class="label">       본문첨부이미지   </span>  
            <div>       
                <input type="file" name="attachImage" title="첨부이미지">       
                <input type="text" title="첨부이미지" readonly="">       
                <button type="button" class="attachFile">파일첨부</button>       
                <button type="reset" class="attachFileReset">           
                    <i class="la la-close" aria-hidden="true"></i> 첨부삭제       
                </button>   
            </div>
        </li>

        <% if(isCountStar) { %>
        <li class="line-star">    
            <span class="label no_top">        평점    </span>    
            <div class="reviewScore radio_style">        
                <div>        
                    <input type="radio" name="reviewScoreValue" id="score5" value="5" checked="">        
                    <label for="score5"><span></span></label>        
                    <label for="score5">★★★★★</label>        
                    <input type="radio" name="reviewScoreValue" id="score4" value="4">        
                    <label for="score4"><span></span></label>        
                    <label for="score4">★★★★</label>        
                    <input type="radio" name="reviewScoreValue" id="score3" value="3">        
                    <label for="score3"><span></span></label>        
                    <label for="score3">★★★</label>        
                    <input type="radio" name="reviewScoreValue" id="score2" value="2">        
                    <label for="score2"><span></span></label>        
                    <label for="score2">★★</label>        
                    <input type="radio" name="reviewScoreValue" id="score1" value="1">        
                    <label for="score1"><span></span></label>        
                    <label for="score1">★</label>        
                    <div>    

                    </div>
                </div>
            </div>
        </li>  
        <% } %>
        
        <li>       
            <label for="form_content">           
                <span title="필수입력항목">
                    <i class="la la-check" aria-hidden="true"></i>
                </span>
                내용       
            </label>       
            <textarea name="contents" id="form_content" rows="10" required=""></textarea>   
        </li>
        
        
        <% if(isAttachmentFile) { %>
        <li class="attachFile">   
            <span class="label">       첨부파일   </span>  
            <div>       
                <input type="file" name="attachImage" title="첨부이미지">       
                <input type="text" title="첨부이미지" readonly="">       
                <button type="button" class="attachFile">파일첨부</button>       
                <button type="reset" class="attachFileReset">           
                    <i class="la la-close" aria-hidden="true"></i> 첨부삭제       
                </button>   
            </div>
            <div>       
                <input type="file" name="attachImage" title="첨부이미지">       
                <input type="text" title="첨부이미지" readonly="">       
                <button type="button" class="attachFile">파일첨부</button>       
                <button type="reset" class="attachFileReset">           
                    <i class="la la-close" aria-hidden="true"></i> 첨부삭제       
                </button>   
            </div>
        </li>
        <% } %>
        
        <% if(isPw) { %>
        <li>   
            <label for="form_password">       
                <span title="필수입력항목">
                    <i class="la la-check" aria-hidden="true"></i>
                </span>       비밀번호   
            </label>   
            <p class="guide">※ 게시물 수정 · 삭제, 비밀글 답변 확인에 사용될 4자리 비밀번호를 입력하세요.</p>   
            <input type="password" name="password" id="form_password" class="width_125px" maxlength="4" required="">
        </li>
        <% } %>
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

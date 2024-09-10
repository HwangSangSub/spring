import {get} from '/js/mngr/pages/order_list/list_index.js';
export const paging={
	pagingFirst : `<li class="pagingFirst ">
						<a href="#" title="첫 페이지로 이동">
							<i class="fa fa-chevron-left" aria-hidden="true"></i>
						</a>
					</li>`,	
	pagingBlockPrev : `<li class="pagingBlockPrev ">  
							<a href="#" title="이전 페이지 블록으로 이동">
								<i class="fa fa-angle-double-left" aria-hidden="true"></i>
							</a>
						</li>`,				
	pagingPrev : `<li class="pagingPrev ">
						<a href="#" title="이전 페이지로 이동">
							<i class="fa fa-angle-left" aria-hidden="true"></i>
						</a>
					</li>`,
	pagingNext : `<li class="pagingNext ">
						<a href="#" title="다음 페이지로 이동">
							<i class="fa fa-angle-right" aria-hidden="true"></i>
						</a>
					</li>`,
	pagingBlockNext : `<li class="pagingBlockNext ">
							<a href="#" title="다음 페이지 블록으로 이동">
								<i class="fa fa-angle-double-right" aria-hidden="true"></i>
							</a>
						</li>`,
	pagingLast : `<li class="pagingLast ">
						<a href="#" title="끝 페이지로 이동">
							<i class="fa fa-chevron-right" aria-hidden="true"></i>
						</a>
					</li>`,
	activeBtnStart : `<li><strong>`,				
	activeBtnEnd : `</strong></li>`,	
	disabledBtnStart : `<li class="pageBtn"><a href="#">`,			
	disabledBtnEnd : `</a></li>`,			
	pageNum : 1,
	totalPage : 1,
	startNum : 1,
	setTotalPage : function(totlaPage){
		this.totalPage = totlaPage;
	},
	setPageNum : function(pageNum){
		this.pageNum = pageNum;
	},
	setStartNum : function(startNum){
		this.startNum = startNum;
	},
	setPaging : function(obj){
		this.setTotalPage(obj.totalPage);
		this.setPageNum(obj.pageNum);
		this.setStartNum(obj.startPage);		
	},
	init:function(){
		console.log(this.totalPage);
		this.getPagingList();


	},
	clickBtn:function(event){
		if(event.target.closest('.pagingFirst')){
			this.pageNum=1;
			//this.getPagingList();
			return true;
		}else if(event.target.closest('.pagingBlockPrev')){
			this.pageNum= this.pageNum%5==0? ((Math.floor(this.pageNum/5)-1)*5) : (Math.floor(this.pageNum/5)*5);
			//this.getPagingList();
			return true;
		}else if(event.target.closest('.pagingPrev')){
			this.pageNum--;
			//this.getPagingList();
			return true;
		}else if(event.target.closest('.pagingNext')){
			this.pageNum++;
			//this.getPagingList();
			return true;
		}else if(event.target.closest('.pagingBlockNext')){
			this.pageNum=this.pageNum%5==0?this.pageNum+1: (Math.floor(this.pageNum/5)*5)+6;
			//this.getPagingList();
			return true;
		}else if(event.target.closest('.pagingLast')){
			this.pageNum=this.totalPage;
			//this.getPagingList();
			return true;
		}else if(event.target.closest('.pageBtn')){
			this.pageNum=event.target.closest('li').querySelector('a').innerHTML*1
			//this.getPagingList();
			return true;
		}
		console.log(this.pageNum);
	},
	getPagingList:function(){
		let HTML='';
		if(this.pageNum>1){
			HTML+=this.pagingFirst;
			if(this.pageNum>5){
				HTML+=this.pagingBlockPrev;
			}
			HTML+=this.pagingPrev;	
		}
		let startNum =this.pageNum%5==0? ((Math.floor(this.pageNum/5)-1)*5)+1 : (Math.floor(this.pageNum/5)*5)+1 ; 
		let endNum = this.pageNum%5==0 ? this.pageNum : (Math.floor(this.pageNum/5)*5)+5;
		for(let i=startNum ; i<=endNum ; i++){
			if(this.pageNum == i&&i<=this.totalPage){
				HTML+=this.activeBtnStart+i+this.activeBtnEnd;
			}else if(this.pageNum != i&&i<=this.totalPage){
				HTML+=this.disabledBtnStart+i+this.disabledBtnEnd;
			}
		}
		if(this.pageNum<this.totalPage){
			HTML+=this.pagingNext;
			//10 일떄 1 페이지 
			// 9일때 1페이지,,
			if( this.pageNum <= (this.totalPage%5==0? ((Math.floor(this.totalPage/5)-1)*5) : (Math.floor(this.totalPage/5)*5))){
				HTML+=this.pagingBlockNext;
			}
			HTML+=this.pagingLast;
		}
		document.getElementsByClassName('boardPaging')[0].querySelector('ul').innerHTML = HTML;
		
		//리스트불러오는부분 여기만 해당함수 맞춰주면됨,, ㅇㅇ;
		//get.searchBtn(get.getParam());
	}	
	
}
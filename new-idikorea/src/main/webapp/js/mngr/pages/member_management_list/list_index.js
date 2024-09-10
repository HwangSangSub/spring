import {paging} from '/js/util/paging/paging.js';
export const get={
	obj : null,
	init:function(){
		console.log("=====");
		console.log(window.pageType);
		this.searchBtn();
		document.addEventListener('click',event=>{
			if(event.target.id=="searchBtn"){
				this.getParam().pageNum=1;
				this.searchBtn(this.obj);
			}else if(event.target.name=="selectMember"){
				this.popupGetMember(event.target.closest('tr').getAttribute('data-id'));
			}
		})
		
		
	},
	popupGetMember : function(memberNo){
		fetch('/api/v1/mngr/member/'+memberNo)
		.then(resp=>resp.json())
		.then(data=>{
			opener.window.get.writeMember(data);
			window.close();
		})
		
	},
	getParam : function(){
		let obj ={};
		if(!location.href.includes('popup')){
			obj={
				pageNum : paging.pageNum,
				itemSize :   document.querySelector('input[name="list_num"]:checked').value,
				sumPriceCheck : document.getElementById('sumPriceCheck').checked,
				searchOption : document.querySelector('[name="searchOption"]').value,
				searchValue : document.querySelector('[name="searchValue"]').value,
				groupOption : document.querySelector('[name="groupOption"]').value,
				birthType : document.querySelector('[name="birthType"]').value,
				genderType : document.querySelector('input[name="gender"]:checked').value,
			}
		}else{
			obj={
				pageNum : paging.pageNum,
				//itemSize :   document.querySelector('input[name="list_num"]:checked').value,
				//sumPriceCheck : document.getElementById('sumPriceCheck').checked,
				searchOption : document.querySelector('[name="searchOption"]').value,
				searchValue : document.querySelector('[name="searchValue"]').value,
				groupOption : document.querySelector('[name="groupOption"]').value,
				//birthType : document.querySelector('[name="birthType"]').value,
				//genderType : document.querySelector('input[name="gender"]:checked').value,
			}			
		}
		
		let saveEmoney = [...document.querySelectorAll('input[name="saveEmoney"]')].map(element => element.value).filter(x=> x!=="");
		let buyMoney = [...document.querySelectorAll('input[name="buyMoney"]')].map(element => element.value).filter(x=> x!=="");
		let orderDate =[...document.querySelectorAll('.orderDate')].map(element => element.value).filter(x=> x!=="");
		let birthDate = [...document.querySelectorAll('input[name="birthDate"]')].map(element => element.value).filter(x=> x!=="");
		if(orderDate.length != 0 )
			obj.orderDate = orderDate;
		if(birthDate.length != 0 )
			obj.birthDate = birthDate;	
		if(saveEmoney.length != 0 )
			obj.saveEmoney = saveEmoney;
		if(buyMoney.length != 0 )
			obj.buyMoney = buyMoney;
		this.obj=obj;
		return obj;
				
	},
	searchBtn : function(obj){
		console.log("???")
		let url=null;
		if(obj!=null){
			url="/api/v1/mngr/member?"+(new URLSearchParams(obj));
		}else{
			let today = new Date();
     	    let date = today.getFullYear() + '-' + (today.getMonth() + 1).toString().padStart(2, '0') + '-' + today.getDate().toString().padStart(2, '0');
			obj={
				startTime : date,
				endTime : date,
			}
			url="/api/v1/mngr/member?"+(new URLSearchParams(this.getParam()));
		}
		fetch(url)
		.then(resp=>resp.json())
		.then(data=>{
			//let className=this.getList(data.content);
			//this.getStatusCount(obj);
			console.log(data)
			paging.setPaging(data);
			paging.init();
			let countHTML = `
				<span>총게시물 : ${data.totalCount}</span>
				<span>페이지 : ${data.pageNum} / ${data.totalPage}</span>
			`;
			document.getElementsByClassName('boardPostInfo')[0].innerHTML=countHTML;
			this.getList(data.content);
		})
	},
	getList : function(list){
		let HTML ='';
		let title ='';
		
		if(window.pageType!="popup" && this.obj !=null && this.obj.sumPriceCheck==true&& document.getElementById('title').querySelectorAll('th').length==13){
			document.getElementById('titleEmoney').insertAdjacentHTML('afterend', '<th id="sumPrice"><div class="textCut">총구매금액</div></th>');
			document.getElementById('emoneyCol').insertAdjacentHTML('afterend', '<col id="sumCol" style="width: 96px;">');
		}else if(window.pageType!="popup" && this.obj !=null && this.obj.sumPriceCheck==false&&document.getElementById('sumPrice')!=null){
			document.getElementById('sumPrice').remove();
			document.getElementById('sumCol').remove();
		}
		console.log(this.obj)
		for(let obj of list){
			HTML +=`
					<tr data-id="${obj.memberNo}" class="${obj.groupName=='후원회원'?'idi_connect':''}">`;
			if(window.pageType!="popup"){
				HTML +=`	
						<td><div class="textCut"><input type="checkbox" name="" class="member_check" value=""></div></td>
						`;
			}		
			HTML +=`	<td><div class="textCut">${obj.memberNo}</div></td>
						<td><div class="textCut">${obj.memberName} ${ (obj.christianName==null||obj.christianName=='')?'':' ( ' + obj.christianName+' )'}</div></td>
						<td><div class="textCut">${obj.memberId}</div></td>`;
			if(window.pageType!="popup"){			
			HTML+=`
				<td><div class="textCut">${!(obj.birthYear!=null && obj.birthYear!="")?"": obj.calendar=="S"? "양력":"음력"} ${!(obj.birthYear!=null && obj.birthYear!="")?"":obj.birthYear+"-"+obj.birth}</div></td>`;
			}					
			HTML+=`	
						<td><div class="textCut">${obj.gender=="W"?"여":"남"}</div></td>
						<td><div class="textCut">${obj.groupName}</div></td>`;
			if(window.pageType!="popup"){
				HTML+=`	<td>
							<div class="textCut">
								<button type="button" onclick="openWindow('/mngr/member/management/list/popup/detail/${obj.memberId}', 'member_management_list_popup_detail', 1000, 840);">보기</button>
							</div>
						</td>
						<td>
							<div class="textCut">
								<button type="button">보기</button>
							</div>
						</td>
						<td>
							<div class="textCut">
								<button type="button">보기</button>
							</div>
						</td>`;
				
			}			
			HTML+=`
						<td><div class="textCut textAR">${obj.emoney==null?0:new Intl.NumberFormat('en-US').format(obj.emoney)}</div></td>`;
			if(this.obj!=null && this.obj.sumPriceCheck==true)
						HTML+=`<td><div class="textCut textAR">${obj.totalBuyPrice==null?0:new Intl.NumberFormat('en-US').format(obj.totalBuyPrice)}</div></td>`;
			if(window.pageType!="popup"){
				HTML+=`
				<td><div class="textCut">${obj.createTime==null?'':obj.createTime}</div></td>
				<td><div class="textCut">${obj.lastSale==null?'':obj.lastSale}</div></td>`;
			}		
			if(window.pageType=="popup"){
				HTML+=`
						<td>
							<div class="textCut">
								<button name="selectMember" type="button">선택</button>
							</div>
						</td>`;
			}			
			HTML+=`
					</tr>
		
					<tr>`;
			
		
		}
		if(window.pageType!="popup"&&list.length==0){	
			console.log("!!")		
		HTML+=`
					<td colspan="14">등록된 게시물이 없습니다.</td>
				</tr>`;
		}else if(window.pageType=="popup"&&list.length==0){			
			console.log("!2")		
		HTML+=`
					<td colspan="9">등록된 게시물이 없습니다.</td>
				</tr>`;
		}

		document.querySelector('#memberContent').innerHTML=HTML;
		//return className;
		
	}
}
import {paging} from '/js/util/paging/paging.js';
export const get={
	obj : null,
	init:function(){
		this.searchBtn();
		//this.getStatusCount(this.getParam());
		document.addEventListener('click',event=>{
			if(event.target.id=="searchBtn"||event.target.classList.contains('tab')){
				this.getParam().pageNum=1;
				this.searchBtn(this.obj);
			}
		})
		
		
	},
	getParam : function(){
		let obj={
			pageNum : paging.pageNum,
			itemSize : document.querySelector('input[name="list_num"]:checked').value,
			//paymentType : ,
			settleKind : document.querySelector('input[name="orderMethod"]:checked').value,
			cashReceipt : document.querySelector('input[name="cashReceipt"]:checked').value,
			orderType : document.querySelector('input[name="orderType"]:checked').value,
			startTime : document.getElementById("startTime").value,
			endTime : document.getElementById("endTime").value,
			dateType : '주문일',
			orderSearchOption : document.getElementsByName('orderSearchOption')[0].value,
			orderSearchValue : document.getElementsByName('orderSearchValue')[0].value,
			productSearchOption : document.getElementsByName('productSearchOption')[0].value,
			productSearchValue : document.getElementsByName('productSearchValue')[0].value,
			status : document.getElementsByClassName('tabmenu')[0].querySelector('.active').value,			
		}
		this.obj=obj;
		return obj;
				
	},
	searchBtn : function(obj){
		let url=null;
		loading.open();
		if(obj!=undefined){
			console.log(this.obj)
			url="/api/v1/mngr/order?"+(new URLSearchParams(this.obj));
		}else{
			let today = new Date();
     	    let date = today.getFullYear() + '-' + (today.getMonth() + 1).toString().padStart(2, '0') + '-' + today.getDate().toString().padStart(2, '0');
			obj={
				startTime : date,
				endTime : date,
			}
			url="/api/v1/mngr/order?"+(new URLSearchParams(this.getParam()));
		}
		fetch(url)
		.then(resp=>resp.json())
		.then(data=>{
			console.log(data)
			let className=this.getList(data.content);
			this.getStatusCount(this.getParam());
			paging.setPaging(data);
			paging.init();
		})
	},
	getStatusCount : function(obj){
		let url=null;
		if(obj!=null){
			url="/api/v1/mngr/order/status?"+(new URLSearchParams(obj));
		}else{
			let today = new Date();
     	    let date = today.getFullYear() + '-' + (today.getMonth() + 1).toString().padStart(2, '0') + '-' + today.getDate().toString().padStart(2, '0');
			obj={
				startTime : date,
				endTime : date,
			}
			url="/api/v1/mngr/order/status?"+(new URLSearchParams(obj));
		}
		fetch(url)
		.then(resp=>resp.json())
		.then(list=>{
			for(let tag of document.querySelectorAll('.tab.event')){
				tag.innerHTML = tag.innerHTML.split('(')[0]+'( 0 )';
			}
			if(list.length==0){
			}
			for(let status of list){
				if(document.querySelector('.tabmenu').querySelector('[value="'+status.status+'"]')!=null){
					document.querySelector('.tabmenu').querySelector('[value="'+status.status+'"]').innerHTML = status.status + "("+new Intl.NumberFormat('en-US').format(status.statusCount)+")";
				}
			}
			loading.close();
		})
	},
	getList : function(list){
		
		let HTML ='';
		for(let obj of list){
		console.log(obj);
			HTML +=`
			<tr class="${obj.orderType=="전화"? 'idi_connect' : ''} ">
				<td><div class="textCut"><input type="checkbox" name="" class="tc_01_check" value=""></div></td>
				<td><div class="textCut">${obj.orderNo}</div></td>
				<td><div class="textCut">${obj.createTime==null? '': obj.createTime.replace('T',' ')}</div></td>
				<td><div class="textCut">${obj.cashReceiptYn}</div></td>
				<td><div class="textCut textAL">${obj.orderItemList.length==0? '': obj.orderItemList[0].goodsName+ (obj.orderItemList.length>1? " 외 "+ (obj.orderItemList.length-1+"건") : "") }</div></td>
				<td>
					<div class="textCut">
						<button type="button" onclick="openWindow('/mngr/order/${obj.orderNo}/list/popup/detail', 'order_list_popup_detail', 1000, 840);">보기</button>
					</div>
				</td>
				<td>
					<div class="textCut">
						<button type="button" onclick="openWindow('../member_management_list/popup_detail.jsp', 'member_management_list_popup_detail', 1000, 840);">보기</button>
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
				</td>
				<td><div class="textCut">${obj.memberNo==0? "비회원주문" : obj.memberName == null ? "탈퇴회원"  : obj.memberName }</div></td>
				<td><div class="textCut">${obj.receiverName}</div></td>
				<td><div class="textCut">${obj.orderType=='내방'? obj.settleKind=='m'? '내방현금' : '내방카드'  : obj.orderType }</div></td>
				<td><div class="textCut">${obj.settleKind}</div></td>
				<td><div class="textCut textAR">${new Intl.NumberFormat('en-US').format(obj.originPrice)}</div></td>
				<td><div class="textCut">${obj.createTime==null? '' : obj.createTime.replace('T',' ')}</div></td>
			</tr>
			`;
		}
		let className="";
		let activeTab=document.querySelector('.event.active').value;
		switch(activeTab){
			case "주문접수":
				className="tc_01";
			break;
			case "결제확인":
				className="tc_02";
			break;
			case "배송준비중":
				className="tc_03";
			break;
			case "배송중":
				className="tc_04";
			break;
			case "배송완료":
				className="tc_05";
			break;
			case "주문취소":
				className="tc_06";
			break;
		}
		console.log(className);
		document.getElementsByClassName(className)[0].querySelector('tbody').innerHTML=HTML;
		return className;
		
	}
}
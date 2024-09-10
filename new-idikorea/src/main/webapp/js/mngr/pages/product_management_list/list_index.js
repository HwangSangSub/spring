import {paging} from '/js/util/paging/paging.js';
export const get={
	obj : null,
	init:function(){
//		this.getList();
		this.searchBtn();
		document.addEventListener("change",event=>{
			if(event.target.getAttribute('category-depth')!=null){
				let eventDepth = event.target.getAttribute('category-depth')*1;
				console.log(eventDepth)
				let targetDepth = 0;
				if(eventDepth ==1 || eventDepth ==2){
					targetDepth = eventDepth+1;
					let selectCategory = event.target.value;
					let i=0;
					for(let j = targetDepth ; j<=3 ; j++){
						document.querySelectorAll('[category-depth="'+j+'"]')[0].querySelectorAll('option')[0].selected=true;
					}
					console.log(targetDepth);
					for(let option of document.querySelectorAll('[category-depth="'+targetDepth+'"]')[0].querySelectorAll('option')){
						if(i!=0){
							option.setAttribute('style','display:none')
						}
						if(option.value.substr(0,3*eventDepth) == selectCategory){
							option.removeAttribute('style');
						}
						i++;
					}
					
				}
				
			}
		})
		
		document.addEventListener("click",event=>{
			
			if(event.target.id=='searchBtn'){
				this.getParam().pageNum=1;
				this.searchBtn();
			}else if(paging.clickBtn(event)){
				this.searchBtn(this.getParam());
			}
			else if(event.target.getAttribute('type')=='checkbox'){
				console.log("jsdlfkjksldfjlkkkk")
				let obj ={};
				obj.goodsNo = event.target.closest('tr').getAttribute('id') ;
				obj[event.target.getAttribute('name')] = (event.target.checked && event.target.getAttribute('name')== 'useStock') ? 'N' : ( !event.target.checked && event.target.getAttribute('name')== 'useStock') ? 'Y' : (event.target.checked && event.target.getAttribute('name')!= 'useStock') ? 1 : 0;		
				//this.update(formData);
				this.update(JSON.stringify( obj) );
				/*{
					goodsNo : event.target.closest('tr').getAttribute('id'),
					column : event.target.getAttribute('name'),
					checked : event.target.checked
				}*/
			}
		})
	},
	update : function(param){
		fetch("/api/v1/mngr/goods",{
			method : "PATCH",
			headers :{
				"Content-Type" : 'application/json'
			},
			body : param	
		}).then(resp=>resp.json())
		.then(data=>{
			
		})
	},
	searchBtn : function(){
		let param = (this.getParam()==null || this.getParam() == undefined) ?  '':('?'+ new URLSearchParams(this.getParam()));
		fetch('/api/v1/mngr/goods'+param)
		.then(resp=>resp.json())
		.then(data=>{
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
	getParam : function(){
		return {
			pageNum : paging.pageNum,
			itemSize : document.querySelector('input[name="list_num"]:checked').value,
			callOpen : document.querySelector('input[name="radio_num_03"]:checked').value,
			userOpen : document.querySelector('input[name="radio_num_01"]:checked').value,
			soldOut : document.querySelector('input[name="radio_num_09"]:checked').value ,
			useRegular : document.querySelector('input[name="radio_num_06"]:checked').value ,
			searchPrice : [ document.getElementById('minPrice').value ==''? document.getElementById('minPrice').value*1 : 0 , document.getElementById('maxPrice').value ==''? document.getElementById('maxPrice').value*1 : 0 ], 
			brandNo : document.getElementById('brand').value,
			category : document.querySelector('[category-depth="3"]').value !='' ? document.querySelector('[category-depth="3"]').value: document.querySelector('[category-depth="2"]').value !='' ? document.querySelector('[category-depth="2"]').value : document.querySelector('[category-depth="1"]').value,
			searchDateArr : [document.getElementsByName('sDate')[0].value , document.getElementsByName('eDate')[0].value ],
			searchOption : document.querySelector('[name="searchOption"]').value,
			searchValue : document.querySelector('[name="searchValue"]').value,
			searchPrice : [ document.getElementById('minPrice').value , document.getElementById('maxPrice').value ]
		};
				
	},
	getList : function(list){
		let HTML =``;
		for(let obj of list){
			HTML += `
					<tr id="${obj.goodsNo}">
						<td><div class="textCut">${obj.goodsNo}</div></td>
						<td><div class="textCut">${obj.goodsCode}</div></td>
						<td>
							<div class="thumbnail textCut" style="width: 55px; height: 55px;">
								<img src="/api/v1/file/${obj.iconImage}" alt="">
							</div>
						</td>
						<td class="textAL"><div class="textCut">${obj.goodsName}</div></td>
						<td><div class="textCut textAR">${obj.price}</div></td>
						<td><div class="textCut">${obj.useStock=='N'?'&infin;':obj.nowStock }</div></td>
						<td><div class="textCut"><input type="checkbox" name="useStock" ${obj.useStock=='N'?'checked' : '' }></div></td>
						<td><div class="textCut">${obj.soldOut==1 ? ( (obj.nowStock==0&& obj.useStock=='Y')? '품절': '<input type="checkbox" name="soldOut" checked >' ) : ( obj.useStock=='Y' && obj.nowStock==0 )? '품절' :'<input type="checkbox" name="soldOut" >'   }</div></div></td>						
						<td><div class="textCut"><input type="checkbox" name="userOpen"  ${obj.userOpen == 1 ? 'checked' : ''}></div></td>
						<td><div class="textCut"><input type="checkbox" name="callOpen" ${obj.callOpen == 1 ? 'checked' : ''}></div></td>
						<td><div class="textCut"><input type="checkbox" name="useRegular" ${obj.useRegular == 'Y' ? 'checked' : ''}></div></td>
						<td><div class="textCut"><button type="button" onclick="openWindow('/mngr/product/${obj.goodsNo}/management/list/popup/detail', 'product_management_list_popup_detail', 1000, 840);">보기</button></div></td>
						<td><div class="textCut"><button type="button">복사</button></div></td>
						<td><div class="textCut">0000-00-00</div></td>
					</tr>
			`;   
		}
		document.getElementById('boardList').innerHTML = HTML;

		/*console.log(list[0].useStock =='N' && list[0].nowStock==0)
		console.log(list[0].soldOut)
		console.log(list[0].soldOut==1)
		console.log(list[0].nowStcok)
		console.log(list[0].nowStcok==0) 
		if(list[0].soldOut == 1)
			console.log("1")``
		if(list[0].useStock == 'Y')
			console.log("2")
		if(list[0].nowStcok = 0)
			console.log("3")
		*/
		

	}
}
export const get={
	init : function(){
		

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
		
		document.addEventListener('click',event=>{
			if(event.target.id=="searchBtn"){
				this.getData();
			}else if(event.target.name=="selectBtn"){
				if(event.target.closest('tr').querySelector('[name="useOrder"]').innerHTML == '품절')
					return alert('품절인 상품은 선택할수없습니다.');
				console.log(event.target.getAttribute('data-id'))
				fetch(`/api/v1/mngr/goods/${event.target.getAttribute('data-id')}/option/${event.target.getAttribute('data-option-id')}`)
				.then(resp=>resp.json())
				.then(data=>{
					console.log(data);
					opener.window.get.writeGoods(data);
				})
			}
		})		
		// 카테고리 1번선택 이벤트까지 발생
		let e = document.querySelector('[category-depth="1"]');
		e.value = "001";
		let event = new Event('change', { bubbles: true });
		e.dispatchEvent(event); 
		//
		this.getData();
	},
	getParam : function(){
		return {
			searchOption : document.getElementsByName('searchOption')[0].value,
			searchValue : document.getElementsByName('searchValue')[0].value,
			category : document.querySelector('[category-depth="3"]').value !='' ? document.querySelector('[category-depth="3"]').value: document.querySelector('[category-depth="2"]').value !='' ? document.querySelector('[category-depth="2"]').value : document.querySelector('[category-depth="1"]').value,
			brandNo : document.getElementById('brand').value,
			soldOut : document.querySelector('input[name="radio_num_09"]:checked').value
		}
		
		
	},
	getData : function(){
		let param = (this.getParam()==null || this.getParam() == undefined) ?  '':('?'+ new URLSearchParams(this.getParam()));
		fetch('/api/v1/mngr/goods/popup'+param)
		.then(resp=>resp.json())
		.then(data=>{
			console.log(data)
			let HTML = ``;
			if(data.length ==0){
				HTML += `
					<tr>
						<td colspan="7">등록된 게시물이 없습니다.</td>
					</tr>
				`;
			}else{
				for(let obj of data){
					HTML += `
						<tr>
							<td>
								<div class="thumbnail textCut" style="width: 55px; height: 55px;">
									<img src="https://www.idikorea.com/attach_file/prod/5aafbe4ebd3c468cbf28ea27445c775d.png" alt="">
								</div>
							</td>
							<td class="textAL">
								<div class="textCut">${obj.goodsName}</div>
								<!-- 상품 옵션이 있는 경우-->
							${(obj.opt1 != null && obj.opt1 !="")? '<div class="textCut" style="border-top: 1px dashed #ccc; margin-top: 6px; padding-top: 6px;">'+obj.opt1+ ( (obj.opt2!=null && obj.opt2!="" ) ? '&gt;'+ obj.opt2 + '</div>':   '</div>') :'' }		
								<!--// 상품 옵션이 있는 경우-->
							</td>
							<td>
								<div class="textCut textAR">
									<span class="sales">${obj.price}</span>
								</div>
							</td>
							<td><div class="textCut">${obj.useStock=='N'?'&infin;':obj.nowStock }</div></td>
							<td><div class="textCut">${obj.useStock=='N'?'✓' : '' }</div></td>
							<td><div class="textCut" name="useOrder">${ ( (obj.nowStock==0 && obj.useStock=='Y') || obj.soldOut ==1)?'품절':''}</div></td>
							<td><button type="button" name="selectBtn" data-id="${obj.goodsNo}" data-option-id="${obj.sno}">선택</button></td>
						</tr>
					`;
					
						//HTML+=`[${obj.opt1}][${obj.opt2}]`;
				}				
			}
			document.getElementById('product').innerHTML = HTML;			
		})
	}
} 		 
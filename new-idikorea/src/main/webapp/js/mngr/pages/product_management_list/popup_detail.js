export const get={
	init : function(){
		let flag = location.href.includes('/mngr/product/management/list/popup/detail'); // flag 가 true 이면 등록페이지
		if(flag){
			document.querySelector('.buttonType.caution').style="display:none"
		}		
		document.addEventListener("click",event=>{
			if(event.target.getAttribute('delete-id')!=null && event.target.getAttribute('delete-id')!=""){
				if(event.target.closest('td').querySelector('img')!=null)
		            event.target.closest('td').querySelector('img').remove();
			}else if(event.target.getAttribute('id')=='saveBtn' && flag == true){ // 등록저장시 
				if(document.getElementById('check_09').checked){
					document.getElementById('minEa').value == '' ;
					document.getElementById('maxEa').value == '' ;
						
				}else if(document.getElementById('maxEa').value*1 < document.getElementById('minEa').value*1){
					return alert('구매수량제한 최대갯수가 최소갯수보다 작을수 없습니다.')
				}
				this.insert( this.getData() );
			}else if(event.target.getAttribute('id')=='saveBtn' && flag == false){ // 수정저장시 
				if(document.getElementById('check_09').checked){
					document.getElementById('minEa').value == '' ;
					document.getElementById('maxEa').value == '' ;
					
				}else if(document.getElementById('maxEa').value*1 < document.getElementById('minEa').value*1){
					return alert('구매수량제한 최대갯수가 최소갯수보다 작을수 없습니다.')
				}
				this.save(this.getData());
			}else if(event.target.name == 'goodsDeleteBtn'){
				if(confirm('삭제된 데이터는 복구할 수 없습니다. 삭제하시겠습니까?')){
					this.delete(event.target.getAttribute('data-id'));
				}
			}
		})
		document.addEventListener("change",event=>{
			if(event.target.getAttribute('type')=='file'){
	            const file = event.target.files[0];
				if(event.target.closest('td').querySelector('img')!=null)
		            event.target.closest('td').querySelector('img').remove();
	            if (file) {
	                const reader = new FileReader();
					let HTML = '';
	                reader.onload = function(e) {
	                    event.target.closest('td').querySelector('.imgView').innerHTML = `<img src="${e.target.result}" alt="상품명">`;
	                };
	                // 파일을 읽습니다
	                reader.readAsDataURL(file);
	            }
			}else if(event.target.getAttribute('category-depth')!=null){
				let eventDepth = event.target.getAttribute('category-depth')*1;
				let targetDepth = 0;
				if(eventDepth ==1 || eventDepth ==2){
					targetDepth = eventDepth+1;
					let selectCategory = event.target.value;
					let i=0;
					for(let j = targetDepth ; j<=3 ; j++){
						document.querySelectorAll('[category-depth="'+j+'"]')[0].querySelectorAll('option')[0].selected=true;
					}
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
		
	},
	delete : function(goodsNo){
		console.log(goodsNo)
		fetch('/api/v1/mngr/goods/'+goodsNo ,{
			method : 'DELETE',
		}).then(resp=>resp.json)
		.then(data=>{
			if(data.code!=null && data.code==400){
				alert(data.message)
			}else{
				alert('삭제되었습니다.');
				window.close();
				opener.document.querySelector('#searchBtn').click();
			}
		})
	},
	insert : function(formData){
		fetch('/api/v1/mngr/goods' , {
			method : 'POST',
			body : formData
		}).then(resp=>resp.json())
		.then(data=>{
			if(data.code!=null && data.code==400){
				alert(data.message)
			}else{
				alert('저장되었습니다.');
				window.close();
				opener.document.querySelector('#searchBtn').click();
			}
		})
	},
	save : function(formData){
		fetch('/api/v1/mngr/goods' , {
			method : 'PUT',
			body : formData
		}).then(resp=>resp.json())
		.then(data=>{
			if(data.code!=null && data.code==400){
				alert(data.message)
			}else{
				alert('저장되었습니다.');
				window.close();
				opener.document.querySelector('#searchBtn').click();
			}
		})
	},
	getData : function(){
		let icon='';
		//icon 이 2진수로 들어감 역순으로 정렬을했기떄문에 다시 역순으로,, ㅇㅋㅇㅋ;
		document.querySelector('#iconTag').querySelectorAll('input').forEach(x=>{
		    if(x.checked)
		        icon = '1'+icon;
		    else
		        icon = '0'+icon;
		})
		//옵션 리스트만들기 단독상품일경우와 옵션상품설정의경우 분기처리함
		let optionList = [];
		if(document.querySelector('input[name="radio_09"]:checked').value=='Y'){
			let option ={
				sno : document.querySelector('.tbody_01').getAttribute('data-id'),
				price : document.querySelector('#singularPrice').value,
				consumer : document.querySelector('#singularConsumer').value,
				supply : document.querySelector('#singularSupply').value,
				reserve : document.querySelector('#singularReserve').value,
				stock : document.querySelector('#singularStock').value,
				selectOption : 'Y'
			};
			optionList.push(option);
		}else if(document.querySelector('input[name="radio_09"]:checked').value=='N'){
			document.querySelectorAll('.contentTable.resultTable').forEach((childTag,index)=>{
				console.log(document.querySelector('input[name="radio_05"]:checked').value == 'Y' ? null : childTag.querySelector('[name="reserve"]').value);
				let option = {
					sno : childTag.querySelector('thead').getAttribute('data-id') ,
					price : childTag.querySelector('[name="price"]').value , 
					consumer : childTag.querySelector('[name="consumer"]').value,
					supply : childTag.querySelector('[name="supply"]').value,
					reserve : document.querySelector('input[name="radio_05"]:checked').value == 'Y' ? null : childTag.querySelector('[name="reserve"]').value,
					stock :  childTag.querySelector('[name="stock"]').value,
				};
				//첫번쨰옵션은 기준옵션이된다,
				if(index==0)
					option.selectOption = 'Y';
				else
					option.selectOption = 'N';
						
				let depth=childTag.closest('[name]').getAttribute('name').split('depth')[1]*1;
				for(let i = depth ; i > 0 ; i--){
					option['opt'+i]=childTag.closest('[name="depth'+i+'"]').querySelector('[name="optionName"]').value;
				}				
				optionList.push(option);
			})
				
		}
		let obj={
			goodsName: document.getElementById('goodsName').value,
			category : document.querySelector('[category-depth="3"]').value !='' ? document.querySelector('[category-depth="3"]').value: document.querySelector('[category-depth="2"]').value !='' ? document.querySelector('[category-depth="2"]').value : document.querySelector('[category-depth="1"]').value,//카테고리
			icon : icon,
			goodsCode : document.getElementById('goodsCode').value ,
			maker : document.getElementById('maker').value==''? document.getElementById('textMaker').value  : document.getElementById('maker').value,
			countryOrigin : document.getElementById('country').value==''? document.getElementById('textCountry').value  : document.getElementById('country').value,
			userOpen : document.querySelector('input[name="radio_01"]:checked').value,
			callOpen : document.querySelector('input[name="radio_03"]:checked').value,
			tax : document.querySelector('input[name="radio_07"]:checked').value,
			useStock : document.querySelector('input[name="useStock"]').checked ? 'N' : 'Y',
			soldOut : document.querySelector('#soldOut').checked ? 1 : 0,
			minEa : document.getElementById('check_09').checked ? 0 : document.querySelector('#minEa').value,
			maxEa : document.getElementById('check_09').checked ? 0 : document.querySelector('#maxEa').value,
			optionList : optionList,
			shortContent : document.getElementById('shortContent').value,
			memo : document.getElementById('memo').value,
			brandNo : document.getElementById('brand').value=='' ? 0 : document.getElementById('brand').value,
			reserve : document.getElementsByName('radio_05')[0].value == 'Y' ? null : document.getElementById('singularReserve').value
			
		}; 
		if(document.getElementById('goodsNo').value!=''){
			obj.goodsNo=document.getElementById('goodsNo').value;
		} 
		let formData = new FormData();
//		formData.append('jsonData',obj );
		formData.append('jsonData',JSON.stringify(obj) );
		if(document.getElementById('iconImage').files[0]!=null)
			formData.append('iconImage',document.getElementById('iconImage').files[0]);
		if(document.getElementById('midiumImage').files[0]!=null)
			formData.append('midiumImage',document.getElementById('midiumImage').files[0]);
		if(document.getElementById('contentImage').files[0]!=null)
			formData.append('contentImage',document.getElementById('contentImage').files[0]);
		return formData;
	},
	
}
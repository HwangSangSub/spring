export const get={
	init : function(){
		document.addEventListener('click',event=>{
			if(event.target.id=="goodsSearchBtn" ){
				if(document.getElementsByName('memberId')[0].value=='')
					return alert('회원검색후에 상품검색을 해야합니다.')
				openWindow('/mngr/order/call/popup/product', 'order_call_popup_product', 1000, 840);
				
			}else if(event.target.name=='goodsDelete'){
				event.target.closest('tr').remove();
			}else if(event.target.id=="orderBtn"){
				this.order();
			}
		})
		
		document.addEventListener('keyup',event=>{
			if(event.target.id=='savedmoney'){
				if(event.target.value*1 >  document.getElementById('max_savedmoney').value*1 ){
					event.target.value='';
					calcSum();
					return alert('보유적립금을 초과하여 사용할수 없습니다.');
				}else if(event.target.value*1 > document.getElementById('sum').innerHTML.replaceAll(',','')*1   ){
					event.target.value='';
					calcSum();
					return alert('상품결제금액을 초과하여 적립금을 사용할수 없습니다.');
				} 
			}else if(event.target.id=="chaffer"){
				if(event.target.value*1 > document.getElementById('sum').innerHTML.replaceAll(',','')*1){
					//상품결제금액보다
				}
			}
			
		})		
		

	},
	writeMember : function(data){
		console.log(data)
		document.getElementsByName('memberNo')[0].value = data.memberNo;
		document.getElementById('memberDc').value = data.dc;
		document.getElementsByName('memberId')[0].value = data.memberId;
		document.getElementsByName('memberName')[0].value = data.memberName;
		document.getElementsByName('zipcode')[0].value = data.zipcode;
		document.getElementsByName('address')[0].value = data.roadAddress ;
		document.getElementsByName('subAddress')[0].value = data.subAddress;
		document.getElementsByName('mobile')[0].value = data.mobile;
		document.getElementsByName('phone')[0].value = data.phone;
		document.getElementById('usedEmoneyText').innerHTML=' ( 사용가능금액 '+data.emoney+')';
		document.getElementById('max_savedmoney').value = data.emoney;
		//document.getElementById('savedmoney').value = data.emoney;
	},
	writeGoods : function(obj){
		console.log(document.getElementById('memberDc'))
		console.log((document.getElementById('memberDc').value=='')? 0 : obj.price* ((document.getElementById('memberDc').value*1)/100));
		console.log(((100-(document.getElementById('memberDc').value*1))/100));
		console.log(obj);
		console.log("----");
		console.log(obj.price*((obj.minEa==null || obj.minEa==0)? 1 : obj.minEa) )
		console.log(obj.minEa)
		console.log(obj.price)
		console.log("----");
			let HTML = `
					<tr>
				<td><div class="textCut">${obj.goodsNo}</div> <input type="hidden" name="optionSno" value="${obj.optionList[0].sno}"></td>
				<td><div class="textCut">${obj.goodsCode}</div></td>
				<td>
					<div class="thumbnail textCut" style="width: 55px; height: 55px;">
						<img src="https://www.idikorea.com/attach_file/prod/5aafbe4ebd3c468cbf28ea27445c775d.png" alt="">
					</div>
				</td>
				<td class="textAL">
					<div class="textCut">${obj.goodsName}</div>
					${(obj.optionList[0].opt1 != null && obj.optionList[0].opt1 !="")? '<div class="textCut" style="border-top: 1px dashed #ccc; margin-top: 6px; padding-top: 6px;">'+obj.optionList[0].opt1+ ( (obj.optionList[0].opt2!=null && obj.optionList[0].opt2!="" ) ? '&gt;'+ obj.optionList[0].opt2 + '</div>':   '</div>') :'' }		
				</td>
				<td><div class="textCut" name="stock">${obj.useStock=='N'?'&infin;':obj.nowStock }</div></td>
				<td><div class="textCut">${obj.useStock=='N'?'✓' : '' }</div></td>
				<td>
					<div class="textCut">
						${(obj.minEa==null || obj.minEa==0)? 1 : obj.minEa}
						<input type="hidden" value="${(obj.minEa==null || obj.minEa==0)? 1 : obj.minEa}" id="minimum">
					</div>
				</td>
				<td>
					<div class="textCut">
						${(obj.maxEa==null || obj.maxEa ==0)? '' : obj.maxEa}
						<input type="hidden" value="${(obj.maxEa==null || obj.maxEa ==0)? '' : obj.maxEa}" id="maximum">
					</div>
				</td>
				<td>
					<input type="button" value="-" class="prodQtyMinus" style="width: 19px; padding: 0;">
					<input type="text" value="${(obj.minEa==null || obj.minEa==0)? 1 : obj.minEa}" class="textAR goodsQty" readonly style="width: 50px;">
					<input type="button" value="+" class="prodQtyPlus" style="width: 19px; padding: 0;">
				</td>
				<td>
					<div class="textCut textAR">
						<span class="sales">${obj.optionList[0].price*((obj.minEa==null || obj.minEa==0)? 1 : obj.minEa)}</span>
						<input type="hidden" value="${obj.optionList[0].price*((obj.minEa==null || obj.minEa==0)? 1 : obj.minEa) }" id="one_sales">                             
					</div>
				</td>
				<td>
					<div class="textCut textAR">
						<span class="discount">${  Math.ceil( (document.getElementById('memberDc').value=='')? 0 : obj.optionList[0].price* ((document.getElementById('memberDc').value*1)/100) ) * ( (obj.minEa==null || obj.minEa==0)? 1 : obj.minEa ) }</span>
						<input type="hidden" value="${   Math.ceil((document.getElementById('memberDc').value=='')? 0 : obj.optionList[0].price* ((document.getElementById('memberDc').value*1)/100) )     }" id="one_discount">
					</div>
				</td>
				<td>
					<div class="textCut textAR">
						<span class="payment">${ Math.floor((document.getElementById('memberDc').value=='')? 0 : obj.optionList[0].price* ((100-document.getElementById('memberDc').value*1)/100)) * ( (obj.minEa==null || obj.minEa==0)? 1 : obj.minEa )  }</span>
						<input type="hidden" value="${ Math.floor((document.getElementById('memberDc').value=='')? 0 : obj.optionList[0].price* ((100-document.getElementById('memberDc').value*1)/100) )  }" id="one_payment">
					</div>
				</td>
				<td><div class="textCut"><button name="goodsDelete" type="button">삭제</button></div></td>
			</tr>
		`;
		
		document.querySelector('#product').innerHTML += HTML;
		calcSum();
	},
	order : function(){
		let obj ={
			memberNo : document.getElementsByName('memberNo')[0].value , 
			receiverName : document.getElementsByName('memberName')[0].value ,
			zipcode : document.getElementsByName('zipcode')[0].value ,
			address : document.getElementsByName('address')[0].value ,
			subAddress : document.getElementsByName('subAddress')[0].value ,
			receiverMobile : document.getElementsByName('mobile')[0].value ,
			receiverPhone : document.getElementsByName('phone')[0].value ,
			coupon : document.querySelector('input[name="birthday_coupon"]:checked').value ,
			emoney : document.getElementById('savedmoney').value==''? 0 :  document.getElementById('savedmoney').value,
			enuri : document.getElementById('chaffer').value==''? 0 : document.getElementById('chaffer').value ,
			deliveryPrice : document.getElementById('delivery').innerHTML.replaceAll(',','') ,
			orderPrice : document.getElementById('orderPrice').innerHTML.replaceAll(',',''),
			orderType : document.querySelector('input[name="orderType"]:checked').value,
			bankAccount : document.getElementById('bankSelect').value ,
			bankSender : document.getElementById('bankSender').value ,
			cashReceiptYn : document.querySelector('input[name="cashReceiptYn"]:checked').value ,
			unpaid : document.getElementById('unpaid').value==''? 0 : document.getElementById('unpaid').value ,
			unpaidMemo : document.getElementById('outstanding').value ,
			catalog : document.getElementById('method9').checked ? 'Y' : 'N', 
			adminMemo : document.getElementById('adminMemo').value ,
			orderPrice : document.getElementById('orderPrice').innerHTML.replaceAll(',','')*1 , 
			lgOrderNo : document.getElementById('lgOrdNo').value,
			settleKind : document.querySelector('input[name="orderMethod"]:checked').value,
			
		}
		let goodsList=[];
		document.querySelector('#product').querySelectorAll('tr').forEach(tag=>{
			let obj = {
				sno : tag.querySelector('[name="optionSno"]').value,
				ea : tag.querySelector('.goodsQty').value,
				
			}
			goodsList.push(obj);
		})
		obj.orderItemList=goodsList;
		loading.open();
		fetch('/api/v1/mngr/order',{
			method : "POST",
		    headers: {
	       		'Content-Type': 'application/json'
		    },
		    body: JSON.stringify(obj)
			
		}).then(resp=>resp.json())
		.then(data=>{
			console.log("??");
			console.log(data);
			if(data==true){
				loading.close();	
				alert("주문이 완료되었습니다.");
				location.href = "/mngr/order/list/index";
			}
			
		})
	}	
	
} 		 
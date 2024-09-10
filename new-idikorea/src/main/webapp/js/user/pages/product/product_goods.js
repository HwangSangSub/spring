
document.addEventListener('DOMContentLoaded', function(){

    const products = document.querySelectorAll('.bdProduct-li'); // 상품 갯수
    const btnsSumControl = document.querySelectorAll('.btn-sum-control'); // 수량 조절
    
    makeSumController(btnsSumControl, products, false);

})

document.addEventListener("click", event=>{
	if(event.target.id=="orderBtn"){
		let orderItems = [...JSON.parse(document.getElementById("orderItems").value)];
		document.querySelectorAll(".sum").forEach(eaTag=>{
			let obj ={
				sno : eaTag.getAttribute('data-id'),
				ea : eaTag.value
			};
			
			if(eaTag.value !="0"){
				orderItems.push(obj);
			}
		/*	console.log(obj);
			if(eaTag.value !="0"){
				let flag = false;
				orderItems.some( (item, index) =>  { 
					if(item.sno == obj.sno && item.ea == obj.ea){
						console.log(2)
					}else if(item.sno == obj.sno){
						console.log(1)
						console.log(index +"index");
						orderItems.splice(index,1);
						console.log(orderItems)
						flag = true;
					}else if(item.sno != obj.sno){
						flag = true;
					}
				})
				console.log(flag)
				if(flag==true)
					orderItems.push(obj);
				if( !orderItems.some( (item, index) =>  {
						
				
				} ) ){
					console.log(4);
				}else if( !orderItems.some( item => ( item.sno == obj.sno && item.ea == obj.ea) )){
					console.log(3)
					orderItems.push(obj);
				}
			}*/
		})
		document.getElementById('orderItems').value = JSON.stringify(orderItems); 
		
		document.getElementsByName('orderForm')[0].submit();
	}
	

})
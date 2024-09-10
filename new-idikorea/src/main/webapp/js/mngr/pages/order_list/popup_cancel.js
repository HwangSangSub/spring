export const open={
	init:function(){
		document.addEventListener("click",event=>{
			if(event.target.id=='saveBtn'){
				let obj = {};
				if(document.getElementById('amount').value=='' && document.getElementById('mileage').value=='')
					return alert("환불금액과 환불마일리지중 하나의값은 필수입니다.");
				if(document.getElementById('adminName').value=='')
					return alert("처리담당자를 입력해주세요.");
				obj.deleteArr=location.search.split('&')[0].split('=')[1].split(',');
				obj.refund = document.getElementById('amount').value;
				obj.refundEmoney = document.getElementById('mileage').value;
				obj.orderNo = location.search.split('&')[1].split('=')[1];
				obj.refundReason = document.querySelector('select').value;
				obj.adminName = document.getElementById('adminName').value;
				obj.memo = document.getElementById('memo').value;
				
				fetch("/mngr/order/"+location.search.split('&')[1].split('=')[1]+"/cancel",{
					method : "DELETE",
					headers : {
						'Content-Type': 'application/json'
					},
					body : JSON.stringify(obj)	
				}).then(resp=>resp.json())
				.then(x=>{
					if(x==true){
						opener.document.getElementById('searchBtn').click();
						location.href='/mngr/order/'+location.search.split('&')[1].split('=')[1]+'/list/popup/detail'
					}
				})
			}
		})
	}
}
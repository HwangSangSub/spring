export const get={
	init:function(){
		document.addEventListener("click",event=>{
			console.log(event.target.id)
			if(event.target.id=="saveBtn"&&confirm('입력된 정보를 저장하시겠습닙까?')){
				if(document.getElementsByName("password")[0].value!="" && document.getElementsByName("password")[0].value != document.getElementsByName("passwordCheck")[0].value)
					return alert("패스워드가 일치하지 않습니다.");
				
				this.save( this.getParam() );
			}
		})
	},
	getParam:function(){
		let obj={
			memberId : document.getElementById('memberId').innerHTML,
			memberName : document.getElementById('memberName').value,
			christianName : document.getElementById('christianName').value,
			mobile : document.getElementById('mobile').value,
			phone : document.getElementById('phone').value,
			zipcode : document.getElementById('zipcode1').value ,
			roadAddress : document.getElementById('address1').value,
			subAddress : document.getElementById('subAddress').value,
			calendar : document.querySelector('input[name="radio_01"]:checked').value,
			birthYear : document.getElementById('birth').value.split('-')[0],
			birth : document.getElementById('birth').value.split('-')[1] + document.getElementById('birth').value.split('-')[2],
			memo : document.getElementById('memo').value,
			recommid : document.getElementById('recommid').value,
		}
		
		if(document.getElementById("password").value != '')
			obj.password = document.getElementById("password").value;
		return obj;
	},
	save:function(obj){
		
		fetch("/api/v1/mngr/member",{
			method : "PUT", 
			headers : {
				'Content-Type': 'application/json'
			},
			body : JSON.stringify(obj)	
		}).then(resp=>resp.json())
		.then(data=>{
			console.log(data)
		})
	}
}

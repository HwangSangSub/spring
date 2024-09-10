export const get={
	init : function(){
		document.addEventListener("click" , event=>{
			if(event.target.closest('button').innerHTML=="로그인"){
				this.login();
			}
		})
	},
	login : function(){
		
		document.getElementById("login").addEventListener("click",x=>{
			fetch("/api/v1/login",{
				method:"post",
				body:new FormData(document.getElementsByName('frm')[0]),
			}).then(resp=>resp.json())
			.then(x=>{
				location.href="/user/main";
			})
		
		})
		
	}
}
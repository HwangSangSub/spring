export const get={
	init: function(){
		this.loadToss();
	},
	loadToss : async function(){ 
		await this.createScript('https://js.tosspayments.com/v2/standard');
		const tossPayments=TossPayments("test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm"); //나중에 정식 클라이언트 key 로 교체해줘야함
		const widgets = tossPayments.widgets({ customerKey :"asdfjklajd_asdadad" }); //개인식별키,, 잘만들자,,
		let obj = opener.window.orderObject;
		widgets.setAmount({
			currency : 'KRW',
			value : obj.orderPrice*1
		});
		console.log(obj.orderPrice)
		const paymentMethodWidget = await widgets.renderPaymentMethods({
		  selector: "#payment-method",
		});
		document.addEventListener("click",event=>{
			if(event.target.closest('button').id == "payBtn"){
				widgets.requestPayment({
					orderId : obj.orderNo,
					orderName : obj.orderName,
					customerName: "...",
					  successUrl: location.origin+"/user/tossPayments/success?status=order",
					  failUrl: location.origin+"/user/tossPayments/fail"
				});
			}
		})
	},
	loadIdiPay : async function(customerKey){
		await this.createScript('https://js.tosspayments.com/v2/standard');
		const tossPayments=TossPayments("live_ck_JQbgMGZzorzjjbOd5Olrl5E1em4d");
		console.log(customerKey)
		const brandpay = tossPayments.brandpay({
		  customerKey : customerKey,
		  redirectUrl: 'https://www.idikorea.com/order/speedOrder/tossPayAuthorize.do',
		});
		let obj = window.orderObject;
		brandpay.requestPayment({
			  amount: {
			    currency: 'KRW',
			    value: obj.orderPrice*1,
			  },
			  orderId: obj.orderNo,
			  orderName: obj.orderName,
			  successUrl:  'https://www.idikorea.com/order/speedOrder/tossPayAuthorize.do',
			  failUrl:  'https://www.idikorea.com/order/speedOrder/tossPayAuthorize.do',
			 // customerEmail: 'customer123@gmail.com',
			 // customerName: '김토스',
			 // customerMobilePhone: '01012341234',
		});
	},
	idiPayObject : '' ,
	createScript : function (url) { //동적으로 스크립트 불러오기위한 태그 생성
    return new Promise((resolve, reject) => {
        const script = document.createElement('script');
        script.src = url;
        script.onload = () => resolve();
        script.onerror = () => reject(new Error(`Failed to load script: ${url}`));
        document.head.appendChild(script);
    });
}
}

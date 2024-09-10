import {paging} from '/js/util/paging/paging.js';
export const get={
	init:function(){
		fetch('/api/v1/mngr/goods')
		.then(resp=>resp.json())
		.then(data=>{
			console.log(data);
			this.getList(data.content)
		})
	},
	getParam : function(){
		
	},
	getList : function(list){
		let HTML =``;
		for(let obj of list){
			HTML += `
					<tr>
						<td><div class="textCut">${obj.goodsNo}</div></td>
						<td><div class="textCut">${obj.goodsCode}</div></td>
						<td>
							<div class="thumbnail textCut" style="width: 55px; height: 55px;">
								<img src="https://www.idikorea.com/attach_file/prod/5aafbe4ebd3c468cbf28ea27445c775d.png" alt="">
							</div>
						</td>
						<td class="textAL"><div class="textCut">${obj.goodsName}</div></td>
						<td><div class="textCut textAR">${obj.g}</div></td>
						<td><div class="textCut">&infin; ( 0 )</div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name=""></div></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><input type="checkbox" name="" checked></div></td>
						<td><div class="textCut"><button type="button" onclick="openWindow('./popup_detail.jsp', 'product_management_list_popup_detail', 1000, 840);">보기</button></div></td>
						<td><div class="textCut"><button type="button">복사</button></div></td>
						<td><div class="textCut">0000-00-00</div></td>
					</tr>
			`;
		}
	}
}
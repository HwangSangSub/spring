document.addEventListener("DOMContentLoaded", function(){
    getBest();
    getCare();
    getBia();
})

// 작성용 공통
const makePage = (targetLine, strCate ) => {
    let txt = '';
    targetLine.forEach( target => {
		console.log(target)
        txt += `
        <img class="m_page_rep_img m_${strCate}_rep_img" src="/api/v1/file/${target.fileId}" alt="">
        <div class="m_page_rep_txt m_${target.title}_rep_txt ${target.title}">
            <h2><span class="line">${target.title}</span> ${strCate == 'care'?'Care Line':''}</h2>
            <h3 class="m_page_rep_desc m_${strCate}_rep_desc">
                ${makePageEx(target.content.split('<br>'))}
            </h3>
        </div>
        `;
    })
    
    return {
        html : txt
    }
}

const makePageEx = (ex) => {
    let txt = '';
    ex.forEach( d => {
        txt += `<span>${d}</span>`;
    })

    return  txt;
    
}



const makeProduct = (targetLine, strCate ) => {
    let txt = '';
    let count = 0;
    targetLine.forEach( target => {
        count = 0;
        target.goodsList.forEach( product => { 
            count % 4 == 0 ? txt += `<div class="swiper-slide"><div class="m_products">` :  txt += '';
            txt += `
            <a href="${product.url}" class="m_product">
                <div class="m_product_overlay m_${strCate}_overlay"></div>
                <img src="/api/v1/file/${product.largeImage}" alt="${product.goodsName}">
                <div class="prodList_icon">                
					<button class="prod_soldOut ${product.soldOut=='Y' ? 'active' : ''}" type="button" onclick="runout(140)">품절</button>
                </div>
                <span class="m_product_name">${product.goodsName}</span>
                <div class="btns-prod m_${strCate}_prod_btns">
                    <button type="button" class="btn btn-prod-heart" data-prod-id="${product.goodsNo}">
                        <i class="la la-heart-o"></i>
                    </button>
                </div>
            </a>
            `;
            count % 4 == 3 || count == target.goodsList.length ? txt += `</div></div>` :  txt += '';
            count++;
        })
    })
    // console.log(makeLikeStar(product.like, product.likeMax).html);

    return {
        html : txt
    }
}

// //작성용 공통

// best
let bests;
const bestTxtSwiperCont = document.querySelector('.m_best_txt_swiper .swiper-wrapper');
const bestImgSwiperCont = document.querySelector('.m_best_img_swiper .swiper-wrapper');

const getBest = () => {
	bestSeller.forEach(best=>{
            bestImgSwiperCont.innerHTML += makeBestImg(best).html;
            bestTxtSwiperCont.innerHTML += makeBestTxt(best).html;
            setBestImgSwiper(bestSeller.length);
            setBestTxtSwiper(bestSeller.length, window.innerWidth);
            // bestImgSwiper.update();
	})
	
 /*   $.ajax({
        url:"/json/user/pages/main/best.json",
        type:"get",
        success : function(data) {
            bests = data.product;
            // console.log(bests);
        }
    }).done(function(){
        bests.forEach( best => {
            bestImgSwiperCont.innerHTML += makeBestImg(best).html;
            bestTxtSwiperCont.innerHTML += makeBestTxt(best).html;
        });
        // bestImgSwiper.update();
        setBestImgSwiper(bests.length);
        setBestTxtSwiper(bests.length, window.innerWidth);
        // bestTxtSwiper.update();
    })*/
}



const makeBestTxt = (product) => {
    const txt = `
    <div class="swiper-slide">
        <a href="${product.link}">
            <h3 class="m_best_name">${product.goodsName}</h3>
            <p>${product.shortContent}</p>
            <span>${makeLikeStar(product.sno, product.sno).html}</span>
            <ul class="clearfix m_best_pay_list">
                <li><strong>₩</strong>${product.consumer}</li>
                <li><strong>₩</strong>${product.price}</li>
            </ul>
        </a>
    </div>
    `;

    // console.log(makeLikeStar(product.like, product.likeMax).html);

    return {
        html : txt
    }
}


const makeLikeStar = ( store, max ) => {
    const star = '★';
    let html = '<span>';
    
    for(let i = 0; i < store; i++) {
        html += star;
    }
    
    const offStarNum = max - store;
    // console.log(`off star : ${offStarNum}`);
    if( offStarNum > 0 ) {
        html += '<span class="star_color_no">';
        for(let i = 0; i < offStarNum; i++) {
            html += star;
        }
        html += '</span>';
    }
    html += '</span>';
    
    return {
        html : html
    }
}


const makeBestImg = (product) => {
	console.log(product)
    const txt = `
    <div class="swiper-slide">
        <a href="${product.link}" class="m_product">
            <div class="m_product_overlay m_best_overlay"></div>
            <div class=""><img src="/api/v1/file/${product.imageFileId }"></div>
            <div class="btns-prod m_best_btn_list">
                <button type="button" class="btn btn-prod-heart" data-prod-id="${product.sno}">
                    <i class="la la-heart-o"></i>
                </button>
                <button type="button" class="btn btn-prod-cart" data-prod-id="${product.sno}">
                    <i class="la la-shopping-cart"></i>
                </button>
            </div>
        </a>
    </div>
    `;
    // console.log(makeLikeStar(product.like, product.likeMax).html);

    return {
        html : txt
    }
}
// //best


// care

let carelines;
const careLineContainer = document.querySelector('.m_care_line_container');
const careLineCont = document.querySelector('.m_care_line_list');
const chkLineName = "Special"; // 처음 열시 보이는 라인
const carePageRep = document.querySelector('.m_care_rep_wrap');
const careProductCont = document.querySelector('.m_care_list_swiper .swiper-wrapper');

/*
const getCare = () => {
    $.ajax({
        url:"/json/user/pages/main/care.json",
        type:"get",
        success : function(data) {
            carelines = data.line;
            // console.log(bests);
        }
    }).done(function(){
        carelines.forEach( line => {
            careLineCont.innerHTML += makeCareLine(line).html; // 상단 line 버튼 작성
        });
        // .update();

        const ElCareLines = careLineCont.querySelectorAll('li');
        const arrElCarLines =[...ElCareLines];
        arrElCarLines.forEach( el => {
            // if(el.classList.contains(chkLineName)){
            if(el.dataset['cate'] == chkLineName){
                el.classList.add('active'); // 상단 line 버튼 활성화
                // const targetLine = carelines.filter( line => el.className.includes(line.category) );
                const targetLine = carelines.filter( line => el.dataset['cate'] == line.cateName );
                carePageRep.innerHTML = makePage(targetLine, 'care').html; // line 설명페이지 작성
                careProductCont.innerHTML = makeProduct(targetLine, 'care').html; // 상품 swiper 작성
                careListSwiper.update(); // 작성후 swiper 적용

                careLineContainer.scrollTo({
                    left: el.offsetLeft - (window.innerWidth - el.clientWidth) / 2, // 반응형 스크롤에서, 누를 시 중앙
                    behavior: 'smooth'
                });
            }

            el.addEventListener('click', function(){
                arrElCarLines.filter( el => el.classList.remove('active'));
                this.classList.add('active');
                // const targetLine = carelines.filter( line => el.className.includes(line.category) );
                const targetLine = carelines.filter( line => el.dataset['cate'] == line.cateName );
                carePageRep.innerHTML = makePage(targetLine, 'care').html;
                careProductCont.innerHTML = makeProduct(targetLine, 'care').html;
                careListSwiper.update();

                careLineContainer.scrollTo({
                    left: el.offsetLeft - (window.innerWidth - el.clientWidth) / 2, // 
                    behavior: 'smooth'
                });
            })
        });
    })

}
*/


const getCare = ()=>{
	carelines = careLine
    carelines.forEach( line => {
        careLineCont.innerHTML += makeCareLine(line).html; // 상단 line 버튼 작성
    });
    // .update();
    const ElCareLines = careLineCont.querySelectorAll('li');
    const arrElCarLines =[...ElCareLines];
    arrElCarLines.forEach( el => {
        if(el.classList.contains(chkLineName)){
            el.classList.add('active'); // 상단 line 버튼 활성화
 //           const targetLine = carelines.filter( line => el.className.includes(line.category) );
            const targetLine = carelines.filter( line => el.getAttribute('data-category-no') == line.categoryNo );
            
            carePageRep.innerHTML = makePage(targetLine, 'care').html; // line 설명페이지 작성
            careProductCont.innerHTML = makeProduct(targetLine, 'care').html; // 상품 swiper 작성
            careListSwiper.update(); // 작성후 swiper 적용

            careLineContainer.scrollTo({
                left: el.offsetLeft - (window.innerWidth - el.clientWidth) / 2, // 반응형 스크롤에서, 누를 시 중앙
                behavior: 'smooth'
            });
        }

        el.addEventListener('click', function(){
            arrElCarLines.filter( el => el.classList.remove('active'));
            this.classList.add('active');
//            const targetLine = carelines.filter( line => el.className.includes(line.category) );
            const targetLine = carelines.filter( line =>el.getAttribute('data-category-no') == line.categoryNo );
            carePageRep.innerHTML = makePage(targetLine, 'care').html;
            careProductCont.innerHTML = makeProduct(targetLine, 'care').html;
            careListSwiper.update();

            careLineContainer.scrollTo({
                left: el.offsetLeft - (window.innerWidth - el.clientWidth) / 2, // 
                behavior: 'smooth'
            });
        })
    });
}

const makeCareLine = (line) => {
	console.log("111")
	console.log(line)
    // <li class="${line.category}">
    const txt = `
   <li class="" data-category-no="${line.categoryNo}" data-cate="${line.title}">
        <span class="m_care_line_img">
            <img src="/api/v1/file/${line.iconImageId}">
        </span>
        <span class="m_care_line_name">${line.title}</span>
    </li>
    `;
    
    return {
        html : txt
    }
}


// //care

// bia


let bialines;
// const biaLineCont = document.querySelector('.m_bia_line_list');
const biaLineCont = document.createElement('ul');
const biaPageRep = document.querySelector('.m_bia_rep_wrap');
const biaProductCont = document.querySelector('.m_bia_list_swiper .swiper-wrapper');

const getBia = () => {
    /*$.ajax({
        url:"/json/user/pages/main/bia.json",
        type:"get",
        success : function(data) {
            bialines = data.line;
            // console.log(bests);
        }
    }).done(function(){
        biaPageRep.innerHTML = makePage(bialines, 'bia').html; // line 설명페이지 작성
        biaProductCont.innerHTML = makeProduct(bialines, 'bia').html; // 상품 swiper 작성
        biaListSwiper.update(); // 작성후 swiper 적용
    })*/

}


// //bia


// ex
const goProdDetail = () => {

}
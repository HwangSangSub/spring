
document.addEventListener('DOMContentLoaded', function(){

    // 베스트셀러 swiper
    setBestImgSwiper(bestImgSwiperSlide.length);
    setBestTxtSwiper(bestImgSwiperSlide.length, window.innerWidth);
    // console.log(bestTxtSwiper);
    // console.log(paramSum);
    
    $(window).on('resize', function(){
        setBestTxtSwiper(bestImgSwiperSlide.length, window.innerWidth);
        careListSwiper.update();
    })

    // 베스트셀러 swiper
})



const visualSwiper = new Swiper('.m_visual_swiper', {
    loop: true,
    simulateTouch: false,
    speed: 1000,
    autoplay: {
        delay: 2000,
    }, 
    navigation: {
        prevEl: ".m_visual_swiper_btn.prev",
        nextEl: ".m_visual_swiper_btn.next",
    }
})


const bestImgSwiperSlide = document.querySelectorAll('.m_best_img_swiper .swiper-slide');
let bestImgSwiper;
const paramBestImgSwiper = {
    slidesPerView: 1,
    spaceBetween: 15,
    allowTouchMove: true,
    breakpoints : {
        509 : {
            slidesPerView: 2,
            spaceBetween: 20,
        },
        768 : {
            slidesPerView: 1,
            spaceBetween: 100,
        },
        1024 : {
            allowTouchMove: false,
        },
    },
    on : {
        slideChangeTransitionEnd: function(swiper){
        },
    },
}

let bestTxtSwiper;
const paramBestTxtSwiper = {
    // loop: true,
    slidesPerView: 1,
    allowTouchMove: false,
    navigation: {
        prevEl: ".m_best_btn.prev",
        nextEl: ".m_best_btn.next",
    },
    controller: {
        control: bestImgSwiper
    },
    breakpoints : {
        509 : {
            slidesPerView: 2,
            spaceBetween: 20,
        },
        768 : {
            slidesPerView: 1,
            spaceBetween: 100,
        },
        1024 : {
        },
    },
};
const paramSwiperLoop = {
    loop: true,
    loopAdditionalSlides: 1, // 마지막 슬라이드 안 보일 시 처리
    loopedSlides: 3, // 연동한 swiper일 시 서로의 loop 일치하기 위해 처리, 실제 기능은 복제 몇 개 해야 하는지 지정
}
const paramSwiperEffect = {
    effect: "fade",
    fadeEffect: {
        crossFade: true
    },
};
let paramBestImgSum = {};
let paramBestTxtSum = {};


const setBestImgSwiper = ( num ) => {
    bestImgSwiper == undefined ? void(0) : bestImgSwiper.destroy();
    paramBestImgSum = Object.assign({}, paramBestImgSwiper, num > 3 ? paramSwiperLoop : {});
    bestImgSwiper = setSwiper('.m_best_img_swiper', paramBestImgSum);
    if(bestImgSwiper != undefined && bestTxtSwiper != undefined) {
        bestImgSwiper.controller.control = bestTxtSwiper;
    }
    
}
const setBestTxtSwiper = ( num, windowW ) => {
    bestTxtSwiper == undefined ? void(0) : bestTxtSwiper.destroy();
    paramBestTxtSum = Object.assign({}, paramBestTxtSwiper, num > 3 ? paramSwiperLoop : {}, windowW > 1023 ? paramSwiperEffect : {});
    bestTxtSwiper = setSwiper('.m_best_txt_swiper', paramBestTxtSum);
    if(bestImgSwiper != undefined && bestTxtSwiper != undefined) {
        bestTxtSwiper.controller.control = bestImgSwiper;
    }
}







const careListSwiper = new Swiper('.m_care_list_swiper', {
    loop: true,
    effect: "fade",
    fadeEffect: {
        crossFade: true
    },
    simulateTouch: false,
    slidesPerView: 1,
    navigation: {
        prevEl: ".m_care_btn.prev",
        nextEl: ".m_care_btn.next",
    },

})


const biaListSwiper = new Swiper('.m_bia_list_swiper', {
    loop: true,
    effect: "fade",    
    fadeEffect: {
        crossFade: true
    },
    simulateTouch: false,
    slidesPerView: 1,
    navigation: {
        prevEl: ".m_bia_btn.prev",
        nextEl: ".m_bia_btn.next",
    },

})


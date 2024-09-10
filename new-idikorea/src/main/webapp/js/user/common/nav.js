
document.addEventListener('DOMContentLoaded', function(){
    // 메뉴를 저장한 json를 읽는다, 있으면 nav를 그린다
    $.ajax({
        url : '/json/user/common/menu.json',
        type:"get",
        success : function(data){
            baseNavResult = baseNav(data);
        }
    }).done(function(){
        
		$('.nav .nav-list').html(baseNavResult.html);

        // navLinks = document.querySelectorAll('.header .nav-link');
        navLinks = document.querySelectorAll('.nav-link');
        arrNavLinks = [...navLinks];
        arrNavLinks.forEach( (link, index) => {
            link.addEventListener('click', function(){
                // console.log(`p : ${link}`);
                const linkLi = $(link).parent();
                const nodes = linkLi.parent().children();
                // chkFooter = false;
                
                if(window.innerHeight < 768) {
                    movePageMobile( nodes.index(linkLi) + 1 );
                    $('.modal-nav-wrap').removeClass('active').addClass('close');
                    closeModalBase();
                }
                else if(windowW > onepageCriteria) {
                    movePage( nodes.index(linkLi) + 1);
                }else {
                    movePageMobile( nodes.index(linkLi) + 1 );
                    if(windowW <= 768) {
                        $('.modal-nav-wrap').removeClass('active').addClass('close');
                        closeModalBase();
                    }
                }
                navLinks.forEach( link => link.classList.remove('active') );
                link.classList.add('active');
                
                // page 위치에 따라 특정 event 수행
                guideDrag();
            } );
        })
        // //html
    })
        
})


const step = { 2 : '', 4: 'sub', 6 : 'third', 8 : 'fourth'}; // 1차메뉴 , 2차메뉴 sub, 3차메뉴 third, 4차메뉴 fourth ...

let navLinks;
let arrNavLinks = [];
let baseNavResult = {};

function baseNav(obj) {
    const arrMenu = obj.menu; // json의 메뉴
    let filterMenu = arrMenu.filter( item => !item.id.startsWith('000')); // json menu 중 nav 에 표시할 필요없는 menu 제외

    let navHtml = ''; // nav 그린 것을 담는 것
    let nav = []; // 현재 nav, 부모부터 하나씩 차례대로 밀어넣을 예정
    let group = [filterMenu];
    
    // 첫번째 메뉴 : menu, 두번째메뉴 : subMenu, 세번째메뉴 : thirdMenu, 네번째메뉴 : forthMenu ...
    if (Array.isArray(arrMenu) && Object.entries(arrMenu).length > 0) {
        arrMenu.forEach(menu => {
            const menuComplete = makeMenu(menu);

            if(menu['id'].startsWith('000')) {
                if(menu['id'] == navId) {
                    nav.push(...menuComplete.nav);
                }
            } else {
                navHtml += menuComplete.html;

                if(menu['id'] == navId.substr(0, 2)) {
                    nav.push(...menuComplete.nav);
                    group.push(...menuComplete.group);
                }
            }
            
        });            

    }

    // console.log(navHtml);
    // $('.nav > .nav-list').html(navHtml);
    return { 
        'html' : navHtml, 
        'nav' : nav,
        'group' : group
    };
}


// 1차메뉴
function makeMenu(menu) {
    let url = checkMenuUrl(menu);
    let checkLi = menu['id'] == navId ? 'current' : ''; // 현재 메뉴의 상단 메뉴인지 체크 
    let chkEn = testStr( menu['tit'], 'en');

    let nav = [];
    let group = [];
    let html = `
    <li class="nav-li li${menu['id']} ${checkLi}">
        <a href="${url}" class="link nav-link" data-menuindex="${menu['num']}" ${chkEn ? 'lang="en"' : ''}>${menu['tit']}</a>
    `;
    
    let arrSubMenu = menu['sub'];
    const makeSubAfter = makeNthMenu(arrSubMenu);
    html += makeSubAfter.html;

    html += '</li>';

    if(menu['id'].startsWith('000')) {
        if(menu['id'] == navId) {
            nav.push(menu);
            html = '';
        }
    } else {        
        if(menu['id'] == navId.substr(0, 2)) {
            nav.push(menu);
            nav.push(...makeSubAfter.nav);
            group.push(makeSubAfter.group);
        }
    }

    return { 
        'html' : html, 
        'nav' : nav,
        'group' : group
    };
}
// //1차메뉴

let currentMenu = {};
Object.defineProperty(currentMenu, 'current', {
    // 변경 변경 시점 잡기
    get : function(){
        return this.value;
    },
    set : function(newValue){
        this.value = newValue;
        // console.log('changed');
    }
})

// 1차메뉴 아래 n차 메뉴
function makeNthMenu(arrMenu) {
    let html = '';   
    let url = '';
    let checkLi;
    let nav = [];
    let group = [];
    
    if(Array.isArray(arrMenu) && Object.entries(arrMenu).length > 0) {
        
        html += `
        <div class="nav-${step[arrMenu[0]['id'].length ]}list-wrap">
        <ul class="nav-${step[arrMenu[0]['id'].length ]}list">
        `;
        
        arrMenu.forEach(menu => {
            url = checkMenuUrl(menu);
            menu['id'] == navId ? checkLi = 'current' : checkLi = '';
            const preparing = menu['preparing'] == true ? 'preparing' : '';

            html += `
            <li class="nav-${step[menu['id'].length]}li li${menu['id']} ${checkLi} ${preparing}">
                <a href="${url}" class="link nav-${step[menu['id'].length]}link" data-menuindex="${menu['num']}">${menu['tit']}</a>
            `;
            // <a href="${pathPage}${url}" class="link nav-${step[menu['id'].length]}link" data-menuindex="${menu['num']}">${menu['tit']}</a>
            checkLi == 'current' && currentMenu.current != menu['entit'] ? currentMenu.current = menu['entit'] : void(0);
            
            // sample
            // if(navId == '00') {
            //     if(menu['id'].startsWith('01') && menu['id'].endsWith('01')) {
            //         nav.push(menu);
            //     }
            // } else {
            //     if(menu['id'] == navId) {
            //         nav.push(menu);
            //     }
            //     group.push(menu);
            // }
            // sample

            if(menu['id'] == navId) {
                nav.push(menu);
            }
            group.push(menu);

            // 아래 메뉴가 더 있다면 하위메뉴를 만든다
            const isArrSub = Array.isArray(menu['sub']);
            const sizeSub = menu['sub'] != undefined ? Object.entries(menu['sub']).length > 0 : false;
            if(isArrSub && sizeSub) {
                const makeNthSubAfter = makeNthMenu(menu['sub']);
                html += makeNthSubAfter.html;
                nav.push(...makeNthSubAfter.nav);
                group.push(...makeNthSubAfter.group);
            }
            html += '</li>';
            
        })
        html += `
            </ul>
        </div>
        `;


    } else {
    }

    return { 
        'html' : html, 
        'nav' : nav ,
        'group' : group
    };
}


// url 있는 하위 메뉴 찾을 때까지 반복
function checkMenuUrl(menu) {
    if(menu['url'] != '') {
        return menu['url'];
    } else {
        if(menu['sub'] && menu['sub'][0]) {
            return checkMenuUrl(menu['sub'][0]);
        } else {
            return '#';
        }
    }
}



function handleNavLink() {    
    arrNavLinks.forEach( t => t.classList.remove('active') );
    const target = arrNavLinks.filter( (link, index) => {
        const linkLi = $(link).parent();
        const nodes = linkLi.parent().children();        

        // if(windowW > onepageCriteria && window.innerHeight < 768) {
        if(window.innerHeight < 768) {
            return nodes.index(linkLi) == page;
        }
        else if(windowW > onepageCriteria) {
            return nodes.index(linkLi) == page - 1;
        }
        else {
            return nodes.index(linkLi) == page;
        }
    });
    // console.log(target);
    target.forEach( t =>{
        t.classList.add('active');
    });
}
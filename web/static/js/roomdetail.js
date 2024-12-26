var slider = document.querySelector('.slider');
var sliderImg = slider.querySelector('.slider-img');
var sliderBtn = slider.querySelector('.slider-btn');
var sliderArrow = slider.querySelector('.slider-arrow');
var prevBtn = sliderArrow.querySelector('.prev');
var nextBtn = sliderArrow.querySelector('.next');
var index = 0;
var timer = null;
function changeImg() {
    sliderImg.style.left = -index * 500 + 'px';
    for (var i = 0; i < sliderBtn.children.length; i++) {
        sliderBtn.children[i].classList.remove('active');
    }
    sliderBtn.children[index].classList.add('active');
}

// 点击切换
slider.addEventListener('click', function (event) {
    var target = event.target;
    if (target.tagName.toLowerCase() === 'li') {
        index = Array.prototype.indexOf.call(sliderBtn.children, target);
        changeImg();
    } else if (target === prevBtn) {
        index--;
        if (index < 0) {
            index = (sliderImg.children).length - 1;
        }
        changeImg();
    } else if (target === nextBtn) {
        index++;
        if (index >= (sliderImg.children).length) {
            index = 0;
        }
        changeImg();
    }
});

function subtract() {
    var number = document.getElementById("number");
    number.value--;
}

function add() {
    var number = document.getElementById("number");
    number.value++;
}

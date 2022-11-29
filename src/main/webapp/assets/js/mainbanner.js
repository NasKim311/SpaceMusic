// 슬라이크 전체 크기(width 구하기)
const slidebn = document.querySelector(".slidebn");
let slidebnWidth = slidebn.clientWidth;

// 버튼 엘리먼트 선택하기
const prevBtn = document.querySelector(".slidebn_prev_button");
const nextBtn = document.querySelector(".slidebn_next_button");

// 슬라이드 전체를 선택해 값을 변경해주기 위해 슬라이드 전체 선택하기
let slidebnItems = document.querySelectorAll(".slidebn_item");
// 현재 슬라이드 위치가 슬라이드 개수를 넘기지 않게 하기 위한 변수
const maxSlidebn = slidebnItems.length;

// 버튼 클릭할 때 마다 현재 슬라이드가 어디인지 알려주기 위한 변수
let currSlidebn = 1;

// 페이지네이션 생성
const pagination = document.querySelector(".slidebn_pagination");

for (let i = 0; i < maxSlidebn; i++) {
  if (i === 0) pagination.innerHTML += `<li class="active">•</li>`;
  else pagination.innerHTML += `<li>•</li>`;
}

const paginationItems = document.querySelectorAll(".slidebn_pagination > li");

// 무한 슬라이드를 위해 start, end 슬라이드 복사하기
const startSlidebn = slidebnItems[0];
const endSlidebn = slidebnItems[slidebnItems.length - 1];
const startElem = document.createElement("div");
const endElem = document.createElement("div");

endSlidebn.classList.forEach((c) => endElem.classList.add(c));
endElem.innerHTML = endSlidebn.innerHTML;

startSlidebn.classList.forEach((c) => startElem.classList.add(c));
startElem.innerHTML = startSlidebn.innerHTML;

// 각 복제한 엘리먼트 추가하기
slidebnItems[0].before(endElem);
slidebnItems[slidebnItems.length - 1].after(startElem);

// 슬라이드 전체를 선택해 값을 변경해주기 위해 슬라이드 전체 선택하기
slidebnItems = document.querySelectorAll(".slidebn_item");
//
let offset = slidebnWidth + currSlidebn;
slidebnItems.forEach((i) => {
  i.setAttribute("style", `left: ${-offset}px`);
});

function nextMove() {
  currSlidebn++;
  // 마지막 슬라이드 이상으로 넘어가지 않게 하기 위해서
  if (currSlidebn <= maxSlidebn) {
    // 슬라이드를 이동시키기 위한 offset 계산
    const offset = slidebnWidth * currSlidebn;
    // 각 슬라이드 아이템의 left에 offset 적용
    slidebnItems.forEach((i) => {
      i.setAttribute("style", `left: ${-offset}px`);
    });
    // 슬라이드 이동 시 현재 활성화된 pagination 변경
    paginationItems.forEach((i) => i.classList.remove("active"));
    paginationItems[currSlidebn - 1].classList.add("active");
  } else {
    // 무한 슬라이드 기능 - currSlide 값만 변경해줘도 되지만 시각적으로 자연스럽게 하기 위해 아래 코드 작성
    currSlidebn = 0;
    let offset = slidebnWidth * currSlidebn;
    slidebnItems.forEach((i) => {
      i.setAttribute("style", `transition: ${0}s; left: ${-offset}px`);
    });
    currSlidebn++;
    offset = slidebnWidth * currSlidebn;
    // 각 슬라이드 아이템의 left에 offset 적용
    setTimeout(() => {
      // 각 슬라이드 아이템의 left에 offset 적용
      slidebnItems.forEach((i) => {
        // i.setAttribute("style", `transition: ${0}s; left: ${-offset}px`);
        i.setAttribute("style", `transition: ${0.15}s; left: ${-offset}px`);
      });
    }, 0);
    // // 슬라이드 이동 시 현재 활성화된 pagination 변경
    paginationItems.forEach((i) => i.classList.remove("active"));
    paginationItems[currSlidebn - 1].classList.add("active");
  }
}
function prevMove() {
  currSlidebn--;
  // 1번째 슬라이드 이하로 넘어가지 않게 하기 위해서
  if (currSlidebn > 0) {
    // 슬라이드를 이동시키기 위한 offset 계산
    const offset = slidebnWidth * currSlidebn;
    // 각 슬라이드 아이템의 left에 offset 적용
    slidebnItems.forEach((i) => {
      i.setAttribute("style", `left: ${-offset}px`);
    });
    // 슬라이드 이동 시 현재 활성화된 pagination 변경
    paginationItems.forEach((i) => i.classList.remove("active"));
    paginationItems[currSlidebn - 1].classList.add("active");
  } else {
    // 무한 슬라이드 기능 - currSlide 값만 변경해줘도 되지만 시각적으로 자연스럽게 하기 위해 아래 코드 작성
    currSlidebn = maxSlidebn + 1;
    let offset = slidebnWidth * currSlidebn;
    // 각 슬라이드 아이템의 left에 offset 적용
    slidebnItems.forEach((i) => {
      i.setAttribute("style", `transition: ${0}s; left: ${-offset}px`);
    });
    currSlidebn--;
    offset = slidebnWidth * currSlidebn;
    setTimeout(() => {
      // 각 슬라이드 아이템의 left에 offset 적용
      slidebnItems.forEach((i) => {
        // i.setAttribute("style", `transition: ${0}s; left: ${-offset}px`);
        i.setAttribute("style", `transition: ${0.15}s; left: ${-offset}px`);
      });
    }, 0);
    // 슬라이드 이동 시 현재 활성화된 pagination 변경
    paginationItems.forEach((i) => i.classList.remove("active"));
    paginationItems[currSlidebn - 1].classList.add("active");
  }
}

// 버튼 엘리먼트에 클릭 이벤트 추가하기
nextBtn.addEventListener("click", () => {
  // 이후 버튼 누를 경우 현재 슬라이드를 변경
  nextMove();
});
// 버튼 엘리먼트에 클릭 이벤트 추가하기
prevBtn.addEventListener("click", () => {
  // 이전 버튼 누를 경우 현재 슬라이드를 변경
  prevMove();
});

// 브라우저 화면이 조정될 때 마다 slideWidth를 변경하기 위해
window.addEventListener("resize", () => {
  slidebnWidth = slidebn.clientWidth;
});

// 각 페이지네이션 클릭 시 해당 슬라이드로 이동하기
for (let i = 0; i < maxSlidebn; i++) {
  // 각 페이지네이션마다 클릭 이벤트 추가하기
  paginationItems[i].addEventListener("click", () => {
    // 클릭한 페이지네이션에 따라 현재 슬라이드 변경해주기(currSlide는 시작 위치가 1이기 때문에 + 1)
    currSlidebn = i + 1;
    // 슬라이드를 이동시키기 위한 offset 계산
    const offset = slidebnWidth * currSlidebn;
    // 각 슬라이드 아이템의 left에 offset 적용
    slidebnItems.forEach((i) => {
      i.setAttribute("style", `left: ${-offset}px`);
    });
    // 슬라이드 이동 시 현재 활성화된 pagination 변경
    paginationItems.forEach((i) => i.classList.remove("active"));
    paginationItems[currSlidebn - 1].classList.add("active");
  });
}

// 드래그(스와이프) 이벤트를 위한 변수 초기화
let startPoint = 0;
let endPoint = 0;

// PC 클릭 이벤트 (드래그)
slidebn.addEventListener("mousedown", (e) => {
  startPoint = e.pageX; // 마우스 드래그 시작 위치 저장
});

slidebn.addEventListener("mouseup", (e) => {
  endPoint = e.pageX; // 마우스 드래그 끝 위치 저장
  if (startPoint < endPoint) {
    // 마우스가 오른쪽으로 드래그 된 경우
    prevMove();
  } else if (startPoint > endPoint) {
    // 마우스가 왼쪽으로 드래그 된 경우
    nextMove();
  }
});

// 모바일 터치 이벤트 (스와이프)
slidebn.addEventListener("touchstart", (e) => {
  startPoint = e.touches[0].pageX; // 터치가 시작되는 위치 저장
});
slidebn.addEventListener("touchend", (e) => {
  endPoint = e.changedTouches[0].pageX; // 터치가 끝나는 위치 저장
  if (startPoint < endPoint) {
    // 오른쪽으로 스와이프 된 경우
    prevMove();
  } else if (startPoint > endPoint) {
    // 왼쪽으로 스와이프 된 경우
    nextMove();
  }
});

// 기본적으로 슬라이드 루프 시작하기
let loopInterval = setInterval(() => {
  nextMove();
}, 3000);

// 슬라이드에 마우스가 올라간 경우 루프 멈추기
slidebn.addEventListener("mouseover", () => {
  clearInterval(loopInterval);
});

// 슬라이드에서 마우스가 나온 경우 루프 재시작하기
slidebn.addEventListener("mouseout", () => {
  loopInterval = setInterval(() => {
    nextMove();
  }, 3000);
});

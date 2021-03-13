let shortlistButton = document.querySelector('#shortlist-button');
let giftsButton = document.querySelector('#gifts-button');
let shortlist = document.querySelector('#shortlist-display');
let gifts  = document.querySelector('#gift-main-display');

showShortlist = (event) => {
  shortlist.hidden = false;
  shortlist.classList.add('shortlist-show');
  gifts.hidden = true;
}

showGifts = (event) => {
  shortlist.hidden = true;
  gifts.hidden = false;
  gifts.classList.add('gifts-show')
}

shortlistButton.addEventListener('click', showShortlist)
giftsButton.addEventListener('click', showGifts)

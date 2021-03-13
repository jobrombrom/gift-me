let shortlistButton = document.querySelector('#shortlist-button');
let giftsButton = document.querySelector('#gifts-button');
let shortlist = document.querySelector('#shortlist-display');
let gifts  = document.querySelector('#gift-main-display');

showShortlist = (event) => {
  shortlist.hidden = false;
  gifts.hidden = true;
}

showGifts = (event) => {
  shortlist.hidden = true;
  gifts.hidden = false;
}

shortlistButton.addEventListener('click', showShortlist)
giftsButton.addEventListener('click', showGifts)

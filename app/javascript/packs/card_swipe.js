'use strict';

var giftContainer = document.querySelector('.gift-display');
// allCards = node list
var allCards = document.querySelectorAll('.gift-card');
// is below just going to get the first one :/
var nope = document.getElementById('nope');
var love = document.getElementById('love');

console.log(giftContainer);
console.log(allCards);
console.log(nope);
console.log(love);


function initCards(card, index) {
  var newCards = document.querySelectorAll('.gift-card:not(.removed)');

  newCards.forEach(function (card, index) {
    console.log(card)
    console.log(index)
    // order of cards
    // card.style.zIndex = allCards.length - index;
    card.style.zIndex = index
    let order = allCards.length - index - 1
    card.style.transform = 'scale(' + (20 - order) / 20 + ') translateY(-' + 30 * order + 'px)';    
    card.style.opacity = (10 - order) / 10;
  });
  
  giftContainer.classList.add('loaded');
}

initCards();





// // swiping
// function createButtonListener(love) {
//   return function (event) {
//     var cards = document.querySelectorAll('.gift-card:not(.removed)');
//     console.log(cards)
//     var moveOutWidth = document.body.clientWidth * 1.5;

//     if (!cards.length) return false;

//     var card = cards[0];
//     // add removed class to card
//     card.classList.add('removed');
//     // transition
//     if (love) {
//       card.style.transform = 'translate(' + moveOutWidth + 'px, -100px) rotate(-30deg)';
//     } else {
//       card.style.transform = 'translate(-' + moveOutWidth + 'px, -100px) rotate(30deg)';
//     }

//     // initCards();

//     event.preventDefault();
//   };
// }
  
// var nopeListener = createButtonListener(false);
// var loveListener = createButtonListener(true);

// nope.addEventListener('click', nopeListener);
// love.addEventListener('click', loveListener);
  

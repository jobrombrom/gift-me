'use strict';

var giftContainer = document.querySelector('.gift-display');
// allCards = node list
var allCards = document.querySelectorAll('.gift-card');

var allNopes = document.querySelectorAll('.nope');
var allLoves = document.querySelectorAll('.love');

// console.log(allNopes);
// console.log(allLoves);


function initCards(card, index) {
  var newCards = document.querySelectorAll('.gift-card:not(.removed)');
  newCards = Array.from(newCards).reverse();

newCards.forEach(function (card, index) {
    // order of cards
 
    card.style.zIndex = allCards.length - index;
    card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
    card.style.opacity = (10 - index) / 10;
    // card.style.zIndex = index

    // let order = allCards.length - index - 1
    // card.style.transform = 'scale(' + (20 - order) / 20 + ') translateY(-' + 30 * order + 'px)';    
    // card.style.opacity = (10 - order) / 10;
  });
  
  giftContainer.classList.add('loaded');

  var card = newCards[0];
  var loveButton = card.closest('.gift-row').querySelector('.love')
  var nopeButton = card.closest('.gift-row').querySelector('.nope')
    

  var nopeListener = createButtonListener(false);
  var loveListener = createButtonListener(true);


  nopeButton.addEventListener('click', nopeListener);
  loveButton.addEventListener('click', loveListener);
};

initCards();

// function frontButton(nodeList) {
//   // get front card
//   // get parent class 
//   // get button 
    // initCards();

// };

// let frontNope = frontButton(allNopes);









// only works for last one because uses get element by id and we have multiple buttons
// swiping
function createButtonListener(love) {
  return function (event) {
    var cards = document.querySelectorAll('.gift-card:not(.removed)');
    cards = Array.from(cards).reverse()
    console.log(cards)
    var moveOutWidth = document.body.clientWidth * 1.5;

    if (!cards.length) return false;

    // add removed class to card
    var card = cards[0];
    card.classList.add('removed');
    // transition
    if (love) {
      card.style.transform = 'translate(' + moveOutWidth + 'px, -100px) rotate(-30deg)';
    } else {
      card.style.transform = 'translate(-' + moveOutWidth + 'px, -100px) rotate(30deg)';
    }

    initCards();

    event.preventDefault();
  };
}


  





// nope.addEventListener('click', console.log(nope));
// love.addEventListener('click', console.log(love));
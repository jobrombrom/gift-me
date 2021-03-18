'use strict';

var giftContainer = document.querySelector('.gift-display');
// allCards = node list
var allCards = document.querySelectorAll('.gift-card');
// is below just going to get the first one :/
var nope = document.getElementById('nope');
var love = document.getElementById('love');
var allNopes = document.querySelectorAll('#nope');
var allLoves = document.querySelectorAll('#love');

// console.log(allNopes);
// console.log(allLoves);


function initCards(card, index) {
  var newCards = document.querySelectorAll('.gift-card:not(.removed)');

newCards.forEach(function (card, index) {
    // order of cards
    card.style.zIndex = index
    let order = allCards.length - index - 1
    card.style.transform = 'scale(' + (20 - order) / 20 + ') translateY(-' + 30 * order + 'px)';    
    card.style.opacity = (10 - order) / 10;
  });
  
  giftContainer.classList.add('loaded');
};

initCards();

// only works for last one because uses get element by id and we have multiple buttons
// swiping
function createButtonListener(love) {
  return function (event) {
    var cards = document.querySelectorAll('.gift-card:not(.removed)');
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
  
var nopeListener = createButtonListener(false);
var loveListener = createButtonListener(true);


// function frontButton(nodeList) {
//   let counter = 1
//   var nope = allNopes[allNopes.length - counter];
//   console.log(nope);
//   counter += 1
//   return nope;
// };

// let frontNope = frontButton(allNopes);



nope.addEventListener('click', nopeListener);
love.addEventListener('click', loveListener);
  
nope.addEventListener('click', console.log(nope));
love.addEventListener('click', console.log(love));
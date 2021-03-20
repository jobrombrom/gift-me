'use strict';

var giftContainer = document.querySelector('.gift-display');
// allCards = node list
var allCards = document.querySelectorAll('.gift-card');

var allNopes = document.querySelectorAll('.nope');
var allLoves = document.querySelectorAll('.love');

function initCards(card, index) {
  var newCards = document.querySelectorAll('.gift-card:not(.removed)');
  newCards = Array.from(newCards).reverse();

newCards.forEach(function (card, index) {
    // order of cards
    card.style.zIndex = allCards.length - index;
    card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
    card.style.opacity = (10 - index) / 10;
  });
  
  giftContainer.classList.add('loaded');

  if (newCards.length == 0) {
    var message = document.getElementById("message")
    message.innerHTML = "Time to look at our wishlist 👇"
  }


  var card = newCards[0];
  var loveButton = card.closest('.gift-row').querySelector('.love')
  var nopeButton = card.closest('.gift-row').querySelector('.nope')
    

  var nopeListener = createButtonListener(false);
  var loveListener = createButtonListener(true);


  nopeButton.addEventListener('click', nopeListener);
  loveButton.addEventListener('click', loveListener);
};

// called when loading the page first time
initCards();

var love_messages = [
  "Good choice! 👍",
  "That was 🔥", 
  "Love that ❤️", 
  "Remember to check out your wishlist 👇",, 
  "Keep it 💯", 
  "👌👌👌",
  "Slayyyy 🗡️", 
  "Bossing it 🏆", 
  "You're nailing this 🥰"
]

var nope_messages = [
  "Oh well... Let's keep looking 💪", 
  "Oh no 👎",
  "😓😓😓", 
  "Remember to check out your wishlist 👇", 
  "Let's ignore that one 🙈", 
  "The search continues... 🔍", 
  "🙃", 
  "Don't know how that one got in there! 🙄"
]


// only works for last one because uses get element by id and we have multiple buttons
// swiping
function createButtonListener(love) {
  return function (event) {
    var cards = document.querySelectorAll('.gift-card:not(.removed)');
    cards = Array.from(cards).reverse()
    var moveOutWidth = document.body.clientWidth * 1.5;

    if (!cards.length) return false;

    // add removed class to card
    var card = cards[0];
    card.classList.add('removed');
    // transition
    if (love) {
      card.style.transform = 'translate(' + moveOutWidth + 'px, -100px) rotate(-30deg)';
      var message = document.getElementById("message")
      message.innerHTML = love_messages[Math.floor(Math.random() * love_messages.length)]    
    } else {
      card.style.transform = 'translate(-' + moveOutWidth + 'px, -100px) rotate(30deg)';
      var message = document.getElementById("message")
      message.innerHTML = nope_messages[Math.floor(Math.random() * nope_messages.length)]      
    
    }

    initCards();

    event.preventDefault();
  };
}

const View = require('./ttt-view.js'); // require appropriate file
const Game = require('./lib/game.js');// require appropriate file

$( () => {
  // Your code here
  let view = new View(new Game(), $('.ttt'));
  $('.ttt').append(view.grid);
});

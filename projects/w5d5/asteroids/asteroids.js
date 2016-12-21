const gameView = require('./lib/game_view.js');

document.addEventListener("DOMContentLoaded", () => {
  const canvasEl = document.getElementById("game-canvas");
  canvasEl.height = window.innerHeight;
  canvasEl.width = window.innerWidth;
  const ctx = canvasEl.getContext("2d");

  const game = new gameView(ctx);
  game.start();
});

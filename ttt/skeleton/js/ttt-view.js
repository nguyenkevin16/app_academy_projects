class View {
  constructor(game, $el) {
    this.game = game;
    this.$grid = this.setupBoard();
    this.$el = $el;

    this.$el.append(this.$grid);
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on('click', 'li', e => {
      const $currentTarget = $(e.currentTarget);
      this.makeMove($currentTarget);
    });
  }

  makeMove($square) {
    const arr = $square.attr('data-pos').split(",");
    const pos = arr.map((el) => parseInt(el));
    console.log(this.game.board);

    if (this.game.board.isEmptyPos(pos)) {
      $square.append(this.game.currentPlayer);
      this.game.playMove(pos);
      $square.attr('style', 'background-color: white');
    } else {
      alert("Invalid move.");
    }

    if (this.game.isOver()) {
      const $winner = $("<h3></h3>");
      $winner.append(`Congratulations, ${this.game.winner()}, you have won!`);

      this.$el.append($winner);
    }
  }

  setupBoard() {
    const newUnorderedList = $('<ul></ul>');

    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let newLiElement = $('<li></li>');
        newLiElement.attr("data-pos", [i, j]);
        newUnorderedList.append(newLiElement);
      }
    }

    return newUnorderedList;
  }
}

module.exports = View;

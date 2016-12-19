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
      const arr = $currentTarget.attr('data-pos').split(",");
      const pos = arr.map((el) => parseInt(el));

      this.game.playMove(pos);
      $currentTarget.append(this.game.currentPlayer);
    });
  }

  makeMove($square) {}

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

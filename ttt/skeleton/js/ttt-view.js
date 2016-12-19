class View {
  constructor(game, $el) {
    this.grid = this.setupBoard();
    this.$el = $el;
    this.bindEvents();
  }

  bindEvents() {

  }

  makeMove($square) {}

  setupBoard() {
    const newUnorderedList = $('<ul></ul>');

    for (let i = 0; i < 9; i++) {
      let newLiElement = $('<li></li>');
      newUnorderedList.append(newLiElement);
    }

    return newUnorderedList;
  }
}

module.exports = View;

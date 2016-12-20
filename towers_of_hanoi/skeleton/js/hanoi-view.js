class HanoiView {
  constructor(game, dom) {
    this.game = game;
    this.$dom = dom;
    this.startTower = null;

    this.setupTowers();
    this.render();
    this.bindEvents();
  }

  setupTowers() {
    for (let i = 0; i < 3; i++) {
      let $ul = $('<ul class="hanoi-towers"></ul>');
      $ul.attr("id", i);
      this.$dom.append($ul);
    }
  }

  render() {
    const $towers = $('.hanoi-towers');

    $('.discs').remove();

    for (let i = 0; i < this.game.towers.length; i++) {
      for (let j = 2; j >= 0; j--) {
        let li = $('<li class="discs"></li>');
        li.text(this.game.towers[i][j]);
        li.attr("id", this.game.towers[i][j]);
        $towers[i].append(li[0]);
      }
    }
  }

  bindEvents() {
    $('.hanoi-towers').on("click", e => {
      const $currentTarget = $(e.currentTarget);

      if (this.startTower === null) {
        this.startTower = parseInt($currentTarget.attr('id'));
      } else {
        const endTower = parseInt($currentTarget.attr('id'));

        if (this.game.move(this.startTower, endTower)) {
          this.startTower = null;
        } else {
          alert("Invalid move");
          this.startTower = null;
        }
      }

      this.render();

      if (this.game.isWon()) {
        this.$dom.append("<p>Congratulations, you are AWESOME!</p>");
      }
    });
  }
}

module.exports = HanoiView;

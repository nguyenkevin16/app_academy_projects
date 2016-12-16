class board {
  constructor() {
    this.grid = [
      [null, null, null],
      [null, null, null],
      [null, null, null]
    ];
  }

  won() {

  }

  winner() {
    const all_possible_rows = this.grid.concat(this.cols()).concat(this.diags());
    const x_win = ['x', 'x', 'x'];
    const o_win = ['o', 'o', 'o'];


  }

  cols() {
    let bucket = [];

    // i = new row_indexes; j = new col_indexes
    for (let i = 0; i < this.grid[0].length(); i++) {
      let row = [];
      for (let j = 0; j < this.grid.length(); j++) {
        row.push(this.grid[j][i]);
      }
      bucket.push(row);
    }

    return bucket;
  }

  diags() {
    const diags = [
      [this.grid[0][0], this.grid[1][1], this.grid[2][2]],
      [this.grid[0][2], this.grid[1][1], this.grid[2][0]]
    ];

    return diags;
  }

  empty(pos) {
    let x = pos[0];
    let y = pos[1];

    return this.grid[x][y] === null;
  }

  place_mark(pos, mark) {
    if (this.empty(pos)) {
      const x = pos[0];
      const y = pos[1];

      this.grid[x][y] = mark;
    }
  }
}



let b = new board;
console.log(b.empty([0, 0]));

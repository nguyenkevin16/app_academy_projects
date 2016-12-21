// class Towers {
//   // play until all disks on tower 2 or 3
//     //get start and end position from user
//     // move disk if possible
// }
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor(){
    this.stacks = [[1],[3,2],[]];
  }

  promptMove(gameOver) {
    this.print();
    let fromTower;
    let toTower;
    reader.question("Where do you want to move disk from: ", (ansFrom) => {
      fromTower = parseInt(ansFrom);

      reader.question("Where do you want to move disk to: ", (ansTo) => {
        toTower = parseInt(ansTo);

        this.move(fromTower, toTower);
        this.gameOver();
      });
    });
  }

  isValidMove(fromTower, toTower) {
    if (fromTower > 2 || toTower > 2) {
      return false;
    } else if (this.stacks[fromTower].length === 0)  {
      return false;
    } else if (this.stacks[toTower].length === 0) {
      return true;
    } else if (this.stacks[fromTower][-1] > this.stacks[toTower][-1]) {
      return false;
    } else {
      return true;
    }
  }

  isWon() {
    if (this.stacks[1].length === 3 || this.stacks[2].length === 3) {
      return true;
    } else {
      return false;
    }
  }

  print() {
    console.log(JSON.stringify(this.stacks));
  }

  move(from, to) {
    if (this.isValidMove(from, to)) {
      this.stacks[to].push(this.stacks[from].pop());
    } else {
      console.log(`Not a valid move.`);
    }
  }

  run() {
    this.promptMove(this.gameOver);
  }

  gameOver() {
    if (!this.isWon()) {
      this.promptMove();
    } else {
      console.log('You won!');
      reader.close();
    }
  }
}

let game = new Game;
game.run();

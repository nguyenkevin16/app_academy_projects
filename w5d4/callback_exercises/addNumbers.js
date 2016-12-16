const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft === 0) {
    reader.close();
    return completionCallback(sum);
  }

  if (numsLeft > 0) {
    reader.question("Please enter a number:", (answer) => {
      sum += parseInt(answer);
      console.log(sum);
      numsLeft--;
      addNumbers(sum, numsLeft, completionCallback);
    });
  }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

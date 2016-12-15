  function uniq(array) {
  const beenSeen = [];

  for (let i = 0; i < array.length; i++) {
    if (!(beenSeen.includes(array[i]))) {
      beenSeen.push(array[i]);
    }
  }

  return beenSeen;
}

// console.log(uniq([1, 2, 1, 3, 3]));

Array.prototype.uniq = function() {
  const beenSeen = [];

  for (let i = 0; i < this.length; i++) {
    if (!(beenSeen.includes(this[i]))) {
      beenSeen.push(this[i]);
    }
  }

  return beenSeen;
};

// console.log([1, 2, 1, 3, 3].uniq());

Array.prototype.two_sum = function() {
  const twoSum = [];

  for (let i = 0; i < this.length - 1 ; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        twoSum.push([i , j]);
      }
    }
  }
  return twoSum;
};
// console.log([-1, 0, 2, -2, 1].two_sum());

function myTranspose(matrix) {
  const outLength = matrix[0].length;
  const outWidth = matrix.length;
  const outArray = [];
  for (let i = 0; i < outLength; i++) {
    const row = [];
    for (let j = 0; j < outWidth; j++) {
      row.push(matrix[j][i]);
    }
    outArray.push(row);
  }
  return outArray;
}

console.log(myTranspose([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]));

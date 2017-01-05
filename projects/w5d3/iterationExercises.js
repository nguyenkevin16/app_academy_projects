function bubbleSort(array) {
  if (array.length < 2) { return array; }

  for (let i = 1; i < array.length; i++) {
    if (array[i] < array[i - 1]) {
      let temp = array[i - 1];
      array[i - 1] = array[i];
      array[i] = temp;
      return bubbleSort(array);
    }
  }

  return array;
}

console.log(bubbleSort([4]));

require('./arrayExercises.js');

function subStrings(string) {
  const subsArr = [];
  for (let i = 0; i < string.length; i++) {
    for (let j = i + 1; j <= string.length; j++) {
      subsArr.push(string.slice(i, j));
    }
  }
  return subsArr.uniq();
}

console.log(subStrings("abcc"));
